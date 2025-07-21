Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2E81E9B19
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 18:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753123088; cv=none; b=E/hRPUXcrKrsg46ouFazIZT3x3lDeYE56TeQwoATy54icwMCZSFoaI1ZtFUk9vopg793DuIaDzHuJmSofz6weI7WvS/icxccmc3KNDWZHYWopqoZQFkxKfPcZ1LLpNnRU+YL2pifniRdpyI71i8KYhqbAgIhAopOQ5v+Qggxiyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753123088; c=relaxed/simple;
	bh=D/yJWSiXDqz0zJ1ihtBmadOUXlXpyjKIDNPPD4Q9cxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OatzOV/5vQ9cj9u2aQC/PPz8uP/qTpWdf4JW32H95Jx/LwoRWmYpS/c4DaKyWQDER1O1ha0NLcprqWfvjHU4f1wiXMLJ8a8AQN6BWtzyXOh5JndKeBji0GKsT1q8Lyw1AuRQl+UUAKKja9Emjwc9zGMq8mphBj+i58POWG9BeM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aW7rgKh4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aW7rgKh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753123086; x=1784659086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D/yJWSiXDqz0zJ1ihtBmadOUXlXpyjKIDNPPD4Q9cxg=;
  b=aW7rgKh4KkvAXXrvh61ojJQAEX3jV4p4OUNPQ6V38WI9hEWNecXpVu5J
   IaM2g68wIL1rh7yGAHoWi1Rz54iDN2DPegvH+LqRcQQ3h8Tq/YDjGuODB
   TWZ1vd8Te9yJ9Jb+eiQj2Q6GIYrGUWa3dU66/uayWfnwHiy2aqJDd6w5J
   5MGSTa4DutjLIn23hLH5qYr8DRr8dPx29vCsvHVAhr5YXWKNLhRa0ajtY
   7T7dB6T8ENCNUg+AjxoTaKAx4oLQ8a5jIrbS5YaQ3H1Kw8X+7NVOVPL75
   RLgohmylS6/npwNtmFn7x+1INBXjUSmJwTvAXRO5OtEvAByfcQngv8VYC
   Q==;
X-CSE-ConnectionGUID: cW17v4pdT0elUyOKYcTfbw==
X-CSE-MsgGUID: ufX1ZcJJTEeUG7Z8uRKOsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55293098"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="55293098"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 11:38:06 -0700
X-CSE-ConnectionGUID: di11VSeCS8eGVn9K7LCCPg==
X-CSE-MsgGUID: agioM4oFR62n/hV9wKRJRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="162963182"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jul 2025 11:38:04 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udvOk-000H4b-14;
	Mon, 21 Jul 2025 18:38:02 +0000
Date: Tue, 22 Jul 2025 02:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Rahul Pathak <rpathak@ventanamicro.com>
Subject: [linux-next:master 7333/11398]
 drivers/cpuidle/cpuidle-riscv-sbi.c:358:36: error: 'sbi_pd_providers'
 undeclared; did you mean 'sbi_pd_provider'?
