Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81182AF1D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 01:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781746234; cv=none; b=WwqypDCJFrC9GBtLLuyOWdzHnqMkQPm4ZwzXGSndwhP+M0QyQrfVQR28fdINPvVLGdCnOSpP7NbzMBe/j/9P5duGMqKjo4FMhgxeySiTHIwjMlesEFoeI+7lRUGm52UpAy0ljl5pmSnB0Njlb5+kbSQ4i+vomf/m2tAxACSPhvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781746234; c=relaxed/simple;
	bh=rikrzvMbwE83Q3o23a5nIJneGy+IZo3Mb538f9x2/84=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kfceFVqX6UVFIsdUYnVnkU0kNUh+goCVTx8LYFRSwS6ifTXjOHuwEQ9ytftbedggNVniNPvxTa3gp7W9kE4aedrDewd9BE/oghwm1E0wCo7bCVcPRNl1tT8jpE2X+JiVACyNDIjnDHOLNPlQZcsZ6P18foqerjqazRQ/YgeYUQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ny0pn+KF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ny0pn+KF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781746232; x=1813282232;
  h=date:from:to:cc:subject:message-id;
  bh=rikrzvMbwE83Q3o23a5nIJneGy+IZo3Mb538f9x2/84=;
  b=Ny0pn+KF3HzclFNZ4tHknS+B/8LGkwSQD9FR4Fo3W/u5RiBuvYFwf22G
   DjAA5DeGyrdSA4rYvkqkBOeU2zyE1Yik5Bj9MlbZdExU67Qs8AmB5mANf
   P5XETnHVZEbPzPOD4NoY+B1vo85PiTzc7AaEb2hFZHgrtdP88EK8W1ovM
   xPO7eHp2nB9q6ItFx0CZ5FECNZDdUlN//rJKF2u6MIxaEPE3yhLD9fcL3
   dANVDl7Xk/3LipzKZr3UleM6E3zWpzxn1CxKvMowe5KPl1Yyh0dCTE85q
   AYaJJi9j3nY3W+nnDjZbHZOIu6Poz0jN17EnqYVecEdvG5Fb3NxQErcRm
   A==;
X-CSE-ConnectionGUID: PpL/SDLdQX+/pNX5X57htg==
X-CSE-MsgGUID: cYaOxgENTIGjuFV+vrLobA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93683035"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="93683035"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 18:30:31 -0700
X-CSE-ConnectionGUID: PAwLA+5bRl2TYcrX7pe6fw==
X-CSE-MsgGUID: EyMFud9aQea+0+JsFa9uvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="252536545"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2026 18:30:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa1aN-00000000V9w-066E;
	Thu, 18 Jun 2026 01:30:27 +0000
Date: Thu, 18 Jun 2026 09:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-power-domains-v7.1 6/11]
 include/linux/mfd/dbx500-prcmu.h:408:19: error: redefinition of
 'prcmu_abb_read'
Message-ID: <202606180825.vUSQntkJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-power-domains-v7.1
head:   b2481ed07ce2ef552c0104079bdcde6d532ec16b
commit: a5269e25e37c9ec0e13756f8fc3d109eaa291721 [6/11] pmdomain: st: ux500: Control DB8500 EPODs
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260618/202606180825.vUSQntkJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606180825.vUSQntkJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180825.vUSQntkJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pmdomain/st/ste-ux500-pm-domain.c:13:
>> include/linux/mfd/dbx500-prcmu.h:408:19: error: redefinition of 'prcmu_abb_read'
     408 | static inline int prcmu_abb_read(u8 slave, u8 reg, u8 *value, u8 size)
         |                   ^~~~~~~~~~~~~~
   In file included from include/linux/mfd/dbx500-prcmu.h:212:
   include/linux/mfd/db8500-prcmu.h:638:19: note: previous definition of 'prcmu_abb_read' with type 'int(u8,  u8,  u8 *, u8)' {aka 'int(unsigned char,  unsigned char,  unsigned char *, unsigned char)'}
     638 | static inline int prcmu_abb_read(u8 slave, u8 reg, u8 *value, u8 size)
         |                   ^~~~~~~~~~~~~~
