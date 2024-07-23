Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371E64595B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 02:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721700135; cv=none; b=BhKyS338/78OpIVqyV+4xq7ALSFEpmU/NVas5V4WuP49Z4wY15uo3UeARsryEOPhWHwKqs9U2Jugad3tVL/5W1jTXjABxC1/wFPeqmdOCHCWyxeZwx2MKJU15Vi+uVEPwjy0guYxbG46KgbzybQwAlViVe4gxLfyFW0q5GTyJ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721700135; c=relaxed/simple;
	bh=SBvjtJxQ3QQC9rw6NOwYO6HmZrMa4/g+LS5Pso4Dox8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=svQwNe3bpHEtkSV5kEmXklWkPw/WPJeFzCPUW3hKt7LbljjzvUCXnRuPXW1ReT2FjZCKmilIeRst9dIqUii1BtjOUXDG+uhdERFfeVkH7ZgNWaEetRAhI/418sIs3dQEo81bMPNJ4FRh354y3u1uIAhUbYJmdIIu13KuRSmGl40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrdxpxBh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrdxpxBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721700133; x=1753236133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SBvjtJxQ3QQC9rw6NOwYO6HmZrMa4/g+LS5Pso4Dox8=;
  b=PrdxpxBhy+zUrXPqbz394+GxoYC6k/cxEwleW9YAmUMnl1p0YY0PJbPW
   B3vzrjnFLvBsaxxaR/yvQPH59jdVbqnXp5OE9zauwf6I4vRfYt12Cw7WE
   IJY0vKWTkMRMF+nq4PQja/6V2XhQCzQhBjpRLufqwtQbUqea6eUd2xOdh
   hs/zVaiLKRDDRzxC2RyTAia1czDnTwos5RWb6ZY6sJsT+TpyLwKFNZpaI
   kVyPxznrJssU0AKa+oETVBnBpsse4zLxLJUh0unZE6T+mNq4oaEj+RTdb
   BftIMWE7sk9Z6Esesc+gpyGAB56A4ys3dZ8hbbuvJnLmNl5fjklAMNvbB
   Q==;
X-CSE-ConnectionGUID: GmKqFw/oTM6QgHs923QmuA==
X-CSE-MsgGUID: iU1vCAu7TcGjc+8D8+5NVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19149042"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="19149042"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 19:02:10 -0700
X-CSE-ConnectionGUID: xzwGcU5HStGQEx/s7DUt6Q==
X-CSE-MsgGUID: V+tcdUIXTL66j5O7S9rAag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="52310046"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jul 2024 19:02:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW4qs-000lXw-1h;
	Tue, 23 Jul 2024 02:02:06 +0000
Date: Tue, 23 Jul 2024 10:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4b 15/74] include/linux/dynamic_debug.h:86:56:
 warning: '/*' within block comment
Message-ID: <202407230933.kISprs51-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-4b
head:   b1eb9061e745d7ee49291aa451e0fbdfc325f7bc
commit: 69e3e77dca408ade14290862bf4cc991166d5acd [15/74] dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240723/202407230933.kISprs51-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230933.kISprs51-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407230933.kISprs51-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:374:
   In file included from include/linux/fortify-string.h:6:
   In file included from include/linux/bug.h:5:
   In file included from arch/x86/include/asm/bug.h:87:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:570:
>> include/linux/dynamic_debug.h:86:56: warning: '/*' within block comment [-Wcomment]
      86 |  *   ~5000 calls to them, across all of drivers/gpu/drm/*
         |                                                        ^
   1 warning generated.
--
>> clang diag: include/linux/dynamic_debug.h:86:56: warning: '/*' within block comment [-Wcomment]


vim +86 include/linux/dynamic_debug.h

    82	
    83	/*
    84	 * dyndbg-classmaps is closely modelled on DRM.debug, which has:
    85	 *   ~23 macros, each passing DRM_UT_* as 1st arg
  > 86	 *   ~5000 calls to them, across all of drivers/gpu/drm/*
    87	 *   Optimizing compilers handle this well.
    88	 *
    89	 * So dyndbg maps known classnames to limited (0..62) .classids, and
    90	 * insists classes are selected by name for adjustment.
    91	 *
    92	 * modules either DEFINE classnames, or USE names defined elsewhere
    93	 * (in another module).  This supports classnames defined over subsystems.
    94	 */
    95	/**
    96	 * DYNDBG_CLASSMAP_DEFINE - define debug classes used by a module.
    97	 * @_var:   name of the classmap, exported for other modules coordinated use.
    98	 * @_type:  enum ddebug_class_map_type: DISJOINT - independent, LEVEL - v2>v1
    99	 * @_base:  reserve N classids starting at _base, to split 0..62 classid space
   100	 * @classes: names of the N classes.
   101	 *
   102	 * This tells dyndbg what classids the module is using, by mapping
   103	 * names onto them.  This qualifies "class NAME" >controls on the
   104	 * defining module, ignoring unknown names.
   105	 *
   106	 * The @classes also name the bits 0.. in any CLASSMAP_PARAM referring
   107	 * to the classmap.
   108	 */
   109	#define __DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, ...)		\
   110		const char *_var##_classnames[] = { __VA_ARGS__ };		\
   111		struct ddebug_class_map __aligned(8) __used			\
   112			__section("__dyndbg_classes") _var = {			\
   113			.mod = THIS_MODULE,					\
   114			.mod_name = KBUILD_MODNAME,				\
   115			.base = _base,						\
   116			.map_type = _maptype,					\
   117			.length = ARRAY_SIZE(_var##_classnames),		\
   118			.class_names = _var##_classnames,			\
   119		}
   120	#define DYNDBG_CLASSMAP_DEFINE(_var, ...)		\
   121		__DYNDBG_CLASSMAP_DEFINE(_var, __VA_ARGS__);	\
   122		EXPORT_SYMBOL(_var)
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
