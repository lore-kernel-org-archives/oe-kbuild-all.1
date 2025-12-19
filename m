Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC6D8F5B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 03:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766115891; cv=none; b=D8s15DpCMOey0NwhBPsb7u1EonK5JZHQHWJACFsHWD6dO4EzpOwYfoJfWj8JeHmGDEE89UHNd93vFn77bqGwABEK3aHSEaVy/I8nkGv28rXfRuvEa3ja4AyYNM+rlzfkpr7k2VzFhqh+c5kPzajI0Z1Icn/o0QPLBu90EvwhC7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766115891; c=relaxed/simple;
	bh=chegZylr449b4HmYadwkJFBuHVYaPMgZks58pRC6XFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZjVyz/1i6Y33URGfnAgFA+KevDV/RtpE+H48pIfcpmXNyrB5TblwqlsvOgAY0wzV1Hk3uPwNIyN07m4OAmG5SFaeD0iKntZ8LKRNnb0O+WOOYsuchOcGReYd5HtHt8eGrpBxz0mIJSPdDnQOQ/IQ8mHfOJR3Lz56Rh7b1e2dEeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUEbUMLp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUEbUMLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766115888; x=1797651888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=chegZylr449b4HmYadwkJFBuHVYaPMgZks58pRC6XFI=;
  b=mUEbUMLp9FvBvLJrbKmgubxuiFxGX/SxPATH7rk/qlmK222SMKhxeVS8
   UFhB93t9AXZlAHcZazjfnDKqN06jh6WuCnIaFUNMwGBNK2nrH9iTHg4DC
   USKBcZqKWMwkgmVdhu95WZT3nOU/HzzymApolB0S2hc8xji8Lk9SbeOZI
   3GHvyZUmNwnAyY17RBWPyJA3e++lFaIVR1yg7K3wVoF1L0K/bxBl6Z0GT
   cLKMBl0Wg0nidsDSK7epE57u7yerGN4Wpd/fqlKmBsm4QIJ4LqqF6DiVz
   OmuJqIjKiEjQKC01dYOOjRi1229/e3d0f5MYfBYPqwKdiF3YTGpnVYiMV
   Q==;
X-CSE-ConnectionGUID: 1s4kFG1nSXWvgHGB6Sivog==
X-CSE-MsgGUID: LbZZa01DTsKwP42UB/zYJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68012225"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68012225"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 19:44:47 -0800
X-CSE-ConnectionGUID: 2d90k9ViQIyi/bn2HhBBeQ==
X-CSE-MsgGUID: rMxE0u3aS4ScWmPUyONOpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="222175611"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 19:44:45 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWRQ3-000000002ws-1VFO;
	Fri, 19 Dec 2025 03:44:43 +0000
Date: Fri, 19 Dec 2025 11:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:ctx-analysis/dev 22/36]
 arch/um/include/shared/skas/mm_id.h:25:29: warning: '__get_turnstile'
 declared 'static' but never defined
Message-ID: <202512191123.9wHzO2Xe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marco,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   3b4ba9b3b7c8365712656e62d0ca5a09504b5074
commit: 984de4f8d618b9302bf2f459e217768752f39a69 [22/36] um: Fix incorrect __acquires/__releases annotations
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20251219/202512191123.9wHzO2Xe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191123.9wHzO2Xe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191123.9wHzO2Xe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/um/include/asm/mmu.h:12,
                    from include/linux/mm_types.h:26,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:18,
                    from arch/um/kernel/asm-offsets.c:6:
>> arch/um/include/shared/skas/mm_id.h:25:29: warning: '__get_turnstile' declared 'static' but never defined [-Wunused-function]
      25 | static inline struct mutex *__get_turnstile(struct mm_id *mm_id);
         |                             ^~~~~~~~~~~~~~~
--
   In file included from arch/um/include/asm/mmu.h:12,
                    from include/linux/mm_types.h:26,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:18,
                    from arch/um/kernel/asm-offsets.c:6:
>> arch/um/include/shared/skas/mm_id.h:25:29: warning: '__get_turnstile' declared 'static' but never defined [-Wunused-function]
      25 | static inline struct mutex *__get_turnstile(struct mm_id *mm_id);
         |                             ^~~~~~~~~~~~~~~
   In file included from arch/um/include/asm/mmu.h:12,
                    from include/linux/mm_types.h:26,
                    from include/linux/sched/mm.h:8,
                    from kernel/sched/sched.h:15,
                    from kernel/sched/rq-offsets.c:5:
>> arch/um/include/shared/skas/mm_id.h:25:29: warning: '__get_turnstile' declared 'static' but never defined [-Wunused-function]
      25 | static inline struct mutex *__get_turnstile(struct mm_id *mm_id);
         |                             ^~~~~~~~~~~~~~~
--
   In file included from arch/um/include/asm/mmu.h:12,
                    from include/linux/mm_types.h:26,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:18,
                    from arch/um/kernel/asm-offsets.c:6:
>> arch/um/include/shared/skas/mm_id.h:25:29: warning: '__get_turnstile' declared 'static' but never defined [-Wunused-function]
      25 | static inline struct mutex *__get_turnstile(struct mm_id *mm_id);
         |                             ^~~~~~~~~~~~~~~
   In file included from arch/um/include/asm/mmu.h:12,
                    from include/linux/mm_types.h:26,
                    from include/linux/sched/mm.h:8,
                    from kernel/sched/sched.h:15,
                    from kernel/sched/rq-offsets.c:5:
>> arch/um/include/shared/skas/mm_id.h:25:29: warning: '__get_turnstile' declared 'static' but never defined [-Wunused-function]
      25 | static inline struct mutex *__get_turnstile(struct mm_id *mm_id);
         |                             ^~~~~~~~~~~~~~~


vim +25 arch/um/include/shared/skas/mm_id.h

    23	
    24	/* Internal linkage; declared here for below context analysis annotations. */
  > 25	static inline struct mutex *__get_turnstile(struct mm_id *mm_id);
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