>> include/linux/mfd/dbx500-prcmu.h:413:19: error: redefinition of 'prcmu_abb_write'
     413 | static inline int prcmu_abb_write(u8 slave, u8 reg, u8 *value, u8 size)
         |                   ^~~~~~~~~~~~~~~
   include/linux/mfd/db8500-prcmu.h:643:19: note: previous definition of 'prcmu_abb_write' with type 'int(u8,  u8,  u8 *, u8)' {aka 'int(unsigned char,  unsigned char,  unsigned char *, unsigned char)'}
     643 | static inline int prcmu_abb_write(u8 slave, u8 reg, u8 *value, u8 size)
         |                   ^~~~~~~~~~~~~~~
>> include/linux/mfd/dbx500-prcmu.h:424:19: error: redefinition of 'prcmu_config_clkout'
     424 | static inline int prcmu_config_clkout(u8 clkout, u8 source, u8 div)
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/mfd/db8500-prcmu.h:608:19: note: previous definition of 'prcmu_config_clkout' with type 'int(u8,  u8,  u8)' {aka 'int(unsigned char,  unsigned char,  unsigned char)'}
     608 | static inline int prcmu_config_clkout(u8 clkout, u8 source, u8 div)
         |                   ^~~~~~~~~~~~~~~~~~~
>> include/linux/mfd/dbx500-prcmu.h:486:19: error: redefinition of 'prcmu_ac_wake_req'
     486 | static inline int prcmu_ac_wake_req(void)
         |                   ^~~~~~~~~~~~~~~~~
   include/linux/mfd/db8500-prcmu.h:648:19: note: previous definition of 'prcmu_ac_wake_req' with type 'int(void)'
     648 | static inline int prcmu_ac_wake_req(void)
         |                   ^~~~~~~~~~~~~~~~~
>> include/linux/mfd/dbx500-prcmu.h:491:20: error: redefinition of 'prcmu_ac_sleep_req'
     491 | static inline void prcmu_ac_sleep_req(void) {}
         |                    ^~~~~~~~~~~~~~~~~~
   include/linux/mfd/db8500-prcmu.h:653:20: note: previous definition of 'prcmu_ac_sleep_req' with type 'void(void)'
     653 | static inline void prcmu_ac_sleep_req(void) {}
         |                    ^~~~~~~~~~~~~~~~~~


vim +/prcmu_abb_read +408 include/linux/mfd/dbx500-prcmu.h

