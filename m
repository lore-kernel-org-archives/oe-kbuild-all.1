Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7D364949
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 02:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779072077; cv=none; b=ANMgO+kSSRUQR204wajHZFnF+PobwYHgq7dBa+USE/SWqJ1NdG3HTXbn3Xpt6W8bGsLwfYTFgOmyT8EJf47XRJ3y3rg4610qDCu2fOv7XK3D5TP0f86/c9AFfIStVSqVag4HljhKJH353mKvs2AIzZAouyYqbZ4lLdgH5ywhhls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779072077; c=relaxed/simple;
	bh=0ZYmBwn+bbrJnFaHPQ+HM8A3jYnJ5G90ltyAMTAFtfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PCNJc69xdsrMQVEq91zjOqJ8W0njlRTFBdqarvBr8PchQ5o7V7ev1+nM5VLvtADrX6B7RG9soy8/wCGdeZzpLyxOuSd+oJZhESE4y97i2dNmj4dbfgkFC1C8my3GAJgHlj0UfNONMSw2Eu4UiWup3G0kbFV4UDSBruD/3mz5W/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bK42VvED; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bK42VvED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779072075; x=1810608075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ZYmBwn+bbrJnFaHPQ+HM8A3jYnJ5G90ltyAMTAFtfY=;
  b=bK42VvEDD/hrX4zEPhfkiyz65ghkWuzRSaskWXonRSlNxXJvPvGQjgyV
   8qJKCqT3RNcRZuxlcOR8NFnAGN7H1MtDHPsZAtrOvSLQQi3MieiJm4bNT
   rZ3DH3NyLx23tgpIBfEpWmvqdVeEhhZgAj350nZoQmgkT1MDNg/mvYaQk
   Uy180wl0LZfP9oLBgs9Eu+POvyDbLO565ARFDnVkbvZACnSRM+YdMnrHX
   XF/w2JJLcUFIVQzYz5H6pZgwLn9BJ79AUVzbuuuna/Mj85/OHHTO+4ZLp
   Jp8iXPeAs6ZVTCG7pMs3XQk0Nl9xjjgXaSPTjCF9S7S3Rlnx8FECjmiKW
   A==;
X-CSE-ConnectionGUID: 7OJ5PynuRAqmoleQUvruXA==
X-CSE-MsgGUID: QTXpzjdzS8SsU82yG/ouNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79951451"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79951451"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 19:41:15 -0700
X-CSE-ConnectionGUID: S9rZvIDJQyS6Bv3jDrq4AQ==
X-CSE-MsgGUID: M9enlaC9Ss2M1eEIODTi6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="243588284"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 May 2026 19:41:13 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOnuo-000000002GO-1Ebt;
	Mon, 18 May 2026 02:41:10 +0000
Date: Mon, 18 May 2026 10:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 39/52] drivers/gpu/drm/drm_print.c:72:34:
 error: variable has incomplete type 'struct ddebug_class_param'
Message-ID: <202605181047.p39H63eE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-shrink-go
head:   270053dc597e59c9ffc0b5f17c8863076b56c7cf
commit: 580adab5c59c094294a4326167b772a69257f466 [39/52] drm: mark DRM_USE_DYNAMIC_DEBUG unBROKEN
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260518/202605181047.p39H63eE-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605181047.p39H63eE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605181047.p39H63eE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_print.c:72:34: error: variable has incomplete type 'struct ddebug_class_param'
      72 | static struct ddebug_class_param drm_debug_bitmap = {
         |                                  ^
   drivers/gpu/drm/drm_print.c:72:15: note: forward declaration of 'struct ddebug_class_param'
      72 | static struct ddebug_class_param drm_debug_bitmap = {
         |               ^
   drivers/gpu/drm/drm_print.c:219:26: warning: unused variable 'category' [-Wunused-variable]
     219 |         enum drm_debug_category category = p->category;
         |                                 ^~~~~~~~
   1 warning and 1 error generated.


vim +72 drivers/gpu/drm/drm_print.c

f158936b60a7874 Jim Cromie  2022-09-11  55  
f158936b60a7874 Jim Cromie  2022-09-11  56  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
f158936b60a7874 Jim Cromie  2022-09-11  57  module_param_named(debug, __drm_debug, ulong, 0600);
f158936b60a7874 Jim Cromie  2022-09-11  58  #else
f158936b60a7874 Jim Cromie  2022-09-11  59  /* classnames must match vals of enum drm_debug_category */
f158936b60a7874 Jim Cromie  2022-09-11  60  DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
f158936b60a7874 Jim Cromie  2022-09-11  61  			"DRM_UT_CORE",
f158936b60a7874 Jim Cromie  2022-09-11  62  			"DRM_UT_DRIVER",
f158936b60a7874 Jim Cromie  2022-09-11  63  			"DRM_UT_KMS",
f158936b60a7874 Jim Cromie  2022-09-11  64  			"DRM_UT_PRIME",
f158936b60a7874 Jim Cromie  2022-09-11  65  			"DRM_UT_ATOMIC",
f158936b60a7874 Jim Cromie  2022-09-11  66  			"DRM_UT_VBL",
f158936b60a7874 Jim Cromie  2022-09-11  67  			"DRM_UT_STATE",
f158936b60a7874 Jim Cromie  2022-09-11  68  			"DRM_UT_LEASE",
f158936b60a7874 Jim Cromie  2022-09-11  69  			"DRM_UT_DP",
f158936b60a7874 Jim Cromie  2022-09-11  70  			"DRM_UT_DRMRES");
f158936b60a7874 Jim Cromie  2022-09-11  71  
f158936b60a7874 Jim Cromie  2022-09-11 @72  static struct ddebug_class_param drm_debug_bitmap = {
f158936b60a7874 Jim Cromie  2022-09-11  73  	.bits = &__drm_debug,
f158936b60a7874 Jim Cromie  2022-09-11  74  	.flags = "p",
f158936b60a7874 Jim Cromie  2022-09-11  75  	.map = &drm_debug_classes,
f158936b60a7874 Jim Cromie  2022-09-11  76  };
f158936b60a7874 Jim Cromie  2022-09-11  77  module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
f158936b60a7874 Jim Cromie  2022-09-11  78  #endif
959b077f26a16c6 Jani Nikula 2019-09-24  79  

:::::: The code at line 72 was first introduced by commit
:::::: f158936b60a7874f29cf8de8d83191ad69119c11 drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
