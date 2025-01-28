Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F4A1DED48
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 19:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738092746; cv=none; b=Sd2C/s42qaYDlrrjR8e1fCcgeqfPzxDvlJiN00ZZnaJc9IbXl+cilSREGM7piCySxnUrZc0ywtQPQWePFDeTp2ViuUxgoxYXONWZzlR6PEl4129erHSXkHzHP7GW8GXcRMHcMpPM+quB3Q0cxyfPF0gU2qsTt0REQNCUARM2NGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738092746; c=relaxed/simple;
	bh=15Meab1OGaZ3Z6MY+PY4Jy8jvucADgUavwkVEBjBiFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVNykUfDoOpeRIkj40wTJOIgHj1bAVt/+ewn3OIIGqnnbciorU1ZNBrxNgOZiIaUIwR9khO+pdGyF6bikwUGwEsMuKOchoh4/NBIXdBOn58hAzoikpW5uT4LnbVMKhOuf+vaDCmzF+y75VzR1Z0+6TEL65+8Fersu+4Av7g2WMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHql54RN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHql54RN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738092744; x=1769628744;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=15Meab1OGaZ3Z6MY+PY4Jy8jvucADgUavwkVEBjBiFE=;
  b=GHql54RNECsx7buP24XK6cnOQkQ7bXz2j+8m0ABvpWvuPf7fQ0V506re
   cv5Ov4hKo2fN4+KtC7KjyewFv8l3KKD7Ga+JNX7jB0XeDoORUpieX4MJj
   z33Tqk7N76oZybvTRDQ8OgcYJ0j5kYUK2Mhu7lujoeVDu0pAkeznoE5o7
   Ml5PPE5uiVLdG5yTxjEV1CVSel3Rmp12lsJHGDLCTpBANB1pdf79+SQKG
   v3aD8I2LNZt5GIakLd0jk+IBMMmgS9grNYteDWyplXfXbhA8LiQiRadRR
   re0j3y2U1x/xV/pRiw26OX2TbnKhYoHWZQ90e5jZqwuNFYiiTE2yUjxAc
   w==;
X-CSE-ConnectionGUID: aVFaIUG1ShyjVEKBBSsaTA==
X-CSE-MsgGUID: k2mHWEraRvqY3FPGit4jfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38293461"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="38293461"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 11:32:21 -0800
X-CSE-ConnectionGUID: s/lU45VtQvq+zUknp8EE+A==
X-CSE-MsgGUID: uytxmrx0SdaPK/w9X0wbYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="108709679"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jan 2025 11:32:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcrJq-000i8F-0x;
	Tue, 28 Jan 2025 19:32:18 +0000
Date: Wed, 29 Jan 2025 03:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: drivers/input/mouse/synaptics.c:164:27: warning: 'smbus_pnp_ids'
 defined but not used
