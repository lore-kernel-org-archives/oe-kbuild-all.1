Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2A334D4CD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 18:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761072937; cv=none; b=WBSBlBsS52DyZ3eXrNKQcZ3te0isBJMFMX5fuZSazlCBtPeQod0xwSHaI7E55qCeuiOFD6QYGJfounPj/5HySxPncXODeHClWadk5YTt57GbfSz2P6duF5S4NKWVnLEmLi51R9rBfFpXM1HtiKOrBU4ixsR/wiziSedEUWrEwws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761072937; c=relaxed/simple;
	bh=0iS6Y0QMTl0m9p84s8jCdzkkCgi8SAoz0IYbF+Y8NFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ClTY4wFBM9H3IgnGE66gpHPPWfUbUxUnpLybDl9dhVqDCqdkGHW+fPxkOvRt18btHlKLExQJ++Efj2MVPvzuvW5Vtn1L6XTthSQQUeRuLHHr0u6AkCq5kXblhTdwa7lxVjND+PA80cBChVMXWI8jgoaHAYiTBbKAL7m7fAkp6AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0uzM6Mw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0uzM6Mw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761072936; x=1792608936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0iS6Y0QMTl0m9p84s8jCdzkkCgi8SAoz0IYbF+Y8NFw=;
  b=I0uzM6MwsyjyODEmQuGqVUGtkm1doDptV9lgNXxd47zDBiYbpgLEwKl6
   Iz5ok5xCtI0sIVtuf7oaRW/A5wgKroStxTE8fOk8/HaBAlozIcRshwj+2
   hVhsrMF3RRnKGx40s76k3xE2LZlMDJau05W2zJy7zPTbd0+uLsa/56JlI
   5WyWMXa+0aaJPBhuCgUcDwxoaTxBCdNXsjnUsRPesBnELOK44ToWDJpC5
   fizlc8zWVeisfnZgmpBdgTdJjA/K8lAURAVGBy2ho3WGzpIWLUrhYp64p
   m8KAfVKe+mmBn7Q8HQV3NshtbyD/mM1oUQHIXlWFfdxI0Fh//j140ivfJ
   g==;
X-CSE-ConnectionGUID: GM8+4DQjQUuC2dQDF4rw4A==
X-CSE-MsgGUID: ur/l9MxkQfScx2T96ubn7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63249894"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="63249894"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 11:55:35 -0700
X-CSE-ConnectionGUID: sAHjwhYITASBzA12Svu9/Q==
X-CSE-MsgGUID: IR2PlY2uRXyJTdni+a6jaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="188778765"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Oct 2025 11:55:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBHW5-000BCE-2x;
	Tue, 21 Oct 2025 18:55:30 +0000
Date: Wed, 22 Oct 2025 02:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yao Zi <ziyao@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 2502/3056]
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: pcie@fe000000
 (rockchip,rk3528-pcie): 'msi-map' is a required property
Message-ID: <202510220254.16yarf4I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
commit: 047bac0be317e68b89d0deed4f659f8e080df6e8 [2502/3056] arm64: dts: rockchip: Enable PCIe controller on Radxa E20C
config: arm64-randconfig-051-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220254.16yarf4I-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220254.16yarf4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220254.16yarf4I-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1229.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: pcie@fe000000 (rockchip,rk3528-pcie): 'msi-map' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: pcie@fe000000 (rockchip,rk3528-pcie): interrupt-names:5: 'dma0' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: pcie@fe000000 (rockchip,rk3528-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-pcie', 'rockchip,rk3568-pcie'] is too long
   	'rockchip,rk3568-pcie' was expected
   	'rockchip,rk3528-pcie' is not one of ['rockchip,rk3562-pcie', 'rockchip,rk3576-pcie', 'rockchip,rk3588-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: pcie@fe000000 (rockchip,rk3528-pcie): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/pcie@fe000000: failed to match any schema with compatible: ['rockchip,rk3528-pcie', 'rockchip,rk3568-pcie']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
