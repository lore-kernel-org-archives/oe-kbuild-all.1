Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3EA9443
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 00:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752537642; cv=none; b=u1bbsVFTpW0AuvLQpN3JsQ5ni+XysY8O4kOqcgRYHnNOXyFmvHiXOd+IvV5OPmIUajTP/XNRp0YzK62Z04Jb8t2y5oJr3t9/74g3I/MWOw5TESXWahmmLoNVqprqa2kV9VdhzTjBe3jAfEpcZWuoGsLZ83vny1yQiH3OZbcz+XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752537642; c=relaxed/simple;
	bh=pWPDZWuzJAcb4UtE8e1F66u33hIBqAnjDtre40iR9l4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lwD2V1Kxezwc7zAgtb1Iho3wtcWe2S2Kdfc6oiLZzcQPhV+Tz0jWNN/KPX6o2MHVwSDB8ofITSdtyunyhW/sH/crIHDWnuwof78OI66j3fjRy3YCQrrwrRxyV/rvja0hoSQLLrHf15vVUylQ+EQU0WeY3Vted0qcyjsVGe0q+Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUqpLh03; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUqpLh03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752537641; x=1784073641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pWPDZWuzJAcb4UtE8e1F66u33hIBqAnjDtre40iR9l4=;
  b=BUqpLh03pLkpx88NjbCYgRqOSfSz+IkfHCQWR6tEDxmLf2YJ/TtYp29U
   Szotj4woJKDM8q8PHfVtenO29onkDr2NDUTqRYVnNrf8R1BMkqUmeuUaD
   Y4mL0IocUTMJo1PaRLgkZ3cmpGhIVOS6Ihj1qsLvxigEJEuZaZpgOjwV9
   SpQCqZ0BRN0lxpy97LDKCb5SWSztYSrKHqwfkWAumiqtxMuy2s4WjFO8o
   oVHno9be2frG8bdJcWNrmtoWfqZ/FFgUT/KqUheEPr9AUj9uecHHI5xd5
   jWopv5783VSghbfgV/seKC1CNxkL4rJNgu5F4JNxg+wfAXl6xzis5mifP
   g==;
X-CSE-ConnectionGUID: Ww2N1m0KQ8Gee4WXQZdTXQ==
X-CSE-MsgGUID: SoSUEHt9SK+UJair8+vtBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72193725"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="72193725"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 17:00:40 -0700
X-CSE-ConnectionGUID: vp7XRqT0QCiLyKNH82GLpg==
X-CSE-MsgGUID: k7Gaul6cTN24YydgvO+wZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="194228058"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Jul 2025 17:00:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubT64-0009SJ-06;
	Tue, 15 Jul 2025 00:00:36 +0000
Date: Tue, 15 Jul 2025 08:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-06 9/9]
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6800000
 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202507150736.3OdOxiFS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-06
