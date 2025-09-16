Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73AD1B4231
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758023337; cv=none; b=OtvDo4z2Z6tYQY29XQnx5bLxljHHfFr5AP7pC5pVLe6Tun21BIAJ82Phc8TTl/3AX9FBLTTDmvQzqqfYd6OWzPRNj/yXe7/gD3vrxhoqV5w6+cAHqFnrbMBVHCO/K9c7sn58qn3gmHgTZJf1M96PvCwqPjz1NU5HXJtYdLF7Vbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758023337; c=relaxed/simple;
	bh=yv9s83oGL9lpj8AunoArAqcUM4PJp6TyyLdBpoDnrZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=emdePMcqeeHEKK5Re8XaJtynZJ8xjEnYVC/OjOaGJkUEcVEnmRqY5EzxgSq/48ayl7Vqi75SdW1aYIY0NHXRYZBoCS+TN2rFukH8a/PlLgGe+k+3zzw+h0kIkK8I8HhzTENZZfMwY6uE8+lVScSyfxLmQ6o56vIaoqMGZqw7acE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gaqnd462; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gaqnd462"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758023336; x=1789559336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yv9s83oGL9lpj8AunoArAqcUM4PJp6TyyLdBpoDnrZo=;
  b=Gaqnd462SQhrWdeoC879/+u3Sce2ffGTQI/CYjSgnyim/NnJSeegdr/M
   hA1Y+jgfUPCDOwqp9KlGdnphC5Xt69CtO0xz6dyzAtOQ8iCXsQnMho8tx
   fSkukQXlH5lDyqEB+0/0pBGXFKFzs7PC+Q0yUvACASPibrM9qU4Xhr59F
   BXEUXfcRetuNsBMS8Zf5D1XEJI28DhvGyTU2rhdCU+R8RU5tn6/59VDWY
   FX3xbU9bgW2YHpJr3zJJPxDc3c6UTAbsdVAua9TAyKN1ZefJRtamZD/k/
   AUBWjgklKGH1qhn02ItsdSKFQ2+r83EOtSUEnIfhDlX6VPmwYdBUjUYZA
   Q==;
X-CSE-ConnectionGUID: cejEApYJTeCLLyXsXGKdjg==
X-CSE-MsgGUID: sR3at3IHSXes/oY9Z+K84w==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="77907874"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="77907874"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 04:48:55 -0700
X-CSE-ConnectionGUID: peQdw1WCSf2ziAHKeBWNOQ==
X-CSE-MsgGUID: gtJYz5ZrR6eF/9YGh5G/XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="174525700"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2025 04:48:54 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyUB1-0000EF-2V;
	Tue, 16 Sep 2025 11:48:51 +0000
Date: Tue, 16 Sep 2025 19:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-6.16 13/61] lib/test_dynamic_debug.c:63:25: error:
 variable has incomplete type 'struct _ddebug_class_map'