Message-ID: <202501290327.rGZRB5w4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c
commit: 0bbadafdc49d11a1836e5946f517d18cceaea6c8 um: allow disabling NO_IOMEM
date:   3 years, 7 months ago
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20250129/202501290327.rGZRB5w4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501290327.rGZRB5w4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501290327.rGZRB5w4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/mouse/synaptics.c:164:27: warning: 'smbus_pnp_ids' defined but not used [-Wunused-const-variable=]
     164 | static const char * const smbus_pnp_ids[] = {
         |                           ^~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/input.h:19,
                    from include/linux/input/mt.h:11,
                    from drivers/input/mouse/synaptics.c:26:
   drivers/input/mouse/synaptics.c: In function 'synaptics_init_ps2':
>> <command-line>: warning: '%s' directive argument is null [-Wformat-overflow=]
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/input/mouse/psmouse.h:202:9: note: in expansion of macro 'dev_info'
     202 |         dev_info(&(psmouse)->ps2dev.serio->dev,         \
         |         ^~~~~~~~
   drivers/input/mouse/psmouse.h:195:33: note: in expansion of macro 'KBUILD_BASENAME'
     195 | #define psmouse_fmt(fmt)        KBUILD_BASENAME ": " fmt
         |                                 ^~~~~~~~~~~~~~~
   drivers/input/mouse/psmouse.h:203:18: note: in expansion of macro 'psmouse_fmt'
     203 |                  psmouse_fmt(format), ##__VA_ARGS__)
         |                  ^~~~~~~~~~~
   drivers/input/mouse/synaptics.c:1638:17: note: in expansion of macro 'psmouse_info'
    1638 |                 psmouse_info(psmouse,
         |                 ^~~~~~~~~~~~


vim +/smbus_pnp_ids +164 drivers/input/mouse/synaptics.c

55e3d9224b60df Andres Salomon        2007-03-10  163  
e839ffab028981 Benjamin Tissoires    2017-03-02 @164  static const char * const smbus_pnp_ids[] = {
e839ffab028981 Benjamin Tissoires    2017-03-02  165  	/* all of the topbuttonpad_pnp_ids are valid, we just add some extras */
e839ffab028981 Benjamin Tissoires    2017-03-02  166  	"LEN0048", /* X1 Carbon 3 */
e839ffab028981 Benjamin Tissoires    2017-03-02  167  	"LEN0046", /* X250 */
5179a9dfa9440c Benjamin Tissoires    2020-02-13  168  	"LEN0049", /* Yoga 11e */
e839ffab028981 Benjamin Tissoires    2017-03-02  169  	"LEN004a", /* W541 */
9df39bedbf2926 Lyude Paul            2018-11-24  170  	"LEN005b", /* P50 */
ca5047286c9c93 Yussuf Khalil         2018-12-08  171  	"LEN005e", /* T560 */
bf502391353b92 Lyude Paul            2020-02-13  172  	"LEN006c", /* T470s */
642aa86eaf8f1e Dennis Kadioglu       2020-05-26  173  	"LEN007a", /* T470s */
ad8fb554f04e38 Benjamin Tissoires    2018-05-22  174  	"LEN0071", /* T480 */
9b2071028f8def Dmitry Torokhov       2017-08-18  175  	"LEN0072", /* X1 Carbon Gen 5 (2017) - Elan/ALPS trackpoint */
15e2cffec3aa0d Edvard Holst          2018-02-03  176  	"LEN0073", /* X1 Carbon G5 (Elantech) */
fc1156f373e392 Hans Verkuil          2019-11-22  177  	"LEN0091", /* X1 Carbon 6 */
5717a09aeaf62d Aaron Ma              2018-02-03  178  	"LEN0092", /* X1 Carbon 6 */
abbe3acd7d72ab Cole Rogers           2019-07-01  179  	"LEN0093", /* T480 */
5717a09aeaf62d Aaron Ma              2018-02-03  180  	"LEN0096", /* X280 */
ad8fb554f04e38 Benjamin Tissoires    2018-05-22  181  	"LEN0097", /* X280 -> ALPS trackpoint */
127e4a1bc11e0e Jason A. Donenfeld    2020-10-04  182  	"LEN0099", /* X1 Extreme Gen 1 / P1 Gen 1 */
1976d7d200c5a3 Nick Black            2019-07-11  183  	"LEN009b", /* T580 */
127e4a1bc11e0e Jason A. Donenfeld    2020-10-04  184  	"LEN0402", /* X1 Extreme Gen 2 / P1 Gen 2 */
e839ffab028981 Benjamin Tissoires    2017-03-02  185  	"LEN200f", /* T450s */
b8a3d819f872e0 Gaurav Agrawal        2020-02-13  186  	"LEN2044", /* L470  */
9843f3e08e2144 Alexander Mikhaylenko 2019-06-12  187  	"LEN2054", /* E480 */
9843f3e08e2144 Alexander Mikhaylenko 2019-06-12  188  	"LEN2055", /* E580 */
470d154a62c4ef Hans de Goede         2020-10-05  189  	"LEN2068", /* T14 Gen 1 */
7a71712293ba30 Mantas Mikulėnas      2018-12-21  190  	"SYN3052", /* HP EliteBook 840 G4 */
5a6dab15f7a798 Teika Kazura          2018-12-03  191  	"SYN3221", /* HP 15-ay000 */
25f8c834e2a687 Dmitry Torokhov       2019-07-12  192  	"SYN323d", /* HP Spectre X360 13-w013dx */
1369d0abe469fb Yussuf Khalil         2020-03-07  193  	"SYN3257", /* HP Envy 13-ad105ng */
de4e374b401a73 Dmitry Torokhov       2014-12-29  194  	NULL
de4e374b401a73 Dmitry Torokhov       2014-12-29  195  };
de4e374b401a73 Dmitry Torokhov       2014-12-29  196  

:::::: The code at line 164 was first introduced by commit
:::::: e839ffab028981ac77f650faf8c84f16e1719738 Input: synaptics - add support for Intertouch devices

:::::: TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
