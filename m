Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABC1182BD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 22:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718491606; cv=none; b=XT07JYpcltSwxj/nju0uovCp4JNO4P+mCfGPByEC57mUFiKMF9K7ELHD4fVSnQSSuD3Tv3YdtXHUplbSmkSeMnEDZsb6J24UgWo49LeYEWbJunr+Q+7RNZmeCe39wr4cDt0KPU+x0X9SNGLAX0okH07bTLlhJd1bgb07lstUuwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718491606; c=relaxed/simple;
	bh=EvE1L1siCc4A2L+gr67FgFcfgUZZrOSJGMrh7KtYrFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPEfOp8F8krVeCkAsw2MDR4sIFfrmP0gN3kHkCJRDo80eqqRcKvBYclK11z0CEGaad4OvpsEHgrq/s6dUTkm3LYddGAO7Ye/8mp38NfGPV2Jf4N3lyskaZpGNW7edVMY7XnwB0HiqOUjiMmdvNry76cGu/fBNtd5ehiCYglOLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGnGJ+xS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGnGJ+xS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718491604; x=1750027604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EvE1L1siCc4A2L+gr67FgFcfgUZZrOSJGMrh7KtYrFs=;
  b=dGnGJ+xSbeMDdjcNZxIiE3Ka579m8qRGGJZhXwqBWevuB5O54CFT52OU
   siIeJP8kkP3wSqnCotmtiYvPtcZ4BtSsPfz0sWXwWAjeErCaH2vo+6E0c
   wx3ZMZ/lruwwbvDkjWzAGdx4sHUTRSoKy69elYjFjHOmLzbxf0FpSyrSy
   wPMEvxFA51Kfb6+k+WmvrWWX5Sj2EAMNYW7NnhZZMbc9+T9WYz/u/p8/O
   MUyuqhkUSGOcBuN8nI4BvaRe7ht2lGUIDuomnE6O+5t28/0PlKx9YzMUQ
   EKW0sVEGpJfP6MQk6ujlXsFmEYFbzbIZTubM6aqYalZAgOippq6g+vuUJ
   w==;
X-CSE-ConnectionGUID: oQ9ly88aQyCT5HlJJsWjEw==
X-CSE-MsgGUID: EelGY3qeSbuOWXdsl6d3lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="32830322"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="32830322"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 15:46:43 -0700
X-CSE-ConnectionGUID: 54CfKwejQ2mxHBHyprRJ7g==
X-CSE-MsgGUID: WEnVNAfzTKi0nj/nyuXitg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="40713204"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jun 2024 15:46:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIcAS-0000Za-13;
	Sat, 15 Jun 2024 22:46:40 +0000
Date: Sun, 16 Jun 2024 06:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 3960/9999]
 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406160607.zGwsjolY-lkp@intel.com>
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
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240616/202406160607.zGwsjolY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160607.zGwsjolY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160607.zGwsjolY-lkp@intel.com/

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
