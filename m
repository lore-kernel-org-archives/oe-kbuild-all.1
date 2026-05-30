Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D44212542
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 04:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780114188; cv=none; b=LOerippHve8ASz26yO5q1T2Sccqx1pfGitfjBDmQ2fXQq3/3sBLM6JbiejVNSKY9Qqi4/9z3EbwcI5+VFZuGF5QLVRxgBL4EvqIr/e/rZ8DhKVdSxfV36QbmR2f9mtdtSDgZ85hvmDD0+8s6qNayoHR5l4pkZpNS72nhrnckBUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780114188; c=relaxed/simple;
	bh=wf4yi53T9ILTSvGI8MFTuhHeKb4AxLCIvsAtn/67FCk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AC+OrwNZwP339XidzdrmGzWfX+7TYqGbg1yWuVSmVuoxlfLzOkAuMfp7Spxl/9fZ5KQousg4sjRUbIRp+KmDGEjnuJW1FxwBL41mnmt2BkHiYsEvw/O9jESG3aCAhJuEa0VVJT0d90+fCtwbq29eFFv+9fuEoXH9BFZH5aS/DuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjVT+1S6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjVT+1S6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780114187; x=1811650187;
  h=date:from:to:cc:subject:message-id;
  bh=wf4yi53T9ILTSvGI8MFTuhHeKb4AxLCIvsAtn/67FCk=;
  b=FjVT+1S6euSl94ZQ385p1KJ+HifNIoa/zh6y1HDEaJqfo4fbOvq1s9pp
   9QEmNG/MdDO0aUoCQFeWFdJabW36b5Oy5oR2QdhdApEfQOMETRQiCaKCX
   OB+AsTFukLblbj6kzRBTAjkIvxIjyZMFwr6OBeo5AF/30RmhThXFDzDjG
   f06H+dVysxaCTwQySAZ+RqOXAPaAR10BvTq4BW2jqE2VmIVkkHKB2B93Q
   cU1H6o0pvYwrG1cpXYBBugfldIwoJGrjTXZ8D/JndHQKOHKVOSBDsPl7D
   WS9oyCzqfYKCCpzCUuHSUwn05gAMJL+Pfk+n8ZpG2gQhh2QdHRc2uWUqo
   Q==;
X-CSE-ConnectionGUID: q4hBOA22Qyufh/ulo5gFWQ==
X-CSE-MsgGUID: npbewl1aQq6kk9m8uV9NoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80991004"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80991004"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 21:09:46 -0700
X-CSE-ConnectionGUID: iUCtru9/SYmo7HO7sI/L5w==
X-CSE-MsgGUID: t3Z/0V8bS9uroyun6OXo6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="244857918"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 29 May 2026 21:09:44 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTB14-0000000013B-27Wm;
	Sat, 30 May 2026 04:09:42 +0000
Date: Sat, 30 May 2026 06:08:52 +0200
From: kernel test robot <lkp@intel.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 6463/9870]
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: watchdog@b017000
 (qcom,apss-wdt-ipq5210): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202605300648.PT4oiS2l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 7a473107f9785700a5c57cee69f60c19a9703f95 [6463/9870] arm64: dts: qcom: ipq5210: add watchdog node
config: arm64-randconfig-2055-20260529 (https://download.01.org/0day-ci/archive/20260530/202605300648.PT4oiS2l-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300648.PT4oiS2l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300648.PT4oiS2l-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: watchdog@b017000 (qcom,apss-wdt-ipq5210): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,apss-wdt-ipq5210', 'qcom,kpss-wdt'] is too long
   	['qcom,apss-wdt-ipq5210', 'qcom,kpss-wdt'] is too short
   	'qcom,apss-wdt-ipq5210' is not one of ['qcom,apss-wdt-glymur', 'qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq5424', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-kaanapali', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-qcs615', 'qcom,apss-wdt-qcs8300', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250', 'qcom,apss-wdt-x1e80100']
   	'qcom,kpss-wdt' was expected
   	'qcom,scss-timer' was expected
   	'qcom,apss-wdt-ipq5210' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
   	'qcom,msm-timer' was expected
   	'qcom,kpss-timer' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml
>> arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: /soc@0/watchdog@b017000: failed to match any schema with compatible: ['qcom,apss-wdt-ipq5210', 'qcom,kpss-wdt']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
