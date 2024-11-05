Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B3A32
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 03:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730777165; cv=none; b=cDjOHEDMxQhciA7hIFHgWAcvkhgArmkiE4vrzpzGvgKsLCEOB7zddLLQHGnOvHLJ4BlN8NtPMn2LtPDKOoUj9RPkBuRIditKbnrnuOCdfK1R74cIoIpEotXYr2/5DlReSqgBRI96x9qQ3fh9n1c1H0BtMh6gnbtMtbwgbS2YsiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730777165; c=relaxed/simple;
	bh=qhsUhLcMWIBH5DCb1Ahb1/thJ0A8rkVCt9MdWUq4r+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2Pva+C0vtCCCLchq6S/z9MKHOzTNpFQQvc5lGvfFSIDRQJVelfmGiC9GHRQrHQ0AzN0X8tN6peDwNtN6f79uM5DGRKz2vPq1Bf6RF4KHGE4upQBxrpU8JHck0hsTYU5PcCRNLGa4NF0JfZjw+yHhjcmPEPoPo3+jy0nHH7+dqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqSIPe93; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqSIPe93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730777164; x=1762313164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qhsUhLcMWIBH5DCb1Ahb1/thJ0A8rkVCt9MdWUq4r+k=;
  b=hqSIPe930PYegZnIIgaxR2Wn0WjvJV2DyTCfvgun1yz+2Z+a52ee1g0R
   /TD3cdVKuwRqqvZkcWzYrixZBLVZ9jMtm7EIBMo5aa95MYIsU6o4oI+jN
   y4bbaYfexhLMn0P0zpCYLGSnNDD4IKHynmuONDxpf5ZBE8PPMG4+6LqVB
   NVr3uliX/K93NbjUSBqcMrMJ0+OvMawnE9jfTWNnF8n3pCs1G8nbYJngO
   ixdCpDgkdKd7KUoUwhwzjS8BpbKDLlVf4EHEBEnsgqUGhqfuCt57rpRab
   6qQ3TIWKajFM6QuDQH/pSeEyMzSXuBS1JCHQRRd2lwRc+/tZXio+eH7n6
   Q==;
X-CSE-ConnectionGUID: O/YXSPhKTii7Tph9QnmCcw==
X-CSE-MsgGUID: vZxkhm4XRUSGZlPG7/DFjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55906216"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="55906216"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 19:26:02 -0800
X-CSE-ConnectionGUID: UxgCv2zGQg6AOrqBm87/2Q==
X-CSE-MsgGUID: vrOrbUYlR8y/liwNqSHqyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="87788403"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2024 19:26:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ACc-000lYF-2b;
	Tue, 05 Nov 2024 03:25:58 +0000
Date: Tue, 5 Nov 2024 11:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [linux-next:master 8280/9360]
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
 dsi@30a00000: Unevaluated properties are not allowed ('ports' was
 unexpected)
Message-ID: <202411051159.Z0GXrnwk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1ffec08567f426a1c593e038cadc61bdc38cb467
commit: 13fe36ff6ba6debd659b3a4a13280bd3c1946718 [8280/9360] arm64: dts: imx8: move samsung,burst-clock-frequency to imx8mn and imx8mm mba8mx board file
config: arm64-randconfig-051-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051159.Z0GXrnwk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051159.Z0GXrnwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051159.Z0GXrnwk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb: dsi@30a00000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/nwl-dsi.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
