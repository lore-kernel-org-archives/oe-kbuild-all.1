Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99295804
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 00:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718411493; cv=none; b=eyMeFkWZscT4CkbYXObpD850Rdj3kS7uwrvxfIjTOdXBQzzdz/bN4AJKN0LD7OVM3bM5/anl3QDqpQgDo+3aTbCgn6hK0CPVgEli8YuvY3fSQ0uzYknFiTMcjmKo4S5oUWo49/f6LhRQRDDEnWZam2WUAGNBsKmSYjZI9b3Ibw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718411493; c=relaxed/simple;
	bh=3PJmXYVgfEgsGePscxNI42+jiQRI8JSP+3Bmt4aTnv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UFWf6N6I/Rsfkor8h6MEppVPPlVM0K/9hA4gpZ1FvxJpIifBwWmy8mLipWVRkhD9VfWGMNgp1268ePMR/56Wz/9V2TvPbNzsxOYJV9pqfiAFzLJrsPDl1W5YzAyDIrWV0xUMET6cJjRAWdRYc6SiSowfXswZ6PFqPcJEMiHTOLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTL89elp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTL89elp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718411492; x=1749947492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3PJmXYVgfEgsGePscxNI42+jiQRI8JSP+3Bmt4aTnv0=;
  b=TTL89elp2/0F4QxPw32F7H3XWDjKtwApTqt87SZAkzFStCx6ftrp8FEo
   /XGEIgfe5TRk8iLJNPmtWO2qN9DsuTtr//hip7/azJwH1kIm3W9IJfneA
   1VduccksifWRgcr+fKgjPG5HoVCsDm5PiwH4lxqksKfhvEZKhUkMMYO5a
   Rt4KvC2OOzhCVWW/fe5NIDgm5N9OHGcgmX02H6wtVbytFhD5UoGNW5gsl
   QWluy4YZaTLPKhSsd4e2BYI3SHDs5lQKnbRsZhPgy1Ty3TOpMvWwxMuLI
   pBKrlZc2s+EK0DiUEVVhDwbTASX2l2meLYeWZsPOnKlId/14mucQvG/Pr
   A==;
X-CSE-ConnectionGUID: DKdjbGKnQyqNcv2xB11YQA==
X-CSE-MsgGUID: FZgfd1rDTfidb+y2OKTilQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19175988"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="19175988"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 17:31:31 -0700
X-CSE-ConnectionGUID: +oQF7jxRS/+U9IL6FcYevQ==
X-CSE-MsgGUID: YZTlhWapRoqJKRtb/na4Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="45768068"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jun 2024 17:31:30 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIHKJ-0001x3-36;
	Sat, 15 Jun 2024 00:31:27 +0000
Date: Sat, 15 Jun 2024 08:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pci-regs 1/2]
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000:
 reg-names:1: 'bridge' was expected
Message-ID: <202406150812.VDRpMyZU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pci-regs
head:   eb95bfa8f217b060d811eb5a6f0e5f0651320099
commit: a0dfeb01459cf986e982931e5f7092bfa4f1e90d [1/2] dt-bindings: PCI: microchip,pcie-host: fix reg properties
config: riscv-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406150812.VDRpMyZU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150812.VDRpMyZU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150812.VDRpMyZU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: reg: [[48, 0, 0, 134217728], [0, 1124073472, 0, 65536]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: reg-names:1: 'bridge' was expected
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: reg-names: ['cfg', 'apb'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: Unevaluated properties are not allowed ('reg', 'reg-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
