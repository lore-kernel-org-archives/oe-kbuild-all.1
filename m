Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC95369
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 01:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694654883; x=1726190883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u/oCCHdUWLnfQuZXq8gFuMvNWNnJXkxa0spmV+ZXrcE=;
  b=OkI6WjCDlziC+skd9CupNKSdzlMc5S2hTXq8XqoJiCUl475BVz8m7XsS
   H+KP/BqP8RfCQz2tSY5cYEpCl7UovMHLnh+hdNsYNfJQpBA2FtKdiYzE1
   fYl5/ivwpZmCBGJrvGrEuQeq0Z7pdFJKygW54eYRpaPPs8rg4xn6iipdk
   E7bu2sBhGFsGdwn/0FgzUL6+pVWXN5tsqmivbdo7QFIA1KVz3yaepo4rr
   /i8Wn1bXut2H9Qz0feGwZJKk97GbkXeLBEINCHfFSY5MtfJpEkggUS1Cw
   gY6VoeGUup9nh4oSHSww2lnlM/yl6cSUYapRFdPockxIMOnH1yzLSyww2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363864222"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="363864222"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814470947"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="814470947"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2023 18:28:01 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgb9D-0000w1-28;
	Thu, 14 Sep 2023 01:27:59 +0000
Date: Thu, 14 Sep 2023 09:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 65/154] drivers/acpi/pptt.c:308:
 warning: Function parameter or member 'callback' not described in
 'acpi_pptt_for_each_container'
Message-ID: <202309140946.68gUY8mp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   47a123f932a23dc3eff4110197949d418914a4ac
commit: ac00bd5fb4f893f43b13c6299db1f6795de94709 [65/154] ACPI / PPTT: Provide a helper to walk processor containers
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230914/202309140946.68gUY8mp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140946.68gUY8mp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140946.68gUY8mp-lkp@intel.com/

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
