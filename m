Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F5190477
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 05:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753162821; cv=none; b=Rog8aW9al05O6FGaXs1cfv5p0elHBnR4UHBnq5J5frgjMPrjh6yLt/hSTL/Hm9WFo9ld86W9MqhajF4VXf1T9PkujO6wsDbzIe6D6TuhHDEWe3OA8SoTNmuWiilZmdE2+76NPM8mblN/MUVdwOUbECqqBWW2RRl3mmTk1mmWgEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753162821; c=relaxed/simple;
	bh=c8s23W7kARymQHrUin8LFssAlPKmlvuBwvikJ6a3ewM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SNI1W/Beb3ANbhDQdKcc+jSK2OJ+Wp6CTj/OajwnD7RaqlWIb141m2icwxjwPcjxyP3sNX6HD/DhlUD6po9aTNoI0qLS5Zo8ANmvyj7G5JhRl3IPxdGoMqPgb6ZUN6pj7CMBYWusRhGRKJHCIcW1lhjQ4+JqblwFDr612mZKIJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAQONaMk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAQONaMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753162820; x=1784698820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c8s23W7kARymQHrUin8LFssAlPKmlvuBwvikJ6a3ewM=;
  b=PAQONaMkNgzS5CA6t9FtMZ/3mQAlyBkcFyYefuIhwW+bFHFBEgkuAyee
   bQNfC3XPukhlWqYRJWBhewFEG2RetlKadLvuOhbgkV0d7axqGgKR5+ir9
   JgNPMCSOp9BMo4gmZrQaHzuB5MPC+c9KNKOcRxh8ZfGigeK3Lv8d6gSZS
   rvxj60p7NLbRdgYbkpcbLQZowcVslUAJZJ/kRdYuq24Q4JT/E2OOdVNF+
   j3YO+uXX84872wVSsAYIBp5NIaP6gAHE3ohbf/cwLnKsGJFJb4sXJoQG5
   xyk7/CHlGy2/UX7C8DDLpBHPZsqzPcFNqCWzsSMCSe7vWssMvwu5GiNBm
   Q==;
X-CSE-ConnectionGUID: n92OYt/JSo+6/stMFPbdqw==
X-CSE-MsgGUID: 8dOsm3sFR7SaD34X+nJ1qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="72966061"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="72966061"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 22:40:16 -0700
X-CSE-ConnectionGUID: MVE6uiMeRxe1wdgQuuDMHg==
X-CSE-MsgGUID: RsFvW2P6TUCX5BthBsCtVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="159594594"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2025 22:40:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue5jX-000HUh-1v;
	Tue, 22 Jul 2025 05:40:11 +0000
Date: Tue, 22 Jul 2025 13:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 34/34] mm/slab_common.c:1214:7:
 warning: no previous prototype for 'oot___kmalloc_node_0'
