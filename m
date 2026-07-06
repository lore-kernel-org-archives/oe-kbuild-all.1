Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E0E39BFED
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783324784; cv=none; b=Xv53U/EGWx9t8bYgP1eWLZxaHxn9C5QojV8rcom14za+IQQzpBjf+LYIV6Q6QASuN4z1M7zFgmojVzu1G98BUuDjZJEX77KXVx4d7jOB03v7orZjyiBmrkl+/EIVAQy/n07zathHV9oG9eAWzDNJeWGBVbP6NNcCqcMFqRlKYG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783324784; c=relaxed/simple;
	bh=clO08+Ac3sB5BF4oBwFbxirBj+cFxYUSVW3PkD/zFw8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MogZY1cjV9tRvTGK7qyTL5crms6IITnN2GgPg5BS39XkBNZGpK6roiwIfv0Hq6aHCWG7SAUZPGSfJ8UnW5RG9+20+K/odHMDsHEA0UkucmA1i1Tqso5S4qqXsnXS3ejCgtqXBw9f13Ci47HG1hCbbj00Q8n/IkXGord/55+Ch5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TB7A3fvr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TB7A3fvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783324779; x=1814860779;
  h=date:from:to:cc:subject:message-id;
  bh=clO08+Ac3sB5BF4oBwFbxirBj+cFxYUSVW3PkD/zFw8=;
  b=TB7A3fvrl7EtqJf5xoUWtzJtPSXaewbDN4LmgnugN1mZ80DmE/mlz7Tq
   0O1pE0ReDDuhQu/sMKkJcxzUaeOhA78RfMcFuiZ2RR6M3Hljkzczrq3X2
   NpzmZgcXRTJggow/0pBH8ns0hanmhnLaufGqzrnzGdOH863FxeJSGYaSN
   HFt+kZB4dGFid3dcmNmbUhhRr1Wf2Q+P9oOqPSa19R4EGO5dBpeJysvQ8
   nbXetIOO8QpmKAQn0ZvHnp8Kuub3hA79vIrkfEZzuRGoJRGqeXx0vAZbw
   MvmErzkmcy6t6t+HQs3qVbSZLECdjVAW6itWZmBE+P9T8sT9jApRBLjoA
   A==;
X-CSE-ConnectionGUID: /vizi+SnRGywsLxLdiXuOw==
X-CSE-MsgGUID: 4oaAjYP8RvSxAkgwsOz4dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="86502673"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="86502673"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 00:59:36 -0700
X-CSE-ConnectionGUID: o4kxhr7dRhC7XxCSbmoTaw==
X-CSE-MsgGUID: mobSbdOOTYeQKQaAcH3lWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="257521854"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Jul 2026 00:59:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgeEm-00000000EBZ-0Ydq;
	Mon, 06 Jul 2026 07:59:32 +0000
Date: Mon, 06 Jul 2026 15:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-dango 182/215]
 block/partitions/msdos.c:573:68: warning: operation on 'state->next' may be
 undefined
Message-ID: <202607061525.IiIAq9N5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-dango
head:   d19514df7d0958e914bdb3435ea4d64d2fc5766a
commit: 1dcb4c65b71c8e3bde88037d6e9129de4228c79e [182/215] block: partitions: msdos: add OF node by partition number
config: loongarch-randconfig-001-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061525.IiIAq9N5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061525.IiIAq9N5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061525.IiIAq9N5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/partitions/msdos.c: In function 'parse_minix':
>> block/partitions/msdos.c:573:68: warning: operation on 'state->next' may be undefined [-Wsequence-point]
     573 |                                 of_put_partition(state, state->next++,
         |                                                         ~~~~~~~~~~~^~


vim +573 block/partitions/msdos.c

   539	
   540	/*
   541	 * Minix 2.0.0/2.0.2 subpartition support.
   542	 * Anand Krishnamurthy <anandk@wiproge.med.ge.com>
   543	 * Rajeev V. Pillai    <rajeevvp@yahoo.com>
   544	 */
   545	static void parse_minix(struct parsed_partitions *state,
   546				sector_t offset, sector_t size, int origin)
   547	{
   548	#ifdef CONFIG_MINIX_SUBPARTITION
   549		struct device *ddev = disk_to_dev(state->disk);
   550		struct device_node *partitions_np = of_node_get(ddev->of_node);
   551		Sector sect;
   552		unsigned char *data;
   553		struct msdos_partition *p;
   554		int i;
   555	
   556		data = read_part_sector(state, offset, &sect);
   557		if (!data)
   558			return;
   559	
   560		p = (struct msdos_partition *)(data + 0x1be);
   561	
   562		/* The first sector of a Minix partition can have either
   563		 * a secondary MBR describing its subpartitions, or
   564		 * the normal boot sector. */
   565		if (msdos_magic_present(data + 510) &&
   566		    p->sys_ind == MINIX_PARTITION) { /* subpartition table present */
   567			seq_buf_printf(&state->pp_buf, " %s%d: <minix:", state->name, origin);
   568			for (i = 0; i < MINIX_NR_SUBPARTITIONS; i++, p++) {
   569				if (state->next == state->limit)
   570					break;
   571				/* add each partition in use */
   572				if (p->sys_ind == MINIX_PARTITION)
 > 573					of_put_partition(state, state->next++,
   574							 start_sect(p), nr_sects(p),
   575							 find_partno_of_node(partitions_np,
   576									     state->next));
   577			}
   578			seq_buf_puts(&state->pp_buf, " >\n");
   579		}
   580		put_dev_sector(sect);
   581	#endif /* CONFIG_MINIX_SUBPARTITION */
   582	}
   583	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
