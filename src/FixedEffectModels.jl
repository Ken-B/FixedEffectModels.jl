
module FixedEffectModels

##############################################################################
##
## Dependencies
##
##############################################################################
import Base.BLAS: axpy!
import Base: A_mul_B!, Ac_mul_B!, size, copy!, getindex, length, fill!, norm, scale!, eltype, length, view, start, next, done
import Distributions: TDist, ccdf, FDist, Chisq, AliasTable, Categorical
import Missings: Missing
import DataArrays: DataArray
import CategoricalArrays: CategoricalArray, CategoricalVector, compress, categorical, CategoricalPool, levels, droplevels!
import DataFrames: DataFrame, AbstractDataFrame, completecases, names!, ismissing
import StatsModels: ModelMatrix, ModelFrame, Terms, coefnames, Formula, completecases, names!,  @formula
using Reexport
import StatsBase: coef, nobs, coeftable, vcov, predict, residuals, var, RegressionModel, model_response, stderr, confint, fit, CoefTable, df_residual
@reexport using StatsBase
##############################################################################
##
## Exported methods and types 
##
##############################################################################

export group, 
reg,
partial_out,
residualize!,
getfe!,
decompose_iv!,
allvars,

WeightFormula,
Ones,
FixedEffect,
FixedEffectProblem,

AbstractRegressionResult,
title,
top,
RegressionResult,
RegressionResultIV,
RegressionResultFE,
RegressionResultFEIV,

AbstractVcovFormula, 
VcovSimpleFormula, 
VcovRobustFormula, 
VcovClusterFormula,
VcovFormula,

AbstractVcovMethod, 
VcovMethod,
VcovSimpleMethod, 
VcovWhiteMethod, 
VcovClusterMethod,

vcov!,
shat!,
VcovData,

Model,
@model

##############################################################################
##
## Load files
##
##############################################################################
include("utils/group.jl")
include("utils/formula.jl")
include("utils/model.jl")
include("utils/lsmr.jl")
include("utils/basecol.jl")
include("utils/combinations.jl")

include("weight/Ones.jl")
include("weight/weight.jl")



include("fixedeffect/FixedEffect.jl")
include("fixedeffect/FixedEffectProblem.jl")
include("fixedeffect/FixedEffectProblem_LSMR.jl")
include("fixedeffect/FixedEffectProblem_Factorization.jl")

include("RegressionResult.jl")

include("vcov/types.jl")
include("vcov/vcovsimple.jl")
include("vcov/vcovrobust.jl")
include("vcov/vcovcluster.jl")
include("vcov/ranktest.jl")

include("reg.jl")
include("partial_out.jl")



end  # module FixedEffectModels