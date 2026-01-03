Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FEE2C0F83
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 15:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767455382; cv=none; b=oVXuzlbPYsecrU9PeaGEifAcbbJWRuuWbXWtyFvu2Apct7+ZJFGRMT9kjfDDUg68GnTwe2HC3YECRERym7ETI3ZaEiUvVmK6wkuyznFg2LR/j/ZjFK6hRcI2xKTcswj8aqYZPX+y+uK6LRcm1HsWWLMU/LEY2r7qSl+pdaq4AeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767455382; c=relaxed/simple;
	bh=UdpQuAVYg3go+KFGqbG7KFffUg4tuMyA9VNoUN7RR3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skF34k+vjzfwy+q+4QzYQHpLOSp4JmexI3UnGEXawFYvK58E97InjTstEC62k8Z+0rjcfjATJkKqwWLi8kTK6JX/agO1e58uUPvvrKrX9eWDLJRbxQ+H0KAYeWi/BnnjW4FQZcFrcOJXp2wn7xF+tOxPJE5xQ51Fc2yxxp1MrNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMzsZJIA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMzsZJIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767455368; x=1798991368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UdpQuAVYg3go+KFGqbG7KFffUg4tuMyA9VNoUN7RR3Y=;
  b=OMzsZJIAjdFh/HUD1xm50HyjOweOw/3sxZi0eaq9MkKpEmCv7qqMeQES
   eSYyGNdznc3NQKCs5MhU92JIHZULKJkOYZMU0dca3tq/EEa75lKIYjZ+Y
   bAakV33wWDHQ42jItwOOAZcQWq39Kyhe8IzIIZ1014wwc6Rflxr4MN0Nk
   lOqOPsuczqEdEetrMGOreh2fT+/P4zyaf1PqDpDNcp+fo08YgY+Uf/y6D
   uRqFxPE3HoLftIwMgawHXeUPRL+w9ZhPtg/VQp9yY0UrQ4kQdMYVzTFFA
   TeIkF/9bjMCONMruB9gpukhcssEyzEBQyVKdbjlExrkIFFIXsA62I4g8Z
   Q==;
X-CSE-ConnectionGUID: e0xX5bQ9R/WeZ1VyWSV63A==
X-CSE-MsgGUID: 8e21lN9/R1qsYKf2pMY5Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="91553964"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="91553964"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 07:49:23 -0800
X-CSE-ConnectionGUID: VXe0M/DUTV+IwoUHCnqyLA==
X-CSE-MsgGUID: J3J+DASXReGVxFLZ02U9iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202033309"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 Jan 2026 07:49:20 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc3sT-000000000j3-1173;
	Sat, 03 Jan 2026 15:49:17 +0000
Date: Sat, 3 Jan 2026 16:49:04 +0100
From: kernel test robot <lkp@intel.com>
To: Charan Pedumuru <charan.pedumuru@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Message-ID: <202601031603.9yKl8K9G-lkp@intel.com>
References: <20260103-nvidia-nand-v4-1-3156f46f3a5e@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103-nvidia-nand-v4-1-3156f46f3a5e@gmail.com>

Hi Charan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 43edce71d70c603d3f3f1b1c886f65cd02d80c24]

url:    https://github.com/intel-lab-lkp/linux/commits/Charan-Pedumuru/dt-bindings-mtd-nvidia-tegra20-nand-convert-to-DT-schema/20260103-131107
base:   43edce71d70c603d3f3f1b1c886f65cd02d80c24
patch link:    https://lore.kernel.org/r/20260103-nvidia-nand-v4-1-3156f46f3a5e%40gmail.com
patch subject: [PATCH v4] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20260103/202601031603.9yKl8K9G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601031603.9yKl8K9G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Using alabaster theme
   ERROR: Cannot find file ./include/linux/pci.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
