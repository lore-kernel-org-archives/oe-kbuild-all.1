Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB2219478
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 06:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720850651; cv=none; b=XZa0m+U2/yFt/zhiYl0ywFCc6FkAX4hwtYDqmfzHO61fbHE95EIqAEb+/GXST6QZU3N1xvdXFkJbfPzA3ZAQrL2PiisiDpY/ycbMJUMIKQijmAdQWyZFxjW9vqX1QV1P9cFcK7/Gs2Eg5nt/QlPC3eVtJpF9Jzeqz6h7jXEzdw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720850651; c=relaxed/simple;
	bh=fMHSEiVDVilIwiKm3AEkKh+UYoaUv0cqaCS5RNYr0HE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KfJD3HdLR5n2L8pcJwF6nXViErMhuqMi3p85jXS798jN+InBKHXvQbP6hXGRQoaBwa1B6Zx+FNn52bfo6vpq9LsHVV7sxUffO8ja+Vwh41oF81/mKWYUPzGK0WTmXTIGoka9CvQD9K9dUAVA5C9/+JhKCUeu92hOrYp37SHs2OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dc+nvuN+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dc+nvuN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720850650; x=1752386650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fMHSEiVDVilIwiKm3AEkKh+UYoaUv0cqaCS5RNYr0HE=;
  b=Dc+nvuN+W+TihSgzBzkezCJKaGnowZZ2xaU65eY/Qh3UZH7Ffrq72/CL
   yzAwoEuRobHjsSxMeseNo2H2SAcaPlN4GdVN7sKZGPYkdk4mPj9u+fN9h
   nmH6MG8SkG+yTxfK4zeE8Hkz0nFlvktY0VO1zvrCHhPe3BXS1AjD27RBZ
   VD35lZlN8fgakFK1Ba3mj/mzI5PL7vE0pG4sq2GOIvroNT61WE73KJbwP
   eWxzf1IO1gnVB902Pl5gGb9379DSdD4BsZO+rV54vvAoDc9d0hIKrYV+0
   9tbtHQOrayWAH7l7/SfapiyoCFHvJjR+YMUyECSfx5t9UZqEYYN9Vubu1
   A==;
X-CSE-ConnectionGUID: AILWM/gMRP28l1F3DQhwHQ==
X-CSE-MsgGUID: Ylb04gWFS2G63iGyPgJhjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="22171627"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="22171627"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 23:04:07 -0700
X-CSE-ConnectionGUID: 2tKM5pw5SwS0XVUzl2Pzog==
X-CSE-MsgGUID: wdR60672ROKjlK5IhfaHvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="53947899"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jul 2024 23:04:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSVrX-000bkk-10;
	Sat, 13 Jul 2024 06:04:03 +0000
Date: Sat, 13 Jul 2024 14:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [linux-next:master 10502/12880]
 arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: leds:
 led-wifi:linux,default-trigger: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202407131329.5dGfeMXn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe121b622825ff8cc995a1e6b026181c48188db
commit: 9d0120b72b972fb564940a252d994864fb9d6524 [10502/12880] ARM: dts: marvell: kirkwood: align LED node name with bindings
config: arm-randconfig-051-20240712 (https://download.01.org/0day-ci/archive/20240713/202407131329.5dGfeMXn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131329.5dGfeMXn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131329.5dGfeMXn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: rtc@10300: compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: rtc@10300: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: /ocp@f1000000/sata@80000: failed to match any schema with compatible: ['marvell,orion-sata']
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: mvsdio@90000: $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: mvsdio@90000: Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cap-sdio-irq', 'cd-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: leds: led-wifi:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'phy0tpt' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'none', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'phy0tpt' does not match '^cpu[0-9]*$'
   	'phy0tpt' does not match '^hci[0-9]+-power$'
   	'phy0tpt' does not match '^mmc[0-9]+$'
   	'phy0tpt' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-l-50.dtb: leds: led-wifi: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
