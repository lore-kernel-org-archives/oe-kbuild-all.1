Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DCC2EBBAF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854017; cv=none; b=qgOlVDIC86cwBrkbpWESn3GQ5zVbmGTeulfU+90b0w+ClIejlxjonZUbxkhJImtiowEz9alMvx+EGbJYpaz4aBWpwvHV0spgU46fWV0of3awBNR7rKDKwwxvS6PQPvLKrqO1bE8gPj6FA71BbCnwPRBQT+o2y8Im2Oj2uKPXxLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854017; c=relaxed/simple;
	bh=gkyet2fOmIY+c84M7Y0pHR/beTdJ9dlm36jlqkQQJu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QyIELHFOgEF9Rk4Ox5vg4BqIYE+qwrflOnXU5dizmJQ3vOKghO6WuCqdNHIudXtz0VG1sxor6emLg3/n4/HZM65WqvCKZUYfznAiVCUF6Tr24ZNoSJmrgjwAtA/JXwTQSMZoXpeoMzv4EwLnfo34pZaCVT8ygo103rrPT16Vsg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krNUSiRm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krNUSiRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762854016; x=1794390016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gkyet2fOmIY+c84M7Y0pHR/beTdJ9dlm36jlqkQQJu4=;
  b=krNUSiRmgSXj9q4MjqEIT7gVb4DDj/NCyZgTWSwHf78CMYDMlR57B4lK
   44c1gLgjg1QvTACp5CIWytx2Q1bqi2K70ux0H9PE30jRGMtD4knBkvG0r
   IfOKIA13SiCXOEXvC2pP6yGD41ZGZQNSqyELlkzwORv0oidI7JR37Hm8S
   8+Z9ZL6FSCh6xdIhBvsyXXc6wqZRLCaWdWomAwLO+7/t02H3ia7P8SwB2
   Dj3Qr7CHEBm5ayrBDl1nsIyjCdlqB1YpVUI/o5GkqebBlWkcOceYrD7Kl
   k3wRzHey89Eq6KphtYElE1vBGx6MGdxqwz7HhrPvltuwOwEP50mJ5JUBl
   A==;
X-CSE-ConnectionGUID: lrSQZ2uIR9+gl1cQNtTasw==
X-CSE-MsgGUID: pXV/FhRqSwi9uvMmmw2Qwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82309647"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="82309647"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 01:40:15 -0800
X-CSE-ConnectionGUID: 7hLsxHZsRui3nldgzDMIAQ==
X-CSE-MsgGUID: QaI0jw54TeaCqMq8f3rrSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="193914805"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Nov 2025 01:40:13 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIkrD-00031F-1u;
	Tue, 11 Nov 2025 09:40:11 +0000
Date: Tue, 11 Nov 2025 17:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk 15/29]
 drivers/media/platform/dreamchip/rppx1/rpp_params.c:14:13: error: implicit
 declaration of function 'WARN_ON'
Message-ID: <202511111733.1PVwE4M3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk
head:   14a3f460905b5d9be43ad2bab030625085a52423
commit: deb53902b8777a75d24152d85dbfdec4f0e5cbab [15/29] media: rppx1: Add framework to support Dreamchip RPPX1 ISP
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251111/202511111733.1PVwE4M3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111733.1PVwE4M3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111733.1PVwE4M3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/dreamchip/rppx1/rpp_params.c: In function 'rppx1_params_rkisp1':
>> drivers/media/platform/dreamchip/rppx1/rpp_params.c:14:13: error: implicit declaration of function 'WARN_ON' [-Wimplicit-function-declaration]
      14 |         if (WARN_ON(!cfg))
         |             ^~~~~~~
>> drivers/media/platform/dreamchip/rppx1/rpp_params.c:15:25: error: 'EINVAL' undeclared (first use in this function)
      15 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rpp_params.c:15:25: note: each undeclared identifier is reported only once for each function it appears in
   In file included from drivers/media/platform/dreamchip/rppx1/rppx1.h:8,
                    from drivers/media/platform/dreamchip/rppx1/rpp_params.c:7:
