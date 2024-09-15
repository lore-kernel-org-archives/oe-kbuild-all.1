Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6213422F19
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 16:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726418635; cv=none; b=Crky2uB/I/6aMU1LxXJLr3Gv1iCl3wOvZWf9AuSVxdJqGJWZRWVpd11zZl0Rzt39P66fTyQggMzjN+3EXCTag2mHogSJd+BIXcHLMnURKqTFniL8imSFjILoLniWSUYcL4O/FMskawxApEJgNhGZ505LrXcNBE5mXwg4h7VBsyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726418635; c=relaxed/simple;
	bh=5nYDO5nXrPQg0NbqH3xx4/2p7DKhiozFPAc+WSmm18Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NZPdgBkdviakJEfyuOBBf42u5rof/tDA3NOFGEbW0nF+MrTiyD13njYP5EKIfwDMIZ3cLZCoqmt2qgZ5Cjjj/V4BHSmgUgOVB4TzFXrtOFri9TFmXsaVg8VtWkJ6p6n6uUhBYYTqpgD85Lh3NkzxxWZ/JauOCixkWhgWjcsMAc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ldp2+O9g; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ldp2+O9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726418634; x=1757954634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5nYDO5nXrPQg0NbqH3xx4/2p7DKhiozFPAc+WSmm18Y=;
  b=Ldp2+O9gx+kGbWJV8zxyEYjcuhAck2EUS2TsxGCAuqJhCMXTgMWahdMK
   E3c9eVdAgQ3F2IW3dbUKZ34n1u+LxGVUIT9zSg23H9s0ODhQxATLJC8pY
   lVoWuisOehD8JFE81jXx95PLUuWthJyDvXj7il/uovUbb0WoNaicmWEbD
   gMjEf5dwTMQ/HROmE/SWaUVd2YzAF/YZWcMRzOcUSHJdFYy7J9/nZ1xuc
   qC6HZiwx1PWQ5TOHdvs0UF3VvOQGXGtJE7YlBFDjWNQyhtN26cUsW5P7G
   nXpp2dh7qu06FP12DkfLfEYGOo4Xj9hc+c9XywA07LENWsbCamc2AG1z4
   g==;
X-CSE-ConnectionGUID: mUWXWfWYT1C8eRFq4ZJtnw==
X-CSE-MsgGUID: yo95FijHTMeHXrXcl6bu2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="36641439"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="36641439"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 09:43:53 -0700
X-CSE-ConnectionGUID: w1SFSP48RzqTNRLYCTu+rw==
X-CSE-MsgGUID: M+diG4maSQWZUxs6/E77hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="68897854"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2024 09:43:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spsLl-0008qe-1p;
	Sun, 15 Sep 2024 16:43:49 +0000
Date: Mon, 16 Sep 2024 00:43:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2690/13950] drivers/acpi/pptt.c:309:5: sparse:
 sparse: symbol 'acpi_pptt_for_each_container' was not declared. Should it be
 static?
Message-ID: <202409160027.9Sg9DJSu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   84404f248a61323e09909849803ea4efce81742f
commit: 1ab6383ee94e788fe424d7eac10dc8ec3bfa6828 [2690/13950] ACPI / PPTT: Provide a helper to walk processor containers
config: loongarch-randconfig-r133-20240913 (https://download.01.org/0day-ci/archive/20240916/202409160027.9Sg9DJSu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240916/202409160027.9Sg9DJSu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160027.9Sg9DJSu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/pptt.c:309:5: sparse: sparse: symbol 'acpi_pptt_for_each_container' was not declared. Should it be static?

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
   310	{
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
