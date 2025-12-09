Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E962FBDF5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 18:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765306335; cv=none; b=txY9UmOypzhpILMJGWWggCPZvdnftRl0mG7ourRpJXR2bX9LWERR3mzC6ES5PoEqv+tw5Tt/iDCIkVClrypGvxivmXqcMMjuB0goo/7biLES9R3DV1oiWXcdVKUyuoDxN17eTQSQOwFVhMHEvFLfPCswwfotfr/cxEkSruMIjEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765306335; c=relaxed/simple;
	bh=j9VAqPMSudNIkk0kxxz4pO6kUBmNbITuLWZ55lpMRHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q2I0tK2xYiySm7PDIgXJXbieRIXaziMJY9kfEGBPVyp2qJnOXLFXHGDUJlUpLDzDDdamtYrb7nFxBDzY+QHITS5RIyF3mJLhN75V8gjhiIUNHJvCxIOSjsXQ0W5Cdz6ebqeBg/cgexS01B+vHZ5DQfpwbofMWDOXAVhUJ37ybwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqIPLYwi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqIPLYwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765306333; x=1796842333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j9VAqPMSudNIkk0kxxz4pO6kUBmNbITuLWZ55lpMRHU=;
  b=RqIPLYwiAIqhrTT+iYHY3bZ241vwIEDkZqjVgItfebXtbK7iI2dAC8B6
   soCDjKajXvujw5fCperFWJw3wrb8Uk4e4IlBjY3Q0XR6+CU7mg/Q3zQ+D
   4W0FLS4q/WSqtdrid7+dY1XWBnqH1m60Uj6VaHmJR/68ja7Tp/otqWm8l
   lrS3IPcgZ4bCBLhcsKrI69M+JqZvp7Qj6OjQDX+OYYSSIB+Dfsx/hUqjk
   /o5Wtop2KzuqX/ycHaFDdt/xVsotbfVgekvwycoSqpdTnQUTpwdHBrM40
   3JsRGmnhU8NvoChsLyr6JlQqSg0VDZUyGlkZnoQV1i1ISAyXWw51ldspF
   w==;
X-CSE-ConnectionGUID: LqlmtHPQShGasCr3vgessg==
X-CSE-MsgGUID: VFkPqICZSquHe2r3fLlEJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67308947"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67308947"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 10:52:12 -0800
X-CSE-ConnectionGUID: Av/Qp+J3TQqsW5aOumLSTg==
X-CSE-MsgGUID: KOS3QrEbRTCzCuLRWmizuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="200778541"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Dec 2025 10:52:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT2oi-000000000LN-0WNI;
	Tue, 09 Dec 2025 18:52:08 +0000
Date: Tue, 9 Dec 2025 19:51:19 +0100
From: kernel test robot <lkp@intel.com>
To: Lukas Bulwahn <lukas.bulwahn@redhat.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: [qcom:clk-for-6.18 22/27] kismet: WARNING: unmet direct dependencies
 detected for QCS_GCC_615 when selected by QCS_DISPCC_615
Message-ID: <202512091946.7LZatRyc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-6.18
head:   4ca6a89f38718d6cd84304e6a26e7ddc90e03356
commit: 9524f95c4042545ee8fc3191b9b89c61a1aca6fb [22/27] clk: qcom: Select the intended config in QCS_DISPCC_615
config: arm-kismet-CONFIG_QCS_GCC_615-CONFIG_QCS_DISPCC_615-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091946.7LZatRyc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091946.7LZatRyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091946.7LZatRyc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCS_GCC_615 when selected by QCS_DISPCC_615
   WARNING: unmet direct dependencies detected for QCS_GCC_615
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - QCS_DISPCC_615 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
