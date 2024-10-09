Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D3D152E02
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 05:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728451232; cv=none; b=MEdBAFKDP65VcO2e7CirAbTfq6Vj3cI+Sce6FKPZXL0ZNcPeXCGiBa78vzI4+DXDUEJGx5uv5I7JkB8FSe5ee3VA9TCKo6GrWqHP5I6mtt70hjmIHV//qltgBBVOrYYQUeWI0o9Orod4mMKM3d1dvYTu3l0nv8GUWSrIjjX2ehk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728451232; c=relaxed/simple;
	bh=4Pz3Qx/bcNes21jTM5RdIrj/QX2lZR28+duwJVMTfgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AISz8/3yqTfZqcEu+IvfEGmz1zMKbl31CmnHzap5mt/IFQ5n4qdLYPnUjQXHfTcmNOHfQC+Ad6xIx4RPJWr1Wg/p26aomfGYN0yOxbij4GOdM4Ikj+Zf3u4LmtGPHNnFi/Rppf1qzW94dLYavuuGuvMz9eR3DP8y7aHqinMmH7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXJod/fP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXJod/fP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728451231; x=1759987231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Pz3Qx/bcNes21jTM5RdIrj/QX2lZR28+duwJVMTfgM=;
  b=IXJod/fPjtNpR15mLAB/YVpAao93KhE5C5nZFAeoGXfie1RgzgMpERst
   PhcbEVU1KaaTZpziVmNnlwryUrAmi3Hi1Xzk8ZZKkAktFmpCXwWf190hY
   h4x1YumYpuQCBM7XK/CqEjilMLkc/3hpDApKgr0X2WjpQJV2L5e1H0Pww
   HfSqyE7IoQGh22sIz7dtAw6JO2naZzpFS0N+N39jRlAEdN7KDKLikw1Jq
   C8/m4wtewSCAaj6FZbKTfqu9GJcjdjF5RTDPcaQT6NmXGT5HCMhimC7lR
   1YL+vEelYBXcbYLmM/w/AV7wgS6ij6v22vg68oQ8LGZ4NSq5dEt6rRb1J
   A==;
X-CSE-ConnectionGUID: mvtuf9lPSDeM/jIVg4jksQ==
X-CSE-MsgGUID: cwttfT6fTYeXBQSI13qyTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38856783"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="38856783"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 22:20:31 -0700
X-CSE-ConnectionGUID: ug8ZliapTCC7uB/90rNT7g==
X-CSE-MsgGUID: Ws2UPZuwRKiw+lHcYe0BWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80924482"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Oct 2024 22:20:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syP7a-0008m4-2P;
	Wed, 09 Oct 2024 05:20:26 +0000
Date: Wed, 9 Oct 2024 13:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?B?Suly9G1l?= de Bretagne <jerome.debretagne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 2344/2853]
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth:
 'vddaon-supply' is a required property
Message-ID: <202410091319.PtAQYmM9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33ce24234fca4c083e6685a18b460a18ebb5d5c1
commit: f6231a2eefd430b8b8798911f023891ea51d1d09 [2344/2853] arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G
config: arm64-randconfig-051-20241008 (https://download.01.org/0day-ci/archive/20241009/202410091319.PtAQYmM9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091319.PtAQYmM9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091319.PtAQYmM9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth: 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth: 'vddbtcmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
