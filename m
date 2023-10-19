Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE518656
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 02:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Is2YRat+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697681624; x=1729217624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1wpysIGePUgMXYiz/NWLX6/HvBpbJfYjyuheWZIZ7vM=;
  b=Is2YRat+lIGI9c1yFE7qeIQ+PYqsDgJIDtomKXVd4zapky6DF6osKdLs
   e+mNX+qFp0YjkyRbxW4NoykgIydryufnAu0b0O8iYVUzgG3vew9vYUYom
   Lh7MY2nFyKGgqhnhG1JDJjo2OvSDvGBgoTWZXdrs3DUHJ+yeMo2PI12XN
   6gQSOgu5vzW/eTQ28zMp/pisnUmgwRLtguVt7GAWDUkWv6cChJhXG22uj
   CfQ/cXAWJ18aQbMQJCEhPzbMR4xbI8agWAXUfzZwRWChPbpLIzRs7fjYB
   cAr4yDPoyO7bG772RUtuJS1giamB5AGiessZpcNiSoKkXpgHFfy0pVzRy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="385980350"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="385980350"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 19:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930426156"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="930426156"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Oct 2023 19:13:40 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtIXa-0001Qn-1K;
	Thu, 19 Oct 2023 02:13:38 +0000
Date: Thu, 19 Oct 2023 10:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1438:58: warning: '%s'
 directive output may be truncated writing up to 1 bytes into a region of
 size between 0 and 29
Message-ID: <202310191030.lSSsOQCJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd72f9c7e512da377074d47d990564959b772643
commit: cc42e76e7de5190a7da5dac9d7b2bbb458e050bf drm/amd: Load MES microcode during early_init
date:   9 months ago
config: x86_64-randconfig-r006-20230904 (https://download.01.org/0day-ci/archive/20231019/202310191030.lSSsOQCJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191030.lSSsOQCJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191030.lSSsOQCJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c: In function 'amdgpu_mes_ctx_alloc_meta_data':
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1099:13: warning: variable 'r' set but not used [-Wunused-but-set-variable]
    1099 |         int r;
         |             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c: In function 'amdgpu_mes_init_microcode':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1438:58: warning: '%s' directive output may be truncated writing up to 1 bytes into a region of size between 0 and 29 [-Wformat-truncation=]
    1438 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |                                                          ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1438:9: note: 'snprintf' output between 16 and 46 bytes into a destination of size 40
    1438 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1439 |                 ucode_prefix,
         |                 ~~~~~~~~~~~~~
    1440 |                 pipe == AMDGPU_MES_SCHED_PIPE ? "" : "1");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1438 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c

  1428	
  1429	int amdgpu_mes_init_microcode(struct amdgpu_device *adev, int pipe)
  1430	{
  1431		const struct mes_firmware_header_v1_0 *mes_hdr;
  1432		struct amdgpu_firmware_info *info;
  1433		char ucode_prefix[30];
  1434		char fw_name[40];
  1435		int r;
  1436	
  1437		amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
> 1438		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes%s.bin",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
