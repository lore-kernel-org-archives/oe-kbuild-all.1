Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184B63009D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552913; cv=none; b=vBN2abyQVvqcyvrCkm3NY61gsDM1i1kLZ0jCaMXBbVZ9PL94VfUI3cLpi3sIGnzf5UKuLn34+UZyhjz5iD4Bqqwl6sd4lRxUddjcPt5TaNdBKQqDfRPyvgdIGXuBKitby5YQK87fGtl++9recfWNtj6OBUpg3xEIkOAOvuJ96K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552913; c=relaxed/simple;
	bh=O+/cTsTJq5uXcDrgkLiW5OYMeBlhObkDglOH9bffLrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BC49ErgyihexTXAbwQd5kjw25s5gcHt+ZNMTPbXG4ixDUadd6d9xyVMcQ8agQKVCIyM6CiKhIemDGpsdtK8X5dID1cUwH7Kdp/9IwXVNqxCdyayPJMxqwjkVrN2RIcFVVSQVeWVS1qUp7/E3dnWlyYWzhLaMcHdYF8MQ/KnrAfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjDZMcDg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjDZMcDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768552912; x=1800088912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+/cTsTJq5uXcDrgkLiW5OYMeBlhObkDglOH9bffLrM=;
  b=bjDZMcDgBmoaRnNqnUroniPVPaas0TEZakbhYXsoK9qoFJHOdcJNPlDb
   ke36Brb+S4qyJV1FuJL9lb6tVvXTgDh3ya/ElJb7jrJHq339RCrFCKbcV
   NOVEB56PELCev1ymMU6kHaLLrvafruZEw7zCcsrjDM/oJz7SQt+eLmzrb
   0OyqRuXatytgTk2o+8rKGQF1keyZFDjtK0ys1fKtcUXfrkdqgJd5jVkHn
   qd4MmVdzK7FTlgrwaOCoGIB54ghSSZr2ZLfG6Z0HUfPK2OFIhuDsFUDMv
   7BBmexTx3aFPYoYx4e9sgweKVT+Oy1Zsc1Z7FBXdvJ0kl3pDvqZKtyrEE
   w==;
X-CSE-ConnectionGUID: T17HUGJFQd+pZwSUpCDh3w==
X-CSE-MsgGUID: EMYDLXA7Q9WruUeYWPx7Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="68875467"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="68875467"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 00:41:49 -0800
X-CSE-ConnectionGUID: ohoL5vfpT0md1YMe/hX2Uw==
X-CSE-MsgGUID: 8FqSe5K7S8+0pcn5KueR3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205648506"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jan 2026 00:41:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgfOr-00000000Kb2-1k0J;
	Fri, 16 Jan 2026 08:41:45 +0000
Date: Fri, 16 Jan 2026 16:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: Byungchul Park <byungchul@sk.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Pavel Begunkov <asml.silence@gmail.com>,
 "Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen"?= <toke@redhat.com>
Subject: [akpm-mm:mm-unstable /301] net/core/page_pool.c:713:71:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202601161606.8RuyUh2k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   fe2c34b6ea5a0e1175c30d59bc1c28caafb02c62
commit: 7699fe82442a62ea29a3745b29dbb8ef8c42d8db [/301] mm: introduce a new page type for page pool in page type
config: x86_64-randconfig-122-20260115 (https://download.01.org/0day-ci/archive/20260116/202601161606.8RuyUh2k-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161606.8RuyUh2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161606.8RuyUh2k-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/page_pool.c:713:71: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted netmem_ref [usertype] netmem @@     got unsigned long @@
   net/core/page_pool.c:713:71: sparse:     expected restricted netmem_ref [usertype] netmem
   net/core/page_pool.c:713:71: sparse:     got unsigned long
   net/core/page_pool.c:734:73: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted netmem_ref [usertype] netmem @@     got unsigned long @@
   net/core/page_pool.c:734:73: sparse:     expected restricted netmem_ref [usertype] netmem
   net/core/page_pool.c:734:73: sparse:     got unsigned long

vim +713 net/core/page_pool.c

   702	
   703	void page_pool_set_pp_info(struct page_pool *pool, netmem_ref netmem)
   704	{
   705		netmem_set_pp(netmem, pool);
   706	
   707		/* XXX: Now that the offset of page_type is shared between
   708		 * struct page and net_iov, just cast the netmem to struct page
   709		 * unconditionally by clearing NET_IOV if any, no matter whether
   710		 * it comes from struct net_iov or struct page.  This should be
   711		 * adjusted once the offset is no longer shared.
   712		 */
 > 713		__SetPageNetpp(__netmem_to_page((__force unsigned long)netmem & ~NET_IOV));
   714	
   715		/* Ensuring all pages have been split into one fragment initially:
   716		 * page_pool_set_pp_info() is only called once for every page when it
   717		 * is allocated from the page allocator and page_pool_fragment_page()
   718		 * is dirtying the same cache line as the page->pp_magic above, so
   719		 * the overhead is negligible.
   720		 */
   721		page_pool_fragment_netmem(netmem, 1);
   722		if (pool->has_init_callback)
   723			pool->slow.init_callback(netmem, pool->slow.init_arg);
   724	}
   725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
