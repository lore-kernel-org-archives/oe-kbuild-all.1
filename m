Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9950E2DECBF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 02:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773194689; cv=none; b=V+E5x1pqIRbqGk0OKkWHwlp2fTRhjBpr9c+Z/Em/yuzKdwD+HdrLND1k3h74Qs04rJVcVW/R6nBhCI4RkuIvQv9l7h8Jqkt/PDG33zsiSYJc3Be/dv8L1HE1nVNWxV/094BF6ccOjZ5Ob4S0U8etm5740vMtogjyasLtUh6XllY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773194689; c=relaxed/simple;
	bh=KJPClGjrGDJGI/US/RgywCmid/NQe7P3mmNQBYCDdUw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YhWZC8+8mFurV5zK3zKwZz4PAq4LIgSyEiCJ+8z87e9yf0alebHG6hKJ962UnYnU50wOo62VkHmBj+jme7eatWw0tWpdDZj23m0+xEaxcqpZ361E/zLffdV77FytBsdLKrRv6yPpIBFd1ZQ9l0adeAWkETXG226+Bhi9Hfu/4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzjbtA/n; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzjbtA/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773194688; x=1804730688;
  h=date:from:to:cc:subject:message-id;
  bh=KJPClGjrGDJGI/US/RgywCmid/NQe7P3mmNQBYCDdUw=;
  b=jzjbtA/nSM8bHCxfmL75EMVyb51Z1ubm9R0qU1N342j55m09Ef7E8gcK
   WFYZzoicC6YdRxtJqxvRC4T9PbAlv9Uk4cn0FVW70J1ssfda4Hyp/2TvU
   Y1XPyG47tPPk5ayZlDXlubqCtJcj6ycEAKKD8RVOUg4M9tk/1zkTKr6xc
   i2UwR/2/YM1MFtIPFvS8zt24s2P48ZC+TemH/VrdgR27n5Cn4xjc7Dyfc
   aXRP6wiIXkzIIpEIn63eLTE8EyuLL4Gdrvx2UyJFK7d8pJ/+Jler3+0Z5
   LoABo2YZfDQtFAJrRCvlI9dw/ukPK2LPd+oT1y/Le1+2r7nUKNXojIKX+
   Q==;
X-CSE-ConnectionGUID: 3i2ppFRnSQ6yxFtWLs52rg==
X-CSE-MsgGUID: XX18N+r0TjewIykI6wocwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="99721422"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="99721422"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 19:04:48 -0700
X-CSE-ConnectionGUID: wkvlfFqQR+SKRvoj4fk7LA==
X-CSE-MsgGUID: 1mT2grhESIqUgE9B3ZJs+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="243320116"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2026 19:04:47 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w08wG-000000003Bx-3OoZ;
	Wed, 11 Mar 2026 02:04:44 +0000
Date: Wed, 11 Mar 2026 03:04:20 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 1/621] htmldocs: Warning:
 Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references
 a file that doesn't exist:
 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
Message-ID: <202603110210.9c5GGinI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: c04af4dfbfc866e054659323f79bf47a1e577e2e [1/621] dt-bindings: reset: Convert ti,syscon-reset to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260311/202603110210.9c5GGinI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110210.9c5GGinI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/leds/leds-lp5812.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-led-multicolor.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
