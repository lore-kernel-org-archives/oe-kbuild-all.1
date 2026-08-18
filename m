Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6941B35DA7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043994; cv=none; b=F3ZqXOhq2AJIDc+7ML7khWCjV0xfe10xE80SP0a4f6Qk7FspAaPaA0U4fCV/KQ4a0I+60ABF3w16iTPFG4XgYx6myS807GBQmFMHPnNEH48/0wRoHkcIpmm5h1RoLHC6YHTcjBVL7sLk5BvC4oY+lxvFoY02b3HZGwvHA6806sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043994; c=relaxed/simple;
	bh=dEW58n6hpUhcQO5WP16NY6hCoxbcqXQtSZAn6D6Jqfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jxZ3qjqx8k8XeEW33JyNgFWLPFqN8FyhhpycU+HZor1xFqaxX0nVwSglxqa23ZdKrJHaeayWARZFrU662v7rJLZw3HYzhDjYlLjujaKExGy4i+ulxz/+m4+fTBP6AVwIQpFGf2EOaN4uGJn4FrOkYksI7vdoOaeF0uYE4Di4G1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhRNR3NA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhRNR3NA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787043992; x=1818579992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dEW58n6hpUhcQO5WP16NY6hCoxbcqXQtSZAn6D6Jqfk=;
  b=XhRNR3NA04FxPsClaRGev3B+2od6+j+ZxsvDNDeY2qCsOy3fEtD0r6rN
   Y+jUAYIAg0li/nwoC71+HvmS62wqzbQp0s2aoOEJnqbyIKjVJNWfC66gU
   xrWvXaPUrgo+XJjxrhatm16bmLMb4/qoWAZeoFtxzB6p/K8ajW+rGPjeV
   Ypav66qlIKNbszz5IcRlFib589B24VJAAELiKB5YTP+UElZFI2ySolqTk
   s4YQjZZZWvRA4LQKZCV+NgWp84v7kC97oIjy21OLoXkB6gU4PDTp/t98q
   Vt//3UeMDTG9xlZEcuWBst9pC8zoKqUotg6lj76MCtsUXWhG9cV5qkRau
   A==;
X-CSE-ConnectionGUID: C4+aKSlHSeGcffVfriDgMg==
X-CSE-MsgGUID: i4kBZQMMQAaQfoIBasjt1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="91343144"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="91343144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 02:06:31 -0700
X-CSE-ConnectionGUID: 8IalkXVoRo6bTlTEnH0TSQ==
X-CSE-MsgGUID: vLU/DiX9Q7eF/JzjYc3r4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="288676642"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Aug 2026 02:06:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwFm7-00000000eDS-3ECZ;
	Tue, 18 Aug 2026 09:06:27 +0000
Date: Tue, 18 Aug 2026 17:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 8/21]
 kernel/bpf/syscall.c:2090:49: error: passing argument 3 of
 'folio_scratchpad_init_key' from incompatible pointer type
Message-ID: <202608181733.nvO2seJ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git folio-pool-v2-lockdep
head:   e77ee8289ea0755b0ee299348504d4568f942d71
commit: 2432ceb7a7491e75e80ba99c95a327d7f5eb1bf2 [8/21] bpf/syscall: Route generic_map_update_batch key/value allocations to folio_scratchpad
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260818/202608181733.nvO2seJ2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181733.nvO2seJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181733.nvO2seJ2-lkp@intel.com/

Note: the jimc/folio-pool-v2-lockdep HEAD e77ee8289ea0755b0ee299348504d4568f942d71 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/bpf/syscall.c: In function 'generic_map_update_batch':
>> kernel/bpf/syscall.c:2090:49: error: passing argument 3 of 'folio_scratchpad_init_key' from incompatible pointer type [-Wincompatible-pointer-types]
    2090 |         folio_scratchpad_init_key(&batch_sp, 0, &bpf_batch_scratchpad_key);
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                 |
         |                                                 struct static_key_true *
   In file included from include/linux/bpf_verifier.h:901,
                    from kernel/bpf/syscall.c:9:
   include/linux/folio_pool.h:104:51: note: expected 'struct static_key *' but argument is of type 'struct static_key_true *'
     104 |                                struct static_key *key);
         |                                ~~~~~~~~~~~~~~~~~~~^~~


vim +/folio_scratchpad_init_key +2090 kernel/bpf/syscall.c

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
