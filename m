Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F2713635C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 19:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729971026; cv=none; b=lNeSvdiBR9hSSKKzvbBs/yk9mYVbT373u4b68MzhO1NN7DLhQMuOEJGoncM3BqfCsHEHtL1m6e6ta1ELObA9/w7XdQNRGS5imkcbtgwa6560m9k7AUytcQROJ/Wa6kVrw2SluSnOYm0R7V1FO0D6kaNiTNSMUovnZwW3+hL208I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729971026; c=relaxed/simple;
	bh=2xMtohkeMRgRB7lgM3GYggeXb+F8Hz+jeiAxDJTS9f8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhWpelnuZqCOAzsiP0VyrYpFDSyJNj8DQQB92N5RTHgMx3GjX285KMGarkb6GwBYOlEBSYinDAoA7ePQCw/wwPCX0RcRNlZ3wwCg6uUpvy0SkxxFj8qu87lFfiTpBKi6iBFTmU2KdSp9dAEYG0jcBUsv6Xw85h+LAb+i0SNMS8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRnwBk/e; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRnwBk/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729971022; x=1761507022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2xMtohkeMRgRB7lgM3GYggeXb+F8Hz+jeiAxDJTS9f8=;
  b=TRnwBk/ezMydndxS5komdISx9uscwXSXd/L3kB4mA83gr8Yd0e6i6rii
   49GaYVlcp3aYMh5qp2gs+dmRG57vgNFwETfc8iTMnBiW8VNcf3Y/3OMts
   DY0lMNg/kwPwghMz3UnF2ThIQwx4yC7sIO+W0WFqxk6ahR5bOxVW1JbNS
   +a0qT6WH+AeAGN/2yJjHHbwQk+rcXqNAS7XsPVeRYMGHo8Fzx8qQ6BMtA
   u05TW9BAHsqkNP+6ul6rIE8zUWr0F+LLJTz1LmwsVobf+9GBZ6XJm7jM8
   gyUSEnB1Q8ELRby9liVJwb8RjN5dBjtiGlNRAzFhFhAe47NUcI9mQMW6h
   g==;
X-CSE-ConnectionGUID: HV1x4O70TA+iKh0fzpOhyA==
X-CSE-MsgGUID: rq7Qmj4MTyWJLVAYlneIuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="29835555"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="29835555"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 12:30:21 -0700
X-CSE-ConnectionGUID: HLgpHXgyQ9KgB/+kgTGP7g==
X-CSE-MsgGUID: T/9qpdfBRS23TJdDyxxgcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="81182715"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Oct 2024 12:30:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4mUL-000Zyq-1k;
	Sat, 26 Oct 2024 19:30:17 +0000
