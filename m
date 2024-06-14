Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E9116A38A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718377875; cv=none; b=pRHzc+cvkNrQvNhTN7tdMUeil12MG3uqdGKjFW4eWO3BUmUYehdTjX3rrQmC9MksLcpG6iMOyOtOegjdsfJKyBgXcYqeChkJy53NCEhQmeZGdxaimidN4PY+ukq3TKKXfrwaJ29O3gkdVcbnpp6MK1QrXGGPovJi2Cmnhv/rNQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718377875; c=relaxed/simple;
	bh=t+p8hRe7ZJaO1YiL/Ey5QrMotfYND+fGv7wrcUgpxyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fU5MIEI8ZgwUOvv75vip4AdeflWD3lN4WjA3lpgjmnJCETjw6pf/YSw3Xp8uhOZgkEEmQJw860B+4tyYc1p5Ci53Y/cGdPwQkDd1bMDD9TZKG7n7jhsnFqPBPhnK8Cj5v0HvvreOX7bHm5AwBPnKuoT/2YIXQhGixTH8hALpXv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vm48pii9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vm48pii9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718377873; x=1749913873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t+p8hRe7ZJaO1YiL/Ey5QrMotfYND+fGv7wrcUgpxyA=;
  b=Vm48pii9C78svy0V+szByKlwuj7B326NtULeFp+uxG+w0lVYlIujwbF+
   lx9syQ2WH0q4kb2zLCaFYUp5vyo8qk2mCE+wlY2AJHA6pPW9goI4vc5OI
   Gr6GTBo4yPcHayDzhX4kJjhaeSsdiuvKpJQERxTYgfGd4GHgYy+XTeLif
   jKkARqsHYNroHQpZsgUPZoPwFC1063mFfXulvGBcuYdpXG41b9jlokM9w
   i6LiXl00bRkA8/FiIeokqbLzAjXa1MRKGV5N6yDU4OYtpWhWE3RFNN+kX
   vOLewvZCktPMQuh9UV6ahvgX0cAOo/AmQCccQvO6D1c7+UGT6oU/SMJGi
   g==;
X-CSE-ConnectionGUID: +uVnBVcWTUWQ3dHC0Xcwrg==
X-CSE-MsgGUID: UOP0fzFgS6GQUuNaebupkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19119123"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="19119123"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 08:11:08 -0700
X-CSE-ConnectionGUID: JEC5FGQ4RVyhmrCQyeMSlw==
X-CSE-MsgGUID: YxrmvlMCRIymwmM76zQFPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="71297906"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2024 08:11:06 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI8Zz-0001RE-1E;
	Fri, 14 Jun 2024 15:11:03 +0000
Date: Fri, 14 Jun 2024 23:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Kropatsch <seb-dev@mail.de>, Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-rockchip@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: rockchip: Improve LEDs on NanoPi R6C/R6S
Message-ID: <202406142337.SdnyldQ8-lkp@intel.com>
References: <20240612205056.397204-4-seb-dev@mail.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612205056.397204-4-seb-dev@mail.de>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Kropatsch/arm64-dts-rockchip-Add-common-definitions-for-NanoPi-R6C-and-R6S/20240613-045639
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20240612205056.397204-4-seb-dev%40mail.de
patch subject: [PATCH 3/5] arm64: dts: rockchip: Improve LEDs on NanoPi R6C/R6S
config: arm64-randconfig-051-20240614 (https://download.01.org/0day-ci/archive/20240614/202406142337.SdnyldQ8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406142337.SdnyldQ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406142337.SdnyldQ8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: leds: led-1:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'stmmac-0:01:link' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'none', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'stmmac-0:01:link' does not match '^cpu[0-9]*$'
   	'stmmac-0:01:link' does not match '^hci[0-9]+-power$'
   	'stmmac-0:01:link' does not match '^mmc[0-9]+$'
   	'stmmac-0:01:link' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: leds: led-1: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: leds: led-2:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'r8169-3-3100:00:link' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'none', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'r8169-3-3100:00:link' does not match '^cpu[0-9]*$'
   	'r8169-3-3100:00:link' does not match '^hci[0-9]+-power$'
   	'r8169-3-3100:00:link' does not match '^mmc[0-9]+$'
   	'r8169-3-3100:00:link' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: leds: led-2: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: leds: led-1:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'stmmac-0:01:link' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'none', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'stmmac-0:01:link' does not match '^cpu[0-9]*$'
   	'stmmac-0:01:link' does not match '^hci[0-9]+-power$'
   	'stmmac-0:01:link' does not match '^mmc[0-9]+$'
   	'stmmac-0:01:link' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: leds: led-1: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: leds: led-2:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'r8169-3-3100:00:link' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'none', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'r8169-3-3100:00:link' does not match '^cpu[0-9]*$'
   	'r8169-3-3100:00:link' does not match '^hci[0-9]+-power$'
   	'r8169-3-3100:00:link' does not match '^mmc[0-9]+$'
   	'r8169-3-3100:00:link' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: leds: led-2: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
