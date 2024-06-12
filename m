Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA32FDDC4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718159004; cv=none; b=FpO2BBU3B+xY5PHvL4DWOc7AdyTe7+DE41Meont2sYFDBHBPxal9satfQsPm9vjB5SBKv1DvVHJVz/lD6aSTIYk80TEUSwj7+jg6spk4vWRF6t+RG9nhOU0FJfatVGIjMQ7+Vk+xDnIas/lNpci8fk/SzqmL0ns0NeDedktFgok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718159004; c=relaxed/simple;
	bh=dvnUQIXmpq523RBqeUxXPR0IO7yrq78SWRXBUNLB0Bc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T9EAzv39h5AsfnyQG856/hcDJt2shzo4bTGGI4cqU3PIYHpySVIVF8RhF4leV+IB1gYvJq6RJ2i+YOORFAXxEUth2/GRyw27oLCIcE4lxjNpVKeH+xt4LDIl3/d12HUJAHw64mt/4eV1Edvx2UzY2oPocGX8GNMzJcimVEoCmzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7Id5dBf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7Id5dBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718159003; x=1749695003;
  h=date:from:cc:subject:message-id:mime-version;
  bh=dvnUQIXmpq523RBqeUxXPR0IO7yrq78SWRXBUNLB0Bc=;
  b=I7Id5dBfBiIVeTNZls+j9I+xeJUFLAV5derAYUD+er0iRXOq+FjDHp8A
   cjC8mjaUqx74cAEUqSKlPovTWScnlRKvrm/kbfwmQVMdOph7chymdRSB3
   k7y0gBU7dS/DgK9Q2xKl63DD3g3xakMc17bGDZUpkvhGnEryqiyo65dAx
   pDmosuq+K3ecfRWeuzrnhdAL/9D9WH9MHuKfWO3HuWGIMsmltqmVwEQqt
   2a6aRw6IyuDmyqqGh9ljkQ3s2NJNC1ch5sSjVYlPplygn/W0HdBFRQaRb
   3YYvw2v+TlRmHuD4IZCwbQTmEqy9yokwRVIFMOUMAMM9RHr8/YKywuH3K
   A==;
X-CSE-ConnectionGUID: qdusm3OUTVWDhtVFvaW+cA==
X-CSE-MsgGUID: iBEQL3xxS4Wa+ePctBsevw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26321440"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="26321440"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 19:23:22 -0700
X-CSE-ConnectionGUID: vh9VMqarSQGYq6uyvlTKRA==
X-CSE-MsgGUID: JG9MiEipS8agcfUkKVGveg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="44188406"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2024 19:23:21 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHDdu-000182-2N;
	Wed, 12 Jun 2024 02:23:18 +0000
Date: Wed, 12 Jun 2024 10:23:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 252/339]
 arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb:
 /bus@f4000/spi@20100000/tpm@1: failed to match any schema with compatible:
 ['infineon,slb9670', 'tcg,tpm_tis-spi']
Message-ID: <202406121018.KVnczrJW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   2cceab3b4473f10ed67af5ba77fdcbcff77d48d9
commit: a82cd18e65a787340a5f9ed6f858c36ce4e51dd6 [252/339] arm64: dts: ti: k3-am642-phyboard-electra: Add TPM support
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240612/202406121018.KVnczrJW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121018.KVnczrJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121018.KVnczrJW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: syscon@43000000: 'mux-controller' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: /bus@f4000/spi@20100000/tpm@1: failed to match any schema with compatible: ['infineon,slb9670', 'tcg,tpm_tis-spi']
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: /bus@f4000/spi@20100000/tpm@1: failed to match any schema with compatible: ['infineon,slb9670', 'tcg,tpm_tis-spi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
