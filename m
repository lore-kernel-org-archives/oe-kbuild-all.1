Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CCF17C7BD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730469771; cv=none; b=EUMVbA8VgB7UpjmKOMBBzmzZ2fcqxjrMmweAepPrdlBElUDq+isYft7OENsi4aBZ/uK/96v7tyzt05nGEo45Ox/DirwS9SwWRoCVS1AtVdupDXuzuefoXxl3zmdgsiRcCn3BOB+e+r7It1f52WH2DIpt7WU7Ii+w41L9Sj9YoSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730469771; c=relaxed/simple;
	bh=o/BerWlG15TZeIiVvxiFPW0yeKnoj9S/2SLCMGpF7es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaSag8CCdRTDU6sIEknKCEcqUbxE3W8KtBJqT81FLkGxj4tGzYb8SPzibxlpp5d5d1nBFHiN8RHPwTW8IIAa8qBxwvE89C6UnPBUDWJYwQo3U8K4CQtlaVjHWjJvDx9bOcS6aAJDnhEgFFvCj75RfDmPeNb9WmuonROyTJ/NeWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clGaD1Nq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clGaD1Nq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730469766; x=1762005766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o/BerWlG15TZeIiVvxiFPW0yeKnoj9S/2SLCMGpF7es=;
  b=clGaD1NqnBIowST9n/39rudCyw6dg2+yxRiXl3ZXty4LacsrALjRFJ/C
   cT0BOMZm9ZpbPd9V7p2R/JkJDFr+glbTrZ7QBFfXj55wqELfG2EBo7S9U
   RQ6lJIyInaKrA7M7t72dJcTRJXegw4K+RUwgwOhTYW6/qFU+uUA/aqaQS
   UBAxC+Y/prYBVqIH3bYdqZleabFh5S+5JFPXvPRegi746orkWEcXq/yWe
   V41CJbnaqgnPi+Xx9MW2mZprNHMeg8iYwW0LeIyt1juBUWs1GROqvKunW
   p7RHGY/JyfO3aOEjFcMKZOwBuJNgKlIFts7LcrOGEVk3nXaCpHUV7cz91
   w==;
X-CSE-ConnectionGUID: Ep5WGnYJSXahwc0tUgXu8g==
X-CSE-MsgGUID: ZeSF19SFTjuHuSB3bjvsDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="29654132"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="29654132"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 07:02:44 -0700
X-CSE-ConnectionGUID: rAjQ2NzoRoOWf8nQDxqZLg==
X-CSE-MsgGUID: +vYyrcdsRN6cV+5MXDr6SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87767853"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2024 07:02:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6sEX-000hcJ-2m;
	Fri, 01 Nov 2024 14:02:37 +0000
Date: Fri, 1 Nov 2024 22:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: mrpre <mrpre@163.com>, yonghong.song@linux.dev,
	john.fastabend@gmail.com, martin.lau@kernel.org,
	edumazet@google.com, jakub@cloudflare.com, davem@davemloft.net,
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mrpre <mrpre@163.com>
Subject: Re: [PATCH 1/2] bpf: Introduce cpu affinity for sockmap
Message-ID: <202411012135.447KNHZK-lkp@intel.com>
References: <20241101023832.32404-1-mrpre@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101023832.32404-1-mrpre@163.com>

Hi mrpre,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on bpf/master net-next/main net/main linus/master v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mrpre/bpf-implement-libbpf-sockmap-cpu-affinity/20241101-104144
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241101023832.32404-1-mrpre%40163.com
patch subject: [PATCH 1/2] bpf: Introduce cpu affinity for sockmap
config: arc-randconfig-001-20241101 (https://download.01.org/0day-ci/archive/20241101/202411012135.447KNHZK-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012135.447KNHZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012135.447KNHZK-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/syscall.c: In function 'bpf_map_update_value':
>> kernel/bpf/syscall.c:254:24: error: too many arguments to function 'sock_map_update_elem_sys'
     254 |                 return sock_map_update_elem_sys(map, key, value, flags, target_cpu);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/bpf/syscall.c:4:
   include/linux/bpf.h:3175:19: note: declared here
    3175 | static inline int sock_map_update_elem_sys(struct bpf_map *map, void *key, void *value,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/sock_map_update_elem_sys +254 kernel/bpf/syscall.c

   240	
   241	static int bpf_map_update_value(struct bpf_map *map, struct file *map_file,
   242					void *key, void *value, __u64 flags, s32 target_cpu)
   243	{
   244		int err;
   245		/* Need to create a kthread, thus must support schedule */
   246		if (bpf_map_is_offloaded(map)) {
   247			return bpf_map_offload_update_elem(map, key, value, flags);
   248		} else if (map->map_type == BPF_MAP_TYPE_CPUMAP ||
   249			   map->map_type == BPF_MAP_TYPE_ARENA ||
   250			   map->map_type == BPF_MAP_TYPE_STRUCT_OPS) {
   251			return map->ops->map_update_elem(map, key, value, flags);
   252		} else if (map->map_type == BPF_MAP_TYPE_SOCKHASH ||
   253			   map->map_type == BPF_MAP_TYPE_SOCKMAP) {
 > 254			return sock_map_update_elem_sys(map, key, value, flags, target_cpu);
   255		} else if (IS_FD_PROG_ARRAY(map)) {
   256			return bpf_fd_array_map_update_elem(map, map_file, key, value,
   257							    flags);
   258		}
   259	
   260		bpf_disable_instrumentation();
   261		if (map->map_type == BPF_MAP_TYPE_PERCPU_HASH ||
   262		    map->map_type == BPF_MAP_TYPE_LRU_PERCPU_HASH) {
   263			err = bpf_percpu_hash_update(map, key, value, flags);
   264		} else if (map->map_type == BPF_MAP_TYPE_PERCPU_ARRAY) {
   265			err = bpf_percpu_array_update(map, key, value, flags);
   266		} else if (map->map_type == BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE) {
   267			err = bpf_percpu_cgroup_storage_update(map, key, value,
   268							       flags);
   269		} else if (IS_FD_ARRAY(map)) {
   270			err = bpf_fd_array_map_update_elem(map, map_file, key, value,
   271							   flags);
   272		} else if (map->map_type == BPF_MAP_TYPE_HASH_OF_MAPS) {
   273			err = bpf_fd_htab_map_update_elem(map, map_file, key, value,
   274							  flags);
   275		} else if (map->map_type == BPF_MAP_TYPE_REUSEPORT_SOCKARRAY) {
   276			/* rcu_read_lock() is not needed */
   277			err = bpf_fd_reuseport_array_update_elem(map, key, value,
   278								 flags);
   279		} else if (map->map_type == BPF_MAP_TYPE_QUEUE ||
   280			   map->map_type == BPF_MAP_TYPE_STACK ||
   281			   map->map_type == BPF_MAP_TYPE_BLOOM_FILTER) {
   282			err = map->ops->map_push_elem(map, value, flags);
   283		} else {
   284			err = bpf_obj_pin_uptrs(map->record, value);
   285			if (!err) {
   286				rcu_read_lock();
   287				err = map->ops->map_update_elem(map, key, value, flags);
   288				rcu_read_unlock();
   289				if (err)
   290					bpf_obj_unpin_uptrs(map->record, value);
   291			}
   292		}
   293		bpf_enable_instrumentation();
   294	
   295		return err;
   296	}
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
