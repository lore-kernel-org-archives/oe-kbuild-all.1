Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3656F6FBD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 07:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIlYk/DK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699686704; x=1731222704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VzkCLXD8Z5IdmomTPoyIJE3bCm9S0rL9vQPtr0ldAcE=;
  b=HIlYk/DKjLpjrZaCyp97X+jdNlCRHpuyBeHPq42/KPLyZhX+90G6Wp/j
   b1j4Eu4i21blzTeiFUju2DUoGydCWQFlrueTYCdza1HkutqwKZn/cfPBA
   2bAE/x3LAf0OajnT6OSgOD9LXxN8KAcap9fup8cX09W/A4Okv63vIoIa8
   irt5hOI2zf96RazYuQE7euLfSQlVrsuS46oN3Vv7vxr3O3c0+lc0dKXcE
   bzborkEDCiFAL/L5N8/at37Al2gjgcEwaeExY4A8jXmhyLZiLP5PmuqvF
   wpV8RHrrbKAmSNAkoFzB+554iQAxnwS6Fj2rpVUadbChntnnhWlEtmfbQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="476486226"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="476486226"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 23:11:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763903209"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="763903209"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 23:11:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1i9b-000AHi-16;
	Sat, 11 Nov 2023 07:11:39 +0000
Date: Sat, 11 Nov 2023 15:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Rocher <jeremy.rocher@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3765/30000] kernel/reboot.c:46:6: sparse:
 sparse: symbol 'reboot_panic_param' was not declared. Should it be static?
Message-ID: <202311111441.fe0NmQJJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: fcaa2f8368fc04749caacf6b3fc873b36af754bf [3765/30000] reboot: add reboot_panic parameter
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231111/202311111441.fe0NmQJJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111441.fe0NmQJJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111441.fe0NmQJJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/reboot.c:46:6: sparse: sparse: symbol 'reboot_panic_param' was not declared. Should it be static?
   kernel/reboot.c:212: warning: Function parameter or member 'cmd' not described in 'do_kernel_restart'

vim +/reboot_panic_param +46 kernel/reboot.c

    34	
    35	/*
    36	 * This variable is used privately to keep track of whether or not
    37	 * reboot_type is still set to its default value (i.e., reboot= hasn't
    38	 * been set on the command line).  This is needed so that we can
    39	 * suppress DMI scanning for reboot quirks.  Without it, it's
    40	 * impossible to override a faulty reboot quirk without recompiling.
    41	 */
    42	int reboot_default = 1;
    43	int reboot_cpu;
    44	enum reboot_type reboot_type = BOOT_ACPI;
    45	int reboot_force;
  > 46	char *reboot_panic_param;
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
