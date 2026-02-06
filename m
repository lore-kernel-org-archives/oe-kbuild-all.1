Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFCD36E484
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 10:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375121; cv=none; b=Q1uogBJUYuaFlvHUnjDqDxMRMco9ER8oheFQ50k1GNlEUDaERgqt1o/wUNrEzru32g/1dfSxCUXy6UmgJ4S7zMisq24kghCKx/FMr1ECgUP2vlZnHiPFHMl3lloByCln34c0jt/eOitKhmjnC188oDRJZKl2b1SYSdVXwJ0ivks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375121; c=relaxed/simple;
	bh=HYpjMG2Yqcy7siqf670QtImQKdhzUEf5CDlkr90hpq8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oSpNYuwcln1RyoOYKTryn15gpnm4a9Hd4JdHWajiSsQJeyquO7L4Xxw1sL1I3dJgcefLZFa4McF3ikJyC5aMTi5DT7APDnReoGzP/F/4Fv5We22C38ASwaj9JCjEC62uY6hHlWD7+LPQraiyai3baMcMedzPpvCgdWMu9U3waT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mftTE0eK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mftTE0eK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770375120; x=1801911120;
  h=date:from:to:cc:subject:message-id;
  bh=HYpjMG2Yqcy7siqf670QtImQKdhzUEf5CDlkr90hpq8=;
  b=mftTE0eK6zgemQxb5lHYfCMGdHC3cv6I1zkFPIUSPZ870Ua9j1BQ5GHf
   AgRX5uHvOcprmL0FgFwqmO9DwZKz4f1jvhJ1AaB/486vjLG3+LalpJZe0
   YRV1EPcsolIk/Ml3BzaeSNK4uY3jXc/e1qi3BulQNCslVo+J+TaPwreQm
   dag1JyhtqeD16zEHrlcEY829dN+vKBkWTdWFqoc/cdHbTA/m12WRn4csG
   59FiLFxbnboH8PmO0x3ySPTend46gDrmH1EzXkVFLP1TRB7EDIvMJeALa
   SOiZGpxBlLryVeTcVzXjQ69J6umVhJ7aebpnNbc4HCOOgaaKCjISz1sOb
   A==;
X-CSE-ConnectionGUID: iezbUVAvQ/WAONAbKaYViQ==
X-CSE-MsgGUID: RgYliry1SDyjbIvPk3F7Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="97037011"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="97037011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 02:51:56 -0800
X-CSE-ConnectionGUID: 5cV+jwE9RU+aOSnADDXhVg==
X-CSE-MsgGUID: r6TUqyOoRia7CmyFEMQb9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="210194368"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Feb 2026 02:51:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voJRH-00000000kfg-4Bkz;
	Fri, 06 Feb 2026 10:51:51 +0000
Date: Fri, 06 Feb 2026 18:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2]
 crypto/fips140-generated-testvecs.h:14:47: warning: initializer-string for
 character array is too long, array size is 16 but initializer has size 17
 (including the null terminating character); did you mean to use the
 'nonstring' attribute?
