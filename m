Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D5B12B80
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 02:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwU/L8KQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700533973; x=1732069973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zrbjJ9oEI2slbPlqxfBNrfBnXeA53nu8ruoxg47jjZc=;
  b=CwU/L8KQk4zrrP43ivhCATGrKBBUUy2qKB1PujKsUz2ezz9JUxZg18N2
   9jXc1aB6tlW9KNcggDmEu4apBTgfnbBrPYkctZT4AWwNVSX8LESTVMzNP
   tEL0C708SrndPwpyvHYJzYHr8k45Esu0vK1M7kaVvbRlZQUJrqoRSWfSo
   RLoIC5sVsJg2n5zmU5W/Gj5MBHzh9ddVWOo3XMVQ+4EvEHrsCTwb97p/B
   wzqLWxditZ38S2E3F5d9NiOkegopa1k6UXIJEevpSbRnpEcF/hnfRjnPL
   aU/eW/EfRDov+Wj7m6xrK8cA0koGapQdPEPhCWHPMRxxsxjvUf8uMp55f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371090893"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371090893"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 18:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939959225"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939959225"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2023 18:32:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5GZ9-0007CA-1f;
	Tue, 21 Nov 2023 02:32:43 +0000
Date: Tue, 21 Nov 2023 10:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Marchevsky <davemarchevsky@fb.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Kernel Team <kernel-team@fb.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Dave Marchevsky <davemarchevsky@fb.com>
Subject: Re: [PATCH v1 bpf-next 1/2] bpf: Support BPF_F_MMAPABLE task_local
 storage
Message-ID: <202311211037.6BmDdrr4-lkp@intel.com>
References: <20231120175925.733167-2-davemarchevsky@fb.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120175925.733167-2-davemarchevsky@fb.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Marchevsky/bpf-Support-BPF_F_MMAPABLE-task_local-storage/20231121-020345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231120175925.733167-2-davemarchevsky%40fb.com
patch subject: [PATCH v1 bpf-next 1/2] bpf: Support BPF_F_MMAPABLE task_local storage
config: sparc-randconfig-r081-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211037.6BmDdrr4-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211037.6BmDdrr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211037.6BmDdrr4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/syscall.c:407:20: warning: no previous prototype for 'bpf_map_get_memcg' [-Wmissing-prototypes]
     407 | struct mem_cgroup *bpf_map_get_memcg(const struct bpf_map *map)
         |                    ^~~~~~~~~~~~~~~~~
--
>> kernel/bpf/bpf_local_storage.c:30:7: warning: no previous prototype for 'alloc_mmapable_selem_value' [-Wmissing-prototypes]
      30 | void *alloc_mmapable_selem_value(struct bpf_local_storage_map *smap)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_local_storage.c: In function 'bpf_selem_free_rcu':
   kernel/bpf/bpf_local_storage.c:288:39: warning: variable 'smap' set but not used [-Wunused-but-set-variable]
     288 |         struct bpf_local_storage_map *smap;
         |                                       ^~~~


vim +/bpf_map_get_memcg +407 kernel/bpf/syscall.c

   406	
 > 407	struct mem_cgroup *bpf_map_get_memcg(const struct bpf_map *map)
   408	{
   409		if (map->objcg)
   410			return get_mem_cgroup_from_objcg(map->objcg);
   411	
   412		return root_mem_cgroup;
   413	}
   414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
