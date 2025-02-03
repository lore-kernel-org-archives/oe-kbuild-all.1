Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59D220409A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 12:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584202; cv=none; b=qraF130DI13Q+0rLVHK0Bce//JNBigNspyxTiZZxUUb3DNzfsTsazBGFKqOzuOIYJwW3wAuWeV2l+7lcZ+WoLWK57630GRIKfe3T5IsRLGbPTYL9+4BK5DBzVwcAL/Fz2+43zqlVhy9NSvR158X/qjzXu+1HuzDOkUhKZUSPtls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584202; c=relaxed/simple;
	bh=wtE4Y99gnW4fHzhPuBdbjU13ZehqXGpa3hMSB+rruTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=shZh0JbaN6F2R8Iv6Y1qLgSomhd4MVnDPbcrROtZyXAg+heB15qE2xk5pk88xxoJMs5eObqf2zdNl3iHoIuCt3fjmwEyFFtWwV4JM17HIlzJm8BIa/OEdJEavCzG+RvusSHNICx2RAKK/G/Fl+4vH7R7SjZFR8+aUTuQz1gFDfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYz154B1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYz154B1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738584200; x=1770120200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wtE4Y99gnW4fHzhPuBdbjU13ZehqXGpa3hMSB+rruTo=;
  b=EYz154B1zpyTgBFR8DJo+GMH2gpw1+nUX6pCb7a/ikTDoHx2IOAu5//H
   s66mMivBJPVAdWNOHC2osLQceke+FZ46UVndDliaP4KMr5HO8NMKLfLWb
   +LKHqiHoo4oWuDrmxgLHKC2c97S5RSFY4wVs1PV5oo5yVhNLma84WXZRe
   ICX9e8IM7Rru4Iq6Gxitxu2nSpPCQ1rv5D2qghtnSfkKzQx4J25BDXLOg
   VdmXwg6994kwe289oGsn3I+AdNmHlnj96e4Et1qld9q3jx1Bj6v0jm4o7
   nVxqnDXP8hgx1K+ftd9mKrZogNC6fotW8siY8wpvk/drGE1GuDiKn4hmp
   A==;
X-CSE-ConnectionGUID: Q+mwNclETPig+vf6liHzTw==
X-CSE-MsgGUID: nyPbucJyQ2GPUXdpnr3i1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39175438"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39175438"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:03:17 -0800
X-CSE-ConnectionGUID: pWmTZwl5QGGengYPQ+DBLg==
X-CSE-MsgGUID: gTJhLSe2QTuAEpp4RpDF0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110025367"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 04:03:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tevAX-000qsz-1H;
	Mon, 03 Feb 2025 12:03:13 +0000
Date: Mon, 3 Feb 2025 20:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Ping-Ke Shih <pkshih@realtek.com>
Subject: [pkshih-rtw:rtw-next 14/30] include/linux/bitmap.h:736:33: warning:
 excess elements in array initializer
