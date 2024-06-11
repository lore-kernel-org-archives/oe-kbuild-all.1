Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C332D63C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 04:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718078828; cv=none; b=alPpsWExgmo/+Q2/SdHjJ8zG8IsFkwsksRobrHOHKSVfCVPedRve1eU86BUoGyDmRPK/knnLaeLJAnlczPpdj3+TP5tGs7m2bJYqLuWscWbHITsVr1O0bitzV0EvCsuWMWNwpOUrDDY6YT8qasHquojx0nIrxSgb8/jeN9LF1cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718078828; c=relaxed/simple;
	bh=/5t2tjm5Ov9FxKVZC/u3A1WiDOwXfSwZBzI0Xsu4Dk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nTEmjfZp9kpcG11/CZiJzIsmJ2k7shBX71fgm10t6dqaCSNZixnT9pvDcrw7bgt7nqXH4GX5XuJ5abCy5hI9WtMXp7vC3OYsp42T80P031JprMLqNMhfYHg7RwkeX8o7GBzL1gVqspeR5K4BsET3BNLbOEZQCpgSJjaMLVXSY3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1uF06VK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1uF06VK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718078827; x=1749614827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/5t2tjm5Ov9FxKVZC/u3A1WiDOwXfSwZBzI0Xsu4Dk4=;
  b=e1uF06VKwsQPRCXIkhuxEYD9ILlere/UoQjQ1LNZNlN4NHaCqcCYkKIj
   bmiaOfwZaLLDPFxNUzXLsFs2W3nAyDMk+9F7eS04S2U+Zq2UvudYGNpKu
   Zf49smMoMt5PVIDR2GG5lfTEIlXnQyFYl6mK7994+ztdiXmPcxD4ke+f5
   YD9Bvf30/PER5OzvvNVRL+e6gNleeWo/jJxP4GwF2anSSe0gzO6xH9foO
   QZFzMu/72FJ+HrPOzd+0oM5G2jpR6OaRVTJfIaHuVDfwEGnvL4xQiea6V
   +pSAYrIjJ69h4+DV9lEdJpfadhhHhEIAB8iZBGQBf5e3mCRh3Sh9QHbyY
   A==;
X-CSE-ConnectionGUID: TWaSgCq0S0aIB0jsuhZkMw==
X-CSE-MsgGUID: Oq/bvLKMRkaR6SI/fvFCHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32303759"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="32303759"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 21:07:06 -0700
X-CSE-ConnectionGUID: ugDdI4CUTbKhrbzdcXRBrw==
X-CSE-MsgGUID: oQ2SRU2vR5OFkwU412tXTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="62455097"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jun 2024 21:07:05 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGsml-0002nK-00;
	Tue, 11 Jun 2024 04:07:03 +0000
Date: Tue, 11 Jun 2024 12:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 3960/9999]
 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406111232.BwUeUioX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: 9c0fb84041f31639ecd580320f366031d0dc5ddc [3960/9999] arm64: dts: renesas: r8a774b1: Add PCIe EP nodes
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240611/202406111232.BwUeUioX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111232.BwUeUioX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111232.BwUeUioX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
