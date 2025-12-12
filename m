Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593AF2FE567
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 23:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765582724; cv=none; b=GUrW6mlU2rCp0O1PjnT5wrr8rf3DSuK9wINVBgrCQJp7e2Hf+FUOZZbMZ3t/XDtKpSvVpehKWqvUFljwqRvuVTTqFwG8dtzeyKMUB3bwgMbytk4FnNGlgTZ5GTdzuvElLNiaERsTrSwoqkoB24Drwa/G5K6ewoX9gNKE3zDYLEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765582724; c=relaxed/simple;
	bh=y9ZE/xUIPYGp4I/fYStAdcF1TfGZovMWqhiRgEcW97s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ND3hAqT8BEhq1cGel0CGYTAt/hxBi3DjYqraSHWCOLNy19toDzprM0mt8j5TXf5ZsNfuKsEGeEO9JuUnezHE93Ky/GFCfCciFdcQvzZOYbC38G9wQFy9yfTP6hYLxWX7glxj2NFX5heq3cEs2V+Wd/q/Z+l3xsqqjzRJGXUcbNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4N2Of19; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4N2Of19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765582723; x=1797118723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y9ZE/xUIPYGp4I/fYStAdcF1TfGZovMWqhiRgEcW97s=;
  b=n4N2Of19xnoq5ZnU88Gkq7u/TN/AsH5VUOIymTm2XD95qoMWK150MRRs
   eQHkeyB167dwBnyH57WED7DvyM/2XckvzB+IYadjpsVU64xYWEHuUsDrz
   s7DXvd42oJ26vt/zv4P+GqigYcdq5XfJmP9FDc6viavpBuzDUEDwjYY26
   bxv9DOSQScGF3uVOvUQCsGM5Sn2yvhXqcSPlgd2mAQ+dmmIeJGZYEULWH
   WZbFH6f2Qw3DzwtbPsmj8U4fsOARlVuEtoso1hAWijHBvn4YXCVMm9QwT
   Cfho4TMIqW+461BOWLVzoTI0RatZp77Mi7WzjigeUZuUciFGP2JaEbXEN
   Q==;
X-CSE-ConnectionGUID: V5KwztAoQ/mMnREsqxuDRw==
X-CSE-MsgGUID: 6U38B4WmTOeOOu3gmzZklg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66762090"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="66762090"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 15:38:41 -0800
X-CSE-ConnectionGUID: vrLvuIlEQKGdAmWa3/H+Ng==
X-CSE-MsgGUID: IadUj++DThmIGfQD18UtKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="202136490"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 15:38:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUCib-000000006m5-1cie;
	Fri, 12 Dec 2025 23:38:37 +0000
Date: Sat, 13 Dec 2025 07:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] drivers/acpi/pptt.c:309:5: warning: no
 previous prototype for 'acpi_pptt_for_each_container'
Message-ID: <202512130728.UiRm4V7I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 1ab6383ee94e788fe424d7eac10dc8ec3bfa6828 [3541/3541] ACPI / PPTT: Provide a helper to walk processor containers
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251213/202512130728.UiRm4V7I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130728.UiRm4V7I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130728.UiRm4V7I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/pptt.c:309:5: warning: no previous prototype for 'acpi_pptt_for_each_container' [-Wmissing-prototypes]
     309 | int acpi_pptt_for_each_container(acpi_pptt_cpu_callback_t callback, void *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
