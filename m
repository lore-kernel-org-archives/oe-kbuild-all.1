Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E3B81A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692967038; x=1724503038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X2tHinMtFoYxE7VP2OzxhvIXpdkwqn+dmypQPOThdCM=;
  b=CrtnCmTvfVQDVQB15Bo5MqhNzFdkXdmgKWrp6EtUNaJNyEtxVf//XwvA
   CM1qL/cl2skVP7217z9Q3ZjTRWmTujmZuCNvS/FdPkSXqOmETPQrDqsYJ
   BC21RSVySt/Q0XU5sH+Am7q1X5Dp4iStnDsooaSggsl4YLQgfZ4g+T4U+
   Vf1fVa4CX+hlZCZpycTWfusXa1TaaaVqYVcl7k6iHUnAL8fwzGphWrLL1
   N6Vy9jhNoOt44vc80e4bIjukMI5EuM/xng2uapM1a9zTDhtw3jimsh9Wg
   HE5p/r8sppyHr4fShbKBmRFbZ8cBopSKpdacm4OO2PGOOgV/cgIAoAz8q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="461064328"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="461064328"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 05:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="984104118"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="984104118"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Aug 2023 05:37:16 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZW3w-0003ZU-05;
	Fri, 25 Aug 2023 12:37:16 +0000
Date: Fri, 25 Aug 2023 20:36:41 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 65/150] drivers/acpi/pptt.c:308:
 warning: Function parameter or member 'callback' not described in
 'acpi_pptt_for_each_container'
Message-ID: <202308252045.RoPaBwSK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   b35e256b516ef563cb57da2628dc19bcd600e35f
commit: ac00bd5fb4f893f43b13c6299db1f6795de94709 [65/150] ACPI / PPTT: Provide a helper to walk processor containers
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230825/202308252045.RoPaBwSK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252045.RoPaBwSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252045.RoPaBwSK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/pptt.c:308: warning: Function parameter or member 'callback' not described in 'acpi_pptt_for_each_container'
>> drivers/acpi/pptt.c:308: warning: Function parameter or member 'arg' not described in 'acpi_pptt_for_each_container'


vim +308 drivers/acpi/pptt.c

   295	
   296	/**
   297	 * acpi_pptt_for_each_container() - Iterate over all processor containers
   298	 *
   299	 * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
   300	 * Container, they may exist purely to describe a Private resource. CPUs
   301	 * have to be leaves, so a Processor Container is a non-leaf that has the
   302	 * 'ACPI Processor ID valid' flag set.
   303	 *
   304	 * Return: 0 for a complete walk, or the first non-zero value from the callback
   305	 *         that stopped the walk.
   306	 */
   307	int acpi_pptt_for_each_container(acpi_pptt_cpu_callback_t callback, void *arg)
 > 308	{
   309		struct acpi_pptt_processor *cpu_node;
   310		struct acpi_table_header *table_hdr;
   311		struct acpi_subtable_header *entry;
   312		bool leaf_flag, has_leaf_flag = false;
   313		unsigned long table_end;
   314		acpi_status status;
   315		u32 proc_sz;
   316		int ret = 0;
   317	
   318		status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_hdr);
   319		if (ACPI_FAILURE(status))
   320			return 0;
   321	
   322		if (table_hdr->revision > 1)
   323			has_leaf_flag = true;
   324	
   325		table_end = (unsigned long)table_hdr + table_hdr->length;
   326		entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
   327				     sizeof(struct acpi_table_pptt));
   328		proc_sz = sizeof(struct acpi_pptt_processor);
   329		while ((unsigned long)entry + proc_sz < table_end) {
   330			cpu_node = (struct acpi_pptt_processor *)entry;
   331			if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
   332			    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID)
   333			{
   334				leaf_flag = cpu_node->flags & ACPI_PPTT_ACPI_LEAF_NODE;
   335				if ((has_leaf_flag && !leaf_flag) ||
   336				    (!has_leaf_flag && !acpi_pptt_leaf_node(table_hdr, cpu_node)))
   337				{
   338					ret = callback(cpu_node, arg);
   339					if (ret)
   340						break;
   341				}
   342			}
   343			entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
   344					     entry->length);
   345		}
   346	
   347		acpi_put_table(table_hdr);
   348	
   349		return ret;
   350	}
   351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
