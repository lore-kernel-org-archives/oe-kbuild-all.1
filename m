Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824A41C8602
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 23:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740441400; cv=none; b=EtEdgysEiEim3pRDVfs7F62X4HUARBhKXE+o6VnkKOO40Wj3ebOhTH2qZtTj3sdxq2fZNQ6YQ3EBTzNn7dQj3POs+IKqYevFu2YyDTe9ZQirvYa3Fl5RQEj/YMnl2lCItgsPN+lDq9mFIp5RMD/mJmewzY+xJs0/YqxOsxB31W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740441400; c=relaxed/simple;
	bh=04jAdXkB7xP1BexEoX9ywNYe7THG8bpS/O2F6IXdPEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YpCoZ8ynuPv2QJ722714AUXyh5SILi/3SgFVKOCafoCXeCS1938t6UkoawWeDBTPnWjnjHID+9IpVmDPm7+ra00Fp7DQSxFtgALmX4mQl6wOdBeHuAxGELCMIKz1rVSqE0bgUAmtoMtbjtVfWq0LvixWIpqejrtus6agAJTSd2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHR55n+a; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHR55n+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740441399; x=1771977399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=04jAdXkB7xP1BexEoX9ywNYe7THG8bpS/O2F6IXdPEs=;
  b=CHR55n+a5NHFA7ayo9dI78cg/GXSwWN/qbxikpck8PtlOESfry5skZGO
   WyHr0S6qzEdnVtmMkGLzDSdRZAITGJUQng5GuxBJ7Lmmbyr2zuCrUE/9T
   RgeRBxFcyHveH7ahPrh84s6BcGzDLrb4Y07FPjLvYeYILOCEnWx+GcoJ+
   IYhPu/BEgQwnq7saEk3Z7fAiBlIJzGv7XOo/uNCU/Lbddnnf1en6xHqaZ
   wIHPn/P9JpH0lj7WHI0u1qWXgGI17qdxaz8axddomXyuh/4uv83wPFQ9h
   Eb+MKF+B1gRwpgaxfhC+cUKbmkprdN4TH4igKYyw1eLOPZ6gHkueyY2jc
   A==;
X-CSE-ConnectionGUID: uYRgqtoYSwKyCepHCK8jJA==
X-CSE-MsgGUID: EUkVMdn7SMCFIJ/fXPVkpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51852056"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="51852056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 15:56:25 -0800
X-CSE-ConnectionGUID: Vfe4iBZnS7uU5e37G3NZ1g==
X-CSE-MsgGUID: 5e5EX0x6RZetpLhbe1kudw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117129742"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Feb 2025 15:56:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmiJB-0009TP-1H;
	Mon, 24 Feb 2025 23:56:21 +0000
Date: Tue, 25 Feb 2025 07:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 5338/5954]
 arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: pcie@5f010000:
 interrupts: [[0, 102, 4], [0, 104, 4]] is too long
Message-ID: <202502250719.czLZAvoG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4ef7aa6a88280d015c6533a210e46efd55bdb57f
commit: e9b7eae6330cb18305be1fab1bd49a8e697e497f [5338/5954] arm64: dts: imx8q: add PCIe EP overlay file for i.MX8QXP mek board
config: arm64-randconfig-051-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250719.czLZAvoG-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250719.czLZAvoG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250719.czLZAvoG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
