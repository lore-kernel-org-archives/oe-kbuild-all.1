Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63CD3A9D90
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 07:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483616; cv=none; b=NaZ1i2tinJLuvPB91HmUo4uIOWk1TphBG5ivAFW1OPZrXP+A9Mwe++LWGdP5DNdR9MFgXv39WzTXeX0ruWsRoo7r9UKPbYhmut2zhPFx3lpN4L0s8utHE3Rj4KPmB7Z1tSXAYBtxWxMsUS2NNhSYXvY0h+ZvdvdSFrQcjAHWp4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483616; c=relaxed/simple;
	bh=CSQVdkE9JJ8pl6Mhb5crz/FnlMsgXM/3gLfVaz+cmbo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sS04Lsc9foxz7sTtyA+G/mq3q0l1eYu1ova2fJ94OGRBrPTc+SzmxcRNYsqonuuGbqVWttP6lNQaxX+P45hGmsobjOl6kfIzL7r4fYgLE6Lbjreewji/zuxxrI3KLIz/1Dh06oWF2aZG7tsrGckIrOWnAmaYozb3G3e/q7I3xTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5c7fm5h; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5c7fm5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785483614; x=1817019614;
  h=date:from:to:cc:subject:message-id;
  bh=CSQVdkE9JJ8pl6Mhb5crz/FnlMsgXM/3gLfVaz+cmbo=;
  b=B5c7fm5hbabu6/KJmIEjr3TaP54y2NA81i6HxPaOtKNnA/p3vsAsNVj8
   ZUTLhpE5p0rcAmaJRs2F2UQrAWwT0JaH9JG4tatzOTXuoE3zsLjEkq6mu
   xmmJQStS/66phAsyXF0EPRn6MHbN45rSICemtbcQqseWiU9vgR0Rinj6+
   4HvZqoLbFvg5LpV+FD5eARWNOOtY5E6ralKBa1CItouHSSt8Lbjg8qj/F
   uYUWKjSDKEa5UkPPkpSLoU39Ic1j672fqSLqZ8BlThiCn/C+EXFtADqAw
   P14GMYo6A3fnNxmRyxWqUFarG/154Q38TU7TaNq3PKN/eu1f3RbI2puU+
   w==;
X-CSE-ConnectionGUID: oOiYT5sISWGQtTRh453kAQ==
X-CSE-MsgGUID: Kki2cnXcQaaNW54ttFRvEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86186479"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="86186479"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 00:40:12 -0700
X-CSE-ConnectionGUID: w0gnRGrVTQWdKersXYJ0+Q==
X-CSE-MsgGUID: iz8EWxgMSZaHTKlz88VFyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="257841993"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jul 2026 00:40:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wphqi-000000000JO-0kDq;
	Fri, 31 Jul 2026 07:40:08 +0000
Date: Fri, 31 Jul 2026 15:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, xiane <sangch.go@gmail.com>
Subject: [tobetter:odroid-7.2.y 58/58]
 drivers/gpu/drm/panel/panel-sitronix-st7701.c:545:13: warning:
 'odroid_vu5s_gip_sequence' defined but not used
Message-ID: <202607311531.hBioub3M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.2.y
head:   b975acfb39259020dffed242fcfba388a6f4e354
commit: 1c377b8dc7ac08dc586a6ea6a35ba698d1294241 [58/58] ODROID-M1/M1S: gpu/drm: add ODROID-Vu5S panel to ST7701 driver
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607311531.hBioub3M-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311531.hBioub3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311531.hBioub3M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-sitronix-st7701.c:545:13: warning: 'odroid_vu5s_gip_sequence' defined but not used [-Wunused-function]
     545 | static void odroid_vu5s_gip_sequence(struct st7701 *st7701)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK_AXG_AUDIO
   Depends on [n]: COMMON_CLK [=y] && (ARCH_MESON || COMPILE_TEST [=y]) && ARM64
   Selected by [m]:
   - SND_MESON_AXG_FIFO [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && (ARCH_MESON || COMPILE_TEST [=y] && COMMON_CLK [=y])


vim +/odroid_vu5s_gip_sequence +545 drivers/gpu/drm/panel/panel-sitronix-st7701.c

   544	
 > 545	static void odroid_vu5s_gip_sequence(struct st7701 *st7701)
   546	{
   547		ST7701_WRITE(st7701, 0xE0, 0x00, 0x00, 0x02);
   548		ST7701_WRITE(st7701, 0xE1, 0x08, 0x00, 0x0A, 0x00, 0x07,
   549				0x00, 0x09, 0x00, 0x00, 0x33, 0x33);
   550		ST7701_WRITE(st7701, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   551				0x00, 0x00, 0x00, 0x00, 0x00);
   552		ST7701_WRITE(st7701, 0xE3, 0x00, 0x00, 0x33, 0x33);
   553		ST7701_WRITE(st7701, 0xE4, 0x44, 0x44);
   554		ST7701_WRITE(st7701, 0xE5, 0x0E, 0x60, 0xA0, 0xA0, 0x10, 0x60, 0xA0, 0xA0,
   555				0x0A, 0x60, 0xA0, 0xA0, 0x0C, 0x60, 0xA0, 0xA0);
   556		ST7701_WRITE(st7701, 0xE6, 0x00, 0x00, 0x33, 0x33);
   557		ST7701_WRITE(st7701, 0xE7, 0x44, 0x44);
   558		ST7701_WRITE(st7701, 0xE8, 0x0D, 0x60, 0xA0, 0xA0, 0x0F, 0x60, 0xA0, 0xA0,
   559				0x09, 0x60, 0xA0, 0xA0, 0x0B, 0x60, 0xA0, 0xA0);
   560		ST7701_WRITE(st7701, 0xEB, 0x02, 0x01, 0xE4, 0xE4, 0x44, 0x00, 0x40);
   561		ST7701_WRITE(st7701, 0xEC, 0x02, 0x01);
   562		ST7701_WRITE(st7701, 0xED, 0xAB, 0x89, 0x76, 0x54, 0x01, 0xFF, 0xFF, 0xFF,
   563				0xFF, 0xFF, 0xFF, 0x10, 0x45, 0x67, 0x98, 0xBA);
   564	
   565		ST7701_WRITE(st7701, 0xCC, 0x10);
   566		ST7701_WRITE(st7701, 0xB9, 0x10);
   567	
   568		ST7701_WRITE(st7701, 0x3A, 0x70);
   569		ST7701_WRITE(st7701, 0x53, 0xEC);
   570		ST7701_WRITE(st7701, 0x55, 0xB3);
   571		ST7701_WRITE(st7701, 0x5E, 0xFF);
   572	}
   573	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
