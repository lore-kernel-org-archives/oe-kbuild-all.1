Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54608417342
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092379; cv=none; b=VhZNXqMxWCcm8UDJfjkQPsVSatSnmMv8NZMMNzkbyL78LWxN8sUOOCcWwUUEQcX2cSk0WBKlPh4kP+EzRC6eL8ZlvvH1zYpy5Mi6jywgEQBpZ/MM6HzEiwlJ3tuNKMoC8jgV7VlYLyW7VFNz/wQINe6sy9WghfjN3fLQwEbds2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092379; c=relaxed/simple;
	bh=q72dfMto2H9k5CgU07ACQMAWpo99WoFvfPSY3fgiiYw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OOTxRmMeOHRfzvoGy7n4/3MAyDf9dy9w9vi6rKkowlVT/Hc1V+NsCF27tvzqlZT3ACYAgGWmeQ0jFoscc3XZEHwTIV9Q8anX6j5K9gBTpePXxn/LmgretUSEtJvQAFocc7iTCyM+dliPBBLEIIS8teDj41DndILAKPi4lD2x0Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKf4WT61; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKf4WT61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092377; x=1814628377;
  h=date:from:to:cc:subject:message-id;
  bh=q72dfMto2H9k5CgU07ACQMAWpo99WoFvfPSY3fgiiYw=;
  b=OKf4WT61wWj5x42dxWfhRjgTaz5OjZBYlzGvjPrXOkyawjQpKoTrfZbz
   Ap1F8S7QIDbmj1FiVZS+Pm0U20Ysc2N1wTGkL+eqx4KOE+fLcyS2K0dwG
   5sX6OQ25YOsAu5QCr/H5IRm93RhBdjpe8ZPT5UWxppzrMRMAbvY+k3TGe
   UcLty2s5KnAG/zZO77yffUTJGnCSVA0fstDXjk9fhNK0EOh0oThhdF1tg
   7Bdo2w8Ft+7XpxrfZ2+sATP6Wzwm2mTFg9zutdlq3NgdTbwEP82r+IyV2
   xr+gtEUjTqrAugOljwsLCKWuJW1CUtq5d9UFXMqqJ7+rG0J+OE87ug8F0
   A==;
X-CSE-ConnectionGUID: hqshtD29RiqW2j10hd6lEw==
X-CSE-MsgGUID: ypRRExbFQ92Wqkqm7eieHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95352295"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95352295"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:16 -0700
X-CSE-ConnectionGUID: V9Tk0trdT+SPpPHcIYznIw==
X-CSE-MsgGUID: T7yzDAksR/eNvMNAaGr/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="257466981"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 03 Jul 2026 08:26:14 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wffmN-000000001XV-3qJZ;
	Fri, 03 Jul 2026 15:26:11 +0000
Date: Fri, 03 Jul 2026 17:26:08 +0200
From: kernel test robot <lkp@intel.com>
To: Eduard Bostina <egbostina@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [krzk-w1:w1-next 2/3] htmldocs: Warning:
 Documentation/w1/masters/omap-hdq.rst references a file that doesn't exist:
 Documentation/devicetree/bindings/w1/omap-hdq.txt
Message-ID: <202607031709.owfUeGBJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-w1.git w1-next
head:   487eca6535cab91944ade06a155e9d789591a1e5
commit: e89bccb295a8880493693e69e091a3668dc0c279 [2/3] dt-bindings: w1: Convert HDQ One Wire to DT schema
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260703/202607031709.owfUeGBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031709.owfUeGBJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>> Warning: Documentation/w1/masters/omap-hdq.rst references a file that doesn't exist: Documentation/devicetree/bindings/w1/omap-hdq.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
