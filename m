Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CC810E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 02:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721700133; cv=none; b=rIuM1U6eDYGCv0NdWA+jwnfFib5R+PgQ+RXLW8RpyofzyhxQeivCNaXs0GEyLomLUP8O0Gugkq6iK4/nQkQu1g1w0yu5EJ38+v3I+cMs9lginwnbEZkrmyS05yz92D3dy6aO52Ikb0W7QJ64f85UEPPPXwYxW+s8VKYxHiCzA1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721700133; c=relaxed/simple;
	bh=KmNUDatePElgbylJ6GFn+ztaVpnms0LBuFcv6aN42N8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ccn5BRBsAsrsyhmQBxe3E8YvtnEtnZr6F1Ue+1IedSZDUsyqY/CJwrTbLeP5Ogi7GsI7lRAl4oliKocchwTvxe6lMLfoPCK+5idRbWqtmR2RF5P7+GlnqwQjYFpCDD2o4BYPOwHNHxDBMyrs6m4H8yWdDvzQuCEzY2thgKKVYaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4cVm9JX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4cVm9JX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721700131; x=1753236131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KmNUDatePElgbylJ6GFn+ztaVpnms0LBuFcv6aN42N8=;
  b=H4cVm9JXE6LNTK4L9/XONKzL0LRRErbxmliFsSWvnkwRIVKpht06twqE
   j95kA1+HdkDApU5TbKYj8EG7pjip3OHg1K62LZj1RzCAu6AcnfQ/pRD76
   YfaB3De3pWOqao93CvbszdTI0QMMS+HkHdDHpmZkua+KtzA2ripaQRu/j
   c7Kzpez2i9gSs0ybxLR6BoInU0AUx5wgTlJyTeZhig4ELb76w0Xlxn7ya
   lEwhwv5yZQwCXYQJ+jPjsttnkjMggKrJJiF8Fu8yHpnqbdrHSAIC/bhYw
   GCjLokKK10suFY9irhNRsbPQZL+SK0Aopny6o4MRJEGJ5mXzpb+CbXXFL
   w==;
X-CSE-ConnectionGUID: 4fMlTSlgTLa3a7FAJVh1qQ==
X-CSE-MsgGUID: uO+/BIzaR76mKsT2uNv4bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19149039"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="19149039"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 19:02:10 -0700
X-CSE-ConnectionGUID: ZOqKG8u0QCKSsVNdzT6eTw==
X-CSE-MsgGUID: 77Yspc0JR0WTqfuYAchVKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="52310047"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jul 2024 19:02:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW4qs-000lXz-20;
	Tue, 23 Jul 2024 02:02:06 +0000
Date: Tue, 23 Jul 2024 10:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4b 15/74] include/linux/dynamic_debug.h:86:56:
 warning: "/*" within comment
Message-ID: <202407230944.owlfm5Xs-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240723/202407230944.owlfm5Xs-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230944.owlfm5Xs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407230944.owlfm5Xs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/module.h:30,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
>> include/linux/dynamic_debug.h:86:56: warning: "/*" within comment [-Wcomment]
      86 |  *   ~5000 calls to them, across all of drivers/gpu/drm/*
         |                                                         
--
   In file included from include/linux/module.h:30,
                    from drivers/input/keyboard/atkbd.c:17:
>> include/linux/dynamic_debug.h:86:56: warning: "/*" within comment [-Wcomment]
      86 |  *   ~5000 calls to them, across all of drivers/gpu/drm/*
         |                                                         
   drivers/input/keyboard/atkbd.c: In function 'atkbd_set_device_attrs':
   drivers/input/keyboard/atkbd.c:1197:21: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
    1197 |                  "%s/input0", atkbd->ps2dev.serio->phys);
         |                     ^~~~~~~
   drivers/input/keyboard/atkbd.c:1196:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
    1196 |         snprintf(atkbd->phys, sizeof(atkbd->phys),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1197 |                  "%s/input0", atkbd->ps2dev.serio->phys);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/module.h:30,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
>> include/linux/dynamic_debug.h:86:56: warning: "/*" within comment [-Wcomment]
      86 |  *   ~5000 calls to them, across all of drivers/gpu/drm/*
         |                                                         


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
