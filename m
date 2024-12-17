Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E18A1531D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734466539; cv=none; b=MIA//IpZlr9qhaaEdnYUYna+59aaOWRrR936sieYGO3GRtEKgNAvDZKR3yd2ctvoifSFwDbxlSx0CnAeOYD6OZ910Wo6Aul3O925nyf5wi6NzUgDTWa4dGVjvLAOFJAEir6/0BDgk/qa59bh4YJADPvgBPlcW0Gl50YJCrK7tnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734466539; c=relaxed/simple;
	bh=KyXQy7+hZed9FcnpRuw8DmVRb4M0N9hMdmzLkJpdjQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WPPH7tt2mz9VfdVlh1d1QgYjtlTJuN+PIpePXOUs4TcvmvGqLuOVDuXvmPBmWtNWmZmiDjH1O2/8aZ/sMeN5mMYNYdC9Q95kDEmCZKCr0QzF4glsgafGyZe3zyflwqMRg9IUvu5FholQAN7QiuMGWhtUyi2foQQI36m6bdNgKtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkVTMGZM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkVTMGZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734466537; x=1766002537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KyXQy7+hZed9FcnpRuw8DmVRb4M0N9hMdmzLkJpdjQs=;
  b=bkVTMGZM7GiKT880kSqGB4+lD3j76Z2iyznTclCgh8GlVhbFo0cNMwt9
   9qgullN1mCaPsUsyNGyKMTBh60uF9+HxxqxmKxHl4hATuutwCLasgdOnr
   3on3YO7uSu4igedHpj+6gh+VXqIvOcM0ijTMe30jqSL0oYhgtjP8ePurD
   Ryakq4eY6G4RBWsoJM1tvch11fiw7TWwZa4sM55kGEONPuSc1Uh6e6T59
   gjSDayePJmOOEhO1X+LMnDqGl6/LTQRmCOufBshTvCWLoejuOXSHBUEVE
   MzjIWHxMyPKEuF0/TR5+lfsNMdNgSY0aIWog1P87q0YhuhKjOllcctPea
   Q==;
X-CSE-ConnectionGUID: a6fZzuo9Squv7BUaL+tcCQ==
X-CSE-MsgGUID: PmszGgsBTw6u75n0x4wk5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34803633"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34803633"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 12:15:36 -0800
X-CSE-ConnectionGUID: cAZD8yKYSpK3MLtmnPcMWQ==
X-CSE-MsgGUID: cQ3ndocfROqUCNE9lf5rVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="98215659"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 12:15:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNdyf-000FmE-1D;
	Tue, 17 Dec 2024 20:15:33 +0000
Date: Wed, 18 Dec 2024 04:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] drivers/acpi/pptt.c:309:5: sparse:
 sparse: symbol 'acpi_pptt_for_each_container' was not declared. Should it be
 static?
Message-ID: <202412180435.xFKN88By-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   46064348cc445799cf9e8fd030323a0426fbb5e4
commit: 1ab6383ee94e788fe424d7eac10dc8ec3bfa6828 [1613/1613] ACPI / PPTT: Provide a helper to walk processor containers
config: loongarch-randconfig-r111-20241210 (https://download.01.org/0day-ci/archive/20241218/202412180435.xFKN88By-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241218/202412180435.xFKN88By-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412180435.xFKN88By-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/pptt.c:309:5: sparse: sparse: symbol 'acpi_pptt_for_each_container' was not declared. Should it be static?
   drivers/acpi/pptt.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:245:46: sparse: sparse: self-comparison always evaluates to false

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
