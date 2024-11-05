Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A01E8855
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730832886; cv=none; b=gO60iR+rNb+kixcsGXPq1f6RSZy1UcewAlNFDCF6wbo6vS5yoYJ7wwQxoA0t5Ed4lz5HwGbB+7ffLfFsWBHBCddPDcu2IW1CJwjrj6GGWyjqrE8M3FubulJ2Do1iP9iSmE3qhU2ERf7erfHTbhA5WPUn4JVml/A1oKaEA13stlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730832886; c=relaxed/simple;
	bh=ZH7etx/9O1xdtZYvH0GaTKK1ORjghV/ZHybNIlf88dI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IK51O8uQjQuVIJzHglGb927mkhQbucnQu0kNff1rP1KA4KgYjX9fVPUWHS9JvYVc7YJoXT4yNONCK++29z0dFtFZr2UEYDim93gZbu3fw8FOV7Zx2Df01Zz3vAHMG3je82jdm/OoyEbKof0ffEmqjp2bISQH9bcA7a/5DMp1nRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMJeQk7p; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMJeQk7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730832885; x=1762368885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZH7etx/9O1xdtZYvH0GaTKK1ORjghV/ZHybNIlf88dI=;
  b=RMJeQk7p0R1vGK+tJMx06mIAeM8PhqGXJqko6rx+Oza4ah95+fL/Z0NV
   fz624ZY1su5L70xf1Or6nsGu7vkAPi9+8iTJzGs/OQK8eboX9eO62jYYV
   Bfu8nEHUZCgjtrGQ1PkCvFdJ98nRsrfz14uQ8RveJ3L85IuogxolcwriQ
   C8QuwJtp50McB9zsluwTPjzRo9QHrdb5xvp8pffMWYO14K8fDXTh62fio
   qUYSQ5YUSH/ZmighZX9pqyRjfM7t0sU5ltQXlwvtvJZEe7GICxs20lb6F
   WWD9/Q9GFKQpeKgJlPHodemzW0aTdDHgNekm4O0yKBJ2Wll8feQz3lsIy
   Q==;
X-CSE-ConnectionGUID: l9t8GBB8QiujNBqU644g5Q==
X-CSE-MsgGUID: V0IsnEqMRXueLMZph2GKvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30773812"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30773812"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 10:54:44 -0800
X-CSE-ConnectionGUID: g7lgc7+tSdesxLM/AetbrA==
X-CSE-MsgGUID: RGM4FqDySyW1LogdTB0Xcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88923140"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Nov 2024 10:54:43 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8OhM-000mMP-2b;
	Tue, 05 Nov 2024 18:54:40 +0000
Date: Wed, 6 Nov 2024 02:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1225/1225] kernel/kprobes.o: warning:
 objtool: register_kprobe()+0x6ee: unreachable instruction
Message-ID: <202411060227.oM4HzgsK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: 388c9a84a807812e7226e0e1ca606563e14a7f5a [1225/1225] kprobes: Warn if the kprobe is reregistered
config: x86_64-buildonly-randconfig-002-20241028 (https://download.01.org/0day-ci/archive/20241106/202411060227.oM4HzgsK-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060227.oM4HzgsK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060227.oM4HzgsK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kprobes.c:120:14: warning: no previous prototype for function 'alloc_insn_page' [-Wmissing-prototypes]
     120 | void __weak *alloc_insn_page(void)
         |              ^
   kernel/kprobes.c:120:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     120 | void __weak *alloc_insn_page(void)
         | ^
         | static 
   kernel/kprobes.c:125:13: warning: no previous prototype for function 'free_insn_page' [-Wmissing-prototypes]
     125 | void __weak free_insn_page(void *page)
         |             ^
   kernel/kprobes.c:125:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     125 | void __weak free_insn_page(void *page)
         | ^
         | static 
   2 warnings generated.
   kernel/kprobes.c:145: warning: Function parameter or member 'c' not described in '__get_insn_slot'
>> kernel/kprobes.o: warning: objtool: register_kprobe()+0x6ee: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
