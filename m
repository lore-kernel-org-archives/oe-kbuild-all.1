Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F3F25B1CB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771408013; cv=none; b=N0hTiqWw3a3xcgy0cFql8eHrtwSVl3hYOnErNiTrSF/4wIPSh7DjxLijKDmh9NpvqnXKkJUCnVoCxi3s+38tzcsYARnPO2mPJIX78e/HcVO2ubU/jYIxj6+Y1aYSglzf0HyMMzvtq4Hc08BGZzHafIomVcErh/wCmXgTewywHtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771408013; c=relaxed/simple;
	bh=qj+KAkLX0I+gqTHp2zgRlgGBx7jc4pJasBsgbfZYuxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkWyqDXFQH3g14DrVnJoGVbvE0nPVxvV2c7zaSSDNwh3i3pzIn8KnIpY7Em1dUIx8CvaKERqjzsgVT/7HMTpmcITwTFSYc2DAdc26fKAaIVKDxy+gmTYtfJBx17DiSmEwA+Ir+2ncU3at/0cT+ZJTVZTEjDb54+qzYl3dSQ+qcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtFBWaiB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtFBWaiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771408012; x=1802944012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qj+KAkLX0I+gqTHp2zgRlgGBx7jc4pJasBsgbfZYuxw=;
  b=KtFBWaiB6wfn+Cb91e/rqTjP+BekG7ayPORtpR4W8ncYh+OzpbInu1j+
   T8Fsnp1zQVmjgDG4XS1EqdFGG6MofpDJRz8d2It93zfA7M6GWh7rs5fDw
   5IftSnwUAdR6Cwsk98baU2t60ZLmFSrZw7oucD9oj64IOjEhRvnkDNB7a
   qyV4kYO/h2UqpDTpQHytKixloaY7D19ZfNtk5nideJtSzJKSPVvRDN60r
   bTH0PniwDnyJniWs7aIhJgq4NM6YsXzzV+5Gpu7v380YG/sZs/Olyrnda
   R/Tblm/WfDyDy822ygF14/2qXm0P1Iy/aptlDAPcwv0EszpXGQF9zvNZc
   w==;
X-CSE-ConnectionGUID: VVYgeRXgQpOO85f+H63BJA==
X-CSE-MsgGUID: oIXIsq7RSBeQQDKU+6fuKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="75090155"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="75090155"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 01:46:51 -0800
X-CSE-ConnectionGUID: uPh0sfMkSEyeqzD9bwXEEw==
X-CSE-MsgGUID: zw911Dt9S6+2A/6+4eKBcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="218679753"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Feb 2026 01:46:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vse8o-000000012F2-2WCu;
	Wed, 18 Feb 2026 09:46:42 +0000
Date: Wed, 18 Feb 2026 17:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, willy@infradead.org, david@kernel.org,
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
	ying.huang@linux.alibaba.com, apopple@nvidia.com,
	lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com,
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
	vbabka@suse.cz, jannh@google.com, rppt@kernel.org, mhocko@suse.com,
	pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com,
	npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org,
	borntraeger@linux.ibm.com
Subject: Re: [PATCH v2 3/3] mm: use vma_start_write_killable() in
 process_vma_walk_lock()
Message-ID: <202602181740.hX3aevQ8-lkp@intel.com>
References: <20260217163250.2326001-4-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217163250.2326001-4-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on b08472d036a36893ecf68296d87beb58d21f4357]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-vma-cleanup-error-handling-path-in-vma_expand/20260218-003502
base:   b08472d036a36893ecf68296d87beb58d21f4357
patch link:    https://lore.kernel.org/r/20260217163250.2326001-4-surenb%40google.com
patch subject: [PATCH v2 3/3] mm: use vma_start_write_killable() in process_vma_walk_lock()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260218/202602181740.hX3aevQ8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602181740.hX3aevQ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602181740.hX3aevQ8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/mm/gmap.c:2311:5: error: conflicting types for 's390_reset_cmma'; have 'int(struct mm_struct *)'
    2311 | int s390_reset_cmma(struct mm_struct *mm)
         |     ^~~~~~~~~~~~~~~
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:32,
                    from include/linux/pagewalk.h:5,
                    from arch/s390/mm/gmap.c:14:
   arch/s390/include/asm/pgtable.h:2020:13: note: previous declaration of 's390_reset_cmma' with type 'void(struct mm_struct *)'
    2020 | extern void s390_reset_cmma(struct mm_struct *mm);
         |             ^~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:31,
                    from arch/s390/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:386,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/cpufeature.h:12,
                    from arch/s390/mm/gmap.c:11:
   arch/s390/mm/gmap.c:2321:19: error: conflicting types for 's390_reset_cmma'; have 'int(struct mm_struct *)'
    2321 | EXPORT_SYMBOL_GPL(s390_reset_cmma);
         |                   ^~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   arch/s390/mm/gmap.c:2321:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    2321 | EXPORT_SYMBOL_GPL(s390_reset_cmma);
         | ^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgtable.h:2020:13: note: previous declaration of 's390_reset_cmma' with type 'void(struct mm_struct *)'
    2020 | extern void s390_reset_cmma(struct mm_struct *mm);
         |             ^~~~~~~~~~~~~~~
--
   arch/s390/kvm/kvm-s390.c: In function 'kvm_s390_set_mem_control':
>> arch/s390/kvm/kvm-s390.c:994:21: error: invalid use of void expression
     994 |                 err = s390_reset_cmma(kvm->arch.gmap->mm);
         |                     ^


vim +2311 arch/s390/mm/gmap.c

  2310	
> 2311	int s390_reset_cmma(struct mm_struct *mm)
  2312	{
  2313		int err;
  2314	
  2315		mmap_write_lock(mm);
  2316		err = walk_page_range(mm, 0, TASK_SIZE, &reset_cmma_walk_ops, NULL);
  2317		mmap_write_unlock(mm);
  2318	
  2319		return (err < 0) ? err : 0;
  2320	}
  2321	EXPORT_SYMBOL_GPL(s390_reset_cmma);
  2322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
