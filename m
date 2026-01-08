Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EE528850C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 03:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767844714; cv=none; b=s9NGREWb73Z2e6x42DiOmc6Xp/IAfBSqMmj8uL3AIgT03LQ8BQuTE1BZI3Y4ONFYikRSJ9BY71Xh7iYh+tHnCPL+ypCEJUf54ItqcM8J9r1EbheMrxuF9pNG2veO/S7/iTsevAQ093MqZRgHuot4xLBUX4SezdtOtBDSTOi3pvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767844714; c=relaxed/simple;
	bh=OvZnw/ZGFn+a0lIRDVI0DHTk8G/PFkyogcihSQHF1Ho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Byvk4CHZjh0UOulnhtjWrC7XpcriQSZ/zWgxVXfs9+tlTcw6L+eAvKaiJJC420cbvgrjphr0uj9ep2MVvPU3Ymvow0uh2jrIr4/v73DN7YWxe83qCJP/EoCJgs4nCotiXY5Wp3c7u0dcv3VKqziLXQwAD/vnOBmdmFI7XD0KSmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXAxmlq8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXAxmlq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767844713; x=1799380713;
  h=date:from:to:cc:subject:message-id;
  bh=OvZnw/ZGFn+a0lIRDVI0DHTk8G/PFkyogcihSQHF1Ho=;
  b=ZXAxmlq8tndSEULh25bqjDIIaSbsLL2RpUUP0fX7c8EBa9bK7Iy5uie9
   svWuxBqtfK+sVZWOpiC/uHhWD/aBUi1fARihgSk5lMXDSCJaEaKeIGEYO
   ovq3hrjv9pxA5Z3Z6kzB3r9rWl6M6kusFEXInF1dUih1HGW5YXEeAOVCI
   BJITJtZR4yNandi4P7ZOo1tNlnORUbSzJtuX5YDNuaVHjtpE0RG5G4ZoH
   cjpF744hGuDrtDxIJ3dI2JdVynfzjuZIgGw5ATgArgIo2HbJcMw47pe4b
   hCrRhNmP/kxLWQjZ6Ugeq6y0RVbjhgwDQXq6Zvdk0yt7VfxBvMKGAgG5+
   g==;
X-CSE-ConnectionGUID: xwm22vT+QXWEa0wHZyuEUw==
X-CSE-MsgGUID: 4jUOoj3JQ6qM0Bw4twvn3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="71797042"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="71797042"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:58:32 -0800
X-CSE-ConnectionGUID: 0Uzk/5FqQoCkZ5dAqNN83A==
X-CSE-MsgGUID: 2GQJ7dRGQce2lLKhQ2iRiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="207236973"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jan 2026 19:58:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdhAK-000000004NU-062K;
	Thu, 08 Jan 2026 03:58:28 +0000
Date: Thu, 08 Jan 2026 11:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v3 2/9]
 drivers/acpi/numa/srat.c:397:undefined reference to `efi_mem_attributes'
Message-ID: <202601081156.UictWJjv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v3
head:   8a4f71e8f0a8aef992da7df176a352073872a47c
commit: 4f450a5bd7e696d6e61362537e159aa1914749ae [2/9] drivers/numa/srat: report EFI_MEMORY_SP regions as spm memblks
config: x86_64-randconfig-005-20260108 (https://download.01.org/0day-ci/archive/20260108/202601081156.UictWJjv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601081156.UictWJjv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601081156.UictWJjv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/acpi/numa/srat.o: in function `acpi_parse_memory_affinity':
>> drivers/acpi/numa/srat.c:397:(.init.text+0x8c7): undefined reference to `efi_mem_attributes'


vim +397 drivers/acpi/numa/srat.c

   358	
   359	static int __init
   360	acpi_parse_memory_affinity(union acpi_subtable_headers *header,
   361				   const unsigned long table_end)
   362	{
   363		struct acpi_srat_mem_affinity *ma;
   364		u64 start, end;
   365		u32 hotpluggable;
   366		int node, pxm;
   367		int rc;
   368	
   369		ma = (struct acpi_srat_mem_affinity *)header;
   370	
   371		acpi_table_print_srat_entry(&header->common);
   372	
   373		if (srat_disabled())
   374			return 0;
   375		if (ma->header.length < sizeof(struct acpi_srat_mem_affinity)) {
   376			pr_err("SRAT: Unexpected header length: %d\n",
   377			       ma->header.length);
   378			goto out_err_bad_srat;
   379		}
   380		if ((ma->flags & ACPI_SRAT_MEM_ENABLED) == 0)
   381			return 0;
   382		hotpluggable = IS_ENABLED(CONFIG_MEMORY_HOTPLUG) &&
   383			(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE);
   384	
   385		start = ma->base_address;
   386		end = start + ma->length;
   387		pxm = ma->proximity_domain;
   388		if (acpi_srat_revision <= 1)
   389			pxm &= 0xff;
   390	
   391		node = acpi_map_pxm_to_node(pxm);
   392		if (node == NUMA_NO_NODE) {
   393			pr_err("SRAT: Too many proximity domains.\n");
   394			goto out_err_bad_srat;
   395		}
   396	
 > 397		if (efi_mem_attributes(start) & EFI_MEMORY_SP)
   398			rc = numa_add_spm_memblk(node, start, end);
   399		else
   400			rc = numa_add_memblk(node, start, end);
   401	
   402		if (rc < 0) {
   403			pr_err("SRAT: Failed to add memblk to node %u [mem %#010Lx-%#010Lx]\n",
   404			       node, (unsigned long long) start,
   405			       (unsigned long long) end - 1);
   406			goto out_err_bad_srat;
   407		}
   408	
   409		node_set(node, numa_nodes_parsed);
   410	
   411		pr_info("SRAT: Node %u PXM %u [mem %#010Lx-%#010Lx]%s%s\n",
   412			node, pxm,
   413			(unsigned long long) start, (unsigned long long) end - 1,
   414			hotpluggable ? " hotplug" : "",
   415			ma->flags & ACPI_SRAT_MEM_NON_VOLATILE ? " non-volatile" : "");
   416	
   417		/* Mark hotplug range in memblock. */
   418		if (hotpluggable && memblock_mark_hotplug(start, ma->length))
   419			pr_warn("SRAT: Failed to mark hotplug range [mem %#010Lx-%#010Lx] in memblock\n",
   420				(unsigned long long)start, (unsigned long long)end - 1);
   421	
   422		max_possible_pfn = max(max_possible_pfn, PFN_UP(end - 1));
   423	
   424		parsed_numa_memblks++;
   425	
   426		return 0;
   427	
   428	out_err_bad_srat:
   429		/* Just disable SRAT, but do not fail and ignore errors. */
   430		bad_srat();
   431	
   432		return 0;
   433	}
   434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
