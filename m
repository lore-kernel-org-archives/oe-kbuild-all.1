Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F48F492E20
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790332126; cv=none; b=ec7NarDLHIwtMCmqIP0einFV6S6BbTGDTZlyjnxa5t2OMAs/7Q2Fgzf9vNhK7pc23uJa29KTRCR7co+YYbwOVrtAoROXcyZDZWrJQgvVG0XXkCZ3SD4QDnRFzD3MCEjL83NJdGYC0bxH9/er1awnfCatu5rsmHpkGN35ZZ74rYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790332126; c=relaxed/simple;
	bh=yOxTm8/lPtjxSRt+F3PSpMd/KRCMjaKHvN/Z9xYCJgs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JRHpKtuTeYcRyUYK2Z4PcZfcw33akfMHQY/7a+bDYRw/tkLXGgvvp1jsiIOFyzv701jqAZGhgfJL6pNanfcj7SO2biq6C9Mc1qRaBUMP+9GmhZ1dpyMvUGXeij3IxZZx3GvnBzkSbe+Td1TmOLC+e/mqWu4TJRLD6LDE4Gdul60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWlxBcKO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWlxBcKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790332123; x=1821868123;
  h=date:from:to:cc:subject:message-id;
  bh=yOxTm8/lPtjxSRt+F3PSpMd/KRCMjaKHvN/Z9xYCJgs=;
  b=eWlxBcKO+chajVb6DfVsiPT6jX/NMK0A+8AojgpxVY0oZ2mupKE3Of+f
   pnPmgDqBliSu25kklFlPVUhrb9XqDmIf5g2WQMPXBBRP63C0m27h1RRTf
   SnDZKE9x3zTEQnUOXnMIUidpUYX5TAhOend5D3nfsFwVIkTnZd33qDbzj
   N1IcRxQkpv6tp7vR+ksrLX/k4R/jpeszRIcJZYnD/ZKXH7XNv8YtNVNYK
   dgB81QVvYGrXMpNTzhXCFQHNSKVn5Tlby1XLlJnOByEOdIAUtOXClxVM8
   KcmHJ3DmqBc8NyH87/LAZ1K8MCg3aGgHh65gRJ6+z4RNx7nQoMpztaNRo
   g==;
X-CSE-ConnectionGUID: B83iDHMhTgSoALRMGe5KPg==
X-CSE-MsgGUID: 1GrulvpiRHuko57xiV9cHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="108605684"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="108605684"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:28:43 -0700
X-CSE-ConnectionGUID: s0hpzR5MSdy15AT7oILoBA==
X-CSE-MsgGUID: UsHWEoyVSXmRKP8Z6Qt7Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273392779"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 25 Sep 2026 03:28:42 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA3AV-000000000gG-0w03;
	Fri, 25 Sep 2026 10:28:39 +0000
Date: Fri, 25 Sep 2026 12:27:43 +0200
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 9675/10113]
 arch/arm64/boot/dts/qcom/hawi-mtp.dtb: aop-cmd-db@81c60000 (qcom,cmd-db):
 Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
Message-ID: <202609251220.UdHj2IPM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: a22f9a319f29e222571b9b968e059b8eba06fd60 [9675/10113] arm64: dts: qcom: hawi: Add base MTP board
config: arm64-randconfig-2400-20260924 (https://download.01.org/0day-ci/archive/20260925/202609251220.UdHj2IPM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251220.UdHj2IPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251220.UdHj2IPM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
>> arch/arm64/boot/dts/qcom/hawi-mtp.dtb: aop-cmd-db@81c60000 (qcom,cmd-db): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
   arch/arm64/boot/dts/qcom/hawi-mtp.dtb: remoteproc@4000000 (qcom,hawi-mpss-pas): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,hawi-mpss-pas', 'qcom,sm8650-mpss-pas'] is too long
   	'qcom,hawi-mpss-pas' is not one of ['qcom,eliza-cdsp-pas', 'qcom,sdx75-mpss-pas', 'qcom,sm8550-adsp-pas', 'qcom,sm8550-cdsp-pas', 'qcom,sm8550-mpss-pas', 'qcom,sm8650-adsp-pas', 'qcom,sm8650-cdsp-pas', 'qcom,sm8650-mpss-pas', 'qcom,sm8750-mpss-pas', 'qcom,x1e80100-adsp-pas', 'qcom,x1e80100-cdsp-pas']
   	'qcom,hawi-mpss-pas' is not one of ['qcom,eliza-adsp-pas', 'qcom,glymur-adsp-pas', 'qcom,hawi-adsp-pas', 'qcom,kaanapali-adsp-pas', 'qcom,maili-adsp-pas', 'qcom,sm8750-adsp-pas']
   	'qcom,hawi-mpss-pas' is not one of ['qcom,glymur-cdsp-pas', 'qcom,hawi-cdsp-pas', 'qcom,kaanapali-cdsp-pas', 'qcom,maili-cdsp-pas']
   	'qcom,sm8750-cdsp-pas' was expected
   	'qcom,sm8550-adsp-pas' was expected
   	'qcom,sm8550-cdsp-pas' was expected
   	'qcom,sm8650-cdsp-pas' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
