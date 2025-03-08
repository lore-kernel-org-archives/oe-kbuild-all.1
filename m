Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0BC322B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741424170; cv=none; b=Gmje5U9jhAmj/qrvIPlG4rxA+io7ZSF/7tXKT817orvypJtz8wzu68nc49Dg5HdDtU6Dbyn/j1uGNHc8nrwcHtvYqpLsM0FIcgcxbUbkKa44LcQ/Jz0uWKI31vLtDsVpDiPrSheRHnt6Mg1zl/wGRNo98j4F6+6jBfBrWzUoTFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741424170; c=relaxed/simple;
	bh=nktO1PN22P4wghb66olpLvQ0VnU4J0cuNANvDrxiG8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IURvq3ENqA0FeSgr/Lv+XqNS0Y83C2ax74ax+x2+SGliljwCJDzWEa/Vr0WMBZqfcb3/xolZ4teJ8dsE5qW1dF1HZlkK8FK1Ls4HvgJhEjm6yKw/TN2aIdfEGsEwcach4us3ThfcRWDiqyfXEvaFZ26sx3r2tQ1WhWxSfvWqRz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SK2F+V9w; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SK2F+V9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741424166; x=1772960166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nktO1PN22P4wghb66olpLvQ0VnU4J0cuNANvDrxiG8E=;
  b=SK2F+V9wPdPYa2K1YPwlUc7KMlUHkXsi9ReeZcE78uy11RMqgK5trFwU
   YEFFFP6lG2++il98vtMYgAdlSwUBXTOAn3OjJki3S62JyyRfzr2VXWMT6
   tAQofibzqpfJZ/5TcPZKGvXM2IpbEzcm3JHWP3pfrUeMQYjiq8cd/jZ0F
   N4b6/GfTVwh8RuElx+ZgXalN7QHuZ9jJvQa9hveJTBWrCGkSdPDWMnZ9z
   YibfHr7wiVOW6Sz27lGq5EA2UIy4el0ON6cWsfjxG7O5e+d7cPTtfYMBL
   W6y4QCpT2OeTlKjODy4DldLFKWM/E99LVglR36sdSFcv7Hx1PKLN6zKu0
   w==;
X-CSE-ConnectionGUID: 7J6UIFAMSJy1Vwt3EbOYtQ==
X-CSE-MsgGUID: yAN7nTUVSf+eEkspv26/xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="46395413"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="46395413"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 00:56:06 -0800
X-CSE-ConnectionGUID: pKC3wqz7R4OjJCo0pLAHyg==
X-CSE-MsgGUID: Wnvb2ArCROmkPnUSApjvVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120434598"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 08 Mar 2025 00:56:04 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqpyU-0001jH-0g;
	Sat, 08 Mar 2025 08:56:02 +0000
Date: Sat, 8 Mar 2025 16:55:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 154/411]
 drivers/gpu/drm/nouveau/nvif/dispchan.c:93:9: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202503081649.TxBe0OC5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: b31c153a3d075fcae5f7fd482a74b060f5365081 [154/411] drm/nouveau/nvif: rework disp "new chan" apis
config: s390-randconfig-r133-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081649.TxBe0OC5-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20250308/202503081649.TxBe0OC5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081649.TxBe0OC5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/nvif/dispchan.c:36:34: sparse: sparse: subtraction of different types can't work (different address spaces)
>> drivers/gpu/drm/nouveau/nvif/dispchan.c:93:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/dispchan.c:107:34: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/gpu/drm/nouveau/nvif/dispchan.c:189:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *bgn @@     got void [noderef] __iomem *ptr @@

vim +/__iomem +93 drivers/gpu/drm/nouveau/nvif/dispchan.c

    71	
    72	static int
    73	nvif_dispchan_wind(struct nvif_dispchan *chan)
    74	{
    75		struct nvif_push *push = &chan->push;
    76	
    77		/* Wait for GET to depart from the beginning of the push buffer to
    78		 * prevent writing PUT == GET, which would be ignored by HW.
    79		 */
    80		u32 get = NVIF_RV32(chan, NV507C, GET, PTR);
    81		if (get == 0) {
    82			/* Corner-case, HW idle, but non-committed work pending. */
    83			if (push->hw.put == 0)
    84				nvif_dispchan_kick(&chan->push);
    85	
    86			if (nvif_msec(chan->disp->device, 2000,
    87				if (NVIF_TV32(chan, NV507C, GET, PTR, >, 0))
    88					break;
    89			) < 0)
    90				return -ETIMEDOUT;
    91		}
    92	
  > 93		PUSH_RSVD(&chan->push, PUSH_JUMP(&chan->push, 0));
    94		push->hw.cur = 0;
    95		return 0;
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