Message-ID: <202602061808.LDJjQX9n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   c9e2710a7bd01bbb73280dfe37937d5b6e24eb0b
commit: c6d5a767217ce93403528e99f1a1eb401a26eeb3 [2/2] ANDROID: fips140: add kernel crypto module
config: arm64-randconfig-r112-20260206 (https://download.01.org/0day-ci/archive/20260206/202602061808.LDJjQX9n-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061808.LDJjQX9n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061808.LDJjQX9n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from crypto/fips140-selftests.c:550:
>> crypto/fips140-generated-testvecs.h:14:47: warning: initializer-string for character array is too long, array size is 16 but initializer has size 17 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      14 | static const u8 fips_aes_iv[16] __initconst = "ABCDEFGHIJKLMNOP";
         |                                               ^~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:17:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      17 |         "\x4c\x3e\xeb\x38\x8d\x1f\x28\xfd\xa2\x3b\xa9\xda\x36\xf2\x99\xe2"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      18 |         "\x84\x84\x66\x37\x0a\x53\x68\x2f\x17\x95\x8d\x7f\xca\x5a\x68\x4e";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:21:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      21 |         "\xc1\x9d\xe6\xb8\xb2\x90\xff\xfe\xf2\x77\x18\xb0\x55\xd3\xee\xa9"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |         "\xe2\x6f\x4a\x32\x67\xfd\xb7\xa5\x2f\x4b\x6e\x1a\x86\x2b\x6e\x3a";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:25:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      25 |         "\xed\x06\x2c\xd0\xbc\x48\xd1\x2e\x6a\x4e\x13\xe9\xaa\x17\x40\xca"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      26 |         "\x00\xb4\xaf\x3b\x4f\xee\x73\xd6\x6c\x41\xf6\x4c\x8b\x0d\x6a\x0f";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:28:54: warning: initializer-string for character array is too long, array size is 22 but initializer has size 23 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      28 | static const u8 fips_aes_gcm_assoc[22] __initconst = "associated data string";
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:31:2: warning: initializer-string for character array is too long, array size is 48 but initializer has size 49 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      31 |         "\x37\x88\x3e\x1d\x58\x50\xda\x10\x07\xeb\x52\xdf\xea\x0a\x54\xd4"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      32 |         "\x44\xbf\x88\x2a\xf3\x03\x03\x84\xaf\x8b\x96\xbd\xea\x65\x60\x6f"
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      33 |         "\x82\xfa\x51\xf4\x28\xad\x0c\xf1\xce\x0f\x91\xdd\x1a\x4c\x77\x5f";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:39:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      39 |         "\x4f\xf7\x9f\x6c\x00\xa8\x30\xdf\xff\xf3\x25\x9c\xf6\x0b\x1b\xfd"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |         "\x3b\x34\x5e\x67\x7c\xf8\x8b\x68\x9a\xb9\x5a\x89\x51\x51\xbd\x35";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:43:2: warning: initializer-string for character array is too long, array size is 16 but initializer has size 17 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      43 |         "\x0c\x05\xda\x64\x51\x0c\x8e\x6c\x86\x52\x46\xa8\x2d\xb1\xfe\x0f";
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:45:49: warning: initializer-string for character array is too long, array size is 16 but initializer has size 17 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      45 | static const u8 fips_hmac_key[16] __initconst = "128-bit HMAC key";
         |                                                 ^~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:48:2: warning: initializer-string for character array is too long, array size is 20 but initializer has size 21 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      48 |         "\x1b\x78\xc7\x4b\xd5\xd4\x83\xb1\x58\xc5\x96\x83\x4f\x16\x8d\x15"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |         "\xb4\xaa\x22\x8c";
         |         ~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:52:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      52 |         "\x4e\x11\x83\x0c\x53\x80\x1e\x5f\x9b\x38\x33\x38\xe8\x74\x43\xb0"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      53 |         "\xc1\x3a\xbe\xbf\x75\xf0\x12\x0f\x21\x33\xf5\x16\x33\xf1\xb0\x81";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:56:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      56 |         "\x63\x0e\xb5\x73\x79\xfc\xaf\x5f\x86\xe3\xaf\xf0\xc8\x36\xef\xd5"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      57 |         "\x35\x8d\x40\x25\x38\xb3\x65\x72\x98\xf3\x59\xd8\x1e\x54\x4c\xa1";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/fips140-generated-testvecs.h:60:2: warning: initializer-string for character array is too long, array size is 64 but initializer has size 65 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      60 |         "\x32\xe0\x44\x23\xbd\xe3\xec\x28\xbf\xf1\x34\x11\xd5\xae\xbf\xd5"
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      61 |         "\xc0\x8e\xb5\xa1\x04\xef\x2f\x07\x84\xf1\xd9\x83\x0f\x6c\x31\xab"
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      62 |         "\xf7\xe7\x57\xfa\xf7\xae\xf0\x6f\xb2\x16\x08\x32\xcf\xc7\xef\x35"
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      63 |         "\xb3\x3b\x51\xb9\xfd\xe7\xff\x5e\xb2\x8b\xc6\x79\xe6\x14\x04\xb4";
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   14 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +/nonstring +14 crypto/fips140-generated-testvecs.h

    13	
  > 14	static const u8 fips_aes_iv[16] __initconst = "ABCDEFGHIJKLMNOP";
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
