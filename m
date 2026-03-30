Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7224114A60F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 05:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774847852; cv=none; b=W3o5E/fzqBlaMCOuyBP8Ql5YbneyuCMLpZJUHGtBrG9dwZ97kjnYWHprKN/VT+mm/TI3ON30vs+dInVToaJOk4/J02oPv97TImAUxFUDZYXiB7cQGFSACitJitBU0vN52Yd6xYRH63gfS6QtKDdJQpzhc3URipuagg4lA2unAfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774847852; c=relaxed/simple;
	bh=rh0tXV0OTMkQVFfVUK329EadKutooU4BqE48+UDnz0E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eBtQK4AZ825IdGw+DWM8vhW6UZ+3qEj4/taI0vh9kdH1xWEdKYgYeOmBQCKN0El+Uq8nIA0jxHWHOu0FGolfy64wPlJJMMBXWEbyHJ/lKN+3TdlMn2Ba+0/NNT1Zef44/YW8Yrm7nYmsVMt8hTNmfuvQ752zare62YzrOrR2LBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iq5HE2tJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iq5HE2tJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774847851; x=1806383851;
  h=date:from:to:cc:subject:message-id;
  bh=rh0tXV0OTMkQVFfVUK329EadKutooU4BqE48+UDnz0E=;
  b=Iq5HE2tJn7VLMnZ5yX6E2oL36WslTBFtQGgTbXlfUFArsMU1TG1vRs0j
   yRZQXVtHo1qCRopydq+y1QI7hCjsOMEQ6HZSSkJ9iFZHjHGscn/ALhpRw
   89g+/skxCT4PxvO7U8vJJwOtwfGbKm15mLfBBhd/rHbjqx0TFPI3wxyLS
   gLAX3XTTp71d/VDtnYo2X7/MxS2iNHgtk0jHUoBwubJnzzdhzNCFQZC34
   RMb5UHFhgl9QBRbCrQjkenoh+Mhim0/DsolApsHrmZ/50JPUVDwFPCIEf
   9dolK1okAMhvKfs6CE7L70RTRzMTbxVOMUBJ6lZvUvJYVULh+a/nhyw6i
   g==;
X-CSE-ConnectionGUID: 6pNQwcjDRwOKPfU2mdaNfQ==
X-CSE-MsgGUID: Hk1gTms/RjO9q62n3odEjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75543302"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="75543302"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 22:17:30 -0700
X-CSE-ConnectionGUID: SBHVXDMkTMOtY/ugZMKm+w==
X-CSE-MsgGUID: 5K+fsDfdQ/OEF3K+I1sA4A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Mar 2026 22:17:28 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w750A-000000000i5-1nih;
	Mon, 30 Mar 2026 05:17:26 +0000
Date: Mon, 30 Mar 2026 13:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-lajolla-staging 1/1]
 drivers/dma-buf/dma-buf.c:42:1: sparse: sparse: symbol
 'dmabuf_accounting_key' was not declared. Should it be static?
Message-ID: <202603301328.7CUbS0Ol-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-lajolla-staging
head:   b050398b89b00b305b45dd70b8ab91470c42f155
commit: fa99e30c77d66fe736ceda786695b70dac853899 [1/1] ANDROID: add command line parameter for dmabuf accounting
config: arm-randconfig-r132-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301328.7CUbS0Ol-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301328.7CUbS0Ol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301328.7CUbS0Ol-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-buf.c:42:1: sparse: sparse: symbol 'dmabuf_accounting_key' was not declared. Should it be static?

vim +/dmabuf_accounting_key +42 drivers/dma-buf/dma-buf.c

    41	
  > 42	DEFINE_STATIC_KEY_TRUE(dmabuf_accounting_key);
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
