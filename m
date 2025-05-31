Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2F812E5D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 03:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748661330; cv=none; b=dCBk4WJqoLKt5awBqtviGgYCadWPFnJSRlxOXTKHebpI4+S3guqJrDy289NsMVqMzbp88iWzLmbHBb8qaI3Yn3mh2AQj3HUO/OwH9/vVKsx1X8RlqErXYqoIIT6vDOcx1KIMj4Nj/SZMEz+0/1mR19P/tNGiVNEs91j0McXUc2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748661330; c=relaxed/simple;
	bh=6cAlrrie4PwiMDKTK2oXJ2uZw93/xAwVC+xHZ3Z00Os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CeEsyAZ6GNSpK3IX1NtmB7gPPvrfZXlWa+KAUBuhhrH496uzvH11DOp7ozA9iwJMfN/js09xkB8XIuVDYiVqRjJQQTb/hc8wiD28EZZoc8FjPuF18aqM6TniBE4CBdcUlKe54XbbW+5P0wX0Ql+omtDsiOHjrU9AcyUbs4NTZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4Lb/05X; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4Lb/05X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748661328; x=1780197328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6cAlrrie4PwiMDKTK2oXJ2uZw93/xAwVC+xHZ3Z00Os=;
  b=T4Lb/05X06zR3IEI6I9mJA8CJ+F+6l1UoiG17vbdenjKIQRqK9VGPUI1
   MI5i/M9Xleib3JLdY9sPCqPN6cW7qxFsutUxenYtiBbgL29PWHoLX1r8A
   QmmglKwvWyx+H+4YHVMB0ks9WUgxQV4U28yOPaRfAPsBOq2ABo8Ekj94G
   opRzKkmYsYRGlpd6o0af1T5HeNwY5DZ4ptmW5YPxU+WEgpyhx7JlR4ANM
   povBXIFO5o0df6wSkMplhfDSUj0fr12fssfD6cBff8nPHF0a1mJLARiES
   rzFQAXt8cSTIcGCEHDLKOrIK5bgDA2ebfuDICkrIF7FEJmFh71KbLpiMO
   g==;
X-CSE-ConnectionGUID: JgCJvWsHTBW5y0+34Sq+Jw==
X-CSE-MsgGUID: j8TLEbe/TYa370+JYBdn+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50857998"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50857998"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 20:15:27 -0700
X-CSE-ConnectionGUID: w7us4kmmTDq4Utt2kfMRLA==
X-CSE-MsgGUID: offny/lXQbOthfn1IjVrKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144688372"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 May 2025 20:15:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLCgt-000YAG-2P;
	Sat, 31 May 2025 03:15:23 +0000
Date: Sat, 31 May 2025 11:14:35 +0800
From: kernel test robot <lkp@intel.com>
To: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Sahil Chandna <quic_chandna@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [linux-next:master 10072/13986]
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2
 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
Message-ID: <202505311156.VMtrBeWr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3a83b350b5be4b4f6bd895eecf9a92080200ee5d
commit: 6a563a9760af9d5476faf8b3fd419b0714ab0b4b [10072/13986] arm64: dts: qcom: Add industrial mezzanine support for qcs6490-rb3gen2
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250531/202505311156.VMtrBeWr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311156.VMtrBeWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505311156.VMtrBeWr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
