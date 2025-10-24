Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648D71E25FA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761319325; cv=none; b=Nez/4KzPGjz9RydSWHQ/Juboc5+D/pbc649L2cPZSvSKV/dAtDAasE3+N5Ousi3K2//i668woxBXWMLUiQUxlBLMnm8jU0ByxPL0+ePzIexWx7Px0SCMYX6EFm76RIrOq4yFdPrEFVJAYofdFVENMXTW8dUBA8CglPR43FwcwHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761319325; c=relaxed/simple;
	bh=vVBF5JNWMCAl+3Aq6nMokz66eaMxXfS2FPyZxQAXMCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MPfpVmQisxnsQO+Ncz3iNF64mJP+MIR2oJFV5MB8063GCeIWeRireeeny+kf7zqaWc7sftVuo9f3Mc5HqLF3NpwEdS0OwpAW5/eg+9xg7DSVaE71GNerb/W5VREyycdnFCk9lYHygqWgh/fmqf6FP+OCQN369Fahan/S8KeQI14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL2kyyeF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL2kyyeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761319323; x=1792855323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vVBF5JNWMCAl+3Aq6nMokz66eaMxXfS2FPyZxQAXMCk=;
  b=TL2kyyeFKpC3BqAVJpiV2seTS2u3tYJ08KcWfQAUi2mdvjEOrSCZbsqi
   YgrFS8pUxXsr4YMBxLrIWqOzPrjuhkOd5CKt4RVt5iiHGHe4eMN8Bb0YE
   sFGIMeAyMoIAVfmkXlJ8JjnGwWugH5TLirjRP9EQ7lzB3mUlzs3zNd8Lv
   T6gSeHDOzkgkQoVNHai+Z+8mCfydNn+/7C5+VNr/3eHja4mddR12OfqUv
   d0ZjaseFJccDIBZn5kPuobGqx6RM3mIqIw6RPw2SGBiCagIsRQ2PIDZFp
   T1EyietmIhBhbUGvvUOOcNo9WeyeOJOYmbaVKozadvU6g7hs2Wt5j4uh0
   A==;
X-CSE-ConnectionGUID: vQcXOdnfQAmX6m1siZP2Ng==
X-CSE-MsgGUID: MsSqawLwQX+S9WmUrAxBrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81128643"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="81128643"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 08:22:02 -0700
X-CSE-ConnectionGUID: GRFauLe7QPuD8JXlivqwXA==
X-CSE-MsgGUID: ijq659rDRSmy1Z+DqcJHog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="183677014"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Oct 2025 08:22:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCJc3-000Ebk-0J;
	Fri, 24 Oct 2025 15:21:56 +0000
Date: Fri, 24 Oct 2025 23:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [linux-next:master 3845/4098]
 arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: gpu@fd000000
 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202510242309.6p5FyVLQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   72fb0170ef1f45addf726319c52a0562b6913707
commit: 0eb6f5143b1daede692ee143df604197f9922164 [3845/4098] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
config: arm64-randconfig-052-20251024 (https://download.01.org/0day-ci/archive/20251024/202510242309.6p5FyVLQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510242309.6p5FyVLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510242309.6p5FyVLQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a7796-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a7796-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a7796-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
