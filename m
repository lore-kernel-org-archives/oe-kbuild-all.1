Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951820;
	b=uZ27okrehgDgjDdrXhDdcrUiClYwnDUdwuwFGBuPsTALjyCfh/eB8sEgTSxmF8ZJrqPN
	 dNzkH7l73WhyXw5WmFWZX4h2OoKu3E9jmiraYMHoMIaYUDR9Q1jznArBpibnowRqfnJIx
	 teYSY30oyccjqOYL/KlBjjhexh4YtgrwKuge0WvUx2oAXAsfilgfGVfasYhVR87GMSGii
	 YISjI2+i9jp4OAqp16jmz4rzxyZ6lyQa9UxzZQNCkUUFCQOSDP3v70Q4Zan+6IppvYeV9
	 42PQOORjTq5eBmuAT5EbTTSQH7TNmSJvvsT41n8QRxaHRxf7m84W6B4wHpm7wdwPpUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951820;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OkQcX/sLhnD+8XktysNLCN2HbKwl1MVO2RHoztkjwCk=;
	b=f2t33xR4NP6Kk9M8J33xBMYsxFyDPLyC34Hdi/0l0fADjdwqozc6tWjCJXn7p+MtKpZk
	 t9l3X+FoLJ5Lg+9VXK1HK2XictAPB+avHHOQ0xLM5GmFW3FZmjuphSxyDrGNnrL1DnVG0
	 hHrtXsjQ98SC6V47TXRqwIzRbi4yOKOR/NIlTd+863/hHeI5citAW2jWf0KcF5Ec2pvzK
	 SMtpGmiFl/QD5SUH36vf0kwA/ktee/kRL4rKtg2DpK+TCkGMd0conduXmU1ikisjBzdf1
	 /xK8/hJbZD5GEI+7nG09t8aXfO2KPfKRHwQCs8rObeTVsuYXnmMWulT9jAZP3nL3oDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MwN5K5pZ;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50C7606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 21:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D50C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MwN5K5pZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794951820; x=1826487820;
  h=date:from:to:cc:subject:message-id;
  bh=kWbx5HAbpU65fUdbu06LE9TdpougtXg20AOtUA9zf2k=;
  b=MwN5K5pZFmTOttK79Zfdwx+PFWePcA32nJtvXU2j6xiHLu7PnCTyNd1k
   LfTtjlfnTkJU2yGtSQDvVQ/g6RbseOZAXCIEBBRzhAa2kWyuo1uOnMASW
   gXTpZdGTin0hwvY34csJTgkpWJLsX/+5CgibxEl4JdiuvTK17V7ZSmcJ9
   vB33CZ8bvg8NqpdkwsK0Uoff5xdkh1o+qeRYUc1Q/N5yRMOtE2sQs8yZs
   h9TF0u882EjC+Cwg2bEjIcpsTEN9Hl/oRFF729LjNa/K0Ev9/rZQLli27
   sotin+/WPRiwf3O+gOF8TIPoMgca5apt+BHSNQLabYPezdD6K+RtrKA/M
   g==;
X-CSE-ConnectionGUID: Q9sXcEFnQu+j/YJ/Paq/WA==
X-CSE-MsgGUID: 3n/WD7ojT/6MiQAU3n8iAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3736300"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3736300"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 13:43:39 -0800
X-CSE-ConnectionGUID: nfd/XcARQp+c33qYSkfGgQ==
X-CSE-MsgGUID: DlGEajnpRkSPquieHeV/hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10316349"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2026 13:43:37 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTQxi-000000003CU-07gn;
	Tue, 17 Nov 2026 21:43:34 +0000
Date: Tue, 17 Nov 2026 22:43:26 +0100
From: kernel test robot <lkp@intel.com>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>
Subject: [linux-next:master 7082/7459]
 arch/arm64/boot/dts/exynos/exynos8855-smdk.dtb: /soc@0/syscon@10020000:
 failed to match any schema with compatible:
 ['samsung,exynos8855-peris-sysreg', 'syscon']
Message-ID: <20261117224141.yr7rYXK5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   749a4de370409464cf8501ec5b2451df45c84eb4
commit: 99eb8abc95341047451f5c53d70d044fa4481af0 [7082/7459] arm64: dts: exynos8855: add cmu_peris clock DT nodes
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261117/20261117224141.yr7rYXK5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117224141.yr7rYXK5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117224141.yr7rYXK5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos8855-smdk.dtb: /soc@0/syscon@10020000: failed to match any schema with compatible: ['samsung,exynos8855-peris-sysreg', 'syscon']
   arch/arm64/boot/dts/exynos/exynos8855-smdk.dtb: /soc@0/syscon@15420000: failed to match any schema with compatible: ['samsung,exynos8855-peric-sysreg', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
