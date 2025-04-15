Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE05B292907
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Apr 2025 11:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716647; cv=none; b=D4Pvx9kXVrr4am6wnBlVg8OVa0Cgt4JWqQpJUGWpwktin/F2Ht9r2IwHbMBiAaFZ0lRbC5BU6bOnd2bPmgF319UGPtrPNVCTR8gwyn8J7TqLFns/moX7msYYrxZr1ngKrwiBjzsoa9mubuRTWf5umLJHhGTg4Lnot1PJGxhNwbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716647; c=relaxed/simple;
	bh=c3z5ccriEVPjarGob2HVFGrL98tv6tcf6bH/VEudxTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BYmfNqYqmVcdZlHI77fEtYDj3FiL+R5YnBqzhGJJk/CaJVCx54BWKeMhbDXTPaGCIbmBjDHyTOw+Y0LVqDvkWTq6d0Ed+7n1UcH0egCcLlfxErRDREh+IbzCA91iuIKqRdvy+P1uAFmHHBCOS4tX9bQmoE0m5psXcWb5oKr3UvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOmqik7r; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOmqik7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744716643; x=1776252643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c3z5ccriEVPjarGob2HVFGrL98tv6tcf6bH/VEudxTo=;
  b=iOmqik7rK7fqymY9hrRg9N7gyY4EwPtnVL0IDYi/ITd7yJN9R3Rb2wpq
   2uSoD/K73nfVL5rpkPnFSfL9gKomIHsAePrRh72pIu32wCEb8SXl+6rsc
   PKh7/NdIce1KpnvfSwq0QlXUDIyHdp95NR8Y/dVNGD/8EnCG/x4wXYXcX
   NDYlasNG3HZME72mxm2g3UYoEwIztLQl1tS9HFYZ+0OazRxhmDqrIIhU6
   VnVOJktKmdZTCVsd+1ImfQCy/L16KulxUpcRCJDkjgu9tof3LvOvmtVvD
   Jbf96obQ5KotIUHYjCJBbctZqLZ8HyXAmW1JprJoTNaWSdQi+x2hjOepE
   Q==;
X-CSE-ConnectionGUID: fhVGR+P8QXG5ujETV+EO3w==
X-CSE-MsgGUID: NJ/U1ThpQ5SI/siJqogdPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46354207"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46354207"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 04:30:42 -0700
X-CSE-ConnectionGUID: WKgzFX4PSp2PLAuZwk1lqQ==
X-CSE-MsgGUID: l1EZ6TZKQbyr3jQiBVJ8lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130060909"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Apr 2025 04:30:41 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4eUw-000FmW-2t;
	Tue, 15 Apr 2025 11:30:38 +0000
Date: Tue, 15 Apr 2025 19:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: [broonie-ci:v3_20250414_rf_asoc_add_codec_driver_for_cirrus_logic_cs48l32_dsp
 1/2] htmldocs: Warning: MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml
Message-ID: <202504151930.v1gBorQy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20250414_rf_asoc_add_codec_driver_for_cirrus_logic_cs48l32_dsp
head:   6da7663063d3316c350eed934d76fe787db9db37
commit: e54a168d41145e7d83d9d53ade47aa0da71029e4 [1/2] ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
reproduce: (https://download.01.org/0day-ci/archive/20250415/202504151930.v1gBorQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504151930.v1gBorQy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1804: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
