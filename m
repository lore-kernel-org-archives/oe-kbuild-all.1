Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864046;
	b=2R6xWM5q/AvePuBPof00yomvY6jE/4jEMMZx1hc3Y6b1j5Y02Tt8ch64LLRibMiLZQtD
	 DB1fwNHZwEyF1NBLJ8STCnaLIWAXAG3lw7g/f4y69SRZXD15Oe4oRvWtgTQvC1ZsArQiE
	 CJMFaKtowwzLMoeewzKvWhHioPufLmI12vlS44dg17zNTGpKrrsgJMp/00UyqKdcrs4fL
	 aW4Ba4Sq9SFMMB3sVxSDBcHeC1U9dn/5ZmIHrabW5AnSCOtx1iIGDrB1fvXVpXiLrbzsQ
	 lsYlLDD9KZyJjd26n5O5/ji0OSVTiRvps4vC5bLh65km/h5/J2Rkj00zcbDoh2g79fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864046;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CuZi0v1I+XutpmWotubaLEs/MB6U3kYOJ/W8WTcWvww=;
	b=5DmeoFigfHU49lc7Tw1a/w1OZacBuWZ0NDxH6yFYY2vDDH7Q36IeSxubJ3GDb6pwKh4a
	 BN5/XogYeW201dwfFShsTfBXli4zKD/V83P0lGInjDkMsmCQy3pSquZtyeZz+73AgP/Ev
	 Uc3bLENKG1J+Bu4nNeZmsUBE0DJaIbrc6YRr4x0wDy7oy+8QYdEPY2olAGdrhPnjTlRob
	 /O+qRFhd/0hg3BetmxYaWLvE+NTd+VYuxxP34SxdvOFPi9t1jO8D0thAevDRgeEyfU1+6
	 yEk4Y4n/lB2QUekTS3NemnyN8OGMTm9ME1obTBbZpzAY2oFCqVMLxKRHDq8bhwwYu5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i5BgaCxh;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B418C606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 21:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B418C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i5BgaCxh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864046; x=1826400046;
  h=date:from:to:cc:subject:message-id;
  bh=G5rXYyu+sg/052i7WL+YKLbBfAlfTWFmQtov0BDS9dA=;
  b=i5BgaCxhclbBXYHACLMJMXkI1P5rXq6e21yP9PrM1EZ7Hwq8GYe2p9kc
   Fbn4ExtkvdW3e+3WzE3EyZfFYNrr1PbGcekQEYR4+5AM4mXcxortsvQfE
   IM0szbcl+ZWmqGJfEkSPDkTt2+ilJWdvh7uFPMW+gAGw4vMhYXFHV7KzF
   1MtSkfCuZC5dAVoBZfDHYiQodZIARsP0dZyFrhU7Vk3uzz3EiEmzpPW4z
   ybVxRwB0N77/Qs3F3u1GR6G/yjtla1mexIcp2ZBUq8OpiYn7nUI5bkYLv
   uk2QxGBa9oBHvuOCSW31uN4Xe33mD8BLpZaSIBNDyu/oION1gU/XeSQDd
   g==;
X-CSE-ConnectionGUID: MTPHVgnESJidQdWzHPwMEw==
X-CSE-MsgGUID: 2ngbMLdPSMKdWyfHMy+Sjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3495190"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3495190"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:20:46 -0800
X-CSE-ConnectionGUID: afRYT2GdQhimZMgMCseADg==
X-CSE-MsgGUID: a/toFwhKTHiE2WNOg92giw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9592185"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Nov 2026 13:20:44 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT481-000000002oU-3R6q;
	Mon, 16 Nov 2026 21:20:41 +0000
Date: Mon, 16 Nov 2026 22:20:36 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 51/155]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800
 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon']
 is too long
Message-ID: <202611162252.nYPVoqhl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   cd0eb1d4dd5d81633888178d716cb96817bdd927
commit: c178127e627efce9560b07a81e3d2682759ad608 [51/155] arm64: dts: mt7622: fix sata
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261116/202611162252.nYPVoqhl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611162252.nYPVoqhl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611162252.nYPVoqhl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: audio-controller (mediatek,mt7622-audio): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml
>> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml
--
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller (mediatek,mt7622-audio): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@1a100800 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