>> drivers/media/platform/dreamchip/rppx1/rpp_module.h:149:37: error: 'ENODEV' undeclared (first use in this function)
     149 |                         __result = -ENODEV;                             \
         |                                     ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rpp_params.c:36:17: note: in expansion of macro 'rpp_module_call'
      36 |                 rpp_module_call(module, param_rkisp1, block, write, priv);
         |                 ^~~~~~~~~~~~~~~
--
   drivers/media/platform/dreamchip/rppx1/rppx1_acq.c: In function 'rppx1_acq_probe':
>> drivers/media/platform/dreamchip/rppx1/rppx1_acq.c:61:25: error: 'EINVAL' undeclared (first use in this function)
      61 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rppx1_acq.c:61:25: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/dreamchip/rppx1/rppx1_acq.c: In function 'rppx1_acq_start':
   drivers/media/platform/dreamchip/rppx1/rppx1_acq.c:109:25: error: 'EINVAL' undeclared (first use in this function)
     109 |                 return -EINVAL;
         |                         ^~~~~~
--
   drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c: In function 'rppx1_awbg_probe':
>> drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c:23:25: error: 'EINVAL' undeclared (first use in this function)
      23 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c:23:25: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/media/platform/dreamchip/rppx1/rppx1_bd.c: In function 'rppx1_bd_probe':
>> drivers/media/platform/dreamchip/rppx1/rppx1_bd.c:45:25: error: 'EINVAL' undeclared (first use in this function)
      45 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rppx1_bd.c:45:25: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c: In function 'rppx1_bdrgb_probe':
>> drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c:72:25: error: 'EINVAL' undeclared (first use in this function)
      72 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c:72:25: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/media/platform/dreamchip/rppx1/rppx1_bls.c: In function 'rppx1_bls_probe':
>> drivers/media/platform/dreamchip/rppx1/rppx1_bls.c:51:25: error: 'EINVAL' undeclared (first use in this function)
      51 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rppx1_bls.c:51:25: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/media/platform/dreamchip/rppx1/rppx1_cac.c: In function 'rppx1_cac_probe':
>> drivers/media/platform/dreamchip/rppx1/rppx1_cac.c:22:25: error: 'EINVAL' undeclared (first use in this function)
      22 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rppx1_cac.c:22:25: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c: In function 'rppx1_ccor_probe':
>> drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c:40:25: error: 'EINVAL' undeclared (first use in this function)
      40 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c:40:25: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/media/platform/dreamchip/rppx1/rppx1_db.c: In function 'rppx1_db_probe':
>> drivers/media/platform/dreamchip/rppx1/rppx1_db.c:37:25: error: 'EINVAL' undeclared (first use in this function)
      37 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rppx1_db.c:37:25: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c: In function 'rppx1_dpcc_probe':
>> drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c:58:25: error: 'EINVAL' undeclared (first use in this function)
      58 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c:58:25: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/media/platform/dreamchip/rppx1/rppx1_exm.c: In function 'rppx1_exm_probe':
>> drivers/media/platform/dreamchip/rppx1/rppx1_exm.c:43:25: error: 'EINVAL' undeclared (first use in this function)
      43 |                 return -EINVAL;
         |                         ^~~~~~
   drivers/media/platform/dreamchip/rppx1/rppx1_exm.c:43:25: note: each undeclared identifier is reported only once for each function it appears in
..


vim +/WARN_ON +14 drivers/media/platform/dreamchip/rppx1/rpp_params.c

     8	
     9	int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
    10				rppx1_reg_write write, void *priv)
    11	{
    12		size_t block_offset = 0;
    13	
  > 14		if (WARN_ON(!cfg))
  > 15			return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
