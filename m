Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E0A1B85DC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725711941; cv=none; b=Hi3aAD+6fDPQovXNDm+jeUh4AhpG5czGP3F7BBb3x67fp2ME8/gVVcD/IUbAV1KFlq0Eb/dnb+xkIaIhTCNfR4NfPIxDRUs4rrAvupTMZQGYq2FG9oh0cbldanVitbNg93pq9T1U1WNBDwilUcIBWvevNdmR6AwC5jo174ci/9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725711941; c=relaxed/simple;
	bh=QLVX/YhPmVBp/rIGeqFN7dgilSbhD+uAR3NroKxKwc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eOn6afgdrEh/yh5L55/W3bDVTIOOnLH847PxI7tuYAdXvCUn/AG130JkpsL9QxN/Pp0uezfJp5T5YUrrUgm/UE+rZpiMlSrc6mO2STvMNgI2fpNYInV1tGb+vb64SuuY7wEfm6Ue9buU5CCOd+G31stfZKEES9q8aLQD1O0Tks4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNNSQEkh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNNSQEkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725711939; x=1757247939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QLVX/YhPmVBp/rIGeqFN7dgilSbhD+uAR3NroKxKwc0=;
  b=nNNSQEkhp7kNDw24FBNciHfOhqhFeBxrx0fCG03fuWsdIVK7B5T/xUjE
   n8suJ/lDoCf2XW2cX7LuSZ1riCcFnXXSw+vv4LQaTaJipgS3XZIg3u560
   7bd+MNEXDbHbk0bjH8hPj7zRrbNlnjkrm3xnF1PZZAGqvVJiIJ94mOHnd
   mmZ54uot80hRYRy17W3MQ0rsjxNZwBk30RSYGPSVdDKPesP5x9nnEZCny
   P8zTnS8Yb09zzO/wF2JbTOXtgR5/r/WZqjVIpxUV7+jAiyb164Vakelf1
   QchwyumKIfvq8SuDRkzxhuF6L2QZCJjgUIC244JK1pIuLdrqhavv7vgOf
   g==;
X-CSE-ConnectionGUID: d0M37PN/T2u14pstCMpxfg==
X-CSE-MsgGUID: JtGG/XoqQOmY4S/3Hk21lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="28203373"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="28203373"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 05:25:38 -0700
X-CSE-ConnectionGUID: KiJlQGbDQ+e1I9LsdXOwSA==
X-CSE-MsgGUID: GZkPqEt6Q2amu4KZO0WiWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70781881"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Sep 2024 05:25:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smuVS-000CYB-2j;
	Sat, 07 Sep 2024 12:25:34 +0000
Date: Sat, 7 Sep 2024 20:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14696/23701] drivers/base/node.c:429:5:
 sparse: sparse: symbol 'register_mem_block_under_node_early' was not
 declared. Should it be static?
Message-ID: <202409072051.qFE23qXy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   13b424f97ef548612c760cfd0892f96de96707e0
commit: f38a43c2e1f2214acbda5d46af4518aa1d9d5e92 [14696/23701] mm: don't rely on system state to detect hot-plug operations
config: x86_64-randconfig-123-20240906 (https://download.01.org/0day-ci/archive/20240907/202409072051.qFE23qXy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409072051.qFE23qXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409072051.qFE23qXy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/node.c:429:5: sparse: sparse: symbol 'register_mem_block_under_node_early' was not declared. Should it be static?
   drivers/base/node.c:429:5: warning: no previous prototype for 'register_mem_block_under_node_early' [-Wmissing-prototypes]
     429 | int register_mem_block_under_node_early(struct memory_block *mem_blk, void *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/register_mem_block_under_node_early +429 drivers/base/node.c

   427	
   428	/* register memory section under specified node if it spans that node */
 > 429	int register_mem_block_under_node_early(struct memory_block *mem_blk, void *arg)
   430	{
   431		int nid = *(int *)arg;
   432		unsigned long pfn, sect_start_pfn, sect_end_pfn;
   433	
   434		sect_start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
   435		sect_end_pfn = section_nr_to_pfn(mem_blk->end_section_nr);
   436		sect_end_pfn += PAGES_PER_SECTION - 1;
   437		for (pfn = sect_start_pfn; pfn <= sect_end_pfn; pfn++) {
   438			int page_nid;
   439	
   440			/*
   441			 * memory block could have several absent sections from start.
   442			 * skip pfn range from absent section
   443			 */
   444			if (!pfn_present(pfn)) {
   445				pfn = round_down(pfn + PAGES_PER_SECTION,
   446						 PAGES_PER_SECTION) - 1;
   447				continue;
   448			}
   449	
   450			/*
   451			 * We need to check if page belongs to nid only at the boot
   452			 * case because node's ranges can be interleaved.
   453			 */
   454			page_nid = get_nid_for_pfn(pfn);
   455			if (page_nid < 0)
   456				continue;
   457			if (page_nid != nid)
   458				continue;
   459	
   460			return do_register_memory_block_under_node(nid, mem_blk);
   461		}
   462		/* mem section does not span the specified node */
   463		return 0;
   464	}
   465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
