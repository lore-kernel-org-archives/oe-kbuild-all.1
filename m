Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50344149C41
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 00:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761611033; cv=none; b=WeRYDFqnnpo6FX/o1g+emLUSU8plyRKTSKEU5Csz6ipvCbRSz+8iMFGppv0jDnbhf9q2eJcXeLXDTIUCipaO0490nkedkQ028aBBX1yWY/qdZlUt2djhN9997+zr+j0lFDZeYS6ttS4EUtoSRdlU8yc4rAmGc22qKLHnzQvUXmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761611033; c=relaxed/simple;
	bh=mf4N/hF1K6kITnpV1kXAHZ+51WSvhz/PcDOV5XrLqFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oSPWPUm9GJmGxM064X83pol65syqxxFCRV1fvSA9Kqg+rFaLgOxqNbN9TwB0D20OfD6P0812WYNStnylCYYhRfTNbmhIN4uc8eJMU3hFr+bDDQMtQQl8qP593cjO1a5jjxin+GC0qoPIABGi6peGkmT+q1tdv2JOlQKIFluU/ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmFVkyFd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmFVkyFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761611031; x=1793147031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mf4N/hF1K6kITnpV1kXAHZ+51WSvhz/PcDOV5XrLqFw=;
  b=VmFVkyFd/Ab1d3jmVranYmG50oXEvS7b4tM4F3Eb8uHRqF6qdQGTixGv
   eglGBaXCIzZP7uWbEQbydYEaNadGRuHqPgEpGACXnVUlPg8nqSDJDoOQD
   5Idw5H6efHEvvMM1LvAr03qeTyoE05DqefUF/pE79cQZRcFg1jzn3Im61
   jvsbB0HHfrnwfQli3KKm5Ifqg+JwpQ/olfT8OKxDDTysNqi6vjagWYQWd
   bmNL8jXJvqhgdeE5vZoC2AwIcVpEFJT30s/r9UM8cKkB0Sce/cvfMq632
   DDn8WexOmUyItCkE2veoUe4T2cy47jjOmITNQHPWvClumKPFRT8QVRzHN
   w==;
X-CSE-ConnectionGUID: kJd7QbdHRP2biGIUgHclag==
X-CSE-MsgGUID: eMtVpO76SgSPuEdZhVsWlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62734257"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="62734257"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 17:23:49 -0700
X-CSE-ConnectionGUID: EWtoUHNBQh2ESeLLNudSLA==
X-CSE-MsgGUID: 8mXn3NipQfWx9kuz3lMX7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="215851892"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2025 17:23:48 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDXV4-000000000R8-0Zud;
	Tue, 28 Oct 2025 00:23:46 +0000
Date: Tue, 28 Oct 2025 01:23:00 +0100
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [linux-next:master 3615/4376]
 arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: gpu@fd000000
 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202510280139.Qkee3N0l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
commit: 0eb6f5143b1daede692ee143df604197f9922164 [3615/4376] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
config: arm64-randconfig-2052-20251025 (https://download.01.org/0day-ci/archive/20251028/202510280139.Qkee3N0l-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dfbe84da278126ac8017618af885ffc8581a728)
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280139.Qkee3N0l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280139.Qkee3N0l-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
