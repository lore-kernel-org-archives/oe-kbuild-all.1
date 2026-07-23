Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263203054E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791966; cv=none; b=O4p16C3mbqpk4+eJXxOG4zb7ZyUwQQTxBjjbIeWU4xlQY2MGlbEGd2k+vyJpGOmWn17vuG5a0R5a9hq83I50dMnIa7NxfJ7BoKG9+l5ntmOuxlgBtRx0EEexlkV0ZFTn5/mSCilSWZ9jIOABflNuTViOIRLo0bpPYZb2P5tuIWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791966; c=relaxed/simple;
	bh=a7m+6RSkKQPU/pjTAbynhPWQybzqx0ErNcWOQle8YpE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dFGSAAPqzkLBeym0Lg6cZdXHkj6WC0VaRHLDovCZNJ1LSyyWrwigU6G5iEm8JazQNRKBQQAHP0EGXoyUnshmpuiuWBW2n9zChSiQ09nfdcr5JRRHH9YAWA/D5lHco6bwqZSrwUp8QCKX5vDdQe8Ca+pKhCg/MTeMiv569JcqmDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hngqg6EY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hngqg6EY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784791964; x=1816327964;
  h=date:from:to:cc:subject:message-id;
  bh=a7m+6RSkKQPU/pjTAbynhPWQybzqx0ErNcWOQle8YpE=;
  b=hngqg6EYaDOn6hLgzMIlYSSxMozw3EOlEsQ0SZ3FrNVzOE2Kf2FQ9Q8n
   XWGgQuJiFY26CJ2fpJjjjhTBEC1LjlRT/K//H+3AUyfvh24QK7IfVrJA6
   Bupat51TVZTdzSrzar399k4TldMdPFGlpigYoAui3OUermDbmArUYbY5j
   T992nulNyC0k47YFxJNM0eylg9bRJCmhBK7WbazvH0vrwG2jGRgw1uB3j
   WNSWtnbbI+aQMB9rPf6W6oaBUPIWkkQxoez2zn8MvvUPMw81uywy6cM8X
   28XygF9lk9FuWVVF78vf/mPUz7UAvPze2MNBm3ueEEd0TgFD2Qgjemk4i
   w==;
X-CSE-ConnectionGUID: QxtwJ/ndRZuk5H/de9plqw==
X-CSE-MsgGUID: Bk1y4+nhQ12azCOFZGBXAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="110981764"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="110981764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:32:44 -0700
X-CSE-ConnectionGUID: 7bb52ugwSMSMyc0ShBrQfQ==
X-CSE-MsgGUID: zKpBep0XTPmtYOgkUNNhzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="258393553"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Jul 2026 00:32:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmnv5-00000000ZRZ-2O7x;
	Thu, 23 Jul 2026 07:32:39 +0000
Date: Thu, 23 Jul 2026 15:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: drivers/gpu/drm/panel/panel-visionox-rm69299.c:241:42:
 sparse: sparse: symbol 'visionox_rm69299_1080p_display_desc' was not
 declared. Should it be static?
Message-ID: <202607231519.DWDovcuL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: 01a2c6756bcae987472228c41319fc6ab2cc89c8 drm/panel: visionox-rm69299: add plumbing to support panel variants
date:   1 year, 1 month ago
config: i386-randconfig-063-20260722 (https://download.01.org/0day-ci/archive/20260723/202607231519.DWDovcuL-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231519.DWDovcuL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 01a2c6756bca ("drm/panel: visionox-rm69299: add plumbing to support panel variants")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231519.DWDovcuL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panel/panel-visionox-rm69299.c:241:42: sparse: sparse: symbol 'visionox_rm69299_1080p_display_desc' was not declared. Should it be static?

vim +/visionox_rm69299_1080p_display_desc +241 drivers/gpu/drm/panel/panel-visionox-rm69299.c

   240	
 > 241	const struct visionox_rm69299_panel_desc visionox_rm69299_1080p_display_desc = {
   242		.mode = &visionox_rm69299_1080x2248_60hz,
   243		.init_seq = (const u8 *)visionox_rm69299_1080x2248_60hz_init_seq,
   244		.init_seq_len = ARRAY_SIZE(visionox_rm69299_1080x2248_60hz_init_seq),
   245	};
   246	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
