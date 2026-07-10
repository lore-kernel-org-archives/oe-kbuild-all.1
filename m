Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E473B0AF7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 07:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669053; cv=none; b=ob6D/OLjCPYdp86wmJhZjPOxrHOLyk4TbCzIG/eVe9Of/BV4NoMs7qgIR0eTWZDLOv5agwfRzuekBfjaDepnIotWpyOTRg8AA7/owHZjV6JKBHKyNWl1gQpd8L0U+X//5fZmi1o2QBi9JIW9fgzYUSmJBMyvdcU+axeWu3Bjf/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669053; c=relaxed/simple;
	bh=Q84mpf151X8pqB39XUKYjd6jYuUYQARUXDuLbl8MCnE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gJ6jaM9Z6M9LwQ37BL5YUyCBSAUbMaMKeRWMbJ+Ifq72RrRAcUReHX/lCi6aQxsz610xsx6WiB0rFASx0zRqyJpwGyj93kS7bv1+x2HMESR1rn/JCNGmTyxT8FNT9AUu9vYdFlo/NwYbI+0tLYeZLFM+MF6T6dUDfIIaT2mwnzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdW0FGTS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdW0FGTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783669051; x=1815205051;
  h=date:from:to:cc:subject:message-id;
  bh=Q84mpf151X8pqB39XUKYjd6jYuUYQARUXDuLbl8MCnE=;
  b=FdW0FGTS3FgE7r5OAZAXo0IlgpSzB6rc97q1C6dmFVDdTyoVosTf6Ql9
   i0yNcopG1NL3uPoZpADba1acqZxRvn7H2xSHK83iVt4O4TgNXUo+m0ZKz
   GBdE9jivzoiDm1EJ3bPk+aNUU8MtXlUR8fnRKSI4i3fpgfqrmWv0t16Ao
   xBkoxL5Dpd+qudqqr1O97KHAGJ8/ZJR2uZc1YOs54ldLOD+ZkBTDKSDsT
   dVGLtYGrMcXRKk2AqDSGH6wAS/Lzk/YDPjoy3HdJ0WDabJ/xm6ZRm33J8
   ZdnMFW1xf0PmHYz+GBIoJO3ZYS+AwT0RVQElySpBw7Yo++te4/QzseP0p
   w==;
X-CSE-ConnectionGUID: QauJzi+cT7m9IZSmCICuHw==
X-CSE-MsgGUID: IjD6qsiORDCIKNQo9ka7Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84243377"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84243377"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 00:37:30 -0700
X-CSE-ConnectionGUID: 11ZB51PsRxCL4wK7vjIxEw==
X-CSE-MsgGUID: zw7GoeIsR+eVHuKLBYu0fw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jul 2026 00:37:28 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi5na-0000000038L-1SAk;
	Fri, 10 Jul 2026 07:37:26 +0000
Date: Fri, 10 Jul 2026 09:37:08 +0200
From: kernel test robot <lkp@intel.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb:
 framebuffer@e3940000 (simple-framebuffer): 'dummy-panel', 'interconnects' do
 not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
Message-ID: <202607100934.6so0Pwih-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a635d6748234582ea287c5ffeae28b9b23f91c7e
commit: edbf03c9fb5ff72f8e7974b35f7ee2d9ae7cb371 arm64: dts: qcom: Add the Nothing Phone (3a)
date:   2 months ago
config: arm64-randconfig-2055-20260708 (https://download.01.org/0day-ci/archive/20260710/202607100934.6so0Pwih-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100934.6so0Pwih-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: edbf03c9fb5f ("arm64: dts: qcom: Add the Nothing Phone (3a)")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607100934.6so0Pwih-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/milos.dtsi:391.11-395.4: Warning (unique_unit_address_if_enabled): /memory@0: duplicate unit-address (also used in node /soc@0)
>> arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb: framebuffer@e3940000 (simple-framebuffer): 'dummy-panel', 'interconnects' do not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
>> arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb: /chosen/framebuffer@e3940000/dummy-panel: failed to match any schema with compatible: ['boe,bf068mwm-td0']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
