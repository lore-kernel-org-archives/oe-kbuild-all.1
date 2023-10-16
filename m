Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6238080F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 17:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aANzyHYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697477112; x=1729013112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qVl80kM7ljyoaLOd6CxVPypo2Zoh3E5MwkBEv5zhj1Y=;
  b=aANzyHYTry6c/3qhG0Fb3UsTwMO9LIwa37Y8tsnWqui0JYBPhvb0KHdr
   88wRl5D5pF2h/4XO1Ky7zPATy8TtLVRyxC3LGGLAxiCIBkhTZoLzGs4we
   zoA8WAnW5b1mJW1cuD8aS0st4Os0OtYTKzv1Yo5gSsh4bNIRZt3TxofcS
   X6M/JLD+cuIoaC58SvPjq1UOQ0S4iVpZTyMfusII4wg5dwrUfPlTc7W7V
   JUkE7PsnpJ8C9BS7igchJB2APXxtCeOWGGWLnP5PdY5lqQi/rbgtZewqX
   Dp07KpgF/NfgTqktzzAQgDYbF3TNau//ngi1bAMUsVR0X21KGkTWqts4n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="7162571"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="7162571"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 10:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="821646841"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="821646841"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Oct 2023 10:25:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsRL2-0008XX-1B;
	Mon, 16 Oct 2023 17:25:08 +0000
Date: Tue, 17 Oct 2023 01:25:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1569/30000]
 drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous
 declaration for 'max11801_read_adc'
Message-ID: <202310170131.yvdUdGi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 901b3581cdd4b5a7d82a205efe7bcfe39c10dc1e [1569/30000] MLK-11703-1: input: touchscreen: max11801_ts: Add DCM mode for max11801 ADC
config: x86_64-randconfig-016-20231016 (https://download.01.org/0day-ci/archive/20231017/202310170131.yvdUdGi2-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170131.yvdUdGi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170131.yvdUdGi2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous declaration for 'max11801_read_adc' [-Wmissing-declarations]
    u32 max11801_read_adc(void)
        ^~~~~~~~~~~~~~~~~


vim +/max11801_read_adc +148 drivers/input/touchscreen/max11801_ts.c

   147	
 > 148	u32 max11801_read_adc(void)
   149	{
   150		u32 adc_data;
   151	
   152		if (!max11801_client) {
   153			pr_err("FAIL  max11801_client not initialize\n");
   154			return -1;
   155		}
   156		adc_data = max11801_dcm_sample_aux(max11801_client);
   157	
   158		return adc_data;
   159	}
   160	EXPORT_SYMBOL_GPL(max11801_read_adc);
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
