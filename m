Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FE31F583D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 03:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761620816; cv=none; b=f3ugMv41M/P3oXBFDgO6ASlY6oVnES6AA4cWmLOVOLJoUCsQCf9pMMpT12yC6Rjlk1cEUa8P4oZCMAAXztQogKqHBacL3q/qYCTnXR3uqMyrXY59cU7wjV7bpWqX3/hWtAfhMLzxDDsNlV/hGyLnh0mYLVO9Zix5oCYGFFPz5hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761620816; c=relaxed/simple;
	bh=xf1gp9ZwAj290BdaHTZHHGg0zAqBchLXVLReMOjpbR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqNUv3hCRiWG7luRMaB8P6bFH7Vx+qeTqDpAuc08WrqWkLMt2mujXiLCIj0FVMiVmZ8I2M/AX9kgGkxAQ68miQC2bBlO0bPcCW7mJePBwBycrceSje5w6rO/wQI0PZYEtwBhUlrHBjCjKoAYJrBQBHZQ8ZDcGkqXG/PiJtOER9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESw9y9D1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESw9y9D1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761620814; x=1793156814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xf1gp9ZwAj290BdaHTZHHGg0zAqBchLXVLReMOjpbR8=;
  b=ESw9y9D1TYr0PIl+cI80AfECAlOV6zhD8+OhuAuUObrlXmSPY9NesNFW
   udO/1FsEfZGyyJocgOgAcy8/ITyHjwudUfm9u2VpRMTkez6SueDNAOID4
   ql7QgP06TvT34vtxXiC9iATxmA7MtFCV+uxGWQ2i63jWgRksuLBxoq417
   YXj7uX9kjnv/5tiUutxauFmCftB/uYhsE11UmOeFU49ovcx47svp2izmk
   +XCxcFhl812E3ZJ9iQ6iT2p6Idc0SWlJYloArY7p9tEdi+FScTls3uUA6
   QztAN77E2c4XDKGFBoB4htk+8jjQdcRM+Vfr56QqSCk7iECB+gsPkYFRG
   g==;
X-CSE-ConnectionGUID: WUYs48BJSEqMHgI2bcHlNw==
X-CSE-MsgGUID: +OBHhqG9RZ2LZWb4Yq2XSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51287534"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="51287534"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 20:06:54 -0700
X-CSE-ConnectionGUID: BFsbtOy6TMuyeIeXkN5SNw==
X-CSE-MsgGUID: 2W/BbVdhSP2jj11I25GD8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="184851330"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Oct 2025 20:06:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDa2o-000IgT-1C;
	Tue, 28 Oct 2025 03:06:46 +0000
Date: Tue, 28 Oct 2025 11:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com, quic_wenbyao@quicinc.com,
	inochiama@gmail.com, mayank.rana@oss.qualcomm.com,
	thippeswamy.havalige@amd.com, shradha.t@samsung.com,
	cassel@kernel.org, kishon@kernel.org, sergio.paracuellos@gmail.com,
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com, s-vadapalli@ti.com
Subject: Re: [PATCH v4 4/4] PCI: keystone: Add support to build as a loadable
 module
Message-ID: <202510281008.jw19XuyP-lkp@intel.com>
References: <20251022095724.997218-5-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022095724.997218-5-s-vadapalli@ti.com>

Hi Siddharth,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.18-rc3 next-20251027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Siddharth-Vadapalli/PCI-Export-pci_get_host_bridge_device-for-use-by-pci-keystone/20251022-180213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251022095724.997218-5-s-vadapalli%40ti.com
patch subject: [PATCH v4 4/4] PCI: keystone: Add support to build as a loadable module
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251028/202510281008.jw19XuyP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510281008.jw19XuyP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510281008.jw19XuyP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
>> ERROR: modpost: "hook_fault_code" [drivers/pci/controller/dwc/pci-keystone.ko] undefined!
ERROR: modpost: "__ffsdi2" [drivers/spi/spi-amlogic-spifc-a4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
