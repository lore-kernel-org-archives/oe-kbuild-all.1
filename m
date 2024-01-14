Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D737E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 05:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vq8uIi3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705211782; x=1736747782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uTl+znRIUTh5DqUPrspj+8dKjy185Wvs7yokMg92X8Y=;
  b=Vq8uIi3+f1Pv5TPEpvALkb5XG9PwXa5+53ewVzcTzju4WJC7j1+wjAm+
   s2kgzUax+lAKheFHJAqj3yYy1feWx9UJVXHl5rDPocLGEtlw8+8fE+lN1
   I0W4g5pt2IB9DRwmgu3bW+t98UkIPFoE6g9APPJ1Qip2GGyz7jymCMsva
   uDfFZggKtdIxheaFF6Op3SXyWYa8dGAuevcXpD2Ety0bnaV38Uh0bw9DU
   yaJOex1kUiygD92dVGQQZLPzkDEyDQkWBoqY1UtvuH5behd5onxRB1sTP
   c9KhMPkwKtAinAlvmFPFi6qJQXc2Hlw52DwXADtD+E7n+Qp7PMnqiD2B3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="403201331"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="403201331"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 21:56:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="902424604"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="902424604"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2024 21:56:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOtTm-000BDy-0o;
	Sun, 14 Jan 2024 05:56:18 +0000
Date: Sun, 14 Jan 2024 13:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4851/17888]
 sound/soc/fsl/imx-hdmi-dma.c:226:5: warning: no previous prototype for
 function 'odd_ones'
Message-ID: <202401141352.5Zockm3o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb [4851/17888] Merge branch 'mxc/next' into next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240114/202401141352.5Zockm3o-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401141352.5Zockm3o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401141352.5Zockm3o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/imx-hdmi-dma.c:226:5: warning: no previous prototype for function 'odd_ones' [-Wmissing-prototypes]
     226 | int odd_ones(unsigned a)
         |     ^
   sound/soc/fsl/imx-hdmi-dma.c:226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     226 | int odd_ones(unsigned a)
         | ^
         | static 
   1 warning generated.
--
>> clang: warning: argument unused during compilation: '-mfpu=neon' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-mfloat-abi=softfp' [-Wunused-command-line-argument]
   error: unknown target CPU 'armv7-a'
   note: valid target CPU values are: nocona, core2, penryn, bonnell, atom, silvermont, slm, goldmont, goldmont-plus, tremont, nehalem, corei7, westmere, sandybridge, corei7-avx, ivybridge, core-avx-i, haswell, core-avx2, broadwell, skylake, skylake-avx512, skx, cascadelake, cooperlake, cannonlake, icelake-client, rocketlake, icelake-server, tigerlake, sapphirerapids, alderlake, raptorlake, meteorlake, sierraforest, grandridge, graniterapids, graniterapids-d, emeraldrapids, knl, knm, k8, athlon64, athlon-fx, opteron, k8-sse3, athlon64-sse3, opteron-sse3, amdfam10, barcelona, btver1, btver2, bdver1, bdver2, bdver3, bdver4, znver1, znver2, znver3, znver4, x86-64, x86-64-v2, x86-64-v3, x86-64-v4


vim +/odd_ones +226 sound/soc/fsl/imx-hdmi-dma.c

32ecbcfdff46d0b0 Shengjiu Wang 2014-08-27  225  
32ecbcfdff46d0b0 Shengjiu Wang 2014-08-27 @226  int odd_ones(unsigned a)
32ecbcfdff46d0b0 Shengjiu Wang 2014-08-27  227  {
32ecbcfdff46d0b0 Shengjiu Wang 2014-08-27  228  	a ^= a >> 8;
32ecbcfdff46d0b0 Shengjiu Wang 2014-08-27  229  	a ^= a >> 4;
32ecbcfdff46d0b0 Shengjiu Wang 2014-08-27  230  	a ^= a >> 2;
32ecbcfdff46d0b0 Shengjiu Wang 2014-08-27  231  	a ^= a >> 1;
32ecbcfdff46d0b0 Shengjiu Wang 2014-08-27  232  
32ecbcfdff46d0b0 Shengjiu Wang 2014-08-27  233  	return a & 1;
32ecbcfdff46d0b0 Shengjiu Wang 2014-08-27  234  }
32ecbcfdff46d0b0 Shengjiu Wang 2014-08-27  235  

:::::: The code at line 226 was first introduced by commit
:::::: 32ecbcfdff46d0b03744d82aee4a12948226fe37 ASoC: fsl_hdmi: hdmi audio driver for imx6

:::::: TO: Shengjiu Wang <shengjiu.wang@freescale.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