fea799e3d3ab84a Mattias Nilsson 2011-08-12  407  
fea799e3d3ab84a Mattias Nilsson 2011-08-12 @408  static inline int prcmu_abb_read(u8 slave, u8 reg, u8 *value, u8 size)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  409  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  410  	return -ENOSYS;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  411  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  412  
fea799e3d3ab84a Mattias Nilsson 2011-08-12 @413  static inline int prcmu_abb_write(u8 slave, u8 reg, u8 *value, u8 size)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  414  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  415  	return -ENOSYS;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  416  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  417  
3c3e489831b601e Mattias Nilsson 2012-03-08  418  static inline int prcmu_abb_write_masked(u8 slave, u8 reg, u8 *value, u8 *mask,
3c3e489831b601e Mattias Nilsson 2012-03-08  419  	u8 size)
3c3e489831b601e Mattias Nilsson 2012-03-08  420  {
3c3e489831b601e Mattias Nilsson 2012-03-08  421  	return -ENOSYS;
3c3e489831b601e Mattias Nilsson 2012-03-08  422  }
3c3e489831b601e Mattias Nilsson 2012-03-08  423  
fea799e3d3ab84a Mattias Nilsson 2011-08-12 @424  static inline int prcmu_config_clkout(u8 clkout, u8 source, u8 div)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  425  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  426  	return 0;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  427  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  428  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  429  static inline int prcmu_request_clock(u8 clock, bool enable)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  430  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  431  	return 0;
6b6fae2b890826c Mattias Nilsson 2012-01-13  432  }
6b6fae2b890826c Mattias Nilsson 2012-01-13  433  
6b6fae2b890826c Mattias Nilsson 2012-01-13  434  static inline long prcmu_round_clock_rate(u8 clock, unsigned long rate)
6b6fae2b890826c Mattias Nilsson 2012-01-13  435  {
6b6fae2b890826c Mattias Nilsson 2012-01-13  436  	return 0;
6b6fae2b890826c Mattias Nilsson 2012-01-13  437  }
6b6fae2b890826c Mattias Nilsson 2012-01-13  438  
6b6fae2b890826c Mattias Nilsson 2012-01-13  439  static inline int prcmu_set_clock_rate(u8 clock, unsigned long rate)
6b6fae2b890826c Mattias Nilsson 2012-01-13  440  {
6b6fae2b890826c Mattias Nilsson 2012-01-13  441  	return 0;
6b6fae2b890826c Mattias Nilsson 2012-01-13  442  }
6b6fae2b890826c Mattias Nilsson 2012-01-13  443  
6b6fae2b890826c Mattias Nilsson 2012-01-13  444  static inline unsigned long prcmu_clock_rate(u8 clock)
6b6fae2b890826c Mattias Nilsson 2012-01-13  445  {
6b6fae2b890826c Mattias Nilsson 2012-01-13  446  	return 0;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  447  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  448  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  449  static inline int prcmu_set_ape_opp(u8 opp)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  450  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  451  	return 0;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  452  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  453  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  454  static inline int prcmu_get_ape_opp(void)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  455  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  456  	return APE_100_OPP;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  457  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  458  
686f871b7109e7e Ulf Hansson     2012-09-24  459  static inline int prcmu_request_ape_opp_100_voltage(bool enable)
686f871b7109e7e Ulf Hansson     2012-09-24  460  {
686f871b7109e7e Ulf Hansson     2012-09-24  461  	return 0;
686f871b7109e7e Ulf Hansson     2012-09-24  462  }
686f871b7109e7e Ulf Hansson     2012-09-24  463  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  464  static inline int prcmu_set_arm_opp(u8 opp)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  465  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  466  	return 0;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  467  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  468  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  469  static inline int prcmu_get_arm_opp(void)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  470  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  471  	return ARM_100_OPP;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  472  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  473  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  474  static inline int prcmu_get_ddr_opp(void)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  475  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  476  	return DDR_100_OPP;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  477  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  478  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  479  static inline void prcmu_system_reset(u16 reset_code) {}
fea799e3d3ab84a Mattias Nilsson 2011-08-12  480  
fea799e3d3ab84a Mattias Nilsson 2011-08-12  481  static inline u16 prcmu_get_reset_code(void)
fea799e3d3ab84a Mattias Nilsson 2011-08-12  482  {
fea799e3d3ab84a Mattias Nilsson 2011-08-12  483  	return 0;
fea799e3d3ab84a Mattias Nilsson 2011-08-12  484  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  485  
5261e101198e7ef Arun Murthy     2012-05-21 @486  static inline int prcmu_ac_wake_req(void)
5261e101198e7ef Arun Murthy     2012-05-21  487  {
5261e101198e7ef Arun Murthy     2012-05-21  488  	return 0;
5261e101198e7ef Arun Murthy     2012-05-21  489  }
fea799e3d3ab84a Mattias Nilsson 2011-08-12  490  
fea799e3d3ab84a Mattias Nilsson 2011-08-12 @491  static inline void prcmu_ac_sleep_req(void) {}
fea799e3d3ab84a Mattias Nilsson 2011-08-12  492  

:::::: The code at line 408 was first introduced by commit
:::::: fea799e3d3ab84ac675de7e48a13a79fb76b6e63 mfd: Create a common interface for dbx500 PRCMU drivers

:::::: TO: Mattias Nilsson <mattias.i.nilsson@stericsson.com>
:::::: CC: Samuel Ortiz <sameo@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