head:   233cd6b58e4f649fb1ae02fb654ee3c7b0cea9f1
commit: 1bd81d785dfc6b8d2e4911acc527c181a88a51d0 [9/9] dt-bindings: net: renesas,etheravb: R-Car V3U is R-Car Gen4
config: arm64-randconfig-051-20250709 (https://download.01.org/0day-ci/archive/20250715/202507150736.3OdOxiFS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150736.3OdOxiFS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150736.3OdOxiFS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,r8a779a0-cmt1' is not one of ['renesas,r8a774a1-cmt1', 'renesas,r8a774b1-cmt1', 'renesas,r8a774c0-cmt1', 'renesas,r8a774e1-cmt1', 'renesas,r8a7795-cmt1', 'renesas,r8a7796-cmt1', 'renesas,r8a77961-cmt1', 'renesas,r8a77965-cmt1', 'renesas,r8a77970-cmt1', 'renesas,r8a77980-cmt1', 'renesas,r8a77990-cmt1', 'renesas,r8a77995-cmt1']
   	'renesas,r8a779a0-cmt1' is not one of ['renesas,r8a779a0-cmt0', 'renesas,r8a779f0-cmt0']
   	'renesas,rcar-gen2-cmt0' was expected
   	'renesas,rcar-gen2-cmt1' was expected
   	'renesas,rcar-gen3-cmt0' was expected
   	'renesas,rcar-gen4-cmt0' was expected
   	'renesas,rcar-gen4-cmt1' was expected
   	from schema $id: http://devicetree.org/schemas/timer/renesas,cmt.yaml#
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: can@e6660000 (renesas,r8a779a0-canfd): Unevaluated properties are not allowed ('channel2', 'channel3', 'channel4', 'channel5', 'channel6', 'channel7' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6800000 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a7742', 'renesas,etheravb-r8a7743', 'renesas,etheravb-r8a7744', 'renesas,etheravb-r8a7745', 'renesas,etheravb-r8a77470', 'renesas,etheravb-r8a7790', 'renesas,etheravb-r8a7791', 'renesas,etheravb-r8a7792', 'renesas,etheravb-r8a7793', 'renesas,etheravb-r8a7794']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a774a1', 'renesas,etheravb-r8a774b1', 'renesas,etheravb-r8a774c0', 'renesas,etheravb-r8a774e1', 'renesas,etheravb-r8a7795', 'renesas,etheravb-r8a7796', 'renesas,etheravb-r8a77961', 'renesas,etheravb-r8a77965', 'renesas,etheravb-r8a77970', 'renesas,etheravb-r8a77980', 'renesas,etheravb-r8a77990', 'renesas,etheravb-r8a77995']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r9a09g011']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,r9a07g043-gbeth', 'renesas,r9a07g044-gbeth', 'renesas,r9a07g054-gbeth']
   	'renesas,etheravb-rcar-gen2' was expected
   	'renesas,etheravb-rcar-gen4' was expected
   	'renesas,etheravb-rzv2m' was expected
   	'renesas,rzg2l-gbeth' was expected
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6810000 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a7742', 'renesas,etheravb-r8a7743', 'renesas,etheravb-r8a7744', 'renesas,etheravb-r8a7745', 'renesas,etheravb-r8a77470', 'renesas,etheravb-r8a7790', 'renesas,etheravb-r8a7791', 'renesas,etheravb-r8a7792', 'renesas,etheravb-r8a7793', 'renesas,etheravb-r8a7794']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a774a1', 'renesas,etheravb-r8a774b1', 'renesas,etheravb-r8a774c0', 'renesas,etheravb-r8a774e1', 'renesas,etheravb-r8a7795', 'renesas,etheravb-r8a7796', 'renesas,etheravb-r8a77961', 'renesas,etheravb-r8a77965', 'renesas,etheravb-r8a77970', 'renesas,etheravb-r8a77980', 'renesas,etheravb-r8a77990', 'renesas,etheravb-r8a77995']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r9a09g011']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,r9a07g043-gbeth', 'renesas,r9a07g044-gbeth', 'renesas,r9a07g054-gbeth']
   	'renesas,etheravb-rcar-gen2' was expected
   	'renesas,etheravb-rcar-gen4' was expected
   	'renesas,etheravb-rzv2m' was expected
   	'renesas,rzg2l-gbeth' was expected
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6820000 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a7742', 'renesas,etheravb-r8a7743', 'renesas,etheravb-r8a7744', 'renesas,etheravb-r8a7745', 'renesas,etheravb-r8a77470', 'renesas,etheravb-r8a7790', 'renesas,etheravb-r8a7791', 'renesas,etheravb-r8a7792', 'renesas,etheravb-r8a7793', 'renesas,etheravb-r8a7794']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a774a1', 'renesas,etheravb-r8a774b1', 'renesas,etheravb-r8a774c0', 'renesas,etheravb-r8a774e1', 'renesas,etheravb-r8a7795', 'renesas,etheravb-r8a7796', 'renesas,etheravb-r8a77961', 'renesas,etheravb-r8a77965', 'renesas,etheravb-r8a77970', 'renesas,etheravb-r8a77980', 'renesas,etheravb-r8a77990', 'renesas,etheravb-r8a77995']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r9a09g011']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,r9a07g043-gbeth', 'renesas,r9a07g044-gbeth', 'renesas,r9a07g054-gbeth']
   	'renesas,etheravb-rcar-gen2' was expected
   	'renesas,etheravb-rcar-gen4' was expected
   	'renesas,etheravb-rzv2m' was expected
   	'renesas,rzg2l-gbeth' was expected
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6830000 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a7742', 'renesas,etheravb-r8a7743', 'renesas,etheravb-r8a7744', 'renesas,etheravb-r8a7745', 'renesas,etheravb-r8a77470', 'renesas,etheravb-r8a7790', 'renesas,etheravb-r8a7791', 'renesas,etheravb-r8a7792', 'renesas,etheravb-r8a7793', 'renesas,etheravb-r8a7794']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a774a1', 'renesas,etheravb-r8a774b1', 'renesas,etheravb-r8a774c0', 'renesas,etheravb-r8a774e1', 'renesas,etheravb-r8a7795', 'renesas,etheravb-r8a7796', 'renesas,etheravb-r8a77961', 'renesas,etheravb-r8a77965', 'renesas,etheravb-r8a77970', 'renesas,etheravb-r8a77980', 'renesas,etheravb-r8a77990', 'renesas,etheravb-r8a77995']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r9a09g011']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,r9a07g043-gbeth', 'renesas,r9a07g044-gbeth', 'renesas,r9a07g054-gbeth']
   	'renesas,etheravb-rcar-gen2' was expected
   	'renesas,etheravb-rcar-gen4' was expected
   	'renesas,etheravb-rzv2m' was expected
   	'renesas,rzg2l-gbeth' was expected
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6840000 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a7742', 'renesas,etheravb-r8a7743', 'renesas,etheravb-r8a7744', 'renesas,etheravb-r8a7745', 'renesas,etheravb-r8a77470', 'renesas,etheravb-r8a7790', 'renesas,etheravb-r8a7791', 'renesas,etheravb-r8a7792', 'renesas,etheravb-r8a7793', 'renesas,etheravb-r8a7794']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a774a1', 'renesas,etheravb-r8a774b1', 'renesas,etheravb-r8a774c0', 'renesas,etheravb-r8a774e1', 'renesas,etheravb-r8a7795', 'renesas,etheravb-r8a7796', 'renesas,etheravb-r8a77961', 'renesas,etheravb-r8a77965', 'renesas,etheravb-r8a77970', 'renesas,etheravb-r8a77980', 'renesas,etheravb-r8a77990', 'renesas,etheravb-r8a77995']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r9a09g011']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,r9a07g043-gbeth', 'renesas,r9a07g044-gbeth', 'renesas,r9a07g054-gbeth']
   	'renesas,etheravb-rcar-gen2' was expected
   	'renesas,etheravb-rcar-gen4' was expected
   	'renesas,etheravb-rzv2m' was expected
   	'renesas,rzg2l-gbeth' was expected
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: ethernet@e6850000 (renesas,etheravb-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a7742', 'renesas,etheravb-r8a7743', 'renesas,etheravb-r8a7744', 'renesas,etheravb-r8a7745', 'renesas,etheravb-r8a77470', 'renesas,etheravb-r8a7790', 'renesas,etheravb-r8a7791', 'renesas,etheravb-r8a7792', 'renesas,etheravb-r8a7793', 'renesas,etheravb-r8a7794']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r8a774a1', 'renesas,etheravb-r8a774b1', 'renesas,etheravb-r8a774c0', 'renesas,etheravb-r8a774e1', 'renesas,etheravb-r8a7795', 'renesas,etheravb-r8a7796', 'renesas,etheravb-r8a77961', 'renesas,etheravb-r8a77965', 'renesas,etheravb-r8a77970', 'renesas,etheravb-r8a77980', 'renesas,etheravb-r8a77990', 'renesas,etheravb-r8a77995']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,etheravb-r9a09g011']
   	'renesas,etheravb-r8a779a0' is not one of ['renesas,r9a07g043-gbeth', 'renesas,r9a07g044-gbeth', 'renesas,r9a07g054-gbeth']
   	'renesas,etheravb-rcar-gen2' was expected
   	'renesas,etheravb-rcar-gen4' was expected
   	'renesas,etheravb-rzv2m' was expected
   	'renesas,rzg2l-gbeth' was expected
   	from schema $id: http://devicetree.org/schemas/net/renesas,etheravb.yaml#
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: mmc@ee140000 (renesas,sdhi-r8a779a0): compatible: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
