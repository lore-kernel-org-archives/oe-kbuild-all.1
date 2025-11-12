Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5796A19F41C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 04:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762920543; cv=none; b=fKmMVfG6oJj2yR10m7sWA5h7oykBbMbZlenOoNdengEpvqWKJqVNoxbeGWDVYjd4c4uuX+s7YsgBSxsnHTNMWooNUEYXxbyE8rWS8iY+u1oCKlVKP1sINg27KmEwj2uxHKrZvC1ch1TABxjfw+xbtgj71XHEhDg+cy3cR+lyW/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762920543; c=relaxed/simple;
	bh=KAHtjv2w7CA+6wTTuDcDjlGA+ZvHR4vrRNPyvLoAeOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MUcoENrQjkmMKClRqC8DlMHD8F9xkZ3eX23/wI6IeGOvsT9u5rcfWDpcMMXh4YsfpXJx7Q1zPGPLcuWWJGHYUNncpcrUhGqxT8VfJTy3+0panuIyBN+pfTdQgdA3z3pBf6SRvp5ZcpZg9UFcUC1h4wwqLz4Gl/kzZxN+u7zrDQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bejyz+bX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bejyz+bX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762920541; x=1794456541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KAHtjv2w7CA+6wTTuDcDjlGA+ZvHR4vrRNPyvLoAeOQ=;
  b=Bejyz+bXk9IYILUcx6Fw7BC8HqFT1RwKn+NF/SGarm5mtXLb0Kutf+D+
   HUhiMJCSLLR4IepriBTxylu3PTUDG92UTgxOuOIu2NMy8C/ZuMlNp83mo
   YLd8TCjTRUkiNEL8w+cD7pErTDqDiiYQaY1KDtFORL3cHVnsG8u1QPc9m
   csk8dtUcdb+3ElFN0UKyScoN3GZWMCRIBtkixP7ocihs8Xnpt7dcy8Zh2
   23Sdt/fFeAHoYoOVFpp+Ol7YvE1jU5zconGR8t8DZ+9ruqBjlxw5xC8HH
   arZpDzE8U5cjg6tzuH1gteS7nDkCKBG8fnjz81SAwAw+jGupp/L3KcCBQ
   w==;
X-CSE-ConnectionGUID: 22cVITIQTcavmufiwcWAyg==
X-CSE-MsgGUID: Nry13wZvQxiZzeRU1eoljQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="52536671"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="52536671"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 20:09:01 -0800
X-CSE-ConnectionGUID: QL9fEP2jT7qcZt1f0/5NOg==
X-CSE-MsgGUID: eQUcmLp9Qv2Iss0S64xR9Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Nov 2025 20:08:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJ2AD-0003oX-25;
	Wed, 12 Nov 2025 04:08:57 +0000
Date: Wed, 12 Nov 2025 12:08:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangjian <zhangjian496@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3135/3135] mm/gmem.c:286:13: warning: no previous
 prototype for function 'gm_dev_fault'
Message-ID: <202511121239.TQKV2Lm3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   60e792f234ac2bde55a826388fb644bede86a012
commit: 4e04912a6c73df8a7185e0f4406d8a39daa027a3 [3135/3135] gmem: implement page faulting for peer-shared vma
config: arm64-randconfig-001-20251112 (https://download.01.org/0day-ci/archive/20251112/202511121239.TQKV2Lm3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121239.TQKV2Lm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121239.TQKV2Lm3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> mm/gmem.c:286:13: warning: no previous prototype for function 'gm_dev_fault' [-Wmissing-prototypes]
     286 | enum gm_ret gm_dev_fault(struct mm_struct *mm, unsigned long  addr,
         |             ^
   mm/gmem.c:286:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     286 | enum gm_ret gm_dev_fault(struct mm_struct *mm, unsigned long  addr,
         | ^
         | static 
   2 warnings generated.


vim +/gm_dev_fault +286 mm/gmem.c

   285	
 > 286	enum gm_ret gm_dev_fault(struct mm_struct *mm, unsigned long  addr,
   287					struct gm_dev *dev, int behavior)
   288	{
   289		int ret;
   290	
   291		mmap_read_lock(mm);
   292		ret = gm_dev_fault_locked(mm, addr, dev, behavior);
   293		mmap_read_unlock(mm);
   294	
   295		return ret;
   296	}
   297	EXPORT_SYMBOL_GPL(gm_dev_fault);
   298	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
