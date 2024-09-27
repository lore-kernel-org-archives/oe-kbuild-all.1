Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8FF1BFE1A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727448344; cv=none; b=sMM91B1V2jidbFOXms35VdLfwARqIFS/EtHo3qTTuAixsrDWnda7TGtHdxZfZeRL4MrVvnhFxs54dAL/shWHk9oT1XG6A8W9E4Y8YFFwLQUlkoB51kIfl7f67f9ua3MRTJ/vVyTYiwQ4F4IvIQfwCDjx6VfGjzifmCQxniC4FFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727448344; c=relaxed/simple;
	bh=F9SsqJEXHl10cq0AE0yaiobdiHZi1EyiIivl8OtU8Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JjHLSu6QCvaNIpHDTUgHu8eSc8+d4VbLATi7QlQRa2DHbTbUFCFSW9sOJDGZDwizKhbhgn1hDaY0MyUzHnaD7W3NDUj/FdLCNQf2MeTvj5//G0MAmBWQnMPl1qycOgBgWd46vals67akqGBDX+Dw7+Tlfl5LwCDiD0znF6Ey+N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYPCocsX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYPCocsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727448343; x=1758984343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F9SsqJEXHl10cq0AE0yaiobdiHZi1EyiIivl8OtU8Pw=;
  b=UYPCocsXTsrz7UzX+AHaYbdgEEeMwUin6YERYN4et/nTsxe3cWW4GjtA
   EzgCyVu4KT0RTQkbsKJxb/9eNZzr+3EvKwB8iHz6Z2n91z68zalux3257
   4xrll9L5MQqaWOH6v57kTHRxEQQST8sdo1jMwKYO2a+EmUTlpHxgzThXc
   83i3a0+q59M5Ar4hZDeZcIyrJKl/P2rdHnwQzUHNPKMiuu9IuES8PsVdS
   8YT1MCyvML9fGJYb3kOvTEa0KzndgUGKxcUW6u/cdzfEO/BwzQkN12giZ
   kgR4smdM+m0JRcBkXnEqINDuaU0xkTcqu7GvEVId2KpJFXC7vOYnlg1EE
   g==;
X-CSE-ConnectionGUID: cJiAOvFFRJuEuufDEJXklA==
X-CSE-MsgGUID: AVoKh2KiSluQJ8HeY9Lq4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30383259"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="30383259"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:45:28 -0700
X-CSE-ConnectionGUID: E2gv21LIQNOpaspYREVwuQ==
X-CSE-MsgGUID: HwF4H/pKQfCAqb5a4mZGLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="110047253"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Sep 2024 07:45:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suCDk-000MFm-0D;
	Fri, 27 Sep 2024 14:45:24 +0000
Date: Fri, 27 Sep 2024 22:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [namhyung-perf:bpf/slab-iter-v1 2/3] mm/slab_common.c:1326:1: error:
 type defaults to 'int' in declaration of '__bpf_kfunc_start_defs'
Message-ID: <202409272218.zKGpAjnx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/namhyung/linux-perf.git bpf/slab-iter-v1
head:   4b00a1c2a4965bcd16815d5ec9a53bf967db5c27
commit: 2484111accb0d487ef52a4c62c6b5b25af560ee3 [2/3] mm/bpf: Add bpf_get_slab_cache() kfunc
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409272218.zKGpAjnx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272218.zKGpAjnx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272218.zKGpAjnx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/slab_common.c:1326:1: warning: data definition has no type or storage class
    1326 | __bpf_kfunc_start_defs();
         | ^~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1326:1: error: type defaults to 'int' in declaration of '__bpf_kfunc_start_defs' [-Wimplicit-int]
>> mm/slab_common.c:1326:1: error: function declaration isn't a prototype [-Werror=strict-prototypes]
>> mm/slab_common.c:1328:12: error: expected ';' before 'struct'
    1328 | __bpf_kfunc struct kmem_cache *bpf_get_slab_cache(u64 addr)
         |            ^~~~~~~
         |            ;
   mm/slab_common.c:1328:32: warning: no previous prototype for 'bpf_get_slab_cache' [-Wmissing-prototypes]
    1328 | __bpf_kfunc struct kmem_cache *bpf_get_slab_cache(u64 addr)
         |                                ^~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1336:1: warning: data definition has no type or storage class
    1336 | __bpf_kfunc_end_defs();
         | ^~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1336:1: error: type defaults to 'int' in declaration of '__bpf_kfunc_end_defs' [-Wimplicit-int]
   mm/slab_common.c:1336:1: error: function declaration isn't a prototype [-Werror=strict-prototypes]
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +1326 mm/slab_common.c

  1324	
  1325	#ifdef CONFIG_BPF_SYSCALL
> 1326	__bpf_kfunc_start_defs();
  1327	
> 1328	__bpf_kfunc struct kmem_cache *bpf_get_slab_cache(u64 addr)
  1329	{
  1330		struct slab *slab;
  1331	
  1332		slab = virt_to_slab((void *)(long)addr);
  1333		return slab ? slab->slab_cache : NULL;
  1334	}
  1335	
> 1336	__bpf_kfunc_end_defs();
  1337	#endif /* CONFIG_BPF_SYSCALL */
  1338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
