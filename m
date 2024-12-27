Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB55D1E489
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735308383; cv=none; b=CphAYiCxqb2+i4BQly+eOeMuNRG08Xw0RAoo1a897+IkUis7nUPhBo0chGDTtrIA+OPZZK/Om+IBdnhXJHTzucpcYM3VbN1f+2aZ8UqUyESvHgLYXnTxwOrbWtodNoP8jg4f69/dOJSdyiuYe18IJ0aSctlQafJgYS5ECkgGjXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735308383; c=relaxed/simple;
	bh=zxNqbIbI70zzq3PzM7/T4a6JZOPZ78jwaAEJmfS7xOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ocb76k4JiHl8bcEwU2s4BuDi1fkfnWn2TZ5BVi4FZRusKuoyuKcjx8fakHuFAwQ7EembGhCtC4DwY0NwTKK3G0tziHzamH8FF7MD181D33XDXtToJu5KQoNDBjF4cohfVbAAtJ/6gWWdrCBDAaiznEo+n42a/ZC18tmqKIvSZv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JG86r/gK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JG86r/gK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735308381; x=1766844381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zxNqbIbI70zzq3PzM7/T4a6JZOPZ78jwaAEJmfS7xOc=;
  b=JG86r/gKhrpuaSH+c0bMPo7Ma/pUUEHs+cetgHMn/gsJ8nXB7UXmeYO/
   IhczdRQoMB5j4UlW8GJjtN8DiJdpw2HYeIqmWpLO4yV68pLdOASaSCXS/
   Y1Zh6p2l2pKjDkcC3fZskFfu9GdpHe4lCkdaLOQ3gZH+YvQslnbsKKFke
   SNZJprT6vRYx6pHr1tNnfNxk0F0fjJu/56aG+1INJrVBjkY7HPk0axe8r
   KW0IH1pMX2pobrJt7f6kmUkFz4yUEH618NJ45zU9zsLEaUEkC5f9RmG3N
   v9EOR43yps4wENWt71JvGg0UGzHdrwoCKCw1er3wblnag1osVj+vEs0oM
   A==;
X-CSE-ConnectionGUID: jl0lC8/pQZGmDH31o3XNoA==
X-CSE-MsgGUID: 7WLwSYrFSQ+yrH27Ii/Zsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35020595"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35020595"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 06:06:20 -0800
X-CSE-ConnectionGUID: YzCREcL2Q9m+Fm6fRtC2Aw==
X-CSE-MsgGUID: 2YKq+pDcRb27h+vaMJ+x9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101003261"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Dec 2024 06:06:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRAym-0003Dg-2s;
	Fri, 27 Dec 2024 14:06:16 +0000
Date: Fri, 27 Dec 2024 22:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb:
 dp-bridge@5c: switches:switch@0: 'port' is a required property
Message-ID: <202412272205.MyJ44QaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   ca8e7ba4cbf9fe4c8fe507bf6d5f91c4f6d0b173
commit: 25fcec4cccf7ff2e6fcfc161128fc4e8927206bf [4/4] CHROMIUM: arm64: dts: mediatek: mt8186: support early corsola devices
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241227/202412272205.MyJ44QaS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412272205.MyJ44QaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412272205.MyJ44QaS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-rev0-sku196609', 'google,steelix-rev0-sku196608', 'google,steelix-rev1-sku196609', 'google,steelix-rev1-sku196608', 'google,steelix-rev0', 'google,steelix-rev1', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-rev0-sku196609', 'google,steelix-rev0-sku196608', 'google,steelix-rev1-sku196609', 'google,steelix-rev1-sku196608', 'google,steelix-rev0', 'google,steelix-rev1', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-rev0-sku196609', 'google,steelix-rev0-sku196608', 'google,steelix-rev1-sku196609', 'google,steelix-rev1-sku196608', 'google,steelix-rev0', 'google,steelix-rev1', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-rev0-sku196609', 'google,steelix-rev0-sku196608', 'google,steelix-rev1-sku196609', 'google,steelix-rev1-sku196608', 'google,steelix-rev0', 'google,steelix-rev1', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: dp-bridge@5c: switches:switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: dp-bridge@5c: switches:switch@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: dp-bridge@5c: switches:switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: dp-bridge@5c: switches:switch@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: dp-bridge@5c: Unevaluated properties are not allowed ('switches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: switch@0: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: switch@1: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: ec@0: typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: ec@0: typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: ec@0: typec:connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: typec: connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: typec: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: typec: connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: typec: connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: connector@0: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: connector@1: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
