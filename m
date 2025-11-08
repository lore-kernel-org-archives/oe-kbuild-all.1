Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9CF1C84A0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762627596; cv=none; b=p/DNK8y0xXeP4E/arqmHvcNmjSXrlqfSaoyx69SOBDnjb5gZbJAj4cHqOeUH+K7ADP1m+q65NukLwuzGVXc6LDRKnl8l1yhBkvOAEqPnNLqTO28GqK5eQCSTEwuKtBtfCJl/vMi8VQ0kxWiRMDtE2Fibl7ANQ57IcL5o+CXYjDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762627596; c=relaxed/simple;
	bh=1OTIJlS81hynyInKNE7TdqKPkpn7edwqKbbQggp9Fqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JuTAH3DqPdLB2BVMf2HwY1bgdQqVEqfqHOdz8b6Kt/QPlxk+NzqsPF+fef8OTztshID7YLN3Lb7Zbx0oBuAt57iNhbXwfP7WC5Ar90m9Qu3mCIhjSclbypuMhXteVILz5qJ4Mlyyzy8ztZEl3WBCFvseS7gE6W1BSvFk4HvqDLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCwmyG2p; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCwmyG2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762627595; x=1794163595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1OTIJlS81hynyInKNE7TdqKPkpn7edwqKbbQggp9Fqo=;
  b=CCwmyG2pnlvdR+l3lihUhTkXXWxHqLjVzjAaN8mBYIS1tS0M1LAvAxJT
   +uX1af1CetPU9NkOwBGvE6i/IkOHqzRwSbviM1NeGCKlmOHPH9AOHe9vZ
   unNhFbh0/eI14whEnwhd2PQPrM/Z6rcoxkiMSuDEXAmEoFUw4twF4YxrS
   2HCWp42yx0qUfJOVVPOvDC6ujbGS0v/RjkPtm9JgI+fP1EF/mZ/C7hOc+
   c/hX/iBMjwQPoKHJjUf/XebIV+HaOsGpNtaOUdmx/uA2FeGzmX++T7aYZ
   M2XcUmnVGaE4h2UxOqkkiMPZqBkYfe6XOgDqd9yr81hFkkB6ElYPgjSU2
   g==;
X-CSE-ConnectionGUID: voandxyeTXSEAmY/1QEghQ==
X-CSE-MsgGUID: B8xZgitPQ2mXXQMWrtP5Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64670413"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64670413"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 10:46:35 -0800
X-CSE-ConnectionGUID: hwveyiVcRAuCjJlJr/95Sw==
X-CSE-MsgGUID: /38NWnKaSyex1HURhQi66Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="193340224"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Nov 2025 10:46:33 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHnxG-0001L9-2v;
	Sat, 08 Nov 2025 18:46:30 +0000
Date: Sun, 9 Nov 2025 02:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:scratch/gourry/isolation/linus 11/11]
 mm/zswap.c:869:6: warning: assignment to 'struct page *' from 'int' makes
 pointer from integer without a cast
Message-ID: <202511090204.lGKEan2q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/linus
head:   67062e895b94cd27af5fa58d8a567086a53d0914
commit: 67062e895b94cd27af5fa58d8a567086a53d0914 [11/11] [HACK] mm/zswap: compressed ram integration example
config: arm-randconfig-004-20251108 (https://download.01.org/0day-ci/archive/20251109/202511090204.lGKEan2q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511090204.lGKEan2q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511090204.lGKEan2q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/numa.h:6,
                    from include/linux/cpumask.h:17,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from mm/zswap.c:16:
   mm/zswap.c: In function 'zswap_compress_direct':
   mm/zswap.c:860:23: error: 'mt_compressed_nodelist' undeclared (first use in this function)
     860 |  int nid = first_node(mt_compressed_nodelist);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:250:40: note: in definition of macro 'first_node'
     250 | #define first_node(src) __first_node(&(src))
         |                                        ^~~
   mm/zswap.c:860:23: note: each undeclared identifier is reported only once for each function it appears in
     860 |  int nid = first_node(mt_compressed_nodelist);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:250:40: note: in definition of macro 'first_node'
     250 | #define first_node(src) __first_node(&(src))
         |                                        ^~~
>> mm/zswap.c:869:6: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     869 |  dst = __alloc_pages(gfp, 0, nid, &mt_compressed_nodelist);
         |      ^
   In file included from include/linux/numa.h:6,
                    from include/linux/cpumask.h:17,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from mm/zswap.c:16:
   mm/zswap.c: In function 'zswap_compress':
   mm/zswap.c:908:19: error: 'mt_compressed_nodelist' undeclared (first use in this function)
     908 |  if (!nodes_empty(mt_compressed_nodelist)) {
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:229:42: note: in definition of macro 'nodes_empty'
     229 | #define nodes_empty(src) __nodes_empty(&(src), MAX_NUMNODES)
         |                                          ^~~


vim +869 mm/zswap.c

   856	
   857	static struct page *zswap_compress_direct(struct page *src,
   858						  struct zswap_entry *entry)
   859	{
 > 860		int nid = first_node(mt_compressed_nodelist);
   861		struct page *dst;
   862		gfp_t gfp;
   863	
   864		if (nid == NUMA_NO_NODE)
   865			return NULL;
   866	
   867		gfp = GFP_NOWAIT | __GFP_NORETRY | __GFP_HIGHMEM | __GFP_MOVABLE |
   868		      __GFP_PROTECTED;
 > 869		dst = __alloc_pages(gfp, 0, nid, &mt_compressed_nodelist);
   870		if (!dst)
   871			return NULL;
   872	
   873		/*
   874		 * TODO: check that the page is safe to use
   875		 *
   876		 * In a real implementation, we would not be using ZSWAP to demonstrate this
   877		 * and instead would implement a new component (compressed_ram, cram.c?)
   878		 *
   879		 * At this point we would check via some callback that the device's memory
   880		 * is actually safe to use - and if not, free the page (without writing to
   881		 * it), and kick off kswapd for that node to make room.
   882		 *
   883		 * Alternatively, if the compressed memory device(s) report a watermark
   884		 * crossing via interrupt, a flag can be set that is checked here rather
   885		 * that calling back into a device driver.
   886		 *
   887		 * In this case, we're testing with normal memory, so the memory is always
   888		 * safe to use (i.e. no compression ratio to worry about).
   889		 */
   890		copy_mc_highpage(dst, src);
   891		return dst;
   892	}
   893	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
