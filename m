Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1497474C08
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 21:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728338061; cv=none; b=f6JR5n+NfCBjYlObTYIKCHYOXiyVTAVE0oFxxUsygnNjv8HYQSjoYvI5z9es+U9aHIyAT2V9YahweWbdYkvhJCLA4O7UULzwZO4pifZjKQvXYuLYgLy4VencmZM1mwV1dg9pNX6GF/aN76fuY0/eRVDdTcPMyVIin7owHaMPPVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728338061; c=relaxed/simple;
	bh=/uKLFY48i/ABip0v4YBqXATpu5If7MVZns01tj1PEh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=To4z+LTabxtkbbQwLcQdlDdcbqHcd0phTwE9hj0iHpmXbXiI6jWrZ5B3x/acftvEmAMgGz7d9vLfpSBdXlwjP3XchmWKK/vsVulnRz/WiHZ0b+TkSluboXns3IrBEb/0k3uvI7U7zIFDTVWbWIvFtN80e+twSctsxAJ08by2fv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePErFvC5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePErFvC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728338059; x=1759874059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/uKLFY48i/ABip0v4YBqXATpu5If7MVZns01tj1PEh8=;
  b=ePErFvC5ghsHfiFxBQDEdDnnuCX1JjyemkvJUw5C/IAUbGZFm0BCOfO5
   GNYeWWalo+i6VmpAcclQRhQ3hbEt+jwq66C/MRJUfE8Yh2KUsndkVS3/C
   RiHcI9AL1rqnhJB3lh4omrhEZRCVhYNz+R8ylsmx8DY1Y5/1q9wekcBDf
   DkK9SmrDdNkxXqJAy4gJYYS10LR4SpvlCSqRWbRjJJOj87VTlE2MhqcqX
   epmvvn180JlLPl+hlMzlvrOXw56T0jJ71XdOaqw2v603En0CF7QOht346
   Tj4Zc3NvLYKBi/8hgCtUCh8VZzKfVDSxLPZFj6h8i/5P7yzQJOUakzggc
   Q==;
X-CSE-ConnectionGUID: KHqmLNiyRYeiXKHoTz0nIw==
X-CSE-MsgGUID: EgbL1v6PRPqdInwDoEOHxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27676521"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="27676521"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 14:54:18 -0700
X-CSE-ConnectionGUID: cnsgP9kjQ3e4tmszKI6ZTw==
X-CSE-MsgGUID: o3Tt6RbaSQ2r3cnra42wvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="75451161"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Oct 2024 14:54:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxvgE-0005a4-2q;
	Mon, 07 Oct 2024 21:54:14 +0000
Date: Tue, 8 Oct 2024 05:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.12-rc1 62/132] drivers/acpi/pptt.c:311:
 warning: Function parameter or struct member 'callback' not described in
 'acpi_pptt_for_each_container'
Message-ID: <202410080526.UiAXVFlu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.12-rc1
head:   4d17b37b670795954fd7a70c8ec83fb705a5e2ad
commit: fa2c70af89532df5517d08e95af357c58772bb60 [62/132] ACPI / PPTT: Provide a helper to walk processor containers
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20241008/202410080526.UiAXVFlu-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410080526.UiAXVFlu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410080526.UiAXVFlu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/pptt.c:311: warning: Function parameter or struct member 'callback' not described in 'acpi_pptt_for_each_container'
>> drivers/acpi/pptt.c:311: warning: Function parameter or struct member 'arg' not described in 'acpi_pptt_for_each_container'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +311 drivers/acpi/pptt.c

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
   309	static int __maybe_unused
   310	acpi_pptt_for_each_container(acpi_pptt_cpu_callback_t callback, void *arg)
 > 311	{
   312		struct acpi_pptt_processor *cpu_node;
   313		struct acpi_table_header *table_hdr;
   314		struct acpi_subtable_header *entry;
   315		bool leaf_flag, has_leaf_flag = false;
   316		unsigned long table_end;
   317		acpi_status status;
   318		u32 proc_sz;
   319		int ret = 0;
   320	
   321		status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_hdr);
   322		if (ACPI_FAILURE(status))
   323			return 0;
   324	
   325		if (table_hdr->revision > 1)
   326			has_leaf_flag = true;
   327	
   328		table_end = (unsigned long)table_hdr + table_hdr->length;
   329		entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
   330				     sizeof(struct acpi_table_pptt));
   331		proc_sz = sizeof(struct acpi_pptt_processor);
   332		while ((unsigned long)entry + proc_sz < table_end) {
   333			cpu_node = (struct acpi_pptt_processor *)entry;
   334			if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
   335			    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID)
   336			{
   337				leaf_flag = cpu_node->flags & ACPI_PPTT_ACPI_LEAF_NODE;
   338				if ((has_leaf_flag && !leaf_flag) ||
   339				    (!has_leaf_flag && !acpi_pptt_leaf_node(table_hdr, cpu_node)))
   340				{
   341					ret = callback(cpu_node, arg);
   342					if (ret)
   343						break;
   344				}
   345			}
   346			entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
   347					     entry->length);
   348		}
   349	
   350		acpi_put_table(table_hdr);
   351	
   352		return ret;
   353	}
   354	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
