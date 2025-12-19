Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858E7226863
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 01:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766106823; cv=none; b=K2kAIrIfh0T3DEHfPlZ4Hv/kP0sGE86mvkX3cZt1yo33fteFW88eviTKgQRqH9uBUr2mA781mZoz0SaNXPE9S+FBdKM2j7Kri6otkJC6+FZ+pWLVbTMFKuAmzCdMCwWA0l2v2pLgIvvn47BO+MbzhVhLgUjazFzBctVlkxmuiqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766106823; c=relaxed/simple;
	bh=WAKFO5qz3bYGUIOUmZFjyeWfPfP2oR6aj6Z67fYJxqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g4AevpaBhbwQcUyw8j5YueEt6JaAUc+ieY2us2zNdL3Qaf9LBI5YCZSKjv4DaDPEeLWpc/quQSiKv4ODZ4vacsKdBiWQAus4vZcLnIlqXNXV03ukvePdqrl4I79DqUZEOH3xMohNZJQyrRkIap0qZJQAoCLIqckQj9a0yg0HkJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBSNCTwT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBSNCTwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766106821; x=1797642821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WAKFO5qz3bYGUIOUmZFjyeWfPfP2oR6aj6Z67fYJxqE=;
  b=oBSNCTwTwhDctxRhrTkKsKdFQR5wikTUa38gnrkWEETRkGw3d/N0WV/a
   nb/A5Mm/NPlXUlN2qn0m/ClZXFgRP5wU/4c+cJ+4Xr1kbZGGPTgzsXs+8
   GkgoAfgf2uakdDKLrY7KLTsvRZxYkZDOFu6NBUxTVfv75YIWqbADSfXsL
   KXcSdhUFGRVTHIG/NxCZOHnCjhfl7rZIuVZJQA74Kr0UW7j8VQ9cTdLqu
   lNR770SKJAIbtJR9/vtm8uTXo/qTgT46UTXOSKaSHG/EP+lZGrk5JXve7
   xo+XAPw13riexJwuDyD+Td2hCklcxD/BL1bcjgZeIxsDAydKbb3Ze7Fc1
   A==;
X-CSE-ConnectionGUID: YMZK3e1PSKm90qMKoIjbjw==
X-CSE-MsgGUID: BPaJr3rsQqyQrDWGYXXaIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78386898"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78386898"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 17:13:41 -0800
X-CSE-ConnectionGUID: /P/VAgo9R+uUHTVFdfhtUA==
X-CSE-MsgGUID: bziF2/CmQxu1jmYSeN/kIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203130061"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Dec 2025 17:13:40 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWP3p-000000002q7-32wU;
	Fri, 19 Dec 2025 01:13:37 +0000
Date: Fri, 19 Dec 2025 09:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4/4]
 include/linux/mmzone.h:1136:13: error: variable 'nid' set but not used
Message-ID: <202512190956.lizWwlVt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Feng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: c65b1bd0af076fa5a1da26b9cf780097b14b1543 [4/4] mm/page_alloc: detect allocation forbidden by cpuset and bail out early
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251219/202512190956.lizWwlVt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190956.lizWwlVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190956.lizWwlVt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from lib/test_bitops.c:9:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: error: variable 'nid' set but not used [-Werror=unused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   cc1: all warnings being treated as errors


vim +/nid +1136 include/linux/mmzone.h

  1094	
  1095	/**
  1096	 * for_each_zone_zonelist_nodemask - helper macro to iterate over valid zones in a zonelist at or below a given zone index and within a nodemask
  1097	 * @zone - The current zone in the iterator
  1098	 * @z - The current pointer within zonelist->_zonerefs being iterated
  1099	 * @zlist - The zonelist being iterated
  1100	 * @highidx - The zone index of the highest zone to return
  1101	 * @nodemask - Nodemask allowed by the allocator
  1102	 *
  1103	 * This iterator iterates though all zones at or below a given zone index and
  1104	 * within a given nodemask
  1105	 */
  1106	#define for_each_zone_zonelist_nodemask(zone, z, zlist, highidx, nodemask) \
  1107		for (z = first_zones_zonelist(zlist, highidx, nodemask), zone = zonelist_zone(z);	\
  1108			zone;							\
  1109			z = next_zones_zonelist(++z, highidx, nodemask),	\
  1110				zone = zonelist_zone(z))
  1111	
  1112	#define for_next_zone_zonelist_nodemask(zone, z, highidx, nodemask) \
  1113		for (zone = z->zone;	\
  1114			zone;							\
  1115			z = next_zones_zonelist(++z, highidx, nodemask),	\
  1116				zone = zonelist_zone(z))
  1117	
  1118	
  1119	/**
  1120	 * for_each_zone_zonelist - helper macro to iterate over valid zones in a zonelist at or below a given zone index
  1121	 * @zone - The current zone in the iterator
  1122	 * @z - The current pointer within zonelist->zones being iterated
  1123	 * @zlist - The zonelist being iterated
  1124	 * @highidx - The zone index of the highest zone to return
  1125	 *
  1126	 * This iterator iterates though all zones at or below a given zone index.
  1127	 */
  1128	#define for_each_zone_zonelist(zone, z, zlist, highidx) \
  1129		for_each_zone_zonelist_nodemask(zone, z, zlist, highidx, NULL)
  1130	
  1131	/* Whether the 'nodes' are all movable nodes */
  1132	static inline bool movable_only_nodes(nodemask_t *nodes)
  1133	{
  1134		struct zonelist *zonelist;
  1135		struct zoneref *z;
> 1136		int nid;
  1137	
  1138		if (nodes_empty(*nodes))
  1139			return false;
  1140	
  1141		/*
  1142		 * We can chose arbitrary node from the nodemask to get a
  1143		 * zonelist as they are interlinked. We just need to find
  1144		 * at least one zone that can satisfy kernel allocations.
  1145		 */
  1146		nid = first_node(*nodes);
  1147		zonelist = &NODE_DATA(nid)->node_zonelists[ZONELIST_FALLBACK];
  1148		z = first_zones_zonelist(zonelist, ZONE_NORMAL,	nodes);
  1149		return (!z->zone) ? true : false;
  1150	}
  1151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
