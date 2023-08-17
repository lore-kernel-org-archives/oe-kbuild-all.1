Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556D812B8E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692271910; x=1723807910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BzgDLx+/vnfS6Tb8SB54Yb8itRldVYhHgYwYvczrS+c=;
  b=mMUcc6MYMRdcKwgveOQ+7DRolJF9xhK5Rtb7KxMrZDUGqcFrkdrMxzQ7
   daTKvidgtXIdT+FAt1gbVLJvekBVE4kvSg5/l9A0FspJL6KcbGEr4uQ2W
   k6e22oxX4ot4jqpydbWr+XQqzQ9pIjzz8VP+NZpEmakN8SRVwBtMFwCG/
   bG4t69I4hsiTzBem5U/dyakQQigyL1nN1L84pW4kUZH/VB0gvgmA7uvw8
   fnojaWe7TUAfH4bgS8sDWWyNYhezmyhxj9YNg25xMOdJ/A7el7fdSB7Ep
   h80w3e9SFW1/4R2iaZ92qnk9fLwlN5CKHl2OBy2LKYjT1BWanTBvDn5SK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403764986"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="403764986"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 04:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="764046846"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="764046846"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 04:31:46 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWbE9-00015V-1j;
	Thu, 17 Aug 2023 11:31:45 +0000
Date: Thu, 17 Aug 2023 19:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 4/7] drivers/firmware/efi/efi.c:643: warning:
 Function parameter or member 'unaccepted' not described in
 'reserve_unaccepted'
Message-ID: <202308171929.c4e96Zxk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-kexec
head:   c3817f480d1101b9c14987e84b6b3abc70c67a2d
commit: 61db94f763a6bf583ab264342115605ee8e33173 [4/7] efi: Make sure unaccepted table is mapped in crashkernel case
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230817/202308171929.c4e96Zxk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171929.c4e96Zxk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171929.c4e96Zxk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/efi.c:643: warning: Function parameter or member 'unaccepted' not described in 'reserve_unaccepted'


vim +643 drivers/firmware/efi/efi.c

   625	
   626	/**
   627	 * reserve_unaccepted - Map and reserve unaccepted configuration table
   628	 *
   629	 * memblock_add() makes sure that the table is mapped in direct mapping. During
   630	 * normal boot it happens automatically because the table is allocated from
   631	 * usable memory. But during crashkernel boot only memory specifically
   632	 * reserved for crash scenario is mapped. memblock_add() forces the table to be
   633	 * mapped in crashkernel case.
   634	 *
   635	 * Align the range to the nearest page boarders. Ranges smaller than page size
   636	 * are not going to be mapped.
   637	 *
   638	 * memblock_reserve() makes sure that future allocations will not touch the
   639	 * table.
   640	 */
   641	
   642	static __init void reserve_unaccepted(struct efi_unaccepted_memory *unaccepted)
 > 643	{
   644		phys_addr_t start, size;
   645	
   646		start = PAGE_ALIGN_DOWN(efi.unaccepted);
   647		size = PAGE_ALIGN(sizeof(*unaccepted) + unaccepted->size);
   648	
   649		memblock_add(start, size);
   650		memblock_reserve(start, size);
   651	}
   652	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
