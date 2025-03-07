Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A0F7FD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 05:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741326027; cv=none; b=Gc/rhff/iJ4r49R80ZLoPtcQO0dmjbBldbrYrnSk2Uv/m7zjFxQAvPYKCsdxdQ7xhopJJmFuOL2sjFrht1xjBp18iv/UUNDvnf4HXJotjfia38IRBn/rIsyNf+s61LAtZxymEcyXJg/BWO4jQXUWcMKRU8kgxb9vDErpIjEqfrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741326027; c=relaxed/simple;
	bh=uuTzd8j7mT1bXr727bmHxazLk37Q/pnAbXMifV8W2HM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qimY7i4ctkqsWbgims3Jsv/OmI+5dYwuKpkP6ZiYOjokVVuQGVf6DHJ2h6vE3DVzZL2ovyUgZHkGu6h3qTkPg1mIVW+IRhHA5rcLaQQz+MaLm7UxrmsMT6P6AMhCP3qZ+hlVTLFfT6JR40xGRuphBEOkBjsTjKanWQck1tuoIxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFcaPOqU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFcaPOqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741326026; x=1772862026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uuTzd8j7mT1bXr727bmHxazLk37Q/pnAbXMifV8W2HM=;
  b=fFcaPOqUrdcsfuxTJeplQa2PbVyA1mYgqDpQ8SqF5PjPXCOAGKvCKks3
   sjnQ0i+xCJlXMpDGs9dR92jmFzF1XjCd3HEIApAxzW0OMWC+bO35wUgnh
   7uXq70ZTMr/kFSXfFs8PR3DNoCMePxOcUg13iIXUd5ZmusHM2TFyVLIKD
   uV0UbrC/vVp10wrrbKuzI6phKUupaUHlYRBVmkQX05mSCRJ9LjnYrwKiU
   BkmBQ57SdldNn7EfpeJgGB/308XXPruMDap9IzF7HukJsOBOisLQHZ2Lb
   ZQu/EY1hmYU13CV3TcGfi9DrFWZ/aTZ6kyjoSI9TiuRvUEg8MyM4Gcsff
   g==;
X-CSE-ConnectionGUID: M7SwwmU/QI+GSP5/1DfuVg==
X-CSE-MsgGUID: cFsGJNyqT4CVc1xTvk06qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41534840"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="41534840"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 21:40:25 -0800
X-CSE-ConnectionGUID: XS8kF4x+TByIZVJuU1sjJg==
X-CSE-MsgGUID: 1b4NcsIORUOv9ZH/Af34Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156437473"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Mar 2025 21:40:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqQQt-000OkY-0b;
	Fri, 07 Mar 2025 05:40:04 +0000
Date: Fri, 7 Mar 2025 13:38:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 7642/9212]
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: gpio@140:
 Unevaluated properties are not allowed ('lte_disable', 'lte_reset',
 'sata_reset', 'wlan_disable' were unexpected)
Message-ID: <202503071330.AYnUvWOo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   565351ae7e0cee80e9b5ed84452a5b13644ffc4d
commit: f2f3d5d62f6fbdaef46d1991086265a497b3e24f [7642/9212] dt-bindings: gpio: mvebu: Add missing 'gpio-ranges' property and hog nodes
config: arm64-randconfig-051-20250305 (https://download.01.org/0day-ci/archive/20250307/202503071330.AYnUvWOo-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071330.AYnUvWOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071330.AYnUvWOo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: config-space@f2000000: $nodename:0: 'config-space@f2000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: gpio@140: Unevaluated properties are not allowed ('lte_disable', 'lte_reset', 'sata_reset', 'wlan_disable' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: sata_reset: $nodename:0: 'sata_reset' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: lte_reset: $nodename:0: 'lte_reset' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: wlan_disable: $nodename:0: 'wlan_disable' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: lte_disable: $nodename:0: 'lte_disable' does not match '-hog(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
