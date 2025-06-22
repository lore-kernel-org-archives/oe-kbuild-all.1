Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91111BC4E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750600314; cv=none; b=ODAiNSCTXZqTDTxvLvW87NkR8LQfkZeiypeyoBX4MgTpIuK9S63eu0h8sDOuxuWZwMLIx8t3ZnP9Z8MqdfclXyuq8u5ae+9ZhvIQTn3EwO2nDIr/fkn1/R/xPmxOwKXKvx8Myx45gAWbzEOA4Mf7OrceGuq+MLdYPpF4LSg8ERo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750600314; c=relaxed/simple;
	bh=ta0VNWUW7+g/0jU7+zY/Rb5+WHvmevr/g7+rgLQmF5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eFXCOa5B8aaPw+i9BBZdHEs0dKBUuRNj2dDe3FFJ+WRP3I6R0bA3PyPgrzDKeiK7o7eyPjJk03FxwKsMmb9KA6B8geT05lzZZXT7FVSYFlXeF61qeVR1lNRWQzfRKayS6ruaAuUUf/+JzD+1u35TrpINhVi5f2zZNvLVDLnSGmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzSyJiUb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzSyJiUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750600313; x=1782136313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ta0VNWUW7+g/0jU7+zY/Rb5+WHvmevr/g7+rgLQmF5g=;
  b=VzSyJiUbaBmjk8Bqhj57urCjklDBoYiJ4jl8HuEU6uSxeV0F9DPyX4pD
   5XAB2smj4/JJzT8im69wrCAjtJ4BeNZiMwn2XPyis+YvLEClXkPax7UIU
   Dg5P8lQxFGsscq1OMxY0PnCyaJ0rKAnal9vhqrrocX6n6cOPsEUaz+I3Z
   7qHM3+gB+t/mwTgtORTBmx2UEkgKqqX2dCbCR8IUMDNJ8yaQxw8cKTlqe
   JZTHK/j6BNNMytDrgZ53r68T45bCNTAjq2qywavrgpAGxRwaB5eabLos8
   yPykKSLKQ0LMFt+6ONB3o34XW62vtCvtrl6nhgXa9aoWMSSbkeK7hzA9P
   A==;
X-CSE-ConnectionGUID: A4oMxGCrT++WN0eJJ0TXQQ==
X-CSE-MsgGUID: suJ4iisSTlGnTtwopCzqlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="40416383"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="40416383"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 06:51:51 -0700
X-CSE-ConnectionGUID: uIEbP0aORqy3A/sXCEsHFQ==
X-CSE-MsgGUID: a6tjfm1LRX2k9dxPZURhTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="151563762"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2025 06:51:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTL6p-000NJu-1D;
	Sun, 22 Jun 2025 13:51:47 +0000
Date: Sun, 22 Jun 2025 21:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 42/42]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: ec@0
 (google,cros-ec-spi): typec:connector@0: Unevaluated properties are not
 allowed ('ports' was unexpected)
Message-ID: <202506222138.xkhKOpkO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   f6966f9200cc04e9bbb539be3cceecc66c21dc21
commit: f6966f9200cc04e9bbb539be3cceecc66c21dc21 [42/42] BACKPORT: FROMGIT: arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
config: arm64-randconfig-052-20250620 (https://download.01.org/0day-ci/archive/20250622/202506222138.xkhKOpkO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506222138.xkhKOpkO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506222138.xkhKOpkO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: dp-bridge@5c (ite,it6505): switches:switch@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: dp-bridge@5c (ite,it6505): Unevaluated properties are not allowed ('switches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: switch@0 (typec-switch): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: switch@1 (typec-switch): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/typec-switch.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: ec@0 (google,cros-ec-spi): typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: ec@0 (google,cros-ec-spi): typec:connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: ec@0 (google,cros-ec-spi): typec:connector@1:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: ec@0 (google,cros-ec-spi): typec:connector@1: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec (google,cros-ec-typec): connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec (google,cros-ec-typec): connector@0: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: typec (google,cros-ec-typec): connector@1:ports: 'port@0' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
