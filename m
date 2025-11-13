Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FCB322A13
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 21:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069060; cv=none; b=QMVDqEPW4nLg+eG1/s6CTVj0uOj+b6bGQ/hKMoZtwgQv0jMeRBUBaBpsWl6XmKdPr11RYXtPNTUfItYFUCWgvVMwrC98Xy/NNYdP9XzJY/k2ybXMCEiFDoMlhqQAN+D7VDYqltzmGBV9DTK4ybkx1XEz95l1RQwXfU/YqQBCyBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069060; c=relaxed/simple;
	bh=+BnORYG3sRbRZCpnzo8Mf8Q2/JiW/8EqxZdFJI3axvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NE2SJnqQJYRYWmSpPiLM6xieW0UFMe5Fq4fzNDVw8Huqbl47PhD7etYXQfad/FV9Wkz+P5n1TuFIvYATBbZavXG/Ey5OyKd96DUnMOOV0phZ0IqOK4CgUlHpm1dxFjwe5qTI3lmEPwlQWpcxNgcDwC0/qhW3VUNnvbNCXORcqeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kgdz8siQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kgdz8siQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069059; x=1794605059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+BnORYG3sRbRZCpnzo8Mf8Q2/JiW/8EqxZdFJI3axvM=;
  b=Kgdz8siQRi/I4OcJCbYGLmc1rLvWhVlmjQJii63rze9bEYDRwq3YIi24
   DPfzAo9VP35roNhdX2qT2uIjOHtr7TC85qflcgWXS8lY6FyLC5pMPbDeB
   3KsFuoLOX2/hY9Ji29EMhyzJeFDtJ3vTU9ytm1iI13bQD5OsjIKT0jOiN
   O7XyqvGRiSMCRnlCrlOolZvF6arwlNhSd//sa3YyFZv8wvEZuEII0x+rX
   5Q0UUe3pHVbnZPlGBu5IJ5/B+n4NisUEVN63WeF3Lb6Qm8Zlb2fqf37Mt
   KZ/vRIGDIS9P/3f4BnFCyPh+zBNjuQ49sapDL2EdHQsLgH3t8RrHG2OWS
   g==;
X-CSE-ConnectionGUID: EHR1SxHCQHiqs09AWauHSw==
X-CSE-MsgGUID: puoMXsrYQO21BrAIY6uGbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="68790222"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="68790222"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:24:17 -0800
X-CSE-ConnectionGUID: mVTiNMhnRDONGKdwKfKEkQ==
X-CSE-MsgGUID: lHfkM51qRW2g5q+yagFYUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189856575"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2025 13:24:15 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJenc-0000000017N-3plK;
	Thu, 13 Nov 2025 21:24:12 +0000
Date: Thu, 13 Nov 2025 22:23:47 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: [broonie-misc:asoc-6.19 31/44] htmldocs: Warning:
 Documentation/devicetree/bindings/mfd/da9055.txt references a file that
 doesn't exist: Documentation/devicetree/bindings/sound/da9055.txt
Message-ID: <202511122044.M5cztcL6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-6.19
head:   4d6e2211aeb932e096f673c88475016b1cc0f8ab
commit: 4acbfcf11cbe6c46c42091b49875c7002b0bff3d [31/44] ASoC: dt-bindings: consolidate simple audio codec to trivial-codec.yaml
reproduce: (https://download.01.org/0day-ci/archive/20251112/202511122044.M5cztcL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511122044.M5cztcL6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arch/arm/keystone/overview.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/keystone/keystone.txt
>> Warning: Documentation/devicetree/bindings/mfd/da9055.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/da9055.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/trace/rv/da_monitor_instrumentation.rst references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
--
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/sphinx/parse-headers.pl
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
