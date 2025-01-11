Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A5F189916
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736585552; cv=none; b=REA7n4fhKQRbwTiKWF3PQeF/U5OBu6h8DLqxTi3Rv2a8HTVSgVDzxREQb+ld3io62106MXB47IMLtFwJhk1SmtLxYDst9kVVYxmBlPQBqhVos9Zi2nowYuQFQqN71wzxUpeaqCq8PUkgczLexl8iEdrZyhwjZgICdtL9Erpfz4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736585552; c=relaxed/simple;
	bh=8N10EQFfGGTCVQQ3mco6DwzMcT9d+LY69SR7ujkHPro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKeyfqkvlF4Tef237ALPQWO7RQQ/xB58LToYads0rbytLsU1jo6b0HLJaKZtsP9a1vdATTJglHh3ZD/dYVIp/eA0wvtubHCNhwZKWiG4+lTGrPtoLTgTpkGqlzyqwBXBOebkmA+yYOXZs0Wp15YppjZWhsBdea0Y2BQDzM/H4Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDpD63AQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDpD63AQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736585551; x=1768121551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8N10EQFfGGTCVQQ3mco6DwzMcT9d+LY69SR7ujkHPro=;
  b=PDpD63AQuTWXRqC3b07GXC3zVPZxCBmO2Uj8+RKqBG4Ed382FB14wvfy
   ulHuSnbfUImaZIbJDs58/BQJsyba/GzYYU739wrvz30i+nvWNJl4ZI8Al
   Yn/pr5nR62CJFSxbOGYf262weCxU3hTIHYaTws8MqzcShYa1J9Jm8mq9o
   h7QrUqIGzqQUTZu9vE0MkMqdtddj09tvSyg1LJba8gflKupXqHK2L8Ir9
   DcEgzzCe11W4Hrn3DBR/raU1WDqgYpz1TMBR/X4+3QFZ+ZgcQiQGqTlu9
   Nj/Dr+HFn476+URJ2Cy1WIKyXcIwJ8ztQEQB1MuEZ8eJdr6g3D9OsBiFs
   w==;
X-CSE-ConnectionGUID: qwbuCV+PT++1QlQgyTBNXg==
X-CSE-MsgGUID: IR8/k0eASwKR+mbKSRBwzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="48297147"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="48297147"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 00:52:29 -0800
X-CSE-ConnectionGUID: dQkcDV2BSEe3QdFM38A2CA==
X-CSE-MsgGUID: gzgOw4fmSA2IEm+R+0aFwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104469505"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 00:52:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWXEA-000KPL-09;
	Sat, 11 Jan 2025 08:52:18 +0000
Date: Sat, 11 Jan 2025 16:52:14 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	David Miller <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH net-next 3/3] net: phy: realtek: add hwmon support for
 temp sensor on RTL822x
Message-ID: <202501111618.Lro85HiT-lkp@intel.com>
References: <dbfeb139-808f-4345-afe8-830b7f4da26a@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbfeb139-808f-4345-afe8-830b7f4da26a@gmail.com>

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/net-phy-realtek-add-support-for-reading-MDIO_MMD_VEND2-regs-on-RTL8125-RTL8126/20250110-195043
base:   net-next/main
patch link:    https://lore.kernel.org/r/dbfeb139-808f-4345-afe8-830b7f4da26a%40gmail.com
patch subject: [PATCH net-next 3/3] net: phy: realtek: add hwmon support for temp sensor on RTL822x
config: parisc-randconfig-r072-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111618.Lro85HiT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111618.Lro85HiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111618.Lro85HiT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/phy/realtek_hwmon.c:3:10: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'support'
       3 |  * HWMON support for Realtek PHY's
         |          ^~~~~~~
>> drivers/net/phy/realtek_hwmon.c:3:33: warning: missing terminating ' character
       3 |  * HWMON support for Realtek PHY's
         |                                 ^
>> drivers/net/phy/realtek_hwmon.c:3:33: error: missing terminating ' character
       3 |  * HWMON support for Realtek PHY's
         |                                 ^~
>> drivers/net/phy/realtek_hwmon.c:5:39: error: stray '@' in program
       5 |  * Author: Heiner Kallweit <hkallweit1@gmail.com>
         |                                       ^
   In file included from include/uapi/asm-generic/types.h:7,
                    from ./arch/parisc/include/generated/uapi/asm/types.h:1,
                    from include/linux/bitops.h:5,
                    from include/linux/hwmon.h:15,
                    from drivers/net/phy/realtek_hwmon.c:8:
>> include/asm-generic/int-ll64.h:16:9: error: unknown type name '__s8'; did you mean '__u8'?
      16 | typedef __s8  s8;
         |         ^~~~
         |         __u8
   In file included from include/linux/kernel.h:27,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/phy.h:15,
                    from drivers/net/phy/realtek_hwmon.c:9:
>> include/linux/math.h:112:9: error: unknown type name '__s8'; did you mean '__u8'?
     112 |         __##type numerator;                             \
         |         ^~
   include/linux/math.h:115:1: note: in expansion of macro '__STRUCT_FRACT'
     115 | __STRUCT_FRACT(s8)
         | ^~~~~~~~~~~~~~
   include/linux/math.h:113:9: error: unknown type name '__s8'; did you mean '__u8'?
     113 |         __##type denominator;                           \
         |         ^~
   include/linux/math.h:115:1: note: in expansion of macro '__STRUCT_FRACT'
     115 | __STRUCT_FRACT(s8)
         | ^~~~~~~~~~~~~~
   In file included from include/linux/quota.h:42,
                    from include/linux/fs.h:271,
                    from include/linux/compat.h:17,
                    from include/linux/ethtool.h:17,
                    from include/linux/phy.h:16:
