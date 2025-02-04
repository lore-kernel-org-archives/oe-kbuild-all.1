Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576252185B1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 18:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738694387; cv=none; b=JkkGM5BytJM5rKCzQHItX9mU9cKxAwrXf3t00t7Y59IyNSJCKtkBjuDc+TQ9+vsZNpcXPWYlD7sos6kRxyZe8IYF8JH5mPqe9b0+aB/l7T2HKzfxthbng/Sls9SpFisu1TDVyvnnj/zX8BEZoUqrsyBWPhUEJYJQ3HQLER29TWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738694387; c=relaxed/simple;
	bh=ixQEK2Ny/BFG8Xf1/UgfDzbhB3oPw8YMPum4ThDO3ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aiLXZiFA6Lh7LYPJ1sMLfSaMRCVoAsjX/YG7iAgJP4XmzsclDGSOmURxO0h2UytKkvIe3ealscTq95tdQ2fi9sWP3czcftZ3kF3Wuc/o19nGwqzLW+9QnEqLnAGBl5z8Lja+cxFG2LMJgqEfFeRXsxwQegUxHI5fQNIxCUCHnC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2LZbx/z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2LZbx/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738694385; x=1770230385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ixQEK2Ny/BFG8Xf1/UgfDzbhB3oPw8YMPum4ThDO3ZQ=;
  b=J2LZbx/z/DvHJp1BqWc3byBgaZIzpAeTmzRGDk3uF1s7gSLQICcfBTc5
   b2/f60sgzEUiZIOQHnq5DTPNu0y+SmB7QxZ17fTkFhAq98z76C1babwBF
   6+eADTUyVUuDegqMHbpAVbsam/0b0NqUzwa9vv4kNhxqOGWkfiVU/kTq2
   wG5iW10t+T5wz3boVdxO77NfHJK2sczXSbQi+b3d97URmih75OYXuXx0j
   MrCoLT9SI5kTIR9LbCG6QfO/4jf8UDcuhvxgSWEXryzrxvQgwF0HKeZoA
   tglK/hL5wWmef95ozpFskjskRe1pomTLO/kzwukS24heRqyqZmbbQP3Ni
   Q==;
X-CSE-ConnectionGUID: AJYVfmj7SqyeYO7DxmNusw==
X-CSE-MsgGUID: xfQctz4cTN20JIj0lDTVDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39343442"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39343442"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 10:39:42 -0800
X-CSE-ConnectionGUID: XML98aZ5TnyWs9O0zpwuOA==
X-CSE-MsgGUID: ckRx2jgZSjKkJDCt0YgIBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115293724"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2025 10:39:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfNpi-000srd-2V;
	Tue, 04 Feb 2025 18:39:38 +0000
Date: Wed, 5 Feb 2025 02:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v4 13/13] mm/memblock.c:2434: warning: Function parameter
 or struct member 'name' not described in 'reserve_mem_kho_revive'
Message-ID: <202502050201.rFcqHIJF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4
head:   a75b813f58b0bc19b2c4b06bd62afc87f02dcb43
commit: a75b813f58b0bc19b2c4b06bd62afc87f02dcb43 [13/13] memblock: Add KHO support for reserve_mem
config: i386-buildonly-randconfig-001-20250204 (https://download.01.org/0day-ci/archive/20250205/202502050201.rFcqHIJF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050201.rFcqHIJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050201.rFcqHIJF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memblock.c:2434: warning: Function parameter or struct member 'name' not described in 'reserve_mem_kho_revive'
>> mm/memblock.c:2434: warning: Function parameter or struct member 'size' not described in 'reserve_mem_kho_revive'
>> mm/memblock.c:2434: warning: Function parameter or struct member 'align' not described in 'reserve_mem_kho_revive'


vim +2434 mm/memblock.c

  2428	
  2429	/**
  2430	 * reserve_mem_kho_revive - Revive reserve_mem blocks from KHO
  2431	 */
  2432	static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t size,
  2433						  phys_addr_t align)
> 2434	{
  2435		const void *fdt = kho_get_fdt();
  2436		const char *path = "/reserve_mem";
  2437		int node, child, err;
  2438	
  2439		if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER))
  2440			return false;
  2441	
  2442		if (!fdt)
  2443			return false;
  2444	
  2445		node = fdt_path_offset(fdt, "/reserve_mem");
  2446		if (node < 0)
  2447			return false;
  2448	
  2449		err = fdt_node_check_compatible(fdt, node, "reserve_mem-v1");
  2450		if (err) {
  2451			pr_warn("Node '%s' has unknown compatible", path);
  2452			return false;
  2453		}
  2454	
  2455		fdt_for_each_subnode(child, fdt, node) {
  2456			const struct kho_mem *mem;
  2457			const char *child_name;
  2458			int len;
  2459	
  2460			/* Search for old kernel's reserved_mem with the same name */
  2461			child_name = fdt_get_name(fdt, child, NULL);
  2462			if (strcmp(name, child_name))
  2463				continue;
  2464	
  2465			err = fdt_node_check_compatible(fdt, child, "reserve_mem_map-v1");
  2466			if (err) {
  2467				pr_warn("Node '%s/%s' has unknown compatible", path, name);
  2468				continue;
  2469			}
  2470	
  2471			mem = fdt_getprop(fdt, child, "mem", &len);
  2472			if (!mem || len != sizeof(*mem))
  2473				continue;
  2474	
  2475			if (mem->addr & (align - 1)) {
  2476				pr_warn("KHO reserved_mem '%s' has wrong alignment (0x%lx, 0x%lx)",
  2477					name, (long)align, (long)mem->addr);
  2478				continue;
  2479			}
  2480	
  2481			if (mem->size != size) {
  2482				pr_warn("KHO reserved_mem '%s' has wrong size (0x%lx != 0x%lx)",
  2483					name, (long)mem->size, (long)size);
  2484				continue;
  2485			}
  2486	
  2487			reserved_mem_add(mem->addr, mem->size, name);
  2488			pr_info("Revived memory reservation '%s' from KHO", name);
  2489	
  2490			return true;
  2491		}
  2492	
  2493		return false;
  2494	}
  2495	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