Message-ID: <202507220226.GNUKHJrr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
commit: ee766b0175861ef2b2e774d2c49eba9a6b38dc7a [7333/11398] cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
config: riscv-randconfig-002-20250721 (https://download.01.org/0day-ci/archive/20250722/202507220226.GNUKHJrr-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220226.GNUKHJrr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220226.GNUKHJrr-lkp@intel.com/

Note: the linux-next/master HEAD 97987520025658f30bb787a99ffbd9bbff9ffc9d builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from include/linux/alloc_tag.h:10,
                    from include/linux/percpu.h:5,
                    from include/linux/cpuidle.h:14,
                    from drivers/cpuidle/cpuidle-riscv-sbi.c:13:
   drivers/cpuidle/cpuidle-riscv-sbi.c: In function 'sbi_cpuidle_domain_sync_state':
>> drivers/cpuidle/cpuidle-riscv-sbi.c:358:36: error: 'sbi_pd_providers' undeclared (first use in this function); did you mean 'sbi_pd_provider'?
     list_for_each_entry(pd_provider, &sbi_pd_providers, link)
                                       ^~~~~~~~~~~~~~~~
   include/linux/container_of.h:19:26: note: in definition of macro 'container_of'
     void *__mptr = (void *)(ptr);     \
                             ^~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     list_entry((ptr)->next, type, member)
     ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     for (pos = list_first_entry(head, typeof(*pos), member); \
                ^~~~~~~~~~~~~~~~
   drivers/cpuidle/cpuidle-riscv-sbi.c:358:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(pd_provider, &sbi_pd_providers, link)
     ^~~~~~~~~~~~~~~~~~~
   drivers/cpuidle/cpuidle-riscv-sbi.c:358:36: note: each undeclared identifier is reported only once for each function it appears in
     list_for_each_entry(pd_provider, &sbi_pd_providers, link)
                                       ^~~~~~~~~~~~~~~~
   include/linux/container_of.h:19:26: note: in definition of macro 'container_of'
     void *__mptr = (void *)(ptr);     \
                             ^~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     list_entry((ptr)->next, type, member)
     ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     for (pos = list_first_entry(head, typeof(*pos), member); \
                ^~~~~~~~~~~~~~~~
   drivers/cpuidle/cpuidle-riscv-sbi.c:358:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(pd_provider, &sbi_pd_providers, link)
     ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/percpu.h:5,
                    from include/linux/cpuidle.h:14,
                    from drivers/cpuidle/cpuidle-riscv-sbi.c:13:
>> include/linux/list.h:770:43: error: dereferencing pointer to incomplete type 'struct sbi_pd_provider'
     for (pos = list_first_entry(head, typeof(*pos), member); \
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   include/linux/list.h:601:2: note: in expansion of macro 'container_of'
     container_of(ptr, type, member)
     ^~~~~~~~~~~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     list_entry((ptr)->next, type, member)
     ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     for (pos = list_first_entry(head, typeof(*pos), member); \
                ^~~~~~~~~~~~~~~~
   drivers/cpuidle/cpuidle-riscv-sbi.c:358:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(pd_provider, &sbi_pd_providers, link)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:503:27: error: expression in static assertion is not an integer
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   include/linux/list.h:601:2: note: in expansion of macro 'container_of'
     container_of(ptr, type, member)
     ^~~~~~~~~~~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     list_entry((ptr)->next, type, member)
     ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     for (pos = list_first_entry(head, typeof(*pos), member); \
                ^~~~~~~~~~~~~~~~
   drivers/cpuidle/cpuidle-riscv-sbi.c:358:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(pd_provider, &sbi_pd_providers, link)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:503:27: error: expression in static assertion is not an integer
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   include/linux/list.h:601:2: note: in expansion of macro 'container_of'
     container_of(ptr, type, member)
     ^~~~~~~~~~~~
   include/linux/list.h:645:2: note: in expansion of macro 'list_entry'
     list_entry((pos)->member.next, typeof(*(pos)), member)
     ^~~~~~~~~~
   include/linux/list.h:772:13: note: in expansion of macro 'list_next_entry'
          pos = list_next_entry(pos, member))
                ^~~~~~~~~~~~~~~
   drivers/cpuidle/cpuidle-riscv-sbi.c:358:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(pd_provider, &sbi_pd_providers, link)
     ^~~~~~~~~~~~~~~~~~~


vim +358 drivers/cpuidle/cpuidle-riscv-sbi.c

   347	
   348	static void sbi_cpuidle_domain_sync_state(struct device *dev)
   349	{
   350		struct sbi_pd_provider *pd_provider;
   351	
   352		/*
   353		 * All devices have now been attached/probed to the PM domain
   354		 * topology, hence it's fine to allow domain states to be picked.
   355		 */
   356		sbi_cpuidle_pd_allow_domain_state = true;
   357	
 > 358		list_for_each_entry(pd_provider, &sbi_pd_providers, link)
   359			of_genpd_sync_state(pd_provider->node);
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