>> include/uapi/linux/dqblk_xfs.h:54:9: error: unknown type name '__s8'; did you mean '__u8'?
      54 |         __s8            d_version;      /* version of this structure */
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:55:9: error: unknown type name '__s8'; did you mean '__u8'?
      55 |         __s8            d_flags;        /* FS_{USER,PROJ,GROUP}_QUOTA */
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:70:9: error: unknown type name '__s8'; did you mean '__u8'?
      70 |         __s8            d_itimer_hi;    /* upper 8 bits of timer values */
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:71:9: error: unknown type name '__s8'; did you mean '__u8'?
      71 |         __s8            d_btimer_hi;
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:72:9: error: unknown type name '__s8'; did you mean '__u8'?
      72 |         __s8            d_rtbtimer_hi;
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:73:9: error: unknown type name '__s8'; did you mean '__u8'?
      73 |         __s8            d_padding2;     /* padding2 - for future use */
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:166:9: error: unknown type name '__s8'; did you mean '__u8'?
     166 |         __s8            qs_version;     /* version number for future changes */
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:168:9: error: unknown type name '__s8'; did you mean '__u8'?
     168 |         __s8            qs_pad;         /* unused */
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:210:9: error: unknown type name '__s8'; did you mean '__u8'?
     210 |         __s8                    qs_version;     /* version for future changes */
         |         ^~~~
         |         __u8
   In file included from include/linux/ethtool.h:20:
>> include/uapi/linux/ethtool.h:2523:9: error: unknown type name '__s8'; did you mean '__u8'?
    2523 |         __s8    link_mode_masks_nwords;
         |         ^~~~
         |         __u8
--
   realtek_hwmon.c:3:10: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'support'
       3 |  * HWMON support for Realtek PHY's
         |          ^~~~~~~
   realtek_hwmon.c:3:33: warning: missing terminating ' character
       3 |  * HWMON support for Realtek PHY's
         |                                 ^
   realtek_hwmon.c:3:33: error: missing terminating ' character
       3 |  * HWMON support for Realtek PHY's
         |                                 ^~
   realtek_hwmon.c:5:39: error: stray '@' in program
       5 |  * Author: Heiner Kallweit <hkallweit1@gmail.com>
         |                                       ^
   In file included from include/uapi/asm-generic/types.h:7,
                    from arch/parisc/include/generated/uapi/asm/types.h:1,
                    from include/linux/bitops.h:5,
                    from include/linux/hwmon.h:15,
                    from realtek_hwmon.c:8:
>> include/asm-generic/int-ll64.h:16:9: error: unknown type name '__s8'; did you mean '__u8'?
      16 | typedef __s8  s8;
         |         ^~~~
         |         __u8
   In file included from include/linux/kernel.h:27,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/phy.h:15,
                    from realtek_hwmon.c:9:
>> include/linux/math.h:112:9: error: unknown type name '__s8'; did you mean '__u8'?
     112 |         __##type numerator;                             \
         |         ^~
   include/linux/math.h:115:1: note: in expansion of macro '__STRUCT_FRACT'
     115 | __STRUCT_FRACT(s8)
         | ^~~~~~~~~~~~~~
   include/linux/math.h:113:9: error: unknown type name '__s8'; did you mean '__u8'?
     113 |         __##type denominator;                           \
         |         ^~
   include/linux/math.h:115:1: note: in expansion of macro '__STRUCT_FRACT'
     115 | __STRUCT_FRACT(s8)
         | ^~~~~~~~~~~~~~
   In file included from include/linux/quota.h:42,
                    from include/linux/fs.h:271,
                    from include/linux/compat.h:17,
                    from include/linux/ethtool.h:17,
                    from include/linux/phy.h:16:
>> include/uapi/linux/dqblk_xfs.h:54:9: error: unknown type name '__s8'; did you mean '__u8'?
      54 |         __s8            d_version;      /* version of this structure */
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:55:9: error: unknown type name '__s8'; did you mean '__u8'?
      55 |         __s8            d_flags;        /* FS_{USER,PROJ,GROUP}_QUOTA */
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:70:9: error: unknown type name '__s8'; did you mean '__u8'?
      70 |         __s8            d_itimer_hi;    /* upper 8 bits of timer values */
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:71:9: error: unknown type name '__s8'; did you mean '__u8'?
      71 |         __s8            d_btimer_hi;
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:72:9: error: unknown type name '__s8'; did you mean '__u8'?
      72 |         __s8            d_rtbtimer_hi;
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:73:9: error: unknown type name '__s8'; did you mean '__u8'?
      73 |         __s8            d_padding2;     /* padding2 - for future use */
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:166:9: error: unknown type name '__s8'; did you mean '__u8'?
     166 |         __s8            qs_version;     /* version number for future changes */
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:168:9: error: unknown type name '__s8'; did you mean '__u8'?
     168 |         __s8            qs_pad;         /* unused */
         |         ^~~~
         |         __u8
   include/uapi/linux/dqblk_xfs.h:210:9: error: unknown type name '__s8'; did you mean '__u8'?
     210 |         __s8                    qs_version;     /* version for future changes */
         |         ^~~~
         |         __u8
   In file included from include/linux/ethtool.h:20:
>> include/uapi/linux/ethtool.h:2523:9: error: unknown type name '__s8'; did you mean '__u8'?
    2523 |         __s8    link_mode_masks_nwords;
         |         ^~~~
         |         __u8


vim +3 drivers/net/phy/realtek_hwmon.c

   > 3	 * HWMON support for Realtek PHY's
     4	 *
   > 5	 * Author: Heiner Kallweit <hkallweit1@gmail.com>
     6	 */
     7	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
