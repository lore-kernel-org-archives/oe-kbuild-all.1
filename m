Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348630;
	b=b7486ABVVchX5geIrInKttfMm7c0bp8lSHwObK94dmA8EvG72BRg85UIQRVjQ2HHUzTH
	 b3Uar0AXCAVkMaZkGVAel6QSYWzoTQ3qHumHXN2j8lhp6gBLz9/W1jcep9IhFJ9gseA2N
	 oiG1BzEhu4CT/fmZ79p707D1/7duNtWIJVyCtjbMJBvigcx+dua+KGdieEexfjl3dOdOr
	 0+Fy5HtV/rcc9KgCL2Km7qxz+lE8J58mvUbEV02jhQlWri3xphnqK8heElEBROWADOJfO
	 M2bH8ZPTEzQjw3shcJk1ec87pvXP9QJEkr0XbBDI6vqD/BfSo86/zFWzSsicWxRR1VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348630;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YPCAfZkl/VqU6hRR+iJpGXoDbiuH3r0An+aBhqpsDF8=;
	b=Bf02TLGymTfKoPs7H4SulQAWE88xir92qCL/RUE+3n3Bjx+povEPe9N9y5YK+48YXiZ4
	 dclK+nxJQxrByQ8Vc9ieOhCqedVofRtPOqBUm8bHfTq0f3ubJy4FQmi/to//F1HRA9hAe
	 3P4554YLlDB+bIU+yGhbzgo87xUn5oGWscHFStX1uSRqtfWJxGW+35+Vh9lBCwdjeapda
	 CWpnQWGOw4lwNNe09W31Dk5i5RuAcjKT6J9ID//8fMOYQxpFRKQMPf5nYOyzKW49rrisC
	 JDPfvy7METXKKzYb9Wj6cRiEFmYUkrQRYSAdzfsMPrXwWlAPPE5At8u5cz4OW1E/lEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C102VK84;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B87606A32C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 11:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B87606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C102VK84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795348629; x=1826884629;
  h=date:from:to:cc:subject:message-id;
  bh=o3O/KsOG+UIEshke3Si7D9+gwU4DTYejRXg7r0bbisw=;
  b=C102VK84XmQG1YWj1gxFhjHgkzJi4S23YgmAbijS+pp/jvzystznv3Y8
   v5rk1FdmC6yDA7z93prLrPvys+EkZwQfCpDY5/ivd+p2DxlAPYNrLZAku
   9P2txALbc04zAO8o22mzeD3G0wdjWiSyLyQ2PBq9skDww5J/GVqwgc4Ef
   VnEgfzDXEKB20sBqCT5GnmPY/BAmi0SZhxFtoQ3Gs8DC88Gax+lA0ltOL
   y99efpSgkwqvtabqWUagq3cC8MZV+ux95URUsqVryKJA5Eue2Q/kjTKcv
   iCELNUcbWef1GM472Y62MHkvcoSq1SFLzJh4OgjUE6cce9aStnHXMVf1T
   A==;
X-CSE-ConnectionGUID: 1uSVyoMFRq+AejW/QRQaqA==
X-CSE-MsgGUID: bhzEiK1wQ4GNtuRX1JvRUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4213156"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4213156"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 03:57:08 -0800
X-CSE-ConnectionGUID: To+Sy5S2TvaFQ6iiUSGWHw==
X-CSE-MsgGUID: 3J9S7/buSiS8O/iAML/vCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="12891424"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 22 Nov 2026 03:57:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV6Br-000000004YH-2obF;
	Sun, 22 Nov 2026 11:57:03 +0000
Date: Sun, 22 Nov 2026 12:56:19 +0100
From: kernel test robot <lkp@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: __efistub_cmdline.c:undefined reference to
 `__efistub___ashldi3'
Message-ID: <20261122125352.gAcg5yLx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Dmitry,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4843f6873f7c4835e62f2c73ba0fd538e57a2f22
commit: 9a4580db6e9f83428813f671a79486469684069f lib: fix memparse() to handle overflow
date:   6 months ago
config: loongarch-randconfig-r2100-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122125352.gAcg5yLx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122125352.gAcg5yLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9a4580db6e9f ("lib: fix memparse() to handle overflow")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261122125352.gAcg5yLx-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L47':
>> __efistub_cmdline.c:(.init.text+0x258): undefined reference to `__efistub___ashldi3'
>> loongarch64-linux-ld: __efistub_cmdline.c:(.init.text+0x268): undefined reference to `__efistub___lshrdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
