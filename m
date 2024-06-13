Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD0F622
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 01:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718241204; cv=none; b=fk9nxGXJ4rfLU2N/8UVNWoLnqCT0Jxk7UDiN8QRtfJgi9g7rCvljzY7zONjW/pApAkN8vfqjHBJneqgYOfNEW/6i2wpWqwMduRtC3qgR4lci+somnieNB3l/Nwy2GMKwuDOq0KuBi+S0rRoLIDkP26Uawm2tCfjeOFcgRuzz3FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718241204; c=relaxed/simple;
	bh=xTujIfWOXVdWUv3MP3uVS+kmHowgTMcCILUnJy/dj8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbwuvDkGtf7M/ZhjJO9stONdCc3pC8a8Azgexuk7YxjjAKSJOtUdFpSnyAqgWoFZZ+J+L72DbDxemrkzSesdWOQj++dLoKM6JfoNB8zkaY/5ynxtO3Hx1G6l//mnEN6waZFfjAp0fhgRjNonH7pR/v7QnSd35jYsCVmFofGkrU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6xxwFLG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6xxwFLG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718241203; x=1749777203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xTujIfWOXVdWUv3MP3uVS+kmHowgTMcCILUnJy/dj8o=;
  b=R6xxwFLGSgSluAqxPXiL2ni0Jqmkg1qkncj+Yo01CmFrF1YkrU7pfvv/
   5t9q3om8jJN0BwmeBc+NzuXKjOezsEYIfX+RI35Wi8/Q/Zjbuj/gucpld
   ToU7eW2n+UkTKEF5xtg0tu7OB4oum88eEqQsFo19GUx0Z7fUgdDr8gAVk
   BaU1gedPns1VhVS5vbIqUUk7fgkxDsW6drffKdQAciqs0AQ57tm7IoY5C
   kPjMDjVKAyMShkuwnA0Tg5TCRoBgLm9vVtJMczOJdsgaVqgxp024duNRk
   +bMNZDKRsNuiPQ6ierUP8u2SJ9wQl4MlBnAeKICYgY4BLaNOtooa1FsPK
   g==;
X-CSE-ConnectionGUID: lio+9JjdSQ+T5PMX8Sk+dQ==
X-CSE-MsgGUID: TgBwQS3mRtizl53z0GL7FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14867540"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14867540"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 18:13:22 -0700
X-CSE-ConnectionGUID: M85uZVHYQayMouhw9hNlBQ==
X-CSE-MsgGUID: MjZQzmhvS9KvnzLeqsVsGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="39832743"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Jun 2024 18:13:20 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHZ1i-00024K-1y;
	Thu, 13 Jun 2024 01:13:18 +0000
Date: Thu, 13 Jun 2024 09:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.10-rc1 54/114] drivers/acpi/pptt.c:412:
 warning: Function parameter or struct member 'acpi_cpu_id' not described in
 'acpi_pptt_get_cpus_from_container'
Message-ID: <202406130920.90YN19K9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.10-rc1
head:   d9ba67a1a8dc6551a0b3254a8f2ee9993ad17957
commit: b53a93c75ae3d6a570dd3d4fe49b8bbe4b57ff19 [54/114] ACPI / PPTT: Add a helper to fill a cpumask from a processor container
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240613/202406130920.90YN19K9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130920.90YN19K9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130920.90YN19K9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/pptt.c:343: warning: Function parameter or struct member 'callback' not described in 'acpi_pptt_for_each_container'
   drivers/acpi/pptt.c:343: warning: Function parameter or struct member 'arg' not described in 'acpi_pptt_for_each_container'
>> drivers/acpi/pptt.c:412: warning: Function parameter or struct member 'acpi_cpu_id' not described in 'acpi_pptt_get_cpus_from_container'
>> drivers/acpi/pptt.c:412: warning: Function parameter or struct member 'cpus' not described in 'acpi_pptt_get_cpus_from_container'


vim +412 drivers/acpi/pptt.c

   329	
   330	/**
   331	 * acpi_pptt_for_each_container() - Iterate over all processor containers
   332	 *
   333	 * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
   334	 * Container, they may exist purely to describe a Private resource. CPUs
   335	 * have to be leaves, so a Processor Container is a non-leaf that has the
   336	 * 'ACPI Processor ID valid' flag set.
   337	 *
   338	 * Return: 0 for a complete walk, or the first non-zero value from the callback
   339	 *         that stopped the walk.
   340	 */
   341	static int
   342	acpi_pptt_for_each_container(acpi_pptt_cpu_callback_t callback, void *arg)
 > 343	{
   344		struct acpi_pptt_processor *cpu_node;
   345		struct acpi_table_header *table_hdr;
   346		struct acpi_subtable_header *entry;
   347		bool leaf_flag, has_leaf_flag = false;
   348		unsigned long table_end;
   349		acpi_status status;
   350		u32 proc_sz;
   351		int ret = 0;
   352	
   353		status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_hdr);
   354		if (ACPI_FAILURE(status))
   355			return 0;
   356	
   357		if (table_hdr->revision > 1)
   358			has_leaf_flag = true;
   359	
   360		table_end = (unsigned long)table_hdr + table_hdr->length;
   361		entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
   362				     sizeof(struct acpi_table_pptt));
   363		proc_sz = sizeof(struct acpi_pptt_processor);
   364		while ((unsigned long)entry + proc_sz < table_end) {
   365			cpu_node = (struct acpi_pptt_processor *)entry;
   366			if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
   367			    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID)
   368			{
   369				leaf_flag = cpu_node->flags & ACPI_PPTT_ACPI_LEAF_NODE;
   370				if ((has_leaf_flag && !leaf_flag) ||
   371				    (!has_leaf_flag && !acpi_pptt_leaf_node(table_hdr, cpu_node)))
   372				{
   373					ret = callback(cpu_node, arg);
   374					if (ret)
   375						break;
   376				}
   377			}
   378			entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
   379					     entry->length);
   380		}
   381	
   382		acpi_put_table(table_hdr);
   383	
   384		return ret;
   385	}
   386	
   387	struct __cpus_from_container_arg {
   388		u32 acpi_cpu_id;
   389		cpumask_t *cpus;
   390	};
   391	
   392	static int __cpus_from_container(struct acpi_pptt_processor *container, void *arg)
   393	{
   394		struct __cpus_from_container_arg *params = arg;
   395	
   396		if (container->acpi_processor_id == params->acpi_cpu_id)
   397			acpi_pptt_get_child_cpus(container, params->cpus);
   398	
   399		return 0;
   400	}
   401	
   402	/**
   403	 * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
   404	 * 					 processor containers
   405	 *
   406	 * Find the specified Processor Container, and fill cpus with all the cpus
   407	 * below it.
   408	 *
   409	 * Return: 0 for a complete walk, or an error if the mask is incomplete.
   410	 */
   411	int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
 > 412	{
   413		struct __cpus_from_container_arg params;
   414	
   415		params.acpi_cpu_id = acpi_cpu_id;
   416		params.cpus = cpus;
   417	
   418		cpumask_clear(cpus);
   419		return acpi_pptt_for_each_container(&__cpus_from_container, &params);
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
