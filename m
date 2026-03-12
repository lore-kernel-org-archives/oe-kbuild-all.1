Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D13C186A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773300786; cv=none; b=VZzkZGTcdOiBXZaSjr/xAI4wtig43VIB27f0/EYFwvhLgnxkworvM6PbBwuC9hZrpMiSuZleg2MOnA1ulg7hIL/4yXet5Kl1x5bDbV2VvoDdHUBLQPIRDoQNuTsvdLnZEro8l4i1n4p5tYYHQ5se5qhnjnlny3PmOlYKP8oNtBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773300786; c=relaxed/simple;
	bh=uIQE2Ng0WkLUmEvt/HShshELdlqr0fFGOCe2M1ZqkaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B2q3sWX8Ty/i4uwiOtUsZGjOXm4f1csQSZSELIe0WwjT8oQ75Z6x5XvvtY23AYQ9Z9a4WaU2YtfEfv7zd+z+xnHsDwn+yDDDP1qNmwgoMYoeB0NRbC/oq8IcCrOiL0K6MLPzjZrQN1gRNsuKCwzpjGvq+aefzJML1RdXr/a52Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6I7nWgs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6I7nWgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773300784; x=1804836784;
  h=date:from:to:cc:subject:message-id;
  bh=uIQE2Ng0WkLUmEvt/HShshELdlqr0fFGOCe2M1ZqkaY=;
  b=l6I7nWgsLI2T78BeNNWAxxFCag6tMR0j6hxzvnEsRFekxiYRmkMPSL/Z
   uNQ0CJVoC/TlUW43eO4I8SKqcX2lvzU+8ujBHzcy5MhmAwfgcSjqPLItG
   9/OsGWO9avdT4y2GD4EjFqc8XXi7qEFvI8AhKr6zkGgx8nKS+1pgkhONH
   7Dnb7LK0ws6ad7+pkQ4x3PCn/K1VwWxINSRwOCqn42JOA1mSHl7EGyASK
   PN76jtO41i7QZWrH3IF4+d50VbD6q6a5aOJG7l3RvXAwv6QoLr6DzT3Nf
   OXx5iEvPQ1CbnQBzOpN8tmMXzd7oEJPMSRGF/2oCPPcbHpd6P4wJs+TJm
   g==;
X-CSE-ConnectionGUID: TedTs5/2TcqqjldepJhRGg==
X-CSE-MsgGUID: Oud+Ji1YQ26ZQ9OO131dXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78274161"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="78274161"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 00:33:04 -0700
X-CSE-ConnectionGUID: xOnmFeZ2THC3be7AdbXYUQ==
X-CSE-MsgGUID: oOThZ6mURMeCAxKxVLd9Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="220678177"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2026 00:33:02 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0aXT-000000003TZ-44q6;
	Thu, 12 Mar 2026 07:32:59 +0000
Date: Thu, 12 Mar 2026 08:32:51 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 54/621] htmldocs: Warning:
 Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references
 a file that doesn't exist:
 Documentation/devicetree/bindings/clock/keystone-gate.txt
Message-ID: <202603120825.rOCzVqfG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: 06707c22f1a1242d27f854a02ef7edd365d176aa [54/621] dt-bindings: clock: Convert ti,keystone,psc-clock to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260312/202603120825.rOCzVqfG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120825.rOCzVqfG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
>> Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/leds/leds-lp5812.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-led-multicolor.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
