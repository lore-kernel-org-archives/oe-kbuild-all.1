Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D3320B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Apr 2025 00:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743899300; cv=none; b=V9NExX8P4TEHh+C1XoPKzzJxI4Csv6bdEOCxizy7wprcAKrdKeEZOLliKuJ+ApYPg3JR4gDVeMyoufBTqGDsqNvXV07OqIZ9DtSM5G1PmFAqp5JzKNMQPvH0tybRWeohgrjk/0tFB+Hoa/8tt5LSmuUNAbAK/+GEIl+d+LV3BZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743899300; c=relaxed/simple;
	bh=mopvcbNI1a8joWNOY1qSMthWm2DzZWZHWekZQ4rwtXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J+GXUizUQem+RU7IwhmhDMow/m7YEtwh7ANBa8IifOgW4wRSf5zC8UDLsgUqXTKY789UHBRHvwf+CgyX0g40Fr4Cpl9P4HFAO+SXTOdHe1gjtDMlwFikQrxKCZwlir/i6fvPv6STmV0Fxqg0agb9XenT3Bx/TZNlnukbq1pj0og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mU235RFv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mU235RFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743899298; x=1775435298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mopvcbNI1a8joWNOY1qSMthWm2DzZWZHWekZQ4rwtXA=;
  b=mU235RFv/rH47xiIUSIslNTeLO/FILl1SC1AbwmSQqwiVJZpyEoBScHx
   cJH/hUdvtSeM7DbDQExWNDwu9HnCSj7qzjP5MljQlpeecOqlUabMlpa2z
   m2Sy037Sil5XpXWtr46dIAEl6Fl7D6TgIeu8SvQZh591NCfOouvylbCKH
   ubzAWdkIF/JccyB3TYhF1vPBLUXlVM4qeCg59NlbED/cV0VxHQz03R0N1
   Z5D7IFMunbhArGD8pp92j+a+jwxSY+H0rDAgSSNezqjKaQ6F67XxE5MBN
   bPDjB0v0hwCfXvsIG9SWdtb//r+4X9e+Fhp9IW8cz5ObP98eAQ5OH7FtF
   g==;
X-CSE-ConnectionGUID: NTgTDyMzTouU4n4tT7m1ig==
X-CSE-MsgGUID: cSTwn8EES5uVPwbO9XNzgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="49159273"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="49159273"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 17:28:16 -0700
X-CSE-ConnectionGUID: 6Ng/P4/lTkGz7G0fiiH2Dw==
X-CSE-MsgGUID: 6kuFbv2iQgKR/Ez4cFnxFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="127578363"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Apr 2025 17:28:15 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1Drw-0002Mt-0j;
	Sun, 06 Apr 2025 00:28:12 +0000
Date: Sun, 6 Apr 2025 08:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2]
 drivers/auxdisplay/panel.c:1454:2: error: call to __compiletime_assert_700
 declared with 'error' attribute: BUILD_BUG_ON failed:
 !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
Message-ID: <202504060814.J5SM4wPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   549cfab57c29bdb8f5df3031ef883e23c1fd7a40
commit: a86094680a0955eab79b0cf74b6ed4f65848c4fa [2/2] UPSTREAM: alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
config: arm64-randconfig-r062-20250405 (https://download.01.org/0day-ci/archive/20250406/202504060814.J5SM4wPU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060814.J5SM4wPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504060814.J5SM4wPU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/auxdisplay/panel.c:1454:2: error: call to __compiletime_assert_700 declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
           strtomem_pad(key->u.kbd.release_str, release, '\0');
           ^
   include/linux/string.h:418:2: note: expanded from macro 'strtomem_pad'
           BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||                \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:524:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:517:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:179:1: note: expanded from here
   __compiletime_assert_700
   ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]


vim +/error +1454 drivers/auxdisplay/panel.c

7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1426  
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1427  /* tries to bind a key to the signal name <name>. The key will send the
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1428   * strings <press>, <repeat>, <release> for these respective events.
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1429   * Returns the pointer to the new key if ok, NULL if the key could not be bound.
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1430   */
36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              2013-02-15  1431  static struct logical_input *panel_bind_key(const char *name, const char *press,
36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              2013-02-15  1432  					    const char *repeat,
36d2041a3d57b9 drivers/staging/panel/panel.c Peter Huewe              2013-02-15  1433  					    const char *release)
698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            2008-11-22  1434  {
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1435  	struct logical_input *key;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1436  
fdf4a4948ca8a1 drivers/staging/panel/panel.c Dominique van den Broeck 2014-05-21  1437  	key = kzalloc(sizeof(*key), GFP_KERNEL);
eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane          2012-07-12  1438  	if (!key)
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1439  		return NULL;
eb073a9bf2b6ed drivers/staging/panel/panel.c Toshiaki Yamane          2012-07-12  1440  
698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            2008-11-22  1441  	if (!input_name2mask(name, &key->mask, &key->value, &scan_mask_i,
cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          2010-07-12  1442  			     &scan_mask_o)) {
cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          2010-07-12  1443  		kfree(key);
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1444  		return NULL;
cb46f472cbb08c drivers/staging/panel/panel.c Kulikov Vasiliy          2010-07-12  1445  	}
698b1515f03914 drivers/staging/panel/panel.c Willy Tarreau            2008-11-22  1446  
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1447  	key->type = INPUT_TYPE_KBD;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1448  	key->state = INPUT_ST_LOW;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1449  	key->rise_time = 1;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1450  	key->fall_time = 1;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1451  
a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             2023-09-11  1452  	strtomem_pad(key->u.kbd.press_str, press, '\0');
a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             2023-09-11  1453  	strtomem_pad(key->u.kbd.repeat_str, repeat, '\0');
a952abcdaa2211 drivers/auxdisplay/panel.c    Justin Stitt             2023-09-11 @1454  	strtomem_pad(key->u.kbd.release_str, release, '\0');
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1455  	list_add(&key->list, &logical_inputs);
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1456  	return key;
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1457  }
7005b58458e4be drivers/staging/panel/panel.c Willy Tarreau            2008-11-13  1458  

:::::: The code at line 1454 was first introduced by commit
:::::: a952abcdaa22116d940ca9cb9253caad1622ae93 auxdisplay: panel: Replace deprecated strncpy() with strtomem_pad()

:::::: TO: Justin Stitt <justinstitt@google.com>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