Message-ID: <202502031932.BMQ4lhJT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/pkshih/rtw rtw-next
head:   3d3e28feca7ac8c6cf2a390dbbe1f97e3feb7f36
commit: 79a36fc56beaeac31cb9b0ca10618b88f4ac31c8 [14/30] wifi: rtw89: regd: handle supported regulatory functions by country
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250203/202502031932.BMQ4lhJT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031932.BMQ4lhJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031932.BMQ4lhJT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/dmi.h:6,
                    from drivers/net/wireless/realtek/rtw89/core.h:10,
                    from drivers/net/wireless/realtek/rtw89/acpi.h:8,
                    from drivers/net/wireless/realtek/rtw89/regd.c:5:
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:20:9: note: in expansion of macro 'COUNTRY_REGD'
      20 |         COUNTRY_REGD("00", RTW89_WW, RTW89_WW, RTW89_WW, 0x0);
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_ww_regd.func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:20:9: note: in expansion of macro 'COUNTRY_REGD'
      20 |         COUNTRY_REGD("00", RTW89_WW, RTW89_WW, RTW89_WW, 0x0);
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:23:9: note: in expansion of macro 'COUNTRY_REGD'
      23 |         COUNTRY_REGD("AR", RTW89_MEXICO, RTW89_MEXICO, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[0].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:23:9: note: in expansion of macro 'COUNTRY_REGD'
      23 |         COUNTRY_REGD("AR", RTW89_MEXICO, RTW89_MEXICO, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:24:9: note: in expansion of macro 'COUNTRY_REGD'
      24 |         COUNTRY_REGD("BO", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[1].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:24:9: note: in expansion of macro 'COUNTRY_REGD'
      24 |         COUNTRY_REGD("BO", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:25:9: note: in expansion of macro 'COUNTRY_REGD'
      25 |         COUNTRY_REGD("BR", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[2].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:25:9: note: in expansion of macro 'COUNTRY_REGD'
      25 |         COUNTRY_REGD("BR", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:26:9: note: in expansion of macro 'COUNTRY_REGD'
      26 |         COUNTRY_REGD("CL", RTW89_CHILE, RTW89_CHILE, RTW89_CHILE, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[3].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:26:9: note: in expansion of macro 'COUNTRY_REGD'
      26 |         COUNTRY_REGD("CL", RTW89_CHILE, RTW89_CHILE, RTW89_CHILE, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:27:9: note: in expansion of macro 'COUNTRY_REGD'
      27 |         COUNTRY_REGD("CO", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[4].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:27:9: note: in expansion of macro 'COUNTRY_REGD'
      27 |         COUNTRY_REGD("CO", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:28:9: note: in expansion of macro 'COUNTRY_REGD'
      28 |         COUNTRY_REGD("CR", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[5].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:28:9: note: in expansion of macro 'COUNTRY_REGD'
      28 |         COUNTRY_REGD("CR", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:29:9: note: in expansion of macro 'COUNTRY_REGD'
      29 |         COUNTRY_REGD("EC", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[6].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:29:9: note: in expansion of macro 'COUNTRY_REGD'
      29 |         COUNTRY_REGD("EC", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:30:9: note: in expansion of macro 'COUNTRY_REGD'
      30 |         COUNTRY_REGD("SV", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[7].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:30:9: note: in expansion of macro 'COUNTRY_REGD'
      30 |         COUNTRY_REGD("SV", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:31:9: note: in expansion of macro 'COUNTRY_REGD'
      31 |         COUNTRY_REGD("GT", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[8].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:31:9: note: in expansion of macro 'COUNTRY_REGD'
      31 |         COUNTRY_REGD("GT", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:32:9: note: in expansion of macro 'COUNTRY_REGD'
      32 |         COUNTRY_REGD("HN", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[9].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:32:9: note: in expansion of macro 'COUNTRY_REGD'
      32 |         COUNTRY_REGD("HN", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:33:9: note: in expansion of macro 'COUNTRY_REGD'
      33 |         COUNTRY_REGD("MX", RTW89_MEXICO, RTW89_MEXICO, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[10].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:33:9: note: in expansion of macro 'COUNTRY_REGD'
      33 |         COUNTRY_REGD("MX", RTW89_MEXICO, RTW89_MEXICO, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:34:9: note: in expansion of macro 'COUNTRY_REGD'
      34 |         COUNTRY_REGD("NI", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[11].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:34:9: note: in expansion of macro 'COUNTRY_REGD'
      34 |         COUNTRY_REGD("NI", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:35:9: note: in expansion of macro 'COUNTRY_REGD'
      35 |         COUNTRY_REGD("PA", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[12].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:35:9: note: in expansion of macro 'COUNTRY_REGD'
      35 |         COUNTRY_REGD("PA", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:36:9: note: in expansion of macro 'COUNTRY_REGD'
      36 |         COUNTRY_REGD("PY", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[13].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:36:9: note: in expansion of macro 'COUNTRY_REGD'
      36 |         COUNTRY_REGD("PY", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:37:9: note: in expansion of macro 'COUNTRY_REGD'
      37 |         COUNTRY_REGD("PE", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[14].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:37:9: note: in expansion of macro 'COUNTRY_REGD'
      37 |         COUNTRY_REGD("PE", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:38:9: note: in expansion of macro 'COUNTRY_REGD'
      38 |         COUNTRY_REGD("US", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x1),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[15].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:38:9: note: in expansion of macro 'COUNTRY_REGD'
      38 |         COUNTRY_REGD("US", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x1),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:39:9: note: in expansion of macro 'COUNTRY_REGD'
      39 |         COUNTRY_REGD("UY", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[16].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:39:9: note: in expansion of macro 'COUNTRY_REGD'
      39 |         COUNTRY_REGD("UY", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:40:9: note: in expansion of macro 'COUNTRY_REGD'
      40 |         COUNTRY_REGD("VE", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[17].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:40:9: note: in expansion of macro 'COUNTRY_REGD'
      40 |         COUNTRY_REGD("VE", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
>> include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:41:9: note: in expansion of macro 'COUNTRY_REGD'
      41 |         COUNTRY_REGD("PR", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[18].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:41:9: note: in expansion of macro 'COUNTRY_REGD'
      41 |         COUNTRY_REGD("PR", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:42:9: note: in expansion of macro 'COUNTRY_REGD'
      42 |         COUNTRY_REGD("DO", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[19].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:42:9: note: in expansion of macro 'COUNTRY_REGD'
      42 |         COUNTRY_REGD("DO", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:43:9: note: in expansion of macro 'COUNTRY_REGD'
      43 |         COUNTRY_REGD("AT", RTW89_ETSI, RTW89_ETSI, RTW89_ETSI, 0x2),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[20].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:43:9: note: in expansion of macro 'COUNTRY_REGD'
      43 |         COUNTRY_REGD("AT", RTW89_ETSI, RTW89_ETSI, RTW89_ETSI, 0x2),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:44:9: note: in expansion of macro 'COUNTRY_REGD'
      44 |         COUNTRY_REGD("BE", RTW89_ETSI, RTW89_ETSI, RTW89_ETSI, 0x2),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[21].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:44:9: note: in expansion of macro 'COUNTRY_REGD'
      44 |         COUNTRY_REGD("BE", RTW89_ETSI, RTW89_ETSI, RTW89_ETSI, 0x2),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:45:9: note: in expansion of macro 'COUNTRY_REGD'
      45 |         COUNTRY_REGD("CY", RTW89_ETSI, RTW89_ETSI, RTW89_ETSI, 0x2),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[22].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:45:9: note: in expansion of macro 'COUNTRY_REGD'
      45 |         COUNTRY_REGD("CY", RTW89_ETSI, RTW89_ETSI, RTW89_ETSI, 0x2),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: warning: excess elements in array initializer
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^
   drivers/net/wireless/realtek/rtw89/regd.c:16:34: note: in expansion of macro 'BITMAP_FROM_U64'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:46:9: note: in expansion of macro 'COUNTRY_REGD'
      46 |         COUNTRY_REGD("CZ", RTW89_ETSI, RTW89_ETSI, RTW89_ETSI, 0x2),
         |         ^~~~~~~~~~~~
   include/linux/bitmap.h:736:33: note: (near initialization for 'rtw89_regd_map[23].func_bitmap')
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
..


vim +736 include/linux/bitmap.h

6cb42f91aa6dfd Yury Norov   2023-09-24  705  
404376af788a76 Randy Dunlap 2017-09-17  706  /**
60ef690018b262 Yury Norov   2017-09-08  707   * BITMAP_FROM_U64() - Represent u64 value in the format suitable for bitmap.
404376af788a76 Randy Dunlap 2017-09-17  708   * @n: u64 value
60ef690018b262 Yury Norov   2017-09-08  709   *
60ef690018b262 Yury Norov   2017-09-08  710   * Linux bitmaps are internally arrays of unsigned longs, i.e. 32-bit
60ef690018b262 Yury Norov   2017-09-08  711   * integers in 32-bit environment, and 64-bit integers in 64-bit one.
60ef690018b262 Yury Norov   2017-09-08  712   *
60ef690018b262 Yury Norov   2017-09-08  713   * There are four combinations of endianness and length of the word in linux
60ef690018b262 Yury Norov   2017-09-08  714   * ABIs: LE64, BE64, LE32 and BE32.
60ef690018b262 Yury Norov   2017-09-08  715   *
60ef690018b262 Yury Norov   2017-09-08  716   * On 64-bit kernels 64-bit LE and BE numbers are naturally ordered in
60ef690018b262 Yury Norov   2017-09-08  717   * bitmaps and therefore don't require any special handling.
60ef690018b262 Yury Norov   2017-09-08  718   *
60ef690018b262 Yury Norov   2017-09-08  719   * On 32-bit kernels 32-bit LE ABI orders lo word of 64-bit number in memory
60ef690018b262 Yury Norov   2017-09-08  720   * prior to hi, and 32-bit BE orders hi word prior to lo. The bitmap on the
60ef690018b262 Yury Norov   2017-09-08  721   * other hand is represented as an array of 32-bit words and the position of
60ef690018b262 Yury Norov   2017-09-08  722   * bit N may therefore be calculated as: word #(N/32) and bit #(N%32) in that
60ef690018b262 Yury Norov   2017-09-08  723   * word.  For example, bit #42 is located at 10th position of 2nd word.
60ef690018b262 Yury Norov   2017-09-08  724   * It matches 32-bit LE ABI, and we can simply let the compiler store 64-bit
60ef690018b262 Yury Norov   2017-09-08  725   * values in memory as it usually does. But for BE we need to swap hi and lo
60ef690018b262 Yury Norov   2017-09-08  726   * words manually.
60ef690018b262 Yury Norov   2017-09-08  727   *
60ef690018b262 Yury Norov   2017-09-08  728   * With all that, the macro BITMAP_FROM_U64() does explicit reordering of hi and
60ef690018b262 Yury Norov   2017-09-08  729   * lo parts of u64.  For LE32 it does nothing, and for BE environment it swaps
60ef690018b262 Yury Norov   2017-09-08  730   * hi and lo words, as is expected by bitmap.
60ef690018b262 Yury Norov   2017-09-08  731   */
60ef690018b262 Yury Norov   2017-09-08  732  #if __BITS_PER_LONG == 64
60ef690018b262 Yury Norov   2017-09-08  733  #define BITMAP_FROM_U64(n) (n)
60ef690018b262 Yury Norov   2017-09-08  734  #else
60ef690018b262 Yury Norov   2017-09-08  735  #define BITMAP_FROM_U64(n) ((unsigned long) ((u64)(n) & ULONG_MAX)), \
60ef690018b262 Yury Norov   2017-09-08 @736  				((unsigned long) ((u64)(n) >> 32))
60ef690018b262 Yury Norov   2017-09-08  737  #endif
60ef690018b262 Yury Norov   2017-09-08  738  

:::::: The code at line 736 was first introduced by commit
:::::: 60ef690018b262ddcd0d51edf10e40710deb9c9f bitmap: introduce BITMAP_FROM_U64()

:::::: TO: Yury Norov <ynorov@caviumnetworks.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
