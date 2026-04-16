Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2742E1A9B58
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 00:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776300334; cv=none; b=UYIECzab5JxSdyZJM0+ePJRge9EztWo5P+HEg6upbUxTX6y5luZ3NqEVyFHq0phPGuVJ02hc+E0S+PBBxVMy7qrDIMUxrttehG2W2HpOQzdCkKzxgvTIhMcJS0JzpgbP0kO/IQJpHz/gIM8M6mWEuUe13JYSYoYWI9DTmUOJAeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776300334; c=relaxed/simple;
	bh=EKiXs22KLTOQ+PHXm4m7qUKNooR/B4O9OhYHO9EirQk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FCYbafufgqZRl04oeXzFvwSbBZ1ACITV0gwazq6idEUwo3Vdw3dK4nL9acNsg+rWM7Rvt4NyMg+1SaDuzF+PbtdnxzUWilm1K0fBPH/xRYCiFEgRB0IhFlRHMfqTcKTYCYqMBF87wgmZhU0qcOFi6QFfoSAwlbncLVELENV8UR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3Ktl0DI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3Ktl0DI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776300331; x=1807836331;
  h=date:from:to:cc:subject:message-id;
  bh=EKiXs22KLTOQ+PHXm4m7qUKNooR/B4O9OhYHO9EirQk=;
  b=L3Ktl0DIbAaYt+5iowPQm9VGLl6eyDAB9H4VlaLn5Pfc8nkTFeCY3his
   +3LfxTdxh8pZhHp56BzDc62g3kxry1M5F08z0QZxrN1ybKuHuAHMw8NTD
   XUhzUFYyFs4UfqwkwD4dARpj9T5fAdj5xOVsac+eL4yrJ7kLNbSSpD8d+
   vi5rK22XkAipwd+LWMl4UGbcWQ9yjTtZp9hXBLKKFiMuOyoOvwvhYyyRc
   8kbGsqLhRrc/y2XPjqV/o9PIxbIKEkmrth8k4W4wXjp0FGj5WyLAKDpWh
   mVYcsE6sA4eUGo6NyMQ12lOk/AIhLTSB6+XsXx014GW88blyhxp0DKm95
   w==;
X-CSE-ConnectionGUID: ng66S5tKRiKveApG03DjsQ==
X-CSE-MsgGUID: 0X7MKcyMR2228KWy+rcveg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81163762"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="81163762"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 17:45:30 -0700
X-CSE-ConnectionGUID: grulalwKRbei0Z8gat64tw==
X-CSE-MsgGUID: k2SUgW56RS6FyfYUuJD8NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="268565980"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Apr 2026 17:45:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDArG-000000000sv-4AHg;
	Thu, 16 Apr 2026 00:45:26 +0000
Date: Thu, 16 Apr 2026 02:45:03 +0200
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/core/bpf_sk_storage.c:140:22: error: too many arguments
 to function 'bpf_selem_alloc'
