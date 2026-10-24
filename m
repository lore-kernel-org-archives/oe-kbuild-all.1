Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792811057;
	b=cOvg77e8k9C/q7XGzOpk11Bq8gPKBzZnSaNWMzu0scMJKCF7gNzarM+yAHH1wqMh+Jkx
	 3BSCdDJNIfoU13873lGDXqLaSGTfs/OhoQEk1J2IXpG09mjL2iHkWD+tSDDoSTdfcPlFG
	 FtZ1L+Hc+7KyWYk6K3FWpR7C4+BVy1IUnk25jFidaXefnv/MpHGf0ztRCr7PfC0Z2oR5r
	 JAbVok/2hpeJq03obsABx3YOnCm/IgTrrM8RZ8AVf7IUW9iXEG15D4Ps7tOZ8w/DoU+9Y
	 CRjLgi0qdd33tdJ4+74GC/ijQY7yZtnk9In3Q9fskObyik+r7VJhcm6N7qd9Kdnf24A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792811057;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xvK8GMhocWBhEop5Y7vy9eUBY32XQiX/y2bHjEPTRmM=;
	b=2dUQohGnYHXiBRXzpEGEMBZiF40YakQOIRM6j7O4XxRu4Rem4vX5pKrxvK6RyAQKGaZh
	 t+0HsqWtMCnWNWhIhM2WpFkEdba8MnPnBjjswCi21gb+E4jYpHLVEUHIubaz0rRLJ+Aus
	 6XCl5cVS1xwMA1D3rK9MFLAYyD+PpzwnNJeBGxPxc/gXEAWuz64kWWX41o9OurZ9fg8ur
	 ++xnG8H4uzZrPv53U3eObPbozwJIGWlQvuiSKvMSXISV86KwX+409LuZSpd3YIsusbTDw
	 uUSGavn17OieZ0UFqPv0/Qz29kfE9pRN+gGsnoRcx20rtFNVfHGS8V9FVPtGgxbdfPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TJOKSATz;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7E0606A31B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 03:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E7E0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TJOKSATz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792811058; x=1824347058;
  h=date:from:to:cc:subject:message-id;
  bh=db5bzMuddf6Br4UEau67s/j0mO6ZX8xp++AjKBI+0CQ=;
  b=TJOKSATzn9FMLRjuymDPgTnvf2zsCF1ZL4m4xf2bGKfqwDJkimZtnGU5
   70SenL/a3GqHITtTYcOzLxkvF73l76Au2akmhg91GbqP+Gif78OfuFPK9
   d0a86nf64cjHfkJ1hCCD4stJakuvUkJPVcwVNHPbEH7hkMpmseDiU1weZ
   +g4caoM9oc/6Rtc4cPPtdV2AZQjmEc6u7CLHWEIzdieYiOuqZt6Lv1dlc
   SZzjxGWkcynvjH3n8uK1jHwNTJya6LvdfdQ/RV5INoXN8H/j1R0641K/Q
   WgsxCF5tS6rGpdLIysbmGwplb/xK7lD5h0AzINlgjTAwFBIhlUqRVXk1a
   A==;
X-CSE-ConnectionGUID: dNZd50T6Qr+emu6/kLtfdw==
X-CSE-MsgGUID: Xj2w+x91RRGQWqR8xp3m5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1471873"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1471873"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 20:04:17 -0700
X-CSE-ConnectionGUID: BKjCU81NTAqMYIhBf0A6dw==
X-CSE-MsgGUID: ArQN3bDaQUuPG2d+m3TItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3752248"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2026 20:04:15 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKS3J-000000003ER-0zlh;
	Sat, 24 Oct 2026 03:04:13 +0000
Date: Sat, 24 Oct 2026 05:04:01 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 18080/19841]
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: dsi@f4107800
 (hisilicon,hi6220-dsi): ports:port@1:endpoint@0: 'reg' is a required property
Message-ID: <202610240525.Riafn8Xc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20a33c6b6cbe7e4805dfb6cd68816937443aa148
commit: ed8c36964c97c73237a793c47e583986a726f932 [18080/19841] dt-bindings: display: Convert hisilicon,hi6220-dsi to DT schema
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261024/202610240525.Riafn8Xc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240525.Riafn8Xc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240525.Riafn8Xc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/mailbox@f7510000: failed to match any schema with compatible: ['hisilicon,hi6220-mbox']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: i2s@f7118000 (hisilicon,hi6210-i2s): dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/hisilicon,hi6210-i2s.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: i2s@f7118000 (hisilicon,hi6210-i2s): dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/hisilicon,hi6210-i2s.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: i2s@f7118000 (hisilicon,hi6210-i2s): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/hisilicon,hi6210-i2s.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/ade@f4100000: failed to match any schema with compatible: ['hisilicon,hi6220-ade']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: ade@f4100000 (hisilicon,hi6220-ade): hisilicon,noc-syscon: b'\x00\x00\x00S' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: dsi@f4107800 (hisilicon,hi6220-dsi): ports:port@1:endpoint@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/display/hisilicon/hisilicon,hi6220-dsi.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: reboot-mode-syscon@5f01000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