Date: Sun, 27 Oct 2024 03:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 6/11]
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning
 (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or
 ranges property, but no unit name
Message-ID: <202410270312.JtYSUUnY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   d9787b596cf182cf34ec02c3314d3fbb4b4b6443
commit: ae24c302b1d9994fb663118fe89348afef46e1da [6/11] CHROMIUM: arm64: dts: mt8188-geralt: Dynamic CMA change to carveout
config: arm64-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241027/202410270312.JtYSUUnY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270312.JtYSUUnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270312.JtYSUUnY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:37.40-40.7: Warning (unit_address_vs_reg): /soc/seninf-top@16010000/csi-receiver@0/port/endpoint@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:307.19-325.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:80.9-83.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:206.36-210.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:212.42-215.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:217.38-221.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:223.44-227.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.46-233.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.46-239.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:241.44-245.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188_geralt_camera_v4l2.dtsi:80.27-86.4: Warning (unit_address_format): /soc/i2c@11ec1000/vcm@0c: unit name should not have leading 0s
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1370.29-1394.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1476.35-1481.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1483.35-1488.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2316.42-2320.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2322.14-2358.5: Warning (simple_bus_reg): /soc/hcp@0: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2360.11-2384.5: Warning (simple_bus_reg): /soc/hcp-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3296.14-3321.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3323.15-3358.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:80.9-83.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:206.36-210.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:212.42-215.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:217.38-221.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:223.44-227.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.46-233.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.46-239.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:241.44-245.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1370.29-1394.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1476.35-1481.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1483.35-1488.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2316.42-2320.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2322.14-2358.5: Warning (simple_bus_reg): /soc/hcp@0: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2360.11-2384.5: Warning (simple_bus_reg): /soc/hcp-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3296.14-3321.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3323.15-3358.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3360.15-3395.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:80.9-83.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:206.36-210.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:212.42-215.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:217.38-221.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:223.44-227.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.46-233.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.46-239.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:241.44-245.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1370.29-1394.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1476.35-1481.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1483.35-1488.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2316.42-2320.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2322.14-2358.5: Warning (simple_bus_reg): /soc/hcp@0: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2360.11-2384.5: Warning (simple_bus_reg): /soc/hcp-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3296.14-3321.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3323.15-3358.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3360.15-3395.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:307.19-325.4: Warning (unit_address_vs_reg): /soc/dsi@1c008000/panel: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:80.9-83.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:206.36-210.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:212.42-215.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:217.38-221.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:223.44-227.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.46-233.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.46-239.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:241.44-245.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1370.29-1394.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1476.35-1481.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1483.35-1488.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2316.42-2320.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2322.14-2358.5: Warning (simple_bus_reg): /soc/hcp@0: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2360.11-2384.5: Warning (simple_bus_reg): /soc/hcp-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3296.14-3321.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3323.15-3358.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3360.15-3395.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:80.9-83.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:206.36-210.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:212.42-215.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:217.38-221.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:223.44-227.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.46-233.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.46-239.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:241.44-245.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1370.29-1394.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1476.35-1481.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1483.35-1488.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2316.42-2320.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2322.14-2358.5: Warning (simple_bus_reg): /soc/hcp@0: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2360.11-2384.5: Warning (simple_bus_reg): /soc/hcp-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3296.14-3321.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3323.15-3358.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3360.15-3395.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:80.9-83.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:206.36-210.5: Warning (unit_address_vs_reg): /reserved-memory/scp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:212.42-215.5: Warning (unit_address_vs_reg): /reserved-memory/apu-reserve-memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:217.38-221.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:223.44-227.5: Warning (unit_address_vs_reg): /reserved-memory/snd-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:229.46-233.5: Warning (unit_address_vs_reg): /reserved-memory/adsp-dma-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:235.46-239.5: Warning (unit_address_vs_reg): /reserved-memory/scp-dual-mem-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:241.44-245.5: Warning (unit_address_vs_reg): /reserved-memory/scp-isp-cma-region: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:247.36-251.5: Warning (unit_address_vs_reg): /reserved-memory/secure-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1370.29-1394.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1476.35-1481.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1483.35-1488.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2316.42-2320.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2322.14-2358.5: Warning (simple_bus_reg): /soc/hcp@0: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2360.11-2384.5: Warning (simple_bus_reg): /soc/hcp-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3296.14-3321.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3323.15-3358.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3360.15-3395.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property

vim +247 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi

     9	
    10	/ {
    11		aliases {
    12			serial0 = &uart0;
    13			i2c0 = &i2c0;
    14			i2c1 = &i2c1;
    15			i2c2 = &i2c2;
    16			i2c3 = &i2c3;
    17			i2c4 = &i2c4;
    18			i2c5 = &i2c5;
    19			i2c6 = &i2c6;
    20			mmc0 = &mmc0;
    21			mmc1 = &mmc1;
    22		};
    23	
    24		ppvar_mipi_disp_avdd: regulator-ppvar-mipi-disp-avdd {
    25			compatible = "regulator-fixed";
    26			regulator-name = "ppvar_mipi_disp_avdd";
    27			enable-active-high;
    28			gpio = <&pio 3 GPIO_ACTIVE_HIGH>;
    29			pinctrl-names = "default";
    30			pinctrl-0 = <&mipi_disp_avdd_en>;
    31			vin-supply = <&pp5000_z1>;
    32		};
    33	
    34		ppvar_mipi_disp_avee: regulator-ppvar-mipi-disp-avee {
    35			compatible = "regulator-fixed";
    36			regulator-name = "ppvar_mipi_disp_avee";
    37			enable-active-high;
    38			gpio = <&pio 4 GPIO_ACTIVE_HIGH>;
    39			pinctrl-names = "default";
    40			pinctrl-0 = <&mipi_disp_avee_en>;
    41			regulator-enable-ramp-delay = <10000>;
    42			vin-supply = <&pp5000_z1>;
    43		};
    44	
    45		backlight_lcd: backlight-lcd {
    46			compatible = "pwm-backlight";
    47			brightness-levels = <0 1023>;
    48			default-brightness-level = <576>;
    49			enable-gpios = <&pio 1 0>;
    50			num-interpolated-steps = <1023>;
    51			power-supply = <&ppvar_sys>;
    52			pwms = <&disp_pwm0 0 500000>;
    53		};
    54	
    55		/* chosen */
    56		chosen: chosen {
    57			stdout-path = "serial0:115200n8";
    58		};
    59	
    60		firmware {
    61			optee {
    62				compatible = "linaro,optee-tz";
    63				method = "smc";
    64				interrupt-parent = <&gic>;
    65				interrupts = <GIC_SPI 547 IRQ_TYPE_LEVEL_HIGH 0>;
    66			};
    67	
    68			mtk-svp-heap {
    69				compatible = "mediatek,secure_heap";
    70				memory-region = <&restricted_region>;
    71			};
    72		};
    73	
    74	        dmic_codec: dmic-codec {
    75			compatible = "dmic-codec";
    76			num-channels = <2>;
    77			wakeup-delay-ms = <50>;
    78		};
    79	
    80		memory {
    81			device_type = "memory";
    82			reg = <0 0x40000000 0 0x80000000>;
    83		};
    84	
    85		edp_panel: panel {
    86			compatible = "lg,lp120up1";
    87			pinctrl-names = "default";
    88			pinctrl-0 = <&edp_bl_pwm>;
    89			status = "disabled";
    90	
    91			port {
    92				edp_panel_in: endpoint {
    93					remote-endpoint = <&edp_out>;
    94				};
    95			};
    96		};
    97	
    98		/* system wide semi-regulated power rail from battery or USB */
    99		ppvar_sys: ppvar-sys {
   100			compatible = "regulator-fixed";
   101			regulator-name = "ppvar_sys";
   102			regulator-always-on;
   103			regulator-boot-on;
   104		};
   105	
   106		/* system wide LDO 1.8V power rail */
   107		pp1800_ldo_z1: regulator-pp1800-ldo-z1 {
   108			compatible = "regulator-fixed";
   109			regulator-name = "pp1800_ldo_z1";
   110			/* controlled by PP3300_Z1 */
   111			regulator-always-on;
   112			regulator-boot-on;
   113			regulator-min-microvolt = <1800000>;
   114			regulator-max-microvolt = <1800000>;
   115			vin-supply = <&pp3300_z1>;
   116		};
   117	
   118		/* separately switched 3.3V power rail */
   119		pp3300_s3: regulator-pp3300-s3 {
   120			compatible = "regulator-fixed";
   121			regulator-name = "pp3300_s3";
   122			/* controlled by EXT_PMIC_EN2 */
   123			regulator-always-on;
   124			regulator-boot-on;
   125			vin-supply = <&pp3300_z1>;
   126		};
   127	
   128		/* system wide 3.3V power rail */
   129		pp3300_z1: regulator-pp3300-z1 {
   130			compatible = "regulator-fixed";
   131			regulator-name = "pp3300_z1";
   132			/* controlled by PP3300_LDO_Z5 & EN_PWR_Z1 */
   133			regulator-always-on;
   134			regulator-boot-on;
   135			regulator-min-microvolt = <3300000>;
   136			regulator-max-microvolt = <3300000>;
   137			vin-supply = <&ppvar_sys>;
   138		};
   139	
   140		/* system wide 4.2V power rail */
   141		pp4200_s5: regulator-pp4200-s5 {
   142			compatible = "regulator-fixed";
   143			regulator-name = "pp4200_s5";
   144			/* controlled by EC */
   145			regulator-always-on;
   146			regulator-boot-on;
   147			regulator-min-microvolt = <4200000>;
   148			regulator-max-microvolt = <4200000>;
   149			vin-supply = <&ppvar_sys>;
   150		};
   151	
   152		/* system wide 5.0V power rail */
   153		pp5000_z1: regulator-pp5000-z1 {
   154			compatible = "regulator-fixed";
   155			regulator-name = "pp5000_z1";
   156			/* controlled by EC */
   157			regulator-always-on;
   158			regulator-boot-on;
   159			regulator-min-microvolt = <5000000>;
   160			regulator-max-microvolt = <5000000>;
   161			vin-supply = <&ppvar_sys>;
   162		};
   163	
   164		pp3300_wlan: regulator-pp3300-wlan {
   165			compatible = "regulator-fixed";
   166			regulator-name = "pp3300_wlan";
   167			pinctrl-names = "default";
   168			pinctrl-0 = <&wlan_en>;
   169			gpio = <&pio 12 GPIO_ACTIVE_HIGH>; /* EN_PP3300_WLAN_X */
   170			enable-active-high;
   171			regulator-always-on;
   172			vin-supply = <&pp3300_z1>;
   173		};
   174	
   175		pp3300_edp_disp: regulator-pp3300-edp-disp {
   176			compatible = "regulator-fixed";
   177			regulator-name = "pp3300_edp_disp";
   178			enable-active-high;
   179			gpio = <&pio 27 GPIO_ACTIVE_HIGH>; /* EN_PP3300_EDP_DISP_X */
   180			pinctrl-names = "default";
   181			pinctrl-0 = <&edp_disp_en>;
   182			regulator-boot-on;
   183			vin-supply = <&pp3300_z1>;
   184		};
   185	
   186		pp3300_mipi_tchscr: regulator-pp3300-mipi-tchscr {
   187			compatible = "regulator-fixed";
   188			regulator-name = "pp3300_mipi_tchscr";
   189			enable-active-high;
   190			gpio = <&pio 144 GPIO_ACTIVE_HIGH>;  /* EN_PP3300_MIPI_TCHSCR_X */
   191			pinctrl-names = "default";
   192			pinctrl-0 = <&mipi_tchscr_en>;
   193			regulator-boot-on;
   194			vin-supply = <&pp3300_z1>;
   195		};
   196	
   197		/*
   198		 * The reserved memory space address and size MUST be in line with the
   199		 * EMI PMU configuration in the firmware.
   200		 */
   201		reserved_memory: reserved-memory {
   202			#address-cells = <2>;
   203			#size-cells = <2>;
   204			ranges;
   205	
   206			scp_mem_reserved: scp-mem-region {
   207				compatible = "shared-dma-pool";
   208				reg = <0 0x50000000 0 0x800000>;
   209				no-map;
   210			};
   211	
   212			apu_reserve_memory: apu-reserve-memory {
   213				compatible = "shared-dma-pool";
   214				reg = <0 0x55000000 0 0x1400000>;
   215			};
   216	
   217			adsp_mem_reserved: adsp-mem-region {
   218				compatible = "mediatek,adsp-reserved-memory";
   219				reg = <0 0x60000000 0 0xF00000>;
   220				no-map;
   221			};
   222	
   223			afe_dma_mem_reserved: snd-dma-mem-region {
   224				compatible = "shared-dma-pool";
   225				reg = <0 0x60f00000 0 0x100000>;
   226				no-map;
   227			};
   228	
   229			adsp_dma_mem_reserved: adsp-dma-mem-region {
   230				compatible = "shared-dma-pool";
   231				reg = <0 0x61000000 0 0x100000>;
   232				no-map;
   233			};
   234	
   235			scp_dual_mem_reserved: scp-dual-mem-region {
   236				compatible = "shared-dma-pool";
   237				reg = <0 0x70000000 0 0x0a000000>;
   238				no-map;
   239			};
   240	
   241			scp_isp_cma_reserved: scp-isp-cma-region {
   242				compatible = "shared-dma-pool";
   243				reg = <0 0x7a000000 0 0x05000000>;
   244				reusable;
   245			};
   246	
 > 247			restricted_region: secure-region {
   248				compatible = "mediatek,dynamic-restricted-region";
   249				reg = <0 0x7f000000 0 0x400000>;
   250				no-map;
   251			};
   252		};
   253	
   254		pp5000_usb_p1_vbus: regulator-pp5000-usb-p1-vbus {
   255			compatible = "regulator-fixed";
   256			regulator-name = "pp5000_usb_p1_vbus";
   257			enable-active-high;
   258			gpio = <&pio 150 GPIO_ACTIVE_HIGH>;
   259			vin-supply = <&pp5000_z1>;
   260		};
   261	};
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
