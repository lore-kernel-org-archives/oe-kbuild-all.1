Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A121313A86D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 03:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721704034; cv=none; b=VieRuE1gsDS82z33gTEEc9lg+hH4v6+mBkwnW6nVHQmkM1gQ4tQ1v3iueVRqncCYPQCai+zttffA0DnbhDMIg7oWvQKWZUa3Tv39i8PGnHAbtvsozhaABGrbc2Cfx1Fd07rxZqBWXJEKCldnjcPDMQ+nBLWXt0DKlJtc93No7Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721704034; c=relaxed/simple;
	bh=yOFbX8laM67jNfHP8dO0RSPmS82V4s3rgiOACwghDUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M6NVzvXJRFpEJ7+6uoie5dlp2JmTs4G43pIOVWv7TaBOhoZ38iXHtfL36JEdC14o7R3baEm9BC2sJYjsZm+aqNbOb4scgcSsJDyQF8ZrBBam2F8QTxL9X6U+/PgfAyPWSBay3tqtpfZ9Dnx/P8vRWwTuWwX7HNdMGioZYsxA3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPhHekfr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPhHekfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721704032; x=1753240032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yOFbX8laM67jNfHP8dO0RSPmS82V4s3rgiOACwghDUU=;
  b=FPhHekfrr+1NHU+kVdWJo4sWm+6YEMBPKph+wKIuBcm7QujHa7yy77dD
   vVXOLcmgCIHa5OQhIWZZMUDsDXGQtX/dpKQoEoC8Y90v/yj3MvHZhjf8q
   7NAqT+0QzuUzCHU+UzEidAJqcOMqJ4nSwTcI4fdjMP2efVsquIJnq4wMh
   tmsVsxOQcfuMsfls7Lc2nwtf5zp9T9COSqOHLrk7PD2/Dm2TInBrPzvqq
   U7AobNPrq8v58GWSbQKghsIgUyKa+2s7fHbGNT8fLPXRCcEwW3jwO7fGJ
   LWJHn0opFkDBm8cwdjDICf/WnlKeHIrzoJexAezp6HUtp31oKHshlqI9r
   w==;
X-CSE-ConnectionGUID: lr+W1Jo2RnKdXL5y4kn2fw==
X-CSE-MsgGUID: Qyp0KyasTnGVX03KDhzFnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="41833080"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="41833080"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 20:07:12 -0700
X-CSE-ConnectionGUID: oMhg8qguT4qCzo3hDcBBRw==
X-CSE-MsgGUID: YD9AjKIBSH2GUnPaWI8IBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="56913621"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Jul 2024 20:07:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW5ro-000lam-1l;
	Tue, 23 Jul 2024 03:07:08 +0000
Date: Tue, 23 Jul 2024 11:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4b 15/74] include/linux/dynamic_debug.h:86:56:
 error: "/*" within comment
Message-ID: <202407231123.vd1TGqCl-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240723/202407231123.vd1TGqCl-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231123.vd1TGqCl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231123.vd1TGqCl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:570,
                    from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_bitops.c:10:
>> include/linux/dynamic_debug.h:86:56: error: "/*" within comment [-Werror=comment]
      86 |  *   ~5000 calls to them, across all of drivers/gpu/drm/*
   cc1: all warnings being treated as errors


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