Message-ID: <202604160227.Jat81B7J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Amery-Hung/selftests-bpf-Remove-kmalloc-tracing-from-local-storage-create-bench/20260415-163526
head:   22bd953a5faeea8dd0780f885b234d987745e31b
commit: 22bd953a5faeea8dd0780f885b234d987745e31b bpf: Remove gfp_flags plumbing from bpf_local_storage_update()
date:   16 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260416/202604160227.Jat81B7J-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160227.Jat81B7J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160227.Jat81B7J-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/bpf_sk_storage.c: In function 'bpf_sk_storage_clone_elem':
>> net/core/bpf_sk_storage.c:140:22: error: too many arguments to function 'bpf_selem_alloc'
     140 |         copy_selem = bpf_selem_alloc(smap, newsk, NULL, false, GFP_ATOMIC);
         |                      ^~~~~~~~~~~~~~~
   In file included from net/core/bpf_sk_storage.c:11:
   include/linux/bpf_local_storage.h:190:1: note: declared here
     190 | bpf_selem_alloc(struct bpf_local_storage_map *smap, void *owner, void *value,
         | ^~~~~~~~~~~~~~~
   net/core/bpf_sk_storage.c: In function 'bpf_sk_storage_clone':
>> net/core/bpf_sk_storage.c:205:31: error: too many arguments to function 'bpf_local_storage_alloc'
     205 |                         ret = bpf_local_storage_alloc(newsk, smap, copy_selem, GFP_ATOMIC);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf_local_storage.h:197:1: note: declared here
     197 | bpf_local_storage_alloc(void *owner,
         | ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_selem_alloc +140 net/core/bpf_sk_storage.c

6ac99e8f23d4b1 Martin KaFai Lau        2019-04-26  132  
1f00d375af84fb KP Singh                2020-08-25  133  static struct bpf_local_storage_elem *
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  134  bpf_sk_storage_clone_elem(struct sock *newsk,
1f00d375af84fb KP Singh                2020-08-25  135  			  struct bpf_local_storage_map *smap,
1f00d375af84fb KP Singh                2020-08-25  136  			  struct bpf_local_storage_elem *selem)
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  137  {
1f00d375af84fb KP Singh                2020-08-25  138  	struct bpf_local_storage_elem *copy_selem;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  139  
0e854e55356908 Amery Hung              2025-11-14 @140  	copy_selem = bpf_selem_alloc(smap, newsk, NULL, false, GFP_ATOMIC);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  141  	if (!copy_selem)
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  142  		return NULL;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  143  
db559117828d24 Kumar Kartikeya Dwivedi 2022-11-04  144  	if (btf_record_has_field(smap->map.record, BPF_SPIN_LOCK))
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  145  		copy_map_value_locked(&smap->map, SDATA(copy_selem)->data,
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  146  				      SDATA(selem)->data, true);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  147  	else
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  148  		copy_map_value(&smap->map, SDATA(copy_selem)->data,
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  149  			       SDATA(selem)->data);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  150  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  151  	return copy_selem;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  152  }
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  153  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  154  int bpf_sk_storage_clone(const struct sock *sk, struct sock *newsk)
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  155  {
1f00d375af84fb KP Singh                2020-08-25  156  	struct bpf_local_storage *new_sk_storage = NULL;
1f00d375af84fb KP Singh                2020-08-25  157  	struct bpf_local_storage *sk_storage;
1f00d375af84fb KP Singh                2020-08-25  158  	struct bpf_local_storage_elem *selem;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  159  	int ret = 0;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  160  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  161  	RCU_INIT_POINTER(newsk->sk_bpf_storage, NULL);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  162  
0db4941d9dae15 Fushuai Wang            2025-10-07  163  	rcu_read_lock_dont_migrate();
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  164  	sk_storage = rcu_dereference(sk->sk_bpf_storage);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  165  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  166  	if (!sk_storage || hlist_empty(&sk_storage->list))
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  167  		goto out;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  168  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  169  	hlist_for_each_entry_rcu(selem, &sk_storage->list, snode) {
1f00d375af84fb KP Singh                2020-08-25  170  		struct bpf_local_storage_elem *copy_selem;
1f00d375af84fb KP Singh                2020-08-25  171  		struct bpf_local_storage_map *smap;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  172  		struct bpf_map *map;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  173  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  174  		smap = rcu_dereference(SDATA(selem)->smap);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  175  		if (!(smap->map.map_flags & BPF_F_CLONE))
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  176  			continue;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  177  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  178  		/* Note that for lockless listeners adding new element
1f00d375af84fb KP Singh                2020-08-25  179  		 * here can race with cleanup in bpf_local_storage_map_free.
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  180  		 * Try to grab map refcnt to make sure that it's still
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  181  		 * alive and prevent concurrent removal.
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  182  		 */
1e0bd5a091e5d9 Andrii Nakryiko         2019-11-17  183  		map = bpf_map_inc_not_zero(&smap->map);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  184  		if (IS_ERR(map))
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  185  			continue;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  186  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  187  		copy_selem = bpf_sk_storage_clone_elem(newsk, smap, selem);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  188  		if (!copy_selem) {
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  189  			ret = -ENOMEM;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  190  			bpf_map_put(map);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  191  			goto out;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  192  		}
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  193  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  194  		if (new_sk_storage) {
fd103ffc57c9a3 Amery Hung              2026-02-05  195  			ret = bpf_selem_link_map(smap, new_sk_storage, copy_selem);
fd103ffc57c9a3 Amery Hung              2026-02-05  196  			if (ret) {
fd103ffc57c9a3 Amery Hung              2026-02-05  197  				bpf_selem_free(copy_selem, true);
fd103ffc57c9a3 Amery Hung              2026-02-05  198  				atomic_sub(smap->elem_size,
fd103ffc57c9a3 Amery Hung              2026-02-05  199  					   &newsk->sk_omem_alloc);
fd103ffc57c9a3 Amery Hung              2026-02-05  200  				bpf_map_put(map);
fd103ffc57c9a3 Amery Hung              2026-02-05  201  				goto out;
fd103ffc57c9a3 Amery Hung              2026-02-05  202  			}
1f00d375af84fb KP Singh                2020-08-25  203  			bpf_selem_link_storage_nolock(new_sk_storage, copy_selem);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  204  		} else {
b00fa38a9c1cba Joanne Koong            2022-03-17 @205  			ret = bpf_local_storage_alloc(newsk, smap, copy_selem, GFP_ATOMIC);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  206  			if (ret) {
e76a33e1c71865 Amery Hung              2025-11-14  207  				bpf_selem_free(copy_selem, true);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  208  				atomic_sub(smap->elem_size,
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  209  					   &newsk->sk_omem_alloc);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  210  				bpf_map_put(map);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  211  				goto out;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  212  			}
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  213  
1f00d375af84fb KP Singh                2020-08-25  214  			new_sk_storage =
1f00d375af84fb KP Singh                2020-08-25  215  				rcu_dereference(copy_selem->local_storage);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  216  		}
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  217  		bpf_map_put(map);
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  218  	}
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  219  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  220  out:
0db4941d9dae15 Fushuai Wang            2025-10-07  221  	rcu_read_unlock_migrate();
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  222  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  223  	/* In case of an error, don't free anything explicitly here, the
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  224  	 * caller is responsible to call bpf_sk_storage_free.
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  225  	 */
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  226  
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  227  	return ret;
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  228  }
8f51dfc73bf181 Stanislav Fomichev      2019-08-14  229  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
