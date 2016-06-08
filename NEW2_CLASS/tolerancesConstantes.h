//
//  tolerancesConstantes.h
//  
//
//  Created by Rabah  on 06/06/16.
//
//

#ifndef tolerancesConstantes_h
#define tolerancesConstantes_h

std::array<float,3> m_alphaCorrection = {120.64,510.64,730.64});
std::array<float,3> m_TolFirstLast = {280.0,540.0,1080.0});
unsigned int m_maxParabolaSeedHits = 8);
std::array<float,3> m_x0Corr = {0.002152 , 0.001534,0.001834});  // Rotation angle
std::array<float,3> m_x0SlopeChange = {400.,500.,500.});
std::array<float,3> m_TolX0SameSign = {0.75,0.75,0.75});
//x0Cut needs to be different from X0SlopeChangeDown & X0SlopeChange
std::array<float,3> m_x0Cut = {1500.,4000.,6000.});
std::array<float,3> m_tolAtX0Cut = {4.5,8.0,14.0});
std::array<float,3>  m_x0SlopeChange2 = {2000.,2000.,2000.});
//Tolerance inferior for |x0| > m_x0SlopeChange2 when x0 = m_x0Cut
std::array<float,3> m_tolAtx0CutOppSig = {0.75,2.0,7.0});
std::array<float,3> m_tolX0Oppsig = {0.75,0.75,0.75});

//find x-Projection Remaining layers & fitting
// Tolerance for remaining layers ( after the 3 hit combination ) in mm
std::array<float,3> m_tolRemaining = {1.0,1.0,1.0});
std::array<float,3> m_maxChi2HitsX = {5.5,5.5,5.5});
std::array<float,3> m_maxChi2DoFX = {4.0,5.0,6.0});

#endif /* tolerancesConstantes_h */

/*
 m_x0Corr[iCase]
 m_tolAtX0Cut[iCase]
 m_TolX0SameSign[iCase]
 m_x0Cut[iCase]
 m_x0SlopeChange[iCase]
 m_tolAtx0CutOppSig[iCase]
 m_tolX0Oppsig[iCase]
 m_x0SlopeChange2[iCase]
 */