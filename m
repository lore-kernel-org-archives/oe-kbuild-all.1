Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518145C96
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 11:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750159585; cv=none; b=kPSdHCQjfy0EgT8n9m1vd0HoVfRHgHlIh9Yz5/FT9uBGisLJjzZEsYBZtuNCi43POoWAB7Vu2ov37AjKAjoVf94UbZVudufem9q73Ufa2k3lJK5kdQ1bXAgSUUzdGugf+1ZOvNeClN7T2PJDXHWYML7YhNvS+SYmn8/n55hun0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750159585; c=relaxed/simple;
	bh=RjbW+YZyAxvRArbP7F6dqrxXWhFdWt5UtHC4RddLqBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BZFeojyjqmF7HEL2thuRXhAJwM/7SUcCb26QwF0eaa1z6GTcfG3v69WnYh3FnibqNxMzk3PoCOlKVgA3I6GzJiLDWYqPA3ppxfH105DB9MmXJ7fCgj0ardFvdk6tuvtkI3qpB6ec0d0t8UqzlZIujsu708Hq8gwO3uo3XAwCTf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltJyUBkT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltJyUBkT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750159583; x=1781695583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RjbW+YZyAxvRArbP7F6dqrxXWhFdWt5UtHC4RddLqBU=;
  b=ltJyUBkT+jGPaku5LmPOVKJs5I1qH2mGb5gR89GRc8H4WN+5SHGz5PYH
   KYY2qxnXpurFALvUk7UMgaLDzvTo1R4vnH0RaU+VVi96cxt9nfdl+17JW
   UbKVoHWth24FQgOHVGOFe1G3lUOGDKfxiBToFWSTEArHlb3MVIDw4BJfN
   gd2VrPqMdeDrKpAhbUMSImL71ol5ZSmBi2eew+7TMahDQK6qPC1qr+ilC
   WTSAT+bd4gU7awLONVSMAeeZE/NYeAc67EkC4SX8l0j6AO9ehCViQE5Bt
   VR9Lra6W1dJG3BRl3ibCGMLIcqcQfTOfGrEGIDm/SC/pGxr4XpRaQ6mBj
   w==;
X-CSE-ConnectionGUID: 5rmi5IKKRzOTITlX+zwevg==
X-CSE-MsgGUID: 0z1ycqlXQUSiVIyKXrUMRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52244781"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="52244781"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 04:26:23 -0700
X-CSE-ConnectionGUID: V1C5651ER1CnUct5Io0auQ==
X-CSE-MsgGUID: 9YMafBUaTYCj8gKTkaZWrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="149239897"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jun 2025 04:26:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRUSJ-000FvK-1T;
	Tue, 17 Jun 2025 11:26:19 +0000
Date: Tue, 17 Jun 2025 19:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/25] mm/slab_common.c:1220:1:
 warning: no previous prototype for function 'oot___kmalloc_node_0'
Message-ID: <202506171902.9jV7S49B-lkp@intel.com>
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
head:   52f058371994dd007ac842b38bab3e576e84ab5a
commit: 1bf884b50b3aafe807ed07f6c653fa3b2bd5831a [0/25] anolis: mm: introduce per module slab for oot memory isolation
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250617/202506171902.9jV7S49B-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171902.9jV7S49B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171902.9jV7S49B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slab_common.c:1220:1: warning: no previous prototype for function 'oot___kmalloc_node_0' [-Wmissing-prototypes]
    1220 | DEFINE_OOT_FUNC___kmalloc_node(0);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:151:1: note: expanded from here
     151 | oot___kmalloc_node_0
         | ^
   mm/slab_common.c:1220:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1220 | DEFINE_OOT_FUNC___kmalloc_node(0);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1221:1: warning: no previous prototype for function 'oot___kmalloc_node_1' [-Wmissing-prototypes]
    1221 | DEFINE_OOT_FUNC___kmalloc_node(1);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:159:1: note: expanded from here
     159 | oot___kmalloc_node_1
         | ^
   mm/slab_common.c:1221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1221 | DEFINE_OOT_FUNC___kmalloc_node(1);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1222:1: warning: no previous prototype for function 'oot___kmalloc_node_2' [-Wmissing-prototypes]
    1222 | DEFINE_OOT_FUNC___kmalloc_node(2);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:167:1: note: expanded from here
     167 | oot___kmalloc_node_2
         | ^
   mm/slab_common.c:1222:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1222 | DEFINE_OOT_FUNC___kmalloc_node(2);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1223:1: warning: no previous prototype for function 'oot___kmalloc_node_3' [-Wmissing-prototypes]
    1223 | DEFINE_OOT_FUNC___kmalloc_node(3);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:175:1: note: expanded from here
     175 | oot___kmalloc_node_3
         | ^
   mm/slab_common.c:1223:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1223 | DEFINE_OOT_FUNC___kmalloc_node(3);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1224:1: warning: no previous prototype for function 'oot___kmalloc_node_4' [-Wmissing-prototypes]
    1224 | DEFINE_OOT_FUNC___kmalloc_node(4);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:7:1: note: expanded from here
       7 | oot___kmalloc_node_4
         | ^
   mm/slab_common.c:1224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1224 | DEFINE_OOT_FUNC___kmalloc_node(4);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1225:1: warning: no previous prototype for function 'oot___kmalloc_node_5' [-Wmissing-prototypes]
    1225 | DEFINE_OOT_FUNC___kmalloc_node(5);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:15:1: note: expanded from here
      15 | oot___kmalloc_node_5
         | ^
   mm/slab_common.c:1225:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1225 | DEFINE_OOT_FUNC___kmalloc_node(5);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1226:1: warning: no previous prototype for function 'oot___kmalloc_node_6' [-Wmissing-prototypes]
    1226 | DEFINE_OOT_FUNC___kmalloc_node(6);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:23:1: note: expanded from here
      23 | oot___kmalloc_node_6
         | ^
   mm/slab_common.c:1226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1226 | DEFINE_OOT_FUNC___kmalloc_node(6);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1227:1: warning: no previous prototype for function 'oot___kmalloc_node_7' [-Wmissing-prototypes]
    1227 | DEFINE_OOT_FUNC___kmalloc_node(7);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:31:1: note: expanded from here
      31 | oot___kmalloc_node_7
         | ^
   mm/slab_common.c:1227:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1227 | DEFINE_OOT_FUNC___kmalloc_node(7);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1228:1: warning: no previous prototype for function 'oot___kmalloc_node_8' [-Wmissing-prototypes]
    1228 | DEFINE_OOT_FUNC___kmalloc_node(8);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:39:1: note: expanded from here
      39 | oot___kmalloc_node_8
         | ^
   mm/slab_common.c:1228:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1228 | DEFINE_OOT_FUNC___kmalloc_node(8);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1229:1: warning: no previous prototype for function 'oot___kmalloc_node_9' [-Wmissing-prototypes]
    1229 | DEFINE_OOT_FUNC___kmalloc_node(9);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:47:1: note: expanded from here
      47 | oot___kmalloc_node_9
         | ^
   mm/slab_common.c:1229:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1229 | DEFINE_OOT_FUNC___kmalloc_node(9);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1230:1: warning: no previous prototype for function 'oot___kmalloc_node_10' [-Wmissing-prototypes]
    1230 | DEFINE_OOT_FUNC___kmalloc_node(10);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:55:1: note: expanded from here
      55 | oot___kmalloc_node_10
         | ^
   mm/slab_common.c:1230:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1230 | DEFINE_OOT_FUNC___kmalloc_node(10);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1231:1: warning: no previous prototype for function 'oot___kmalloc_node_11' [-Wmissing-prototypes]
    1231 | DEFINE_OOT_FUNC___kmalloc_node(11);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:63:1: note: expanded from here
      63 | oot___kmalloc_node_11
         | ^
   mm/slab_common.c:1231:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1231 | DEFINE_OOT_FUNC___kmalloc_node(11);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1232:1: warning: no previous prototype for function 'oot___kmalloc_node_12' [-Wmissing-prototypes]
    1232 | DEFINE_OOT_FUNC___kmalloc_node(12);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:71:1: note: expanded from here
      71 | oot___kmalloc_node_12
         | ^
   mm/slab_common.c:1232:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1232 | DEFINE_OOT_FUNC___kmalloc_node(12);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1233:1: warning: no previous prototype for function 'oot___kmalloc_node_13' [-Wmissing-prototypes]
    1233 | DEFINE_OOT_FUNC___kmalloc_node(13);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:79:1: note: expanded from here
      79 | oot___kmalloc_node_13
         | ^
   mm/slab_common.c:1233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1233 | DEFINE_OOT_FUNC___kmalloc_node(13);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1234:1: warning: no previous prototype for function 'oot___kmalloc_node_14' [-Wmissing-prototypes]
    1234 | DEFINE_OOT_FUNC___kmalloc_node(14);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:3:1: note: expanded from here
       3 | oot___kmalloc_node_14
         | ^
   mm/slab_common.c:1234:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1234 | DEFINE_OOT_FUNC___kmalloc_node(14);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1235:1: warning: no previous prototype for function 'oot___kmalloc_node_15' [-Wmissing-prototypes]
    1235 | DEFINE_OOT_FUNC___kmalloc_node(15);
         | ^
   mm/slab_common.c:1214:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1214 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:11:1: note: expanded from here
      11 | oot___kmalloc_node_15
         | ^
   mm/slab_common.c:1235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1235 | DEFINE_OOT_FUNC___kmalloc_node(15);
         | ^
         | static 
   mm/slab_common.c:1213:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    1213 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slab_common.c:1250:1: warning: no previous prototype for function 'oot___kmalloc_0' [-Wmissing-prototypes]
    1250 | DEFINE_OOT_FUNC___kmalloc(0);
         | ^
   mm/slab_common.c:1244:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:25:1: note: expanded from here
      25 | oot___kmalloc_0
         | ^
   mm/slab_common.c:1250:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1250 | DEFINE_OOT_FUNC___kmalloc(0);
         | ^
         | static 
   mm/slab_common.c:1243:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1243 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slab_common.c:1251:1: warning: no previous prototype for function 'oot___kmalloc_1' [-Wmissing-prototypes]
    1251 | DEFINE_OOT_FUNC___kmalloc(1);
         | ^
   mm/slab_common.c:1244:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:33:1: note: expanded from here
      33 | oot___kmalloc_1
         | ^
   mm/slab_common.c:1251:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1251 | DEFINE_OOT_FUNC___kmalloc(1);
         | ^
         | static 
   mm/slab_common.c:1243:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1243 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slab_common.c:1252:1: warning: no previous prototype for function 'oot___kmalloc_2' [-Wmissing-prototypes]
    1252 | DEFINE_OOT_FUNC___kmalloc(2);
         | ^
   mm/slab_common.c:1244:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:41:1: note: expanded from here
      41 | oot___kmalloc_2
         | ^
   mm/slab_common.c:1252:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1252 | DEFINE_OOT_FUNC___kmalloc(2);
         | ^
         | static 
   mm/slab_common.c:1243:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1243 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slab_common.c:1253:1: warning: no previous prototype for function 'oot___kmalloc_3' [-Wmissing-prototypes]
    1253 | DEFINE_OOT_FUNC___kmalloc(3);
         | ^
   mm/slab_common.c:1244:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:49:1: note: expanded from here
      49 | oot___kmalloc_3
         | ^
   mm/slab_common.c:1253:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1253 | DEFINE_OOT_FUNC___kmalloc(3);
         | ^
         | static 
   mm/slab_common.c:1243:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1243 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
   mm/slab_common.c:1254:1: warning: no previous prototype for function 'oot___kmalloc_4' [-Wmissing-prototypes]
    1254 | DEFINE_OOT_FUNC___kmalloc(4);
         | ^
   mm/slab_common.c:1244:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:57:1: note: expanded from here
      57 | oot___kmalloc_4
         | ^
   mm/slab_common.c:1254:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1254 | DEFINE_OOT_FUNC___kmalloc(4);
         | ^
         | static 
   mm/slab_common.c:1243:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1243 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
   mm/slab_common.c:1255:1: warning: no previous prototype for function 'oot___kmalloc_5' [-Wmissing-prototypes]
    1255 | DEFINE_OOT_FUNC___kmalloc(5);
         | ^
   mm/slab_common.c:1244:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:65:1: note: expanded from here
      65 | oot___kmalloc_5
         | ^
   mm/slab_common.c:1255:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1255 | DEFINE_OOT_FUNC___kmalloc(5);
         | ^
         | static 
   mm/slab_common.c:1243:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1243 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
   mm/slab_common.c:1256:1: warning: no previous prototype for function 'oot___kmalloc_6' [-Wmissing-prototypes]
    1256 | DEFINE_OOT_FUNC___kmalloc(6);
         | ^
   mm/slab_common.c:1244:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:73:1: note: expanded from here
      73 | oot___kmalloc_6
         | ^
   mm/slab_common.c:1256:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1256 | DEFINE_OOT_FUNC___kmalloc(6);
         | ^
         | static 
   mm/slab_common.c:1243:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1243 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
   mm/slab_common.c:1257:1: warning: no previous prototype for function 'oot___kmalloc_7' [-Wmissing-prototypes]
    1257 | DEFINE_OOT_FUNC___kmalloc(7);
         | ^
   mm/slab_common.c:1244:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:81:1: note: expanded from here
      81 | oot___kmalloc_7
         | ^
   mm/slab_common.c:1257:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1257 | DEFINE_OOT_FUNC___kmalloc(7);
         | ^
         | static 
   mm/slab_common.c:1243:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1243 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
   mm/slab_common.c:1258:1: warning: no previous prototype for function 'oot___kmalloc_8' [-Wmissing-prototypes]
    1258 | DEFINE_OOT_FUNC___kmalloc(8);
         | ^
   mm/slab_common.c:1244:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:89:1: note: expanded from here
      89 | oot___kmalloc_8
         | ^
   mm/slab_common.c:1258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1258 | DEFINE_OOT_FUNC___kmalloc(8);
         | ^
         | static 
   mm/slab_common.c:1243:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1243 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
   mm/slab_common.c:1259:1: warning: no previous prototype for function 'oot___kmalloc_9' [-Wmissing-prototypes]
    1259 | DEFINE_OOT_FUNC___kmalloc(9);
         | ^
   mm/slab_common.c:1244:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    1244 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \


vim +/oot___kmalloc_node_0 +1220 mm/slab_common.c

  1219	
> 1220	DEFINE_OOT_FUNC___kmalloc_node(0);
> 1221	DEFINE_OOT_FUNC___kmalloc_node(1);
> 1222	DEFINE_OOT_FUNC___kmalloc_node(2);
> 1223	DEFINE_OOT_FUNC___kmalloc_node(3);
> 1224	DEFINE_OOT_FUNC___kmalloc_node(4);
> 1225	DEFINE_OOT_FUNC___kmalloc_node(5);
> 1226	DEFINE_OOT_FUNC___kmalloc_node(6);
> 1227	DEFINE_OOT_FUNC___kmalloc_node(7);
> 1228	DEFINE_OOT_FUNC___kmalloc_node(8);
> 1229	DEFINE_OOT_FUNC___kmalloc_node(9);
> 1230	DEFINE_OOT_FUNC___kmalloc_node(10);
> 1231	DEFINE_OOT_FUNC___kmalloc_node(11);
> 1232	DEFINE_OOT_FUNC___kmalloc_node(12);
> 1233	DEFINE_OOT_FUNC___kmalloc_node(13);
> 1234	DEFINE_OOT_FUNC___kmalloc_node(14);
> 1235	DEFINE_OOT_FUNC___kmalloc_node(15);
  1236	
  1237	void *__kmalloc(size_t size, gfp_t flags)
  1238	{
  1239		return __do_kmalloc_node(size, flags, NUMA_NO_NODE, _RET_IP_);
  1240	}
  1241	EXPORT_SYMBOL(__kmalloc);
  1242	
  1243	#define DEFINE_OOT_FUNC___kmalloc(index)				\
  1244	void *oot___kmalloc_ ## index(size_t size, gfp_t flags)			\
  1245	{									\
  1246		return oot__do_kmalloc_node(index, size, flags, NUMA_NO_NODE, _RET_IP_);  \
  1247	}									\
  1248	EXPORT_SYMBOL(oot___kmalloc_ ## index)
  1249	
> 1250	DEFINE_OOT_FUNC___kmalloc(0);
> 1251	DEFINE_OOT_FUNC___kmalloc(1);
> 1252	DEFINE_OOT_FUNC___kmalloc(2);
> 1253	DEFINE_OOT_FUNC___kmalloc(3);
> 1254	DEFINE_OOT_FUNC___kmalloc(4);
> 1255	DEFINE_OOT_FUNC___kmalloc(5);
> 1256	DEFINE_OOT_FUNC___kmalloc(6);
> 1257	DEFINE_OOT_FUNC___kmalloc(7);
> 1258	DEFINE_OOT_FUNC___kmalloc(8);
> 1259	DEFINE_OOT_FUNC___kmalloc(9);
> 1260	DEFINE_OOT_FUNC___kmalloc(10);
> 1261	DEFINE_OOT_FUNC___kmalloc(11);
> 1262	DEFINE_OOT_FUNC___kmalloc(12);
> 1263	DEFINE_OOT_FUNC___kmalloc(13);
> 1264	DEFINE_OOT_FUNC___kmalloc(14);
> 1265	DEFINE_OOT_FUNC___kmalloc(15);
  1266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
