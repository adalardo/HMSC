#ifndef mcmcNormalXTrPhyloAutoLatent_h
#define mcmcNormalXTrPhyloAutoLatent_h
#include <RcppArmadillo.h>
#include <Rcpp.h>
#include "updateParamLatent.h"
#include "updateParamAuto.h"
#include "updateLatent.h"
#include "updateLatentAuto.h"
#include "updateShrinkLocal.h"
#include "updateParamShrinkGlobal.h"
#include "adaptVarAuto.h"
#include "adaptVar.h"
#include "updateParamXPhylo.h"
#include "updateParamTrPhylo.h"
#include "updatePrecXPhylo.h"
#include "fixParamPhylo.h"
#include "updateParamPhylo.h"
#include "fixParamAuto.h"
#include "updateResidVar.h"

RcppExport SEXP mcmcNormalXTrPhyloAutoLatent(arma::mat& Ylatent,
											 arma::mat& X,
											 arma::mat& Tr,
											 arma::mat& Phylo,
											 arma::mat& iPhylo,
											 arma::field< arma::mat >& Auto,
											 arma::umat& RandomAuto,
											 arma::umat& Random,
											 arma::mat& paramX,
											 arma::mat& paramTr,
											 arma::mat& precX,
											 double paramPhylo,
											 arma::vec& residVar,
											 arma::field< arma::mat >& latent,
											 arma::field< arma::mat >& paramLatent,
											 arma::field< arma::mat >& shrinkLocal,
											 arma::field< arma::vec >& paramShrinkGlobal,
											 arma::field< arma::vec >& paramAuto,
											 arma::field< arma::mat >& latentAuto,
											 arma::field< arma::mat >& paramLatentAuto,
											 arma::field< arma::mat >& shrinkLocalAuto,
											 arma::field< arma::vec >& paramShrinkGlobalAuto,
											 arma::mat& priorParamTr,
											 arma::mat& priorVarTr,
											 arma::mat& priorVarXScaleMat,
											 double priorVarXDf,
											 double priorResidVarScale,
											 double priorResidVarShape,
											 arma::mat& priorParamPhyloWeight,
											 Rcpp::NumericVector& priorParamPhyloGrid,
											 arma::mat& priorParamAutoWeight,
											 Rcpp::NumericMatrix& priorParamAutoDist,
											 double priorShrinkLocal,
											 double priorShrinkOverallShape,
											 double priorShrinkOverallScale,
											 double priorShrinkSpeedShape,
											 double priorShrinkSpeedScale,
											 arma::vec& adapt,
											 arma::vec& redund,
											 int nAuto,
											 arma::vec& nAutoLev,
											 arma::vec& nLatentAuto,
											 int nRandom,
											 arma::vec& nRandomLev,
											 arma::vec& nLatent,
											 double nsp,
											 int nsite,
											 int nparamX,
											 int nTr,
											 int nparamPhylo,
											 int npriorParamAuto,
											 int niter,
											 int nburn,
											 int thin,
											 int verbose);

#endif