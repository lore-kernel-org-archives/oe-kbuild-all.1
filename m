Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C776920F9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 20:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696018268; x=1727554268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9nip1rv0r2ibV+8B0zp10+cyolKFVknGRqEblgDLXeQ=;
  b=OjVXjk77WFfS1vJRb4RAKnI33uc31k4Q7ED7/0PMYNM2kYmeqAcd+fc+
   /dFnaxF4s5bhEScaMLtSjXIP5ilL4UE8hHT8o7nqj6T70jGFHh7Jh4Afg
   cHLlwwMTaG2xOabIW/EjXNMfox0GfoSHMoX1UOTdi33q5/Dj3aC77PSxL
   qN2zpxiF+B3bdSYs7SdCjMa9fIe+eeALuuLw77WyY9zzredSZhaKnt9y/
   2WZ3/wNrwhF1lEWn3Zt30gnUvuvAJLtq7iuhPAQnn+/0LfNksV90JzI4x
   GA463/G75+0bm4pMXmpWET6fCcJw+aoyw8i8GmSvb6EeZTLQV/68eoKc1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="372707097"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="372707097"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 11:03:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="893494578"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="893494578"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2023 11:02:11 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmHpi-00038J-2W;
	Fri, 29 Sep 2023 18:03:22 +0000
Date: Sat, 30 Sep 2023 02:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:isp/t602x-v2 46/67]
 drivers/media/platform/apple/isp/isp-v4l2.c:325:20: warning: no previous
 prototype for 'isp_select_preset'
Message-ID: <202309300107.XVnj4fqc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux isp/t602x-v2
head:   1c5cf609edca9f5624e2b2dd3439147c2760d716
commit: 1163402c3c47bd4149792f4ae35fae9f51c013a2 [46/67] isp: Working t602x and multiple formats and more fixes
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230930/202309300107.XVnj4fqc-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309300107.XVnj4fqc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300107.XVnj4fqc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/isp/isp-v4l2.c:325:20: warning: no previous prototype for 'isp_select_preset' [-Wmissing-prototypes]
     325 | struct isp_preset *isp_select_preset(struct apple_isp *isp, u32 width,
         |                    ^~~~~~~~~~~~~~~~~


vim +/isp_select_preset +325 drivers/media/platform/apple/isp/isp-v4l2.c

   324	
 > 325	struct isp_preset *isp_select_preset(struct apple_isp *isp, u32 width,
   326					     u32 height)
   327	{
   328		struct isp_preset *preset, *best = &isp->presets[0];
   329		int i, score, best_score = INT_MAX;
   330	
   331		/* Default if no dimensions */
   332		if (width == 0 || height == 0)
   333			return &isp->presets[0];
   334	
   335		for (i = 0; i < isp->num_presets; i++) {
   336			preset = &isp->presets[i];
   337			score = abs((int)preset->output_dim.x - (int)width) +
   338			abs((int)preset->output_dim.y - (int)height);
   339			if (score < best_score) {
   340				best = preset;
   341				best_score = score;
   342			}
   343		}
   344	
   345		return best;
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
