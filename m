Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E18E277818
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 08:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913964; cv=none; b=kSQt3raoriq1NHoL7UEASvhEfC5ffRKub0nFjrb9uVCUBWKBp8RgPdvO/CwH8Ry8mXtYXvN+aCWu+Y5CSjA2zxk3J+PPSiL1rYV1Q/yfm8aPUS8nJvcaxtLKTjUl9qt8/zzKTkVE11hr9pDI5qljONRiA5NOhdl37Ry8XyinPiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913964; c=relaxed/simple;
	bh=XJbOu8oe6MHnFoBGQc7cHTHtXhGx4hB36GKy8vSOICk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K14WsAOramBfy1shfZWSoh0i830uerxNUFt8T9qXnZMwrkp1xq0ml8RW4hUot4xG8hvXX3+Ea1FszzSZcvUMtfrDDn6hLOwvW0F2jNyGJvqAXklISlwZrjE06BTSGNkfQZaGLi4IAhDyUIiJJOr3kgsKlzIGWLNHPvHEAIql6TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DncP7Ez0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DncP7Ez0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745913962; x=1777449962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XJbOu8oe6MHnFoBGQc7cHTHtXhGx4hB36GKy8vSOICk=;
  b=DncP7Ez0AcRr4WQ9aFrvdFs7nNl8rWvDzbQFZyzIhwr7AUIB3VBVXtHp
   z3LRuytVcWVW8Nt0rLtEd+/l0awWz5c6X6HFkMNLe4Img8Iw4rrNwMNe0
   xo21DkKVsT1HwMEnsNzsf7K15XPFzwc86RQRp6ReViXapVn5N6gQwZx/Z
   QhDof6DVyZXMWytmePAcvdRRRP9gamFBIQ2eHCVVbFFK11374vhFC2pSp
   /D6ApNNAmh+walnfFGDLwXmCwodEqQsyAUqk5LR2Pa40jxHQTb3a8cDUc
   s6UgOJzUJyqDZ7VHUghSl5WHJ310s1RaDeKmqa8/AmTWqqBchj/Dkn76a
   A==;
X-CSE-ConnectionGUID: YvEpzlG5T+CYUhuJDCGt4A==
X-CSE-MsgGUID: gM1SUm64S1mJTyXXjVxoUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47537529"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="47537529"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 01:05:48 -0700
X-CSE-ConnectionGUID: 98GuK9QCRYSrVo/7tNEo5g==
X-CSE-MsgGUID: WIUxjBp3S2eSXWSWqrFQiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="164699249"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Apr 2025 01:05:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9fyI-0000ZP-08;
	Tue, 29 Apr 2025 08:05:42 +0000
Date: Tue, 29 Apr 2025 16:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, peter.ujfalusi@gmail.com,
	vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	praneeth@ti.com, vigneshr@ti.com, u-kumar1@ti.com, a-chavda@ti.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/8] dmaengine: ti: New driver for K3 BCDMA_V2
Message-ID: <202504291527.tCMC8UGh-lkp@intel.com>
References: <20250428072032.946008-7-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428072032.946008-7-s-adivi@ti.com>

Hi Sai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.15-rc4]
[cannot apply to next-20250428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sai-Sree-Kartheek-Adivi/dt-bindings-dma-ti-Add-document-for-K3-BCDMA-V2/20250428-152616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250428072032.946008-7-s-adivi%40ti.com
patch subject: [PATCH 6/8] dmaengine: ti: New driver for K3 BCDMA_V2
config: arm64-kismet-CONFIG_TI_K3_RINGACC-CONFIG_TI_K3_UDMA_V2-0-0 (https://download.01.org/0day-ci/archive/20250429/202504291527.tCMC8UGh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250429/202504291527.tCMC8UGh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291527.tCMC8UGh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TI_K3_RINGACC when selected by TI_K3_UDMA_V2
   WARNING: unmet direct dependencies detected for TI_K3_RINGACC
     Depends on [n]: SOC_TI [=y] && (ARCH_K3 [=y] || COMPILE_TEST [=y]) && TI_SCI_INTA_IRQCHIP [=n]
     Selected by [y]:
     - TI_K3_UDMA_V2 [=y] && DMADEVICES [=y] && ARCH_K3 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
