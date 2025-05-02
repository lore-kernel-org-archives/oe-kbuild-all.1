Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78709267395
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 07:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169712; cv=none; b=BH22XLQy5fVsoHN2k9imF4nyPcvgTUDY6o668uAUI55yOPuITMwpWyVk/efHJjrd9zInbWx/55QyAdsH1ZU6BJDW+bfh3lk04mzkdsYeFsKjX+BPxyicFAHrIqWyeQhN8gbA77rXMwNtPDKIAEmuaAO17rgYrhL5GzcPIswW8/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169712; c=relaxed/simple;
	bh=9S2WjA6k7mOWQgmcdNgM8oS1sRzr6cHPt3EHGiYEcRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UqozfYwH9r6D0B0NuURAv2yEnwGORePhB0mBniWh43N5tfsKHK0jAhPh2qZVyxSXZWVV4rM/jWSF/p9cvuVUUwCmhTRwngDIbn0iU2Va6N+Ay44nAwGrW3CcffHKrJl3qxIVPm++4lRV80jEgdk2H+gmBTcIjB681rX2K1tdm30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBu+BtZg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBu+BtZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746169711; x=1777705711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9S2WjA6k7mOWQgmcdNgM8oS1sRzr6cHPt3EHGiYEcRk=;
  b=IBu+BtZgRgl2asl8nzJVCsquYxG6ea0xL+GPnRSPkzbXOugy0Kx1NDCa
   gm9EQ5cYLFELhPNXln8lKWgIIqm9al7EbCs1lAWnVocXqAMyQAsN2Se/N
   PXzTyosRXLJ4RJu6svllFwSUcG9mMNGCGlnALYZG/iIAJhUb2uKwO+ovy
   FpvGfurnUx/Xyx+Nc1qYZMAmamCGPMFNldk2fcG+jx0XlRUxrwuWCzeWi
   iknontpTQkLj5+8J3f3w8zyNCx5u/MS0XozerkqCsGiRpmb8HXqLYR/eu
   H4xQsyFXyYVuvmEu8o7vD2TqWHz6a7Kuc5izkWsK8h6ly72BIvoIk+sw2
   w==;
X-CSE-ConnectionGUID: 587CXnHzTHiylTAV/704jw==
X-CSE-MsgGUID: i0RL2861SYK5JNU8Oyn34w==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58057516"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="58057516"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 00:08:27 -0700
X-CSE-ConnectionGUID: t92nldQLTi+LG6lBzY8TWA==
X-CSE-MsgGUID: IYwONpQwSaC7LL7p9MFSGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="134325699"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 May 2025 00:08:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAkVT-0004b5-1G;
	Fri, 02 May 2025 07:08:23 +0000
Date: Fri, 2 May 2025 15:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert-irq 8/44] htmldocs: Warning:
 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml references a
 file that doesn't exist:
 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
Message-ID: <202505021551.YtefY5bm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert-irq
head:   271e22adde83e0cc6fce40f70c5f660bf1a8e2e3
commit: 357dfc0976c9d5cd147b50d1d44d98ea75e3ff38 [8/44] dt-bindings: interrupt-controller: Convert aspeed,ast2xxx-scu-ic to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250502/202505021551.YtefY5bm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021551.YtefY5bm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml references a file that doesn't exist: Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
