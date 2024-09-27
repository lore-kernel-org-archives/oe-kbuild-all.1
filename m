Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136502E630
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 19:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727466283; cv=none; b=XF24ylvebyz/sOi5/9huOf+R1GeaoUyEL4aPb7/lMgGQWOfOnW3JtwFrkaToXRQ5omXk1dGY6EQEeHJ5Hp2W8b79JnEYiK37WMmvGyhdHSTxCLapeXxcMPcT80D1Z+T8aIG9/wVvtie2btkZBdsn9DwgCNIYfkO243ij674XYQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727466283; c=relaxed/simple;
	bh=0QmIRDXz2Yv9bJ+Uns6HyYxd6F/2uiR6zHvcdZ2AOwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jzfLm3wwNTj+vHAQA5f6KcmZ1kKU4yJj0LFK4BwqICDihedzc2BhVrUpqJMZPi1HUHBX0auZsZHrSIkUdZyj79UsQ2coJ6lpaObvg05ZItVIrtNbJKK55k1omoWThv2YPDVo/rm3ELuuEc7ACKAheC1rA8RV+CFYaF8rLLspVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuCcFaxq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuCcFaxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727466282; x=1759002282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0QmIRDXz2Yv9bJ+Uns6HyYxd6F/2uiR6zHvcdZ2AOwY=;
  b=FuCcFaxqN/Hdhxs1lutaOmxDcyZ8jEgVJBRMNk1+wqpW88dEQHqa4a1v
   GJ1VbuMdXO1pa1G+4oKLXE1n9m7QiS/A69PYKHkpLEE+CQvqqsaOQqqsh
   dUHsB3VKC4Vq7cL//d0x/jHBFkZwO2TgIQX/dy/3e1Mbeq7YaUzuo2PzK
   8ts66puvH7KlsT5GJTCEzhk0hO2nNngPg2/IOGDkd1SqnrJyWdH6hUsqm
   YJDYfhqqvSRWgLf/Ghv2W2Oe73UHPjiPBrpt7rK8TnhtoKriZjcymAUp5
   5cnF7P97J75OJtbeHNbaZjxMoII5unotEYiDkIL7fZa0cXdih2MaJTfcx
   g==;
X-CSE-ConnectionGUID: /2JGq1wTSj6ykJS//VzXYQ==
X-CSE-MsgGUID: /2qpzd5nST67v+3bndEiSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37189376"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="37189376"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 12:44:40 -0700
X-CSE-ConnectionGUID: kTwuYCH/SXi4QDHn0DAMaQ==
X-CSE-MsgGUID: 7MM6g5PoS3e7+K+TzzKZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72946745"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Sep 2024 12:44:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suGtJ-000MXx-2R;
	Fri, 27 Sep 2024 19:44:37 +0000
Date: Sat, 28 Sep 2024 03:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 764/966]
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202409280346.wiYdN9fj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: a26a8e451c8aadf15df62cf923e23a119a9e0992 [764/966] arm64: dts: renesas: r8a774c0: Add PCIe EP node
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409280346.wiYdN9fj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280346.wiYdN9fj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280346.wiYdN9fj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
