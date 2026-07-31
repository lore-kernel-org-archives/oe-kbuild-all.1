Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61113E63B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506846; cv=none; b=fwrgIpW7z4veIpnDxTZQSITrocrXcUhQDmG0MOymTV8tOg29PFZCE5NPU23TjXb5nfB7JVJnKtqKVeoLP71JBY8H/rDMrBtdQsOt7d9hs40TyVpk1xYKqtfOe9bZSfvA9H35GlYzYentyVT5EghI0XRii/UIMz/gtEOiKEyNJ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506846; c=relaxed/simple;
	bh=9uJynIXeySZoWDHtsPpLheFMAYRkqSmiWQZVFT1uhzg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OiKihMf1vrr5/zVEyWT5biCmwN4NGdUMZ2xBsXEC3t66qdQ9bFdBIUbJKlSxECNnr6Ugn/DhYeKbXjk5XDXaWSUHvVXH7aAAtcd2knmASXMdmy6SpjhEI5hoXRI34Z8GTZ2SgIQWb3zBqM+9047omNPA1O2uwjtgp+nuic2HsJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfL9d1Iw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfL9d1Iw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785506844; x=1817042844;
  h=date:from:to:cc:subject:message-id;
  bh=9uJynIXeySZoWDHtsPpLheFMAYRkqSmiWQZVFT1uhzg=;
  b=ZfL9d1IwbqII4wd2pCJvJWkFN0DM7k13vlII4Y28nudkWBeQPiE5X13a
   71nea9wD9YWAS+5kNfh3NbJFA8eTbWzLo8NjH2BaPl/Gy6ew3dA9CEcGd
   zMqxcFM8bvSHZSWVB4Ztony78FS0HiL78I+ybT4KhuKCavkcS2BMZx4kJ
   /NRkHtNtyZL8V2wk/I7GYaraANgaRnXHigBHMitR0SzH/LuEG4Fx3SYu4
   Z7vEUnqiiCUYLKHi/pefsB4Eb5KihdAaVwzV4lsNR6MJ17eY7EnpBz8qs
   nTXQTn5+/NZP8raQdFsd7PvUNtO1c0s2eE1KicLB8y3vq+cGjQDvk7Fl6
   A==;
X-CSE-ConnectionGUID: ZB8YvBZhRWylGfmPMLc68Q==
X-CSE-MsgGUID: WFY81pHpRAOexXjcy28EqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="88664100"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="88664100"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:07:24 -0700
X-CSE-ConnectionGUID: ZtZKHVkhSOKhXARqrduQFA==
X-CSE-MsgGUID: AOxBdGEyT7ix2VCBDZP4rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="258800583"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jul 2026 07:07:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpntQ-0000000017J-2ew7;
	Fri, 31 Jul 2026 14:07:20 +0000
Date: Fri, 31 Jul 2026 22:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/2]
 include/linux/mmzone.h:1136:13: error: variable 'nid' set but not used
Message-ID: <202607312158.dSl1fUDE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Feng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   1290154c48656bd1012a837076a0fbe379330eb3
commit: c65b1bd0af076fa5a1da26b9cf780097b14b1543 [0/2] mm/page_alloc: detect allocation forbidden by cpuset and bail out early
config: x86_64-randconfig-016-20260731 (https://download.01.org/0day-ci/archive/20260731/202607312158.dSl1fUDE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607312158.dSl1fUDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607312158.dSl1fUDE-lkp@intel.com/

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
