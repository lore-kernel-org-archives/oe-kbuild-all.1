Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4D613F43A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 03:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733975857; cv=none; b=az4IIBAO9t7o8fhbJTCe7dIVu8pzEIXjKfZg5xz70HyFXLPGGOHvjh8D7vQyNHv4VhIqvY2RyJB83MeScdEXXAzjKpTiomSV/phuufGfbVwU4DKiJ+fehR2JKV2d0uIn1TI10LS2myXi2y50GuXV/TZxW1skm4WgnEc0uu51EEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733975857; c=relaxed/simple;
	bh=avMpD592FGSIqWpnDK8lZI/BfHdGwNE1wij+bKUI/hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GjtpI+AxC403Kxl1/v54AGIYX6KPVefMF2pYk0e+3h+blAVR8YcsOnbEcpbyGphksG2M7jVH+vOBpR4IFgbjRZrdZc8bvjCe3TxUczK+4SozCMnwintv6NMDbYD4nk5OyJRoWgNlbi14D6Rkryi8GzjImqq/fZwZyUtONtSa/+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4Vv6p/f; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4Vv6p/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733975856; x=1765511856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=avMpD592FGSIqWpnDK8lZI/BfHdGwNE1wij+bKUI/hk=;
  b=c4Vv6p/fYFQqaL/H9zWkkUMitqBBofN7WIsnkLjHRJp8hxv4Ja6HA1I9
   6v3M3aTWUOdotmK8t58nruLNK5fG18Eb6LrQyDtvaqEn1xtB2f4a7Plto
   zeKW2NW2xumGAYA1bjGTro3363omY5k2Gl3gzt9M7x7wskGlh7dum3yMF
   QAVFiIQ0wWMQLvxLVwjyceWIdl6lp4qY5mAhe0ylf+1c9EySZn88OCKIl
   FfFOyWgQ7h8k8WNuc3AI8kCCTQTXgQQC4OrC+F9fCX+pOOfH4DHlpjzFN
   dTBfcBf0OiQK2G9EbpE1QhEIGPR9hZVwMV9gs2phZEJm8juqDANaCtgnk
   g==;
X-CSE-ConnectionGUID: K6nRWjEPSY2P9eGhlijxWQ==
X-CSE-MsgGUID: qh/j05fLTGuMDC+Cw2ZEfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59775534"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="59775534"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 19:57:33 -0800
X-CSE-ConnectionGUID: SyfjpiAYSwuUo10Q1tWRgQ==
X-CSE-MsgGUID: ymsTvsHtRO2xh1apqd/ZsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96530181"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2024 19:57:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLaKP-0007PZ-0m;
	Thu, 12 Dec 2024 03:57:29 +0000
Date: Thu, 12 Dec 2024 11:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [ambarus:acpm-v4-upstream 3/10] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml
Message-ID: <202412121157.66Uo82V3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day acpm-v4-upstream
head:   a7e0ce0f6a033307db912fc77b1bbb7c3e1df757
commit: 26c389f00b6244f87b078f93a9403c8549c53505 [3/10] MAINTAINERS: add entry for Samsung Exynos mailbox driver
reproduce: (https://download.01.org/0day-ci/archive/20241212/202412121157.66Uo82V3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121157.66Uo82V3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
