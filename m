Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D049C44360
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 14:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730989819; cv=none; b=HSKPtGt88sSY+w2bXghC9HT99FHiRGUcYXTKOYNe9C6gE817ag/yX2tjAbnk8rT1QUxW1kLq8qzNWVfWUz+lGMqTn/rpPyFBrzv1upxEfxia1Lj06PJK5o0wj95aZE6ClSWT/VaCOYQFFY9zvd/VqXJcy9d5Yh/cQ9DthtNMBl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730989819; c=relaxed/simple;
	bh=qahyJb/p9LjGiRnwZLxA7vmrSo9GZkObLXQz/ejiRNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Me/AwjgMCxc/ICzO0pjLkxfYVpxNnqQxbVRkPpjWHoCKbI6dYEYOaL/8wojc5tAcDGMvHtnvQRTQLAq1gF9ef8LaAaGS4FBGwcvN8k72XB0i1r9zQ2sCHaIr0NLPNE6tDs/nnbeQLFB4DFzkfqjcW5jIXTAWZpdApqIbynEmhJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRcDUtbM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRcDUtbM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730989818; x=1762525818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qahyJb/p9LjGiRnwZLxA7vmrSo9GZkObLXQz/ejiRNA=;
  b=QRcDUtbMxNa6g+Ox66ctE5UhjB49VKVXp9hDOP/1e95dxcTOpLm3vu5M
   A4XYeyXB5dbG9Va9+7EVr+0s+xZNLGJWgySIVY+N7wgRgq7VnFUmHoN8J
   8girWPEdH7fbEfFFdss7bdJOqnsiMFDP63wEGat1h1iSQfHFKc6Z4U24y
   iK+CQsuDO1m+/oeaJW5rEbHj42P40HFnYgjwr5+J4MaN64dUqhLDUFx8C
   huTO3CCC89YTKyRWqrtqfH1GGvtKQCpvnxeGs6e/m62CmyB9rOYXIjnZ4
   5G4I6Wi1xxonUpqmhDvJCVHS+YfF1df1Zy1rDzMOWIN0/5+NTFqothljL
   g==;
X-CSE-ConnectionGUID: fS7oboDcQfWcX7TO353tug==
X-CSE-MsgGUID: z37bU+DpTEutqO8Zs9aSMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31007052"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31007052"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 06:30:17 -0800
X-CSE-ConnectionGUID: 5g0lJn8OQ7G4kmSpkuNbhw==
X-CSE-MsgGUID: pC3J5HfSTuqXh8kfdpacwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="90224868"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2024 06:30:15 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t93WX-000qLO-24;
	Thu, 07 Nov 2024 14:30:13 +0000
Date: Thu, 7 Nov 2024 22:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 9117/10190]
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a2f8800: interrupt-names:
 ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
Message-ID: <202411072210.UuoO2HrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   74741a050b79d31d8d2eeee12c77736596d0a6b2
commit: 7b8a31e82b87cc7784010ddc97601ccaf7a173ae [9117/10190] arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows
config: arm64-randconfig-051-20241106 (https://download.01.org/0day-ci/archive/20241107/202411072210.UuoO2HrQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411072210.UuoO2HrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411072210.UuoO2HrQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4146.11-4156.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
