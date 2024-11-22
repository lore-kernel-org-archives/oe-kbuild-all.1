Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE18922339
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 16:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732294380; cv=none; b=nVsGtsnjzG5sKda6Fpk9wpUPPR2wyQvGdH7AWLv/V/inYWwHXZTiMekabtOYXpzpwYiZ54gF2flTV84xg+zVKWiBwFI4MnxvmgFwyWkfH7dNS2WcbBvvpkXwvoMeHzBdgNnXQsum4rXssuVnnOuztqBDjYLmJ634Hz0zph1h3Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732294380; c=relaxed/simple;
	bh=kZnbaE8LJUKQfv7L80BTOdeDaVGvxruk8HzaEA5IKW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPD7aVepyeMNh38JHn4WKZV7qARa9OiQ7QEr0DOH8sinBD80IQ+nfo0qKyWztIAVDRqHClc56ozWqbToOLc4Uu5nKnAR21nerpENI6DvuvD770uRQqEJ8h0AaH72cgqnYLSD6/M6SSKN6keiCk8pNKNLwQBdLjNC528HtrHCUAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOM5IuJ4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOM5IuJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732294379; x=1763830379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kZnbaE8LJUKQfv7L80BTOdeDaVGvxruk8HzaEA5IKW0=;
  b=LOM5IuJ4ujGmHPOSN9qESOUokAztRun9koWLFAM5qdLoaIvYgmQ3jeQo
   vX1VQNI3C0+gNH2yyw0g3COJs5oLNfnhFweG3j59sCst0aZyZr+U5ogI7
   JR1689wLueg5yxgBTLxP6hSkzxMW904fIhz9yClpy0jnkXddUpmo71je4
   YC9i3wthqO1k5mZ3njDM63mqb6V7ca5VnfFyqEKg0a8iqYCHR6xu1dBc6
   VRvBeyTilXFRJJSIIn4+sWLjx1NBqxwLtVjgzQe81mE5Ci+GseiK47OYK
   xjgp6xELT2eUjh3wbGRsdgrbTPPJt33IXujgnie2ZrBb7YurkQTBRfNS7
   g==;
X-CSE-ConnectionGUID: hoc/HMKfSR29ZSTn9q5+HQ==
X-CSE-MsgGUID: UGMG4hJGQfqurViiiv11MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43855918"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="43855918"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 08:52:52 -0800
X-CSE-ConnectionGUID: FouXNupxTlKNoV61GKTIfg==
X-CSE-MsgGUID: vu2+7xHbTu6he5kphu3ASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="95710656"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Nov 2024 08:52:51 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEWtk-00044v-2W;
	Fri, 22 Nov 2024 16:52:48 +0000
Date: Sat, 23 Nov 2024 00:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] mm: convert mm_lock_seq to a proper seqcount
Message-ID: <202411230014.xk4U56vk-lkp@intel.com>
References: <20241121162826.987947-2-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121162826.987947-2-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on 43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-convert-mm_lock_seq-to-a-proper-seqcount/20241122-003050
base:   43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
patch link:    https://lore.kernel.org/r/20241121162826.987947-2-surenb%40google.com
patch subject: [PATCH v2 2/3] mm: convert mm_lock_seq to a proper seqcount
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241123/202411230014.xk4U56vk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230014.xk4U56vk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230014.xk4U56vk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/rwonce.h:27,
                    from ./arch/sh/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:317,
                    from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/sh/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from arch/sh/kernel/asm-offsets.c:14:
   include/linux/mmap_lock.h: In function 'vma_end_write_all':
>> include/linux/mmap_lock.h:140:35: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     140 |         ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
         |                                   ^~
   include/linux/kcsan-checks.h:371:32: note: in definition of macro 'ASSERT_EXCLUSIVE_WRITER'
     371 |         __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
         |                                ^~~
>> include/linux/mmap_lock.h:140:35: error: 'struct mm_struct' has no member named 'mm_lock_seq'
     140 |         ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
         |                                   ^~
   include/linux/kcsan-checks.h:371:45: note: in definition of macro 'ASSERT_EXCLUSIVE_WRITER'
     371 |         __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCESS_ASSERT)
         |                                             ^~~
   make[3]: *** [scripts/Makefile.build:102: arch/sh/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +140 include/linux/mmap_lock.h

   128	
   129	/*
   130	 * Drop all currently-held per-VMA locks.
   131	 * This is called from the mmap_lock implementation directly before releasing
   132	 * a write-locked mmap_lock (or downgrading it to read-locked).
   133	 * This should normally NOT be called manually from other places.
   134	 * If you want to call this manually anyway, keep in mind that this will release
   135	 * *all* VMA write locks, including ones from further up the stack.
   136	 */
   137	static inline void vma_end_write_all(struct mm_struct *mm)
   138	{
   139		mmap_assert_write_locked(mm);
 > 140		ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
   141		mm_lock_seqcount_end(mm);
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
