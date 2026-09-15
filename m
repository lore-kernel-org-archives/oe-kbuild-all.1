Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF258318EC7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 01:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434639; cv=none; b=PCAW/C394/pg1yLbSHAt/tCEkA9drT9dYTWsN70/YCcEijXRV+vmDqFAf6Hwc0Xkuyfs0mRzzu/YOe8CPK4VXJyJSwHStVwSHZcd/MfV5AVSPZhlnjRrY0++ZcSL6hAqR6sO0x4YbptR856pOGcwm1m8ygfTVovEpAX2obPKmac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434639; c=relaxed/simple;
	bh=+StfakESxiuenYHZ3ivKDMJloyA06lpoXCWgf65gLss=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fBC1cjzawxyB4gwm0gfcdjxmvlDRJgd01hJoTQRvFSU1TIXg2P/7SZ4nAaOwDIwDQ0w0a6n7sqC8XlUSGomLxlVy7s+zGzL0eKSeILIoO5qvB9vUybv04LSFgaabMVkuNXtu2Nnb7J9cQ7eb0NPtqMqV8hq0Gvrds1CNValjtTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dyKFJQoT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyKFJQoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789434637; x=1820970637;
  h=date:from:to:cc:subject:message-id;
  bh=+StfakESxiuenYHZ3ivKDMJloyA06lpoXCWgf65gLss=;
  b=dyKFJQoTpwBP1xkp+7m0S/md3DHsxXWJEymxdCNvp19he8eEY7n9M+Pn
   WsdwJvqQQe4GWN7uoSDOZmsG1/GXuYobhbgkfi+/yN90rBvfTEpmL9f+C
   T7F9eJ0lCYnFZ0/FDjgERhp0+f5D+UhvBfZ8sSaAt1uV7gW+QlSt/Wdmp
   0/A6fI9qYTHHvwlKv8VQkcAtfmsToN5XlGT1KZ+zwMcvVpth4rC8pdmV6
   uTE/6uZj5DoBBKTEFPak0/7rYYpylgZDASFGf6N8aPERtnhraywnMimOc
   nBN4jyL41Z8Zql5DtEDwhTauyGAAVsbjKrBwzQHXHp8EUADvxqHEDLOxq
   w==;
X-CSE-ConnectionGUID: BiVJyOqrRqiYk7eXbwAGPg==
X-CSE-MsgGUID: Qz0ZoPksR/CKEOzWH8l/nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112559641"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112559641"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 18:10:37 -0700
X-CSE-ConnectionGUID: SfP7upuYRxGeoMaIBkZgMQ==
X-CSE-MsgGUID: 99YWqEM4QZ+ARF627vCR8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276322011"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 Sep 2026 18:10:36 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Hgs-000000000QJ-2fL7;
	Tue, 15 Sep 2026 01:10:30 +0000
Date: Tue, 15 Sep 2026 03:09:39 +0200
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 6316/6545]
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtb:
 spi-ws-2ch-canfd (spi-gpio): $nodename:0: 'spi-ws-2ch-canfd' does not match
 '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202609150228.Nh4nZzbQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
commit: bf0a6853f441afb811682254634c5c914b092b16 [6316/6545] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare 2CH CANFD HAT
config: arm64-randconfig-2052-20260914 (https://download.01.org/0day-ci/archive/20260915/202609150228.Nh4nZzbQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150228.Nh4nZzbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150228.Nh4nZzbQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtb: spi-ws-2ch-canfd (spi-gpio): $nodename:0: 'spi-ws-2ch-canfd' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtb: spi-ws-2ch-canfd (spi-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'can@0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-gpio.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
