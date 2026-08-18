Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0823DB630
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078218; cv=none; b=letsdmVf7++wcCqzM82LoCoECqumvOqipSNqx3xLvxHKmDKg+U8+Pxw6Cu6+Fa/b2YysoUEragQkQmzogP7P3M8Tvqg5VH3sIY/qF1Lqe3ZZ7TYS1edXimtdq7QGrxNl44wdVfKfDzh1Fik+MlwNdT2nMnENAE1FWqJz1/gi3Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078218; c=relaxed/simple;
	bh=OH9WfY2Z1Y598xYjv44FJnCN8Nne/ccjgUhC8LyNx8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UHHu1noxq9JhjyQwxUFtgNB6xall1+qS53ZAedA7MVTsM5F7OTfQ28eO1y77QSHzBgTdt0sG0NnIfELbjeWrDjPrXH9Y514AcuXTRPwMhVcFx0D+zDzmB4X0lzh6+oX9x1qmFa0zo0FTXaU1gMf8xLE09wgGptArYKe0B9+HY08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLKXnCjY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLKXnCjY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787078216; x=1818614216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OH9WfY2Z1Y598xYjv44FJnCN8Nne/ccjgUhC8LyNx8Y=;
  b=bLKXnCjYPmHhunPJSMsC2rCSJqKKo1e79nSSC3x1urLg1rSYbuWHAYi8
   U+j5lNnRnkwNApg4+LgI/7RTakkObmsP9hW7KxasVqXVouUVeGd1OnCRl
   5IRMkAHvhl+rtBpRL7FNU+Vvbl49v0bJvwC1nAUGyKXYu/EY/ljlsgGeb
   F1Jk3k1QFLdBb86JXLqqEwZH+90j/x2VJDbwBzHTkYWOKUx+D7KJEXtgI
   5kuUU0PtixL3u/lxOvP9GynC9dYTOii8/axXIuFzdH8mowRE3CYjHMmPY
   ZNcXB1ZfLmWLPa9/PFV5TnBs/4ccuxwIEIIN029PULZ1E4SJEMiIGyCpi
   w==;
X-CSE-ConnectionGUID: ginLfo/TSlukFHRigiizGA==
X-CSE-MsgGUID: NOX0XFjIT0S5i1gt5FGMZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87647954"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87647954"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 11:36:55 -0700
X-CSE-ConnectionGUID: Wn+0rdbnRGKYXsH+Y823WQ==
X-CSE-MsgGUID: FrR6PSROTSqdFW4TReuMPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="295229307"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 18 Aug 2026 11:36:54 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwOg7-00000000799-2ixs;
	Tue, 18 Aug 2026 18:36:51 +0000
Date: Tue, 18 Aug 2026 20:36:29 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v1 8/12] kernel/bpf/syscall.c:2090:42:
 error: incompatible pointer types passing 'struct static_key_true *' to
 parameter of type 'struct static_key *'
Message-ID: <202608182020.MUTLT6gX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git folio-pool-v1
head:   cf5ab0bf7d3855a2dc795f25265b8f9f5ae0d324
commit: 2432ceb7a7491e75e80ba99c95a327d7f5eb1bf2 [8/12] bpf/syscall: Route generic_map_update_batch key/value allocations to folio_scratchpad
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260818/202608182020.MUTLT6gX-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608182020.MUTLT6gX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608182020.MUTLT6gX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/syscall.c:2090:42: error: incompatible pointer types passing 'struct static_key_true *' to parameter of type 'struct static_key *' [-Wincompatible-pointer-types]
    2090 |         folio_scratchpad_init_key(&batch_sp, 0, &bpf_batch_scratchpad_key);
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/folio_pool.h:104:30: note: passing argument to parameter 'key' here
     104 |                                struct static_key *key);
         |                                                   ^
   1 error generated.


vim +2090 kernel/bpf/syscall.c

  2064	
  2065	int generic_map_update_batch(struct bpf_map *map, struct file *map_file,
  2066				     const union bpf_attr *attr,
  2067				     union bpf_attr __user *uattr)
  2068	{
  2069		void __user *values = u64_to_user_ptr(attr->batch.values);
  2070		void __user *keys = u64_to_user_ptr(attr->batch.keys);
  2071		struct folio_scratchpad batch_sp;
  2072		u32 value_size, cp, max_count;
  2073		void *key, *value;
  2074		int err = 0;
  2075	
  2076		err = bpf_map_check_op_flags(map, attr->batch.elem_flags,
  2077					     BPF_F_LOCK | BPF_F_CPU | BPF_F_ALL_CPUS);
  2078		if (err)
  2079			return err;
  2080	
  2081		value_size = bpf_map_value_size(map, attr->batch.elem_flags);
  2082	
  2083		max_count = attr->batch.count;
  2084		if (!max_count)
  2085			return 0;
  2086	
  2087		if (put_user(0, &uattr->batch.count))
  2088			return -EFAULT;
  2089	
> 2090		folio_scratchpad_init_key(&batch_sp, 0, &bpf_batch_scratchpad_key);
  2091	
  2092		key = folio_scratchpad_alloc(&batch_sp, map->key_size,
  2093					     sizeof(void *), GFP_USER | __GFP_NOWARN);
  2094		if (!key)
  2095			return -ENOMEM;
  2096	
  2097		value = folio_scratchpad_alloc(&batch_sp, value_size,
  2098					       sizeof(void *), GFP_USER | __GFP_NOWARN);
  2099		if (!value) {
  2100			folio_scratchpad_free(&batch_sp);
  2101			return -ENOMEM;
  2102		}
  2103	
  2104		for (cp = 0; cp < max_count; cp++) {
  2105			err = -EFAULT;
  2106			if (copy_from_user(key, keys + cp * map->key_size,
  2107			    map->key_size) ||
  2108			    copy_from_user(value, values + cp * value_size, value_size))
  2109				break;
  2110	
  2111			err = bpf_map_update_value(map, map_file, key, value,
  2112						   attr->batch.elem_flags);
  2113	
  2114			if (err)
  2115				break;
  2116			cond_resched();
  2117		}
  2118	
  2119		if (copy_to_user(&uattr->batch.count, &cp, sizeof(cp)))
  2120			err = -EFAULT;
  2121	
  2122		folio_scratchpad_free(&batch_sp);
  2123	
  2124		return err;
  2125	}
  2126	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
