Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C4235055
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752916015; cv=none; b=BM+Q4p29/NKWlcMt5wAlvdRXfcqWtIPGsqecNHCa04hEJRjsaCYhEC0sYvjra0k7QSsq9GWcFFz2j+cRW04l/9ctfNva9oJx4oix7VUyvbNi1mITryMnAjEJF7YGoFkz1ax1Mzv5KK7l68R+Ab3a9MWOlPXFw18QJSzQapCe9QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752916015; c=relaxed/simple;
	bh=nB/egk+KEP7FTyr2Qe2wrCq9n/uP/x5C8KVBZC8oARs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GK1BMJ1BLftjfSwGnRBWsDsIA7FQA6Z5mRxveTWcnUp7aF5c5F2cYlnOfCLJSKiM2Ifx2j6euE8udXQWPbgweff8mtP4hGPtKxH+IZDCFMcFvHBl9OuBcUmEWxoTyeYkQ6e5cpE+AySt9eC6iF2JOUSTuFHe3KpXa/WebDB4Qjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMvROrlo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMvROrlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752916014; x=1784452014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nB/egk+KEP7FTyr2Qe2wrCq9n/uP/x5C8KVBZC8oARs=;
  b=YMvROrlo/ecZu/9mBYakqmMaY5FymoOezi4ZnGkPTIb5IaZEMqBxLyCi
   AQotXBTxYChIJwOaJ4H163X8p6ZgFLW0/nO1715fscUPPsHsA2d4p0Ult
   RJv7SADXqYoBiL004nJF3lJdNdOkxC3N7MwhFsGb2X5kGpd4RmxpJpUid
   4RXCpx1TnehRJF93x5pb3ezfQsAMjKV3+wZrITMvI6SQeeTW+unFJ0R8H
   2V19AyDifPqvYvhqF2oyhrdFG7Jw0FHI4PcpaHg0XOyEODWaxDNc+Z5u8
   NopfpGOXzaROcPePs4uet+/p5vYp/N9onXwie3XmVnGb3nXNq3Zze8YSD
   g==;
X-CSE-ConnectionGUID: dJIwg/J4R0uLCBbWP6j6Pg==
X-CSE-MsgGUID: iBm2rxENRYWJ+oekKdgpZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="66265550"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="66265550"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 02:06:54 -0700
X-CSE-ConnectionGUID: KL0g8mCGR82L1Dk8KAENTQ==
X-CSE-MsgGUID: JlY5oe9kTaa/u7bpAMUTXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="157738866"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Jul 2025 02:06:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud3Ws-000FNP-1E;
	Sat, 19 Jul 2025 09:06:50 +0000
Date: Sat, 19 Jul 2025 17:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Georgi Djakov <djakov@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 11000/11307]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pmu@240b3400
 (qcom,sm8750-cpu-bwmon): 'nonposted-mmio' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202507191709.6ljJtzlY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
commit: e8c2f20f594d67d8b33b29f237306d26b2351ff9 [11000/11307] arm64: dts: qcom: sm8750: Add BWMONs
config: arm64-randconfig-051-20250718 (https://download.01.org/0day-ci/archive/20250719/202507191709.6ljJtzlY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191709.6ljJtzlY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191709.6ljJtzlY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pmu@240b3400 (qcom,sm8750-cpu-bwmon): 'nonposted-mmio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
--
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: pmu@240b3400 (qcom,sm8750-cpu-bwmon): 'nonposted-mmio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
