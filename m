Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180A2155738
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718715480; cv=none; b=qLzeOAnXvyg8f5ByMAq1DZiGt9w6h4stHTfiU+jzR0hLDX5oTCH2JlRPeQkbNA3oeN/B67SNDqGVWup17EWQzes7hXlhmOULSyypzQmnPpvqgg190sMQWvjm94D2PMy5j+K24kmEDO/ggJC3DNVMGiBljFOyzQMEYKmJkO/ZI28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718715480; c=relaxed/simple;
	bh=4FAdW6dgpwEIh5osXVF4sosLC0cSbmbrAp1A1JQNv5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kjT0ENQDXuuvy5MXomnESmMbEJGGyO7Ao9Em1xiFxIOAejoaXe1z0xHH4M//vbFwOEdGAciga9JpylQ1M5nKhByswTbUgPMeoeOqua2FdL23+uWpsieAjgVUPAX5WmW7H/PKngiLLfTSA3F4jaHYScMu4BakkgumlZHxT1B6v3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcmooJgV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcmooJgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718715479; x=1750251479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4FAdW6dgpwEIh5osXVF4sosLC0cSbmbrAp1A1JQNv5U=;
  b=LcmooJgVrvmHZrAkpr1Vsm5bmniUXqrI34rvaCg+iIsFyVFaLJ2SJupi
   iNSqkh2Mj7OhUrPisCGDDXOpAeSS/l8jud5kLKjMs946t7ORplnSXwFHn
   +6j3Tes32Zlr+7khNUcx/tzP8f2Kt3+BTjIfDR0lxiTJ7gMQjAf1cPI9P
   rEnqSe7WIQHl2zr/TLMxKzdMiA3cSk8pVDiz10WcaTjJdHBDAJzd97b9u
   zK5XY4rEO92RznxpvnLZo5mZgF73SJ7QJ/Kj6HrMRBb6lUt7Rla3kfNfE
   /SeoQN7MdVrz+NKoXurJghfNeMsL/8loqiY2TdpjJx4H8qYN/7JDFSDOO
   Q==;
X-CSE-ConnectionGUID: lpJy19ZKS7i56DNhGmLmow==
X-CSE-MsgGUID: jo5sLe7fQgytq6aSp2FB/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26272162"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="26272162"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 05:57:54 -0700
X-CSE-ConnectionGUID: exUqzZAbT0WDj2kgvB8Hfg==
X-CSE-MsgGUID: s7D9idNSR2irnW42aU0Low==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="42019584"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jun 2024 05:57:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJYPF-0005We-2p;
	Tue, 18 Jun 2024 12:57:49 +0000
Date: Tue, 18 Jun 2024 20:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 3959/9999]
 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406182040.Qg508jcq-lkp@intel.com>
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
commit: b99c0f465b6398b36ed3bef6fac8ad2078cd3bfc [3959/9999] arm64: dts: renesas: r8a774a1: Add PCIe EP nodes
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240618/202406182040.Qg508jcq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406182040.Qg508jcq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406182040.Qg508jcq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
