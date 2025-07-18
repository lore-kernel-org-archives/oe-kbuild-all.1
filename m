Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F51E10957
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752871077; cv=none; b=d+il1P92KXD4QJVTi5q5Y0Zvd6AaB0A9grxGJYPqlthhw8v/bMrIN5tyPU66GhPf/GYy++EFMbMcmpNZUXbjJ8UKI6b/XlCYyab9qDbHfepOGXYFFUchv9V5qyDCz+2q06A9zMjSTetwERXScLVJFArHh7aKBP3Hkwk/RgZibFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752871077; c=relaxed/simple;
	bh=/QFi4zfOH5H4go+JwRM+Pt4mkD81oyIAuJM7KFgUhww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nt1ZzPf++rmLNVAyMBO8Xp4cOZZ6LWsh6BC/8vUlJ4/zEOwTH7VGPyG7QQJVRhSUziRaCL4tHLX7kIzNUII0FQGkxasSeNRH92YIKz4HDFWA1zdXnEqj2ZfeSz1UN9k8FJRLouZnpvUhvr5tK+izc7cv+zZoTRV5NyFN+VDs324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5OQEMcV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5OQEMcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752871076; x=1784407076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/QFi4zfOH5H4go+JwRM+Pt4mkD81oyIAuJM7KFgUhww=;
  b=g5OQEMcVlPQCzpIF1zGcRNwDC3qAoI1nYYAvWrVoIMQF/UNA5GY3Gnm0
   vmte0+Jx6XdYY5FxMKJU78b6YXIBRhJID7K4B0GtWo/1fzBjd+qOYnVDH
   AS26ySiZuWGuCyR1aFd23i4Z531dbmjKgwbww/osXj1ZsJs8roWcIetna
   jMrmYplu0KH5ist/BkwkvGnGMvussWJI0ddTOX1zxO9EUK2OrYY9RG0x8
   ju9csGnDaDFk9DJhkyAJYsiDoraeTHEwtrylNbRt4PIbkCsLjX8pnILlT
   LbyktsVT6ZgBgr5MqWkFItGjdP9VDZfkr4E7T3SzClJ0lfLt6x1T3qOPU
   g==;
X-CSE-ConnectionGUID: 9pklmxalTk6PLvmpm74OnQ==
X-CSE-MsgGUID: wXfIYZwVRlaqJgN/8DfzFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54884961"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="54884961"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 13:37:55 -0700
X-CSE-ConnectionGUID: 7hOQF/djQ4CdTkQ+4qRjYQ==
X-CSE-MsgGUID: WgPXWD0yQbahli+fDJDMgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="158752694"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jul 2025 13:37:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucrq3-000F1z-1o;
	Fri, 18 Jul 2025 20:37:51 +0000
Date: Sat, 19 Jul 2025 04:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nico Pache <npache@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 06/14] khugepaged: introduce collapse_scan_bitmap for
 mTHP support
Message-ID: <202507190444.84t25Ubg-lkp@intel.com>
References: <20250714003207.113275-7-npache@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714003207.113275-7-npache@redhat.com>

Hi Nico,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20250718]
[cannot apply to lwn/docs-next linus/master v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nico-Pache/khugepaged-rename-hpage_collapse_-to-collapse_/20250714-083735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250714003207.113275-7-npache%40redhat.com
patch subject: [PATCH v9 06/14] khugepaged: introduce collapse_scan_bitmap for mTHP support
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20250719/202507190444.84t25Ubg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190444.84t25Ubg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190444.84t25Ubg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/khugepaged.c: In function '__collapse_huge_page_swapin':
   mm/khugepaged.c:1051:48: error: 'MTHP_STAT_COLLAPSE_EXCEED_SWAP' undeclared (first use in this function)
    1051 |                         count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_SWAP);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1051:48: note: each undeclared identifier is reported only once for each function it appears in
   mm/khugepaged.c: At top level:
>> mm/khugepaged.c:1301:12: warning: 'collapse_scan_bitmap' defined but not used [-Wunused-function]
    1301 | static int collapse_scan_bitmap(struct mm_struct *mm, unsigned long address,
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/collapse_scan_bitmap +1301 mm/khugepaged.c

  1299	
  1300	/* Recursive function to consume the bitmap */
> 1301	static int collapse_scan_bitmap(struct mm_struct *mm, unsigned long address,
  1302				int referenced, int unmapped, struct collapse_control *cc,
  1303				bool *mmap_locked, unsigned long enabled_orders)
  1304	{
  1305		u8 order, next_order;
  1306		u16 offset, mid_offset;
  1307		int num_chunks;
  1308		int bits_set, threshold_bits;
  1309		int top = -1;
  1310		int collapsed = 0;
  1311		int ret;
  1312		struct scan_bit_state state;
  1313		bool is_pmd_only = (enabled_orders == (1 << HPAGE_PMD_ORDER));
  1314	
  1315		cc->mthp_bitmap_stack[++top] = (struct scan_bit_state)
  1316			{ HPAGE_PMD_ORDER - KHUGEPAGED_MIN_MTHP_ORDER, 0 };
  1317	
  1318		while (top >= 0) {
  1319			state = cc->mthp_bitmap_stack[top--];
  1320			order = state.order + KHUGEPAGED_MIN_MTHP_ORDER;
  1321			offset = state.offset;
  1322			num_chunks = 1 << (state.order);
  1323			// Skip mTHP orders that are not enabled
  1324			if (!test_bit(order, &enabled_orders))
  1325				goto next;
  1326	
  1327			// copy the relavant section to a new bitmap
  1328			bitmap_shift_right(cc->mthp_bitmap_temp, cc->mthp_bitmap, offset,
  1329					  MTHP_BITMAP_SIZE);
  1330	
  1331			bits_set = bitmap_weight(cc->mthp_bitmap_temp, num_chunks);
  1332			threshold_bits = (HPAGE_PMD_NR - khugepaged_max_ptes_none - 1)
  1333					>> (HPAGE_PMD_ORDER - state.order);
  1334	
  1335			//Check if the region is "almost full" based on the threshold
  1336			if (bits_set > threshold_bits || is_pmd_only
  1337				|| test_bit(order, &huge_anon_orders_always)) {
  1338				ret = collapse_huge_page(mm, address, referenced, unmapped, cc,
  1339						mmap_locked, order, offset * KHUGEPAGED_MIN_MTHP_NR);
  1340				if (ret == SCAN_SUCCEED) {
  1341					collapsed += (1 << order);
  1342					continue;
  1343				}
  1344			}
  1345	
  1346	next:
  1347			if (state.order > 0) {
  1348				next_order = state.order - 1;
  1349				mid_offset = offset + (num_chunks / 2);
  1350				cc->mthp_bitmap_stack[++top] = (struct scan_bit_state)
  1351					{ next_order, mid_offset };
  1352				cc->mthp_bitmap_stack[++top] = (struct scan_bit_state)
  1353					{ next_order, offset };
  1354				}
  1355		}
  1356		return collapsed;
  1357	}
  1358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
