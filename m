Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AAD86334
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 00:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765586747; cv=none; b=AOlJn2lpEptrT+Cqq3ukCQFOyPCLEXPkB+9We/duQRWMl6CNbSZcj6m5FZ0tRXQEnstrsmfOLP7l+q//1jaYTGenVj3yEp8R/pa6oZFN+xewtvC0NpH+L0BFCi/x/hOV6UL2+VW7R4xPExKZNj9UZwJlnxLx+mNjAkR9Z4buvMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765586747; c=relaxed/simple;
	bh=ZNMQTF3d0fqzxwgT27n1heIfbd20FTdXMIdnobYPNJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vGNcteknGlCGWURbVGcF21HkiNfdLvpZm4LbkAWdCCtmUYad1zNHAhhImXTs9CTfyV5E2uW+3uqq0L5Lmj865F3Q11T5zpkUn5rTFHlTkbfrc49bEUSPFs7HUI5571GeXORi36mMSLQLOXSkxVQN6k9tvtpLBKZiIh4qE4ARVVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eH4qU1G9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eH4qU1G9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765586747; x=1797122747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZNMQTF3d0fqzxwgT27n1heIfbd20FTdXMIdnobYPNJ8=;
  b=eH4qU1G9UlfGHdqz7hIHZeQgwSLOc1kM77oPG7PDQFRm9z0epTwSjycp
   OuXCPQwn7I5YABZO0HlIPvECCGdHVmmz2HeNPx716+8hCbFnqa97qyg2i
   OOQPPHOK3J4K8jXZVgAPiJkuRp7XWY2VopuCj0ZoVwQJcIhHuyIhi6rz0
   jF7vKP29wtdMhJwQ053MhjvLsN+GtmtsiCehfX88TvzSYKV2M7Y9uVxT5
   iN9CQhwS60ZQG1uBOHGkEs8mzKdsHKWIauZLlYYuJcNYHaIHdAVdHwnfG
   CC7xfmIUmguAnAJIM5bN0/e+POFOLondFOQK6f9gAEJ4JbBXwU+AkvN9t
   w==;
X-CSE-ConnectionGUID: 3g7zrxuVTdy6kBXsieJm2g==
X-CSE-MsgGUID: wQ2HjEeTTZGLKg+coqZQDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71219661"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="71219661"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 16:45:46 -0800
X-CSE-ConnectionGUID: 9vkwK8yfSh2LHSAAB3CeyQ==
X-CSE-MsgGUID: Z+eZjpuZTG6k7lOgm9NZ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196290214"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 16:45:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUDlW-000000006qx-2033;
	Sat, 13 Dec 2025 00:45:42 +0000
Date: Sat, 13 Dec 2025 08:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/1]
 drivers/gpu/drm/i915/i915_gpu_error.c:692:3: sparse: sparse: symbol
 'guc_hw_reg_state' was not declared. Should it be static?
Message-ID: <202512130835.ohcdlxpz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   48776802cab71a77ba2ad75aae59a6f475da6efc
commit: ba391a102ec11ab7f5b249e46dcf61ef836a57e7 [0/1] drm/i915/guc: Include the GuC registers in the error state
config: x86_64-randconfig-123-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130835.ohcdlxpz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130835.ohcdlxpz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130835.ohcdlxpz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/i915_gpu_error.c:692:3: sparse: sparse: symbol 'guc_hw_reg_state' was not declared. Should it be static?

vim +/guc_hw_reg_state +692 drivers/gpu/drm/i915/i915_gpu_error.c

   687	
   688	/* This list includes registers that are useful in debugging GuC hangs. */
   689	const struct {
   690		u32 start;
   691		u32 count;
 > 692	} guc_hw_reg_state[] = {
   693		{ 0xc0b0, 2 },
   694		{ 0xc000, 65 },
   695		{ 0xc140, 1 },
   696		{ 0xc180, 16 },
   697		{ 0xc1dc, 10 },
   698		{ 0xc300, 79 },
   699		{ 0xc4b4, 47 },
   700		{ 0xc574, 1 },
   701		{ 0xc57c, 1 },
   702		{ 0xc584, 11 },
   703		{ 0xc5c0, 8 },
   704		{ 0xc5e4, 1 },
   705		{ 0xc5ec, 103 },
   706		{ 0xc7c0, 1 },
   707		{ 0xc0b0, 2 }
   708	};
   709	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
