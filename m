Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739011482E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 20:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735244000; cv=none; b=RRBTcl5IogJxxBx68ojd+e/HcIsDeE1zRYROX87bxlhTywPZDabqeCmUdySeY4mChs5b4HIL6rzkiGMIs49JS74cTmBDvGmsOLItVlHtmbRBaFYaG7fVD76ygVPIlL5zMznED8LgzCl5x90f8UoRa7QSXjc86gCkYnnHX/HJ2mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735244000; c=relaxed/simple;
	bh=kut02tP8mAXPeZfupd1/Q1dZIS77Zok7HOnpHEnNw94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHmw7agWg6pZ/ZQb/PX8iGpKK6mEALTtsGsiFQhd6ml/DCKx68D6ElOmZVdtAZTaNp58QFzu8bBygA8P5VcbK0olXooodWgqMu67Hsc3j0SAjo+uzhlW95CqXzpSNqRl/ImNfN/f62b3VZRGCktGcZuydooTFcemXuh2y6dDQ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btDLRwjB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btDLRwjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735243998; x=1766779998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kut02tP8mAXPeZfupd1/Q1dZIS77Zok7HOnpHEnNw94=;
  b=btDLRwjBPKWLQZiZe5KW6UB3bmddF9ghNac6UeOMpajIAfMI36H4DwrL
   Z+GN/MTglijrEdR9ZvOLFae2/hf1nuAr0UO+eQpmLeWnwF+yRbwQtChX/
   ClihCq8Z1b9RJm6/61iRg16NkqmfLLtTexizi1+c8jCNi+IRG1SzsROli
   aRb6LoZOwchOOS/lr+o5iEg5c31Xs3Ob1unBP6D9surV8ojuxlUnyy9CB
   J7cRJDvK7879v52P0AgKZOkhZvdFc9i7dxqO5CumTxmqHNUCH+tJfDnRX
   AjEJ8rw6rN5bd8XTUb3tjTy2dm+thn0YGZV9aPPdbh9tNw3RRKY5arFfI
   g==;
X-CSE-ConnectionGUID: h004qTpYRf+VAZMdRexvUA==
X-CSE-MsgGUID: ovM+j/0VSceaKuoOXYyeXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="23259233"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="23259233"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 12:13:16 -0800
X-CSE-ConnectionGUID: yZmBS6RRT6CweXrxhYA4Rw==
X-CSE-MsgGUID: jKNwmcfFSY+hZRKfaQ/GSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="99745800"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Dec 2024 12:13:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQuEF-0002lo-2L;
	Thu, 26 Dec 2024 20:13:07 +0000
Date: Fri, 27 Dec 2024 04:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, peterz@infradead.org,
	willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v7 13/17] mm/debug: print vm_refcnt state when dumping
 the vma
Message-ID: <202412270304.GtgNiDPd-lkp@intel.com>
References: <20241226170710.1159679-14-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-14-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on 431614f1580a03c1a653340c55ea76bd12a9403f]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-introduce-vma_start_read_locked-_nested-helpers/20241227-010925
base:   431614f1580a03c1a653340c55ea76bd12a9403f
patch link:    https://lore.kernel.org/r/20241226170710.1159679-14-surenb%40google.com
patch subject: [PATCH v7 13/17] mm/debug: print vm_refcnt state when dumping the vma
config: riscv-randconfig-001-20241227 (https://download.01.org/0day-ci/archive/20241227/202412270304.GtgNiDPd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412270304.GtgNiDPd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412270304.GtgNiDPd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/cmpxchg.h:9,
                    from arch/riscv/include/asm/barrier.h:14,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:23,
                    from mm/debug.c:9:
   mm/debug.c: In function 'dump_vma':
>> mm/debug.c:189:66: error: 'const struct vm_area_struct' has no member named 'vm_refcnt'
     189 |                 vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_refcnt));
         |                                                                  ^~
   include/linux/printk.h:473:33: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:514:9: note: in expansion of macro 'printk'
     514 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   mm/debug.c:181:9: note: in expansion of macro 'pr_emerg'
     181 |         pr_emerg("vma %px start %px end %px mm %px\n"
         |         ^~~~~~~~


vim +189 mm/debug.c

   178	
   179	void dump_vma(const struct vm_area_struct *vma)
   180	{
   181		pr_emerg("vma %px start %px end %px mm %px\n"
   182			"prot %lx anon_vma %px vm_ops %px\n"
   183			"pgoff %lx file %px private_data %px\n"
   184			"flags: %#lx(%pGv) refcnt %x\n",
   185			vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
   186			(unsigned long)pgprot_val(vma->vm_page_prot),
   187			vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
   188			vma->vm_file, vma->vm_private_data,
 > 189			vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_refcnt));
   190	}
   191	EXPORT_SYMBOL(dump_vma);
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