Message-ID: <202507221323.IJos8pa1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c51bc02ec5b3728140f3a1cd74cf21c8566be5c
commit: 1bf884b50b3aafe807ed07f6c653fa3b2bd5831a [34/34] anolis: mm: introduce per module slab for oot memory isolation
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250722/202507221323.IJos8pa1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221323.IJos8pa1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221323.IJos8pa1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_0' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1220:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1220 | DEFINE_OOT_FUNC___kmalloc_node(0);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_1' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1221:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1221 | DEFINE_OOT_FUNC___kmalloc_node(1);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_2' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1222:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1222 | DEFINE_OOT_FUNC___kmalloc_node(2);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_3' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1223:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1223 | DEFINE_OOT_FUNC___kmalloc_node(3);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_4' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1224:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1224 | DEFINE_OOT_FUNC___kmalloc_node(4);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_5' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1225:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1225 | DEFINE_OOT_FUNC___kmalloc_node(5);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_6' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1226:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1226 | DEFINE_OOT_FUNC___kmalloc_node(6);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_7' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1227:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1227 | DEFINE_OOT_FUNC___kmalloc_node(7);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_8' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1228:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1228 | DEFINE_OOT_FUNC___kmalloc_node(8);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_9' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1229:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1229 | DEFINE_OOT_FUNC___kmalloc_node(9);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_10' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1230:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1230 | DEFINE_OOT_FUNC___kmalloc_node(10);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_11' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1231:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1231 | DEFINE_OOT_FUNC___kmalloc_node(11);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_12' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1232:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1232 | DEFINE_OOT_FUNC___kmalloc_node(12);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_13' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1233:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1233 | DEFINE_OOT_FUNC___kmalloc_node(13);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_14' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1234:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1234 | DEFINE_OOT_FUNC___kmalloc_node(14);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1214:7: warning: no previous prototype for 'oot___kmalloc_node_15' [-Wmissing-prototypes]
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1235:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1235 | DEFINE_OOT_FUNC___kmalloc_node(15);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_0' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1250:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1250 | DEFINE_OOT_FUNC___kmalloc(0);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_1' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1251:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1251 | DEFINE_OOT_FUNC___kmalloc(1);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_2' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1252:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1252 | DEFINE_OOT_FUNC___kmalloc(2);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_3' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1253:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1253 | DEFINE_OOT_FUNC___kmalloc(3);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_4' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1254:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1254 | DEFINE_OOT_FUNC___kmalloc(4);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_5' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1255:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1255 | DEFINE_OOT_FUNC___kmalloc(5);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_6' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1256:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1256 | DEFINE_OOT_FUNC___kmalloc(6);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_7' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1257:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1257 | DEFINE_OOT_FUNC___kmalloc(7);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_8' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1258:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1258 | DEFINE_OOT_FUNC___kmalloc(8);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_9' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1259:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1259 | DEFINE_OOT_FUNC___kmalloc(9);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_10' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1260:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1260 | DEFINE_OOT_FUNC___kmalloc(10);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_11' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1261:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1261 | DEFINE_OOT_FUNC___kmalloc(11);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_12' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1262:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1262 | DEFINE_OOT_FUNC___kmalloc(12);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_13' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1263:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1263 | DEFINE_OOT_FUNC___kmalloc(13);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_14' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1264:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1264 | DEFINE_OOT_FUNC___kmalloc(14);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1244:7: warning: no previous prototype for 'oot___kmalloc_15' [-Wmissing-prototypes]
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^~~~~~~~~~~~~~
   mm/slab_common.c:1265:1: note: in expansion of macro 'DEFINE_OOT_FUNC___kmalloc'
    1265 | DEFINE_OOT_FUNC___kmalloc(15);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/oot___kmalloc_node_0 +1214 mm/slab_common.c

  1212	
  1213	#define DEFINE_OOT_FUNC___kmalloc_node(index)				\
> 1214	void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)	\
  1215	{									\
  1216		return oot__do_kmalloc_node(index, size, flags, node, _RET_IP_);;	\
  1217	}									\
  1218	EXPORT_SYMBOL(oot___kmalloc_node_ ## index)
  1219	
  1220	DEFINE_OOT_FUNC___kmalloc_node(0);
  1221	DEFINE_OOT_FUNC___kmalloc_node(1);
  1222	DEFINE_OOT_FUNC___kmalloc_node(2);
  1223	DEFINE_OOT_FUNC___kmalloc_node(3);
  1224	DEFINE_OOT_FUNC___kmalloc_node(4);
  1225	DEFINE_OOT_FUNC___kmalloc_node(5);
  1226	DEFINE_OOT_FUNC___kmalloc_node(6);
  1227	DEFINE_OOT_FUNC___kmalloc_node(7);
  1228	DEFINE_OOT_FUNC___kmalloc_node(8);
  1229	DEFINE_OOT_FUNC___kmalloc_node(9);
  1230	DEFINE_OOT_FUNC___kmalloc_node(10);
  1231	DEFINE_OOT_FUNC___kmalloc_node(11);
  1232	DEFINE_OOT_FUNC___kmalloc_node(12);
  1233	DEFINE_OOT_FUNC___kmalloc_node(13);
  1234	DEFINE_OOT_FUNC___kmalloc_node(14);
  1235	DEFINE_OOT_FUNC___kmalloc_node(15);
  1236	
  1237	void *__kmalloc(size_t size, gfp_t flags)
  1238	{
  1239		return __do_kmalloc_node(size, flags, NUMA_NO_NODE, _RET_IP_);
  1240	}
  1241	EXPORT_SYMBOL(__kmalloc);
  1242	
  1243	#define DEFINE_OOT_FUNC___kmalloc(index)				\
> 1244	void *oot___kmalloc_ ## index(size_t size, gfp_t flags)			\
  1245	{									\
  1246		return oot__do_kmalloc_node(index, size, flags, NUMA_NO_NODE, _RET_IP_);  \
  1247	}									\
  1248	EXPORT_SYMBOL(oot___kmalloc_ ## index)
  1249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
