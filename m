Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094CE39AFD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 18:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714071497; cv=none; b=i9oI/nIjH+V2+dGJH33rNkg3yv84MiX0R5YGDgaIhw2h3cn4FcoDbx52bxUGnqTPKWIVbgbQ/O0B2WjUNpwu5QzDiFRT++RaKP09QYNfrthKoe7ts/o5aCyC21IZbrlG9b9KMINAgpnDE15vVfeZ5bf/PdIKuNNY9P+/662QYdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714071497; c=relaxed/simple;
	bh=M5s9gs+Sw3xbt8BJ171Mpd1/64chkwF32mrYHAAIAVY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yc+kLfcllfJ0dXr1qMN7ncTGaph9ulQoyNYwGjSZZDaU233Q31ckGqYtUDohR15549pZJVsJ/Ex0LfE8NH+4p3Ptr01nRXe8Z7IVW3eOO39zX86saO4oPTYVDXbtUmiO9IQUl6JUagcMFqzWfG3+Wy0+GlM5FZuFunBc5U7RSSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYfutPF3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYfutPF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714071495; x=1745607495;
  h=date:from:cc:subject:message-id:mime-version;
  bh=M5s9gs+Sw3xbt8BJ171Mpd1/64chkwF32mrYHAAIAVY=;
  b=bYfutPF3rnJeGydaTdu2yOtJOEp4x3d074v6Mvqm9eBRw6onZSExxJp2
   UKGdiG+5+zzZz6W2HK0FLgl9xAudzz4rKehATEn1W/HSArHF3bY4InL5r
   7YA7Acx2HwQeL7i7P4oFKNYr5PCNBoOMe1jxWMFV2WwK9HezUq3nvVY7f
   Mm3J7DqwCSpomu3oEHiMYoGNyHZi56kxz/uHoyXla9T3aFVLxtdSnRdWV
   ctCv32tnHYX5zdU6KCh8IZHYZPqE+y5WkR0T8TWpeCxQWYGM022lT3PHE
   ngJnlKZ8+LzXtdJFUl59wMWtY40F81XpARDYhjSp9AQet17HGOOQ7UCrU
   g==;
X-CSE-ConnectionGUID: aDq5JL4DR/ON+PaaEf0thA==
X-CSE-MsgGUID: zLyYoQkNSSSgPwk1ydbeYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13570959"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="13570959"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 11:58:13 -0700
X-CSE-ConnectionGUID: X5NFX8lsSTyz/CgEu1xsVQ==
X-CSE-MsgGUID: 5jDZgTLnQGK8EnFP26B/DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25667577"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Apr 2024 11:58:13 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s04IM-0002k4-01;
	Thu, 25 Apr 2024 18:58:10 +0000
Date: Fri, 26 Apr 2024 02:58:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 19/22] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/media/i2c/ov1063x.yaml
Message-ID: <202404260200.e56QAplk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   2e423244f8c09173a344e7069f0fe2bdf26cccee
commit: 1d2f40c03c3b1d45809a245d79913b28c613f297 [19/22] dt-bindings: media: Document OmniVision OV1063x driver
reproduce: (https://download.01.org/0day-ci/archive/20240426/202404260200.e56QAplk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260200.e56QAplk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da90*.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/i2c/ov1063x.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/cnm,wave5.yaml
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using sphinx_rtd_theme theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
