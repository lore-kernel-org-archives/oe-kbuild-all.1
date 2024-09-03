Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E7E18F2F6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 18:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725388412; cv=none; b=CM12qEH24QFvt45QZXQRAFuWrh162DsZOkz1sB4caHCicr/GNqSfNIL4xpykXxYQtVhgOSU58QWCrFW5OZWTxD0wdw5qjJBgYwh9NwDPUkAt6x2BDELJfMy73DOy8z07cMmQxITWUf958zHfiRtawA5xNCsgVyOUqonfJTW0w/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725388412; c=relaxed/simple;
	bh=3qCOyov0nhWFSDDIJ3ZTzeqW6fgujaVvY6W8sDsJkdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tei5HVlsLW3b+KsqV4uvyMpQGIACRn2+faHD6UpkkDFV7sjGO2aro0X/LUW7xC70RaAHl7gI9dKm72Yuh9xStkLCVvERYnRfmYxMnAlCDO1DW7j/tQehsv9qmASwLUAjoPhDEAq7Kuly5uQTl7b1fCWAY58eUQN/xBd5aaQM9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9z8PjX7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9z8PjX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725388410; x=1756924410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3qCOyov0nhWFSDDIJ3ZTzeqW6fgujaVvY6W8sDsJkdA=;
  b=b9z8PjX7h0Lg35XmXrFaPsU0H4LOA30hXbobd3071BizMJLkODIZkJx4
   ChD7mDORIAjr+Br89B7CPw+DGmKNfwgDf5uD10kk8YDahEXCODjQfrd4N
   K87tiNA766BJqHaHtWrYxW5ZWih1DoZlrPX7xvhvx+VQ4YK+GISCm5ioQ
   2T0ZzB8q7TQpx6UhaNQLXrXv8GgrDZrceJTwIfuWjq1z6sE3CJzj5kg1B
   Jq2quct9SgaYwiKVTP1gPoLpc1FtoVBgm2Ae7TMOXk5XnBlbKvR+60GNI
   RNpmFutfiLkRaoFdcLeYVxA7yJd2RvRLhbKx2sUzXE1IpZ//Q6t9loks+
   A==;
X-CSE-ConnectionGUID: yJgHcbOHQwOSO2PwpEDK9g==
X-CSE-MsgGUID: FtdWc9KAQXimnXJ231fCeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23524756"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23524756"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 11:33:27 -0700
X-CSE-ConnectionGUID: J6mb/AweTEypKYKWwLzpYg==
X-CSE-MsgGUID: hhtupNmxQ2Gjz85UDHqe/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="102418305"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Sep 2024 11:33:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slYLD-00072m-2e;
	Tue, 03 Sep 2024 18:33:23 +0000
Date: Wed, 4 Sep 2024 02:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8329/8400]
 arch/arm/boot/dts/rockchip/rv1108-elgin-r1.dtb: display@0: 'spi-cpha',
 'spi-cpol' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202409040257.zbB00iRD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6804f0edbe7747774e6ae60f20cec4ee3ad7c187
commit: b76f3bfb28e97974d5d95b159acf66948c521326 [8329/8400] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
config: arm-randconfig-054-20240902 (https://download.01.org/0day-ci/archive/20240904/202409040257.zbB00iRD-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040257.zbB00iRD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040257.zbB00iRD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/rockchip/rv1108-elgin-r1.dtb: display@0: 'spi-cpha', 'spi-cpol' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
