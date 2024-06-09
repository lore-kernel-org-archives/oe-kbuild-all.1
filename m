Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9355C1BF40
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 13:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717940173; cv=none; b=cIVOb+k6M3k7AHlBFUmkViJ0V5winmQaO/Nc+hPwQmAi8yGM+KlOYhVWQMkRWS8gNyNlsOZXO2psf00hPfzWW0e6+roQBdeAfKpTCIqRU+88VXj0M5IuYBDw2kG58VW9RDMiFioZilXPbYCooyo+E+eJpJoQ8ctfdN1yf2F/CyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717940173; c=relaxed/simple;
	bh=bzhV4qomWP40z9FNCdIILdwpbA/g0sCE9C3BACX7qCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XO6PNDn5yxbsOtTE0XhVEgVY7E/xVlox+Nh36v4yUptIwEgHzlz/1F4VA5vgJ/wD/bwMsSNiPAecfHU1m9JJWLJod/d6xdeeG8dRnUxqsG6qZSat6kQB3bQjYmEpZjEQiCo1T9ihs9oxZGAf9dp2IuJAfu3N2SkgRxoErotBZ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDN7zzTp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDN7zzTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717940171; x=1749476171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bzhV4qomWP40z9FNCdIILdwpbA/g0sCE9C3BACX7qCM=;
  b=NDN7zzTpg8Z7IkaptOUAi0UY/yejEY8MO7X2EIEwDgG4wd2VhNqgV+vg
   TzJarXQcLIIk2TxVExCB76XYhbUSza+FI2AWrpfLbfLq+xawDIGtiOJOB
   PkSqMFX4ixC+2UwEcHDU+UjON14JGkCDzmM8cUBnkWPB2BdcYp4v4OesY
   tKzOI/tEdLxbzZkkxR2D4YUTqc4lxuXFEADDP4nZhg++eEHTwtnFyM5Wb
   9gFfD9HPvf9vv3rVSDJS7JsnptiX/Bmqyt0Pyf8gCPAdXwclPbEFJ9oZd
   C1hRim0lDW3A5VPwKJ8lAeYuVgRNsrFuDcv4XiAAk0IpJObVPuqRlAwd2
   A==;
X-CSE-ConnectionGUID: 18In0prRTDaTc7UDZOAnmA==
X-CSE-MsgGUID: p+mGol4qR0yRc233IrLQqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="32148028"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="32148028"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 06:36:11 -0700
X-CSE-ConnectionGUID: B2LT0M28TkOVyclAjNX16w==
X-CSE-MsgGUID: 4UVhr1S5Tj2qEvbBSnX7Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="38930196"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jun 2024 06:36:10 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGIiO-0001FO-00;
	Sun, 09 Jun 2024 13:36:08 +0000
Date: Sun, 9 Jun 2024 21:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 4/4] arm64: dts: renesas: rz-smarc: Replace fixed
 regulator for USB VBUS
Message-ID: <202406092141.skQ4slrb-lkp@intel.com>
References: <20240607113745.73934-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607113745.73934-5-biju.das.jz@bp.renesas.com>

Hi Biju,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on geert-renesas-devel/next linus/master v6.10-rc2 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/reset-renesas-Instantiate-USB-VBUS-regulator-device/20240607-234023
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20240607113745.73934-5-biju.das.jz%40bp.renesas.com
patch subject: [PATCH RFC v2 4/4] arm64: dts: renesas: rz-smarc: Replace fixed regulator for USB VBUS
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406092141.skQ4slrb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406092141.skQ4slrb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,rcar-gen2-sdhi' was expected
   	'renesas,rcar-gen4-sdhi' was expected
   	'renesas,rzg2l-sdhi' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: mmc@11c10000: clocks: [[2, 1, 29], [2, 1, 31], [2, 1, 30], [2, 1, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: mmc@11c10000: clock-names: ['core', 'clkh', 'cd', 'aclk'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: mmc@11c10000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: usbphy-ctrl@11c40000: 'usb-vbus-regulator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzg2l-usbphy-ctrl.yaml#
--
   	'renesas,rcar-gen2-sdhi' was expected
   	'renesas,rcar-gen4-sdhi' was expected
   	'renesas,rzg2l-sdhi' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: mmc@11c10000: clocks: [[4, 1, 36], [4, 1, 38], [4, 1, 37], [4, 1, 39]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: mmc@11c10000: clock-names: ['core', 'clkh', 'cd', 'aclk'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: mmc@11c10000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: usbphy-ctrl@11c40000: 'usb-vbus-regulator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzg2l-usbphy-ctrl.yaml#
--
   	'renesas,rcar-gen2-sdhi' was expected
   	'renesas,rcar-gen4-sdhi' was expected
   	'renesas,rzg2l-sdhi' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: mmc@11c10000: clocks: [[4, 1, 36], [4, 1, 38], [4, 1, 37], [4, 1, 39]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: mmc@11c10000: clock-names: ['core', 'clkh', 'cd', 'aclk'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: mmc@11c10000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: usbphy-ctrl@11c40000: 'usb-vbus-regulator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzg2l-usbphy-ctrl.yaml#
--
   	'renesas,rcar-gen2-sdhi' was expected
   	'renesas,rcar-gen4-sdhi' was expected
   	'renesas,rzg2l-sdhi' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: mmc@11c10000: clocks: [[4, 1, 36], [4, 1, 38], [4, 1, 37], [4, 1, 39]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: mmc@11c10000: clock-names: ['core', 'clkh', 'cd', 'aclk'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: mmc@11c10000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: usbphy-ctrl@11c40000: 'usb-vbus-regulator' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzg2l-usbphy-ctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
