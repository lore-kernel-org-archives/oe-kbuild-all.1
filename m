Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4C8283686
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765642957; cv=none; b=BgnSQxWtsfJY7eZxAOJLbOi7y6QHXEA5YWe+DCap2C/0YRUcmi1ZwoOt3pNlNrUa5ABjI31pPg7WrXUz3hILNrcsWs5EckzPnoumZhtjyQWkiZKa5IqaHv6IBpono6d2ExKeQdnxOARplbGjtJwmj4gcOSAbG6l/50bV/HOrFJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765642957; c=relaxed/simple;
	bh=TeZ4juW2v+d4xQ2ZbT0F6Ns1ffjXQGc2NnYuZTBVCLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PI9vbExV6bJhhlUKAfzZmNaJ5drnC84t4Eo0xEbyRcPZJMnKDBNlMYxNlnVNDdjdpOchlx2oSn6AW/hQJ9yVwRY8JXV700zj84SMhhexxa0zJiBsioPd2FT3+O3PmSEwWjjIHAuKYy89fYeIt1mm+lqaGqreKfS+R1yZsZKsk9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cW26+JIt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cW26+JIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765642956; x=1797178956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TeZ4juW2v+d4xQ2ZbT0F6Ns1ffjXQGc2NnYuZTBVCLM=;
  b=cW26+JItyGLbrYm4l2KMzoCsjkmEzeyc8HBdf4SmsTFZ1MKASASEU5jw
   Hir37mlrkdRmDyyof563Wv2nq9pIkEt4otxvcMQ8AA5fJ9blmGW6pViIf
   iVto/C8wzhNCWy/FzW+XMuhFku9s/TNQoJq9SDIdU0C/pC8WigW4XhoP2
   xw6Qyr7WXw3Qjq1v3gf1faxa9GRfGaZgXhGIjEGk+h0qw5M/mwn0V9cIf
   2fK2TwSNPo9DnBlp3HNweX1Qm8pmkRc9qaNZu20/uWgQU7X6DatmhbEpG
   ADrPO6+RQFyxa2V6V7af69548sNngQXm/8vqVUlMIrJ2Mw36xr86/VZ+F
   A==;
X-CSE-ConnectionGUID: 72GQc2fdQhKR7pZcJ16Y6w==
X-CSE-MsgGUID: qN/hfZQ9Qt6F4EZ2isQ8xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79071908"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="79071908"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 08:22:35 -0800
X-CSE-ConnectionGUID: sv9iu1DsSfOuqGxStsVsdQ==
X-CSE-MsgGUID: pUS0yUy4SYGLQc93yDAGtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201752378"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 08:22:33 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSO7-0000000027s-0GdY;
	Sat, 13 Dec 2025 16:22:31 +0000
Date: Sat, 13 Dec 2025 17:21:36 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] mm/slab_common.c:1214:7:
 warning: no previous prototype for 'oot___kmalloc_node_0'
Message-ID: <202512131719.ezgnYp0Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: 81be03af48c826a24b8088f8d4705153c556d0d2 [50/50] anolis: mm: introduce per module slab for oot memory isolation
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512131719.ezgnYp0Y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131719.ezgnYp0Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131719.ezgnYp0Y-lkp@intel.com/

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
