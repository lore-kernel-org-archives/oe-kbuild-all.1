Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B983280325
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461051; cv=none; b=Vls11EN5IznFUi9rpY6Ob7Vt+1pMLotgLyS+gR7vlhh3RPIWutq59x+ZUBJn7Io7cQdyMT9qd8OwlFkafUtNdMqmvQPybkBI43t1wclAQOozU5OSk8KZ9xwhpUDEE/jN/EGuSQXk/3f/gnyyxBPzcuA4qhs09wC3TH9CR0fJzeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461051; c=relaxed/simple;
	bh=cLhWp+BjFhg/3Oh7BR76yYxxNSqYihlP5kLQr9rPP9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gtJjLvha6tQVqlXKkhmItm1uqftx3EDrBviFW9tOwyMjByS4gBHQl8u3YgiQvsMfVbve7qxX2B7fgHsQdF4ZlIx6DKfhUmmCpoixT+jy/s7FRtEbCEe1y4mppRkOzTlMbGbHjloohdjZ5mSgCGKepPf27eaDmOcEy9e/8Pbot1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vgek548F; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vgek548F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765461049; x=1796997049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cLhWp+BjFhg/3Oh7BR76yYxxNSqYihlP5kLQr9rPP9U=;
  b=Vgek548F+/B1LgmlMBQHT/jIJo7uk4mz011DdkYBYwTBINc+jWYEfCLM
   98Y+pzewr+5A/3QgYahUDXkQWUZHKRJ1gplOtx8xyNf8GJJkTNQKek98M
   qYqb7n++embPgzXUFmfARqJTz5RZ+Iuj9uVB+mrhb2kEBUhlo7rpb3FB7
   a7fAqdS5EMSHK9RynFN11rGDc+LCu8LL1h5PHxvA87NbyDfY/FnGHZaex
   WEyme9jFhGsRXkM1xc0MJG7kQnvvf7KFASZSi0QK8yGEP13yiRfJZKXU3
   KyhG4+LNlxcxh7X3Xg0iqD7Fn8cTuWreiGb9DsC8spDjmFfwnZJ6bZ7ZJ
   g==;
X-CSE-ConnectionGUID: YKCx0Cb+RqC7bH3BkV1Blg==
X-CSE-MsgGUID: N4HRO/dxSACyXl9gPJPMGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67328219"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67328219"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:50:49 -0800
X-CSE-ConnectionGUID: 7E7D4t68ScacMQ4rMsNhgg==
X-CSE-MsgGUID: yPOKOnGVQKKcfnI9bg/RGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="195881459"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 11 Dec 2025 05:50:48 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTh49-0000000016i-1W15;
	Thu, 11 Dec 2025 13:50:45 +0000
Date: Thu, 11 Dec 2025 14:49:45 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] drivers/acpi/pptt.c:309:5: warning: no
 previous prototype for function 'acpi_pptt_for_each_container'
Message-ID: <202512111416.5evNsB79-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 1ab6383ee94e788fe424d7eac10dc8ec3bfa6828 [3508/3508] ACPI / PPTT: Provide a helper to walk processor containers
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512111416.5evNsB79-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111416.5evNsB79-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111416.5evNsB79-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from ././include/linux/compiler_types.h:150:
   ./include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/acpi/pptt.c:20:
   In file included from ./include/linux/acpi.h:37:
   In file included from ./include/acpi/acpi_io.h:7:
   In file included from ./arch/arm64/include/asm/acpi.h:14:
   In file included from ./include/linux/memblock.h:12:
   In file included from ./include/linux/mm.h:2181:
   ./include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   ./include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   ./include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/pptt.c:309:5: warning: no previous prototype for function 'acpi_pptt_for_each_container' [-Wmissing-prototypes]
     309 | int acpi_pptt_for_each_container(acpi_pptt_cpu_callback_t callback, void *arg)
         |     ^
   drivers/acpi/pptt.c:309:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     309 | int acpi_pptt_for_each_container(acpi_pptt_cpu_callback_t callback, void *arg)
         | ^
         | static 
   7 warnings generated.
--
>> drivers/acpi/pptt.c:310: warning: Function parameter or member 'callback' not described in 'acpi_pptt_for_each_container'
>> drivers/acpi/pptt.c:310: warning: Function parameter or member 'arg' not described in 'acpi_pptt_for_each_container'


vim +/acpi_pptt_for_each_container +309 drivers/acpi/pptt.c

   297	
   298	/**
   299	 * acpi_pptt_for_each_container() - Iterate over all processor containers
   300	 *
   301	 * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
   302	 * Container, they may exist purely to describe a Private resource. CPUs
   303	 * have to be leaves, so a Processor Container is a non-leaf that has the
   304	 * 'ACPI Processor ID valid' flag set.
   305	 *
   306	 * Return: 0 for a complete walk, or the first non-zero value from the callback
   307	 *         that stopped the walk.
   308	 */
 > 309	int acpi_pptt_for_each_container(acpi_pptt_cpu_callback_t callback, void *arg)
 > 310	{
   311		struct acpi_pptt_processor *cpu_node;
   312		struct acpi_table_header *table_hdr;
   313		struct acpi_subtable_header *entry;
   314		bool leaf_flag, has_leaf_flag = false;
   315		unsigned long table_end;
   316		acpi_status status;
   317		u32 proc_sz;
   318		int ret = 0;
   319	
   320		status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_hdr);
   321		if (ACPI_FAILURE(status))
   322			return 0;
   323	
   324		if (table_hdr->revision > 1)
   325			has_leaf_flag = true;
   326	
   327		table_end = (unsigned long)table_hdr + table_hdr->length;
   328		entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
   329				     sizeof(struct acpi_table_pptt));
   330		proc_sz = sizeof(struct acpi_pptt_processor);
   331		while ((unsigned long)entry + proc_sz < table_end) {
   332			cpu_node = (struct acpi_pptt_processor *)entry;
   333			if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
   334			    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID)
   335			{
   336				leaf_flag = cpu_node->flags & ACPI_PPTT_ACPI_LEAF_NODE;
   337				if ((has_leaf_flag && !leaf_flag) ||
   338				    (!has_leaf_flag && !acpi_pptt_leaf_node(table_hdr, cpu_node)))
   339				{
   340					ret = callback(cpu_node, arg);
   341					if (ret)
   342						break;
   343				}
   344			}
   345			entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
   346					     entry->length);
   347		}
   348	
   349		acpi_put_table(table_hdr);
   350	
   351		return ret;
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
