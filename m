Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2012D12EBE9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 23:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718235141; cv=none; b=K5g6bNs0VxfJG8SP+ZFhAclVf3tinffZpDstj7etWVFMkGy9KtFJGzwfhNd1mCkL1bXE8JkdeftTIs5t3WOosNR3uUNdO92VANwJ6REb+LNwVmsEfNrf+jq3exoBtSsqvGlwvzUaXjjXJ9TQLMX9vuEFRGMnfWx/Eowof8iiaRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718235141; c=relaxed/simple;
	bh=55DnZqV2cLexnrO5EYZ6QUVLH6619rzcFbHNX3chdMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T1eXAk5JukH3TsNSJvlv04JGCIfxvMb3fN5RqGhKVfREn6o26t1mAqelJGHQa8d44DTAjUS4Q+9aN00mKd82tklOVGwffKzrPjx4A6P8LfTj0nVxDew0w5hbp79JasvRQlSIjlvkfUIuhYgxUDlOgR8GYIFQuNV2JJZeLswURbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfscGLDG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfscGLDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718235139; x=1749771139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=55DnZqV2cLexnrO5EYZ6QUVLH6619rzcFbHNX3chdMo=;
  b=gfscGLDGW8pwD8GbSfP+ZIzSIL6On30w15OHE5HeNmBGUiY9njaa/vFI
   u63pxbUmc6tSVIaiB/IPQ90pFYIqgAG8DqbkaYdLI2DvOzvQTBZi67sVB
   osB/6QUPtYX2GkexwtkNKmASuPfcMJFL8U+jUePr0MT3Gy2Y3g3kkqUZh
   u8A9kg9KBO3S9uVZr0C4IMMB+LZ27jA8rmsi5YZvk5w3SyNn0U65HYjJO
   n4Bi5gZ4jE7+wczkidkZRQuArmlMrlRLHktN4jVkgsqFGWeYbhBJF3Dnk
   4dnhwqduFs4wDeVMujrzVMcTuAEszwSuuSwAzE2/XNqBEq8TFvmXMvQeu
   g==;
X-CSE-ConnectionGUID: 5qdES4oxTpi1Cof0XB0QEA==
X-CSE-MsgGUID: t9NdnHpmRt6U2FtYAkX4Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="17951048"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="17951048"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 16:32:18 -0700
X-CSE-ConnectionGUID: t+OdEnVLQMWpVpJi2uQ7hQ==
X-CSE-MsgGUID: nD9tno2MTjaNaWwsNrUvkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44849322"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2024 16:32:17 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHXRv-00020c-0j;
	Wed, 12 Jun 2024 23:32:15 +0000
Date: Thu, 13 Jun 2024 07:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.10-rc1 52/114] drivers/acpi/pptt.c:311:
 warning: Function parameter or struct member 'callback' not described in
 'acpi_pptt_for_each_container'
Message-ID: <202406130753.277hpkFp-lkp@intel.com>
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
commit: 65b187069a9445597af990107fdd54cae981c970 [52/114] ACPI / PPTT: Provide a helper to walk processor containers
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240613/202406130753.277hpkFp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130753.277hpkFp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130753.277hpkFp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/pptt.c:311: warning: Function parameter or struct member 'callback' not described in 'acpi_pptt_for_each_container'
>> drivers/acpi/pptt.c:311: warning: Function parameter or struct member 'arg' not described in 'acpi_pptt_for_each_container'


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
