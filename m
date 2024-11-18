Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D945150981
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731966573; cv=none; b=scA4fv5lFxJajmxTcrKlTFywrrQWNyQ0rTKVOQbyO8gGe3OOdiakkh/qLW7paUXDFBOMEgmGiTrvRsOBBinh0IZZwSrC8RBiTRH2O7+YCqCcjIEq4b3Eb++pnXGBLbP7pawMo5FUpyyXcRkCGmQaL9Zq9B7x4/spHHvWqtWWclA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731966573; c=relaxed/simple;
	bh=h55UXr/amE0o/TSpZwMFCC5CFQW1/1zfSkyF5RWC4TA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bng0rPw3U5SSV0abnWHiyTXiqNW5hsfooRUatLV0jBIAbpmdCRR4fDIMqiFy7a7+mtjgaLU85uPybOBxZGmPvV/KM5MJ1JZXKYkVa/fTseK3X5H+fqofS1EBPj2iTu4IlAIU1CR36n6LqAkiiwoYmEEJMiLDzvoD/URg0usEBVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsSV5IR7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsSV5IR7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731966571; x=1763502571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h55UXr/amE0o/TSpZwMFCC5CFQW1/1zfSkyF5RWC4TA=;
  b=GsSV5IR7O5d39mXVZxAeRE/hzXEyufH+nNzxQTZw9ZhtnRwwR4TMz+uO
   dixHDmQ5cjJgLzwgrwISBHaXZe0lB9E8RMaQLN8Xhx5Ba7mE0/ZwVgpYc
   Jb+OWL8bpu2VqpwhLURstJTn+JYmauvJZe42raaB1RL866gtut+ncK/Sr
   VixGG75gx5PVfYW7SM/c+zfxzhI2O71svYiPFJlZGr00lkny62JCSkRtD
   8Dfv01JPFx4xp0YPr7QiJFaLt1GbQlYOF+poPHoNh5oQNagxkgQ6Bw3ZL
   Hrpdsz3ZM53mtEg/V53cH23LAC4LkIthI1RdEYjOCthXGvQ/zMvkQwGQ4
   w==;
X-CSE-ConnectionGUID: kKIq14HmRh2voSuehgv7IA==
X-CSE-MsgGUID: l31+Co5fQdqNIjNtAfJcPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32181409"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="32181409"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 13:49:30 -0800
X-CSE-ConnectionGUID: w8FBmRyER5CvHBP9VDusVg==
X-CSE-MsgGUID: VtNCIHtPRu6YVpMx58xjhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="93806984"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Nov 2024 13:49:29 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD9cc-0002f7-2a;
	Mon, 18 Nov 2024 21:49:26 +0000
Date: Tue, 19 Nov 2024 05:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2441/2441] mm/swapfile.o: warning: objtool:
 free_swap_and_cache()+0xfc: unreachable instruction
Message-ID: <202411190510.SqCWpjuv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f1a4fad5752a86f57a260fc09d7d7ee25dbd84de
commit: 1d94cc3410041f99602b68b4d1d79e57fbebf6ca [2441/2441] mm: swap: fix race between free_swap_and_cache() and swapoff()
config: x86_64-buildonly-randconfig-001-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190510.SqCWpjuv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190510.SqCWpjuv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190510.SqCWpjuv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.o: warning: objtool: free_swap_and_cache()+0xfc: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