Message-ID: <202509161935.vY7w7TDf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix-6.16
head:   0ceda2081f53d69e686e8f91742c1491b9a68f99
commit: e27e2bfaccfdaa4a0a5b9571197ff5bfffe63870 [13/61] dyndbg: DECLARE_DYNDBG_CLASSMAP needs stub defn
config: i386-randconfig-141-20250914 (https://download.01.org/0day-ci/archive/20250916/202509161935.vY7w7TDf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161935.vY7w7TDf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509161935.vY7w7TDf-lkp@intel.com/

Note: the jimc/dd-drm-fix-6.16 HEAD 0ceda2081f53d69e686e8f91742c1491b9a68f99 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> lib/test_dynamic_debug.c:63:25: error: variable has incomplete type 'struct _ddebug_class_map'
      63 | DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
         |                         ^
   lib/test_dynamic_debug.c:63:1: note: forward declaration of 'struct _ddebug_class_map'
      63 | DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
         | ^
   include/linux/dynamic_debug.h:127:16: note: expanded from macro 'DECLARE_DYNDBG_CLASSMAP'
     127 |         static struct _ddebug_class_map __aligned(8) __used             \
         |                       ^
   lib/test_dynamic_debug.c:79:25: error: variable has incomplete type 'struct _ddebug_class_map'
      79 | DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
         |                         ^
   lib/test_dynamic_debug.c:63:1: note: forward declaration of 'struct _ddebug_class_map'
      63 | DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
         | ^
   include/linux/dynamic_debug.h:127:16: note: expanded from macro 'DECLARE_DYNDBG_CLASSMAP'
     127 |         static struct _ddebug_class_map __aligned(8) __used             \
         |                       ^
   lib/test_dynamic_debug.c:86:25: error: variable has incomplete type 'struct _ddebug_class_map'
      86 | DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
         |                         ^
   lib/test_dynamic_debug.c:63:1: note: forward declaration of 'struct _ddebug_class_map'
      63 | DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
         | ^
   include/linux/dynamic_debug.h:127:16: note: expanded from macro 'DECLARE_DYNDBG_CLASSMAP'
     127 |         static struct _ddebug_class_map __aligned(8) __used             \
         |                       ^
   lib/test_dynamic_debug.c:93:25: error: variable has incomplete type 'struct _ddebug_class_map'
      93 | DECLARE_DYNDBG_CLASSMAP(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES, 22,
         |                         ^
   lib/test_dynamic_debug.c:63:1: note: forward declaration of 'struct _ddebug_class_map'
      63 | DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
         | ^
   include/linux/dynamic_debug.h:127:16: note: expanded from macro 'DECLARE_DYNDBG_CLASSMAP'
     127 |         static struct _ddebug_class_map __aligned(8) __used             \
         |                       ^
   4 errors generated.
--
>> drivers/gpu/drm/drm_crtc_helper.c:53:25: error: variable has incomplete type 'struct _ddebug_class_map'
      53 | DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
         |                         ^
   drivers/gpu/drm/drm_crtc_helper.c:53:1: note: forward declaration of 'struct _ddebug_class_map'
      53 | DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
         | ^
   include/linux/dynamic_debug.h:127:16: note: expanded from macro 'DECLARE_DYNDBG_CLASSMAP'
     127 |         static struct _ddebug_class_map __aligned(8) __used             \
         |                       ^
   1 error generated.
--
>> drivers/gpu/drm/display/drm_dp_helper.c:46:25: error: variable has incomplete type 'struct _ddebug_class_map'
      46 | DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
         |                         ^
   drivers/gpu/drm/display/drm_dp_helper.c:46:1: note: forward declaration of 'struct _ddebug_class_map'
      46 | DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
         | ^
   include/linux/dynamic_debug.h:127:16: note: expanded from macro 'DECLARE_DYNDBG_CLASSMAP'
     127 |         static struct _ddebug_class_map __aligned(8) __used             \
         |                       ^
   1 error generated.
--
>> drivers/gpu/drm/nouveau/nouveau_drm.c:77:25: error: variable has incomplete type 'struct _ddebug_class_map'
      77 | DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
         |                         ^
   drivers/gpu/drm/nouveau/nouveau_drm.c:77:1: note: forward declaration of 'struct _ddebug_class_map'
      77 | DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
         | ^
   include/linux/dynamic_debug.h:127:16: note: expanded from macro 'DECLARE_DYNDBG_CLASSMAP'
     127 |         static struct _ddebug_class_map __aligned(8) __used             \
         |                       ^
   1 error generated.


vim +63 lib/test_dynamic_debug.c

683263a5e075ac Jim Cromie 2022-09-04  31  
6ea3bf466ac6ad Jim Cromie 2022-09-04  32  /*
6ea3bf466ac6ad Jim Cromie 2022-09-04  33   * Using the CLASSMAP api:
6ea3bf466ac6ad Jim Cromie 2022-09-04  34   * - classmaps must have corresponding enum
6ea3bf466ac6ad Jim Cromie 2022-09-04  35   * - enum symbols must match/correlate with class-name strings in the map.
6ea3bf466ac6ad Jim Cromie 2022-09-04  36   * - base must equal enum's 1st value
6ea3bf466ac6ad Jim Cromie 2022-09-04  37   * - multiple maps must set their base to share the 0-30 class_id space !!
6ea3bf466ac6ad Jim Cromie 2022-09-04  38   *   (build-bug-on tips welcome)
6ea3bf466ac6ad Jim Cromie 2022-09-04  39   * Additionally, here:
6ea3bf466ac6ad Jim Cromie 2022-09-04  40   * - tie together sysname, mapname, bitsname, flagsname
6ea3bf466ac6ad Jim Cromie 2022-09-04  41   */
6ea3bf466ac6ad Jim Cromie 2022-09-04  42  #define DD_SYS_WRAP(_model, _flags)					\
6ea3bf466ac6ad Jim Cromie 2022-09-04  43  	static unsigned long bits_##_model;				\
6ea3bf466ac6ad Jim Cromie 2022-09-04  44  	static struct ddebug_class_param _flags##_model = {		\
6ea3bf466ac6ad Jim Cromie 2022-09-04  45  		.bits = &bits_##_model,					\
6ea3bf466ac6ad Jim Cromie 2022-09-04  46  		.flags = #_flags,					\
6ea3bf466ac6ad Jim Cromie 2022-09-04  47  		.map = &map_##_model,					\
6ea3bf466ac6ad Jim Cromie 2022-09-04  48  	};								\
6ea3bf466ac6ad Jim Cromie 2022-09-04  49  	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes, &_flags##_model, 0600)
6ea3bf466ac6ad Jim Cromie 2022-09-04  50  
6ea3bf466ac6ad Jim Cromie 2022-09-04  51  /* numeric input, independent bits */
6ea3bf466ac6ad Jim Cromie 2022-09-04  52  enum cat_disjoint_bits {
6ea3bf466ac6ad Jim Cromie 2022-09-04  53  	D2_CORE = 0,
6ea3bf466ac6ad Jim Cromie 2022-09-04  54  	D2_DRIVER,
6ea3bf466ac6ad Jim Cromie 2022-09-04  55  	D2_KMS,
6ea3bf466ac6ad Jim Cromie 2022-09-04  56  	D2_PRIME,
6ea3bf466ac6ad Jim Cromie 2022-09-04  57  	D2_ATOMIC,
6ea3bf466ac6ad Jim Cromie 2022-09-04  58  	D2_VBL,
6ea3bf466ac6ad Jim Cromie 2022-09-04  59  	D2_STATE,
6ea3bf466ac6ad Jim Cromie 2022-09-04  60  	D2_LEASE,
6ea3bf466ac6ad Jim Cromie 2022-09-04  61  	D2_DP,
6ea3bf466ac6ad Jim Cromie 2022-09-04  62  	D2_DRMRES };
6ea3bf466ac6ad Jim Cromie 2022-09-04 @63  DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
6ea3bf466ac6ad Jim Cromie 2022-09-04  64  			"D2_CORE",
6ea3bf466ac6ad Jim Cromie 2022-09-04  65  			"D2_DRIVER",
6ea3bf466ac6ad Jim Cromie 2022-09-04  66  			"D2_KMS",
6ea3bf466ac6ad Jim Cromie 2022-09-04  67  			"D2_PRIME",
6ea3bf466ac6ad Jim Cromie 2022-09-04  68  			"D2_ATOMIC",
6ea3bf466ac6ad Jim Cromie 2022-09-04  69  			"D2_VBL",
6ea3bf466ac6ad Jim Cromie 2022-09-04  70  			"D2_STATE",
6ea3bf466ac6ad Jim Cromie 2022-09-04  71  			"D2_LEASE",
6ea3bf466ac6ad Jim Cromie 2022-09-04  72  			"D2_DP",
6ea3bf466ac6ad Jim Cromie 2022-09-04  73  			"D2_DRMRES");
6ea3bf466ac6ad Jim Cromie 2022-09-04  74  DD_SYS_WRAP(disjoint_bits, p);
6ea3bf466ac6ad Jim Cromie 2022-09-04  75  DD_SYS_WRAP(disjoint_bits, T);
6ea3bf466ac6ad Jim Cromie 2022-09-04  76  

:::::: The code at line 63 was first introduced by commit
:::::: 6ea3bf466ac6ad6c0ee1ad4e80d77d62e5e11c7a dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
