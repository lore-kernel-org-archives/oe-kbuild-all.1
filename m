Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721964;
	b=1mZelskr4X4KacUYSsqhenhctirFx1Kg9rrmq8SifpCF9QCX4o5jvKDMlkNCzRiXn61l
	 9ovlV4Oy6r+0+wB91AbSqV7uqHCQjoy6BOWOSlBdGBx44EH/Lvo8LPfOqkdif0lbJJ580
	 E+KLVHl9qkwwd1fplp+iMbtz24CfEeVo095WzDXHM14dxGNrcE8h37QePIFpl1FPFyBjg
	 0Pp7T5/HoHpxS2MUnIdXiX8+24GXhJWDZkRN/hK5hAinjT/p8BhzHGs3gcqPeDu1NtPIw
	 Qyl2p5Mh5WshLMDLWh8X7/qxjulnoavkO/+74WijcgH3at2ugb4bliw22uLU0ro7UgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721964;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=RtjWS+Rl15OxWIKAquzxeERLFmCYxpheVr2kTDLFGCs=;
	b=uM6fbQWY6Ykmah6xCSMtc7rJ2VJQrmbP3ynuDd3syOwp9PxkyjvXGcM4vhOW+QXTQw8b
	 roWvLA/SAj8twBTBpI5MGRA9UkHy3trrVb6BJbozkDih4yetSydlXt065u4tpUyBNuP9i
	 jXauiJsoAl9D+Go/SxNkS9n/LkKkkoXVL4Wm7hicYaHeg0QFmGfu0+i9tyhqzKVQ+9YI+
	 As/GYMHDzvcm2tdArYKP5MyNnlckZ43oBB1xm/A8ZnHDnHPMKUetctXYTo75smIqogL4t
	 pT89vBX8KzLhRzoDi80Nr10eselBdrLxNqeKnQH2NNftwKstt7Gd2buZxHAb5zSTbHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aFU1gZ0q;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8BA606A326
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Nov 2026 16:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC8BA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aFU1gZ0q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793721963; x=1825257963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q9SURTZ81MiAnKBH+kKXsgn9FP0ZpGgJ1Ua+t993uDM=;
  b=aFU1gZ0qsXHiiccI2PXI42geHCkKLsJRTzWIiovR4Dro9mL0Fdlwc03d
   h46MTTmJNfWuaGkDXybAEamoRHwnSf8bCic+GIRph4JTIO4JFHOebHA1b
   xemp2oQEVdizudmPGplMxO0jWEhyMeIn6O3tLvH9Hhz74p/YHDgS4R9RR
   ycI4JJ6HvcptElHHCzrLxFwwER0PTakGOblEUg51CX6g4mlzKknHorOkp
   N+NaJiPP0qTfeS4Oib65kBSGYb3wx022HicBhJWOBRae6Iv0RwHd/anpR
   AC+TScWFdqHUTukT753N7uDDnAi/JeJwSu86xqvcj3s6hBKHNUc1ghHzp
   A==;
X-CSE-ConnectionGUID: Kd5DVXgBTwCPliEnTx4dRA==
X-CSE-MsgGUID: AmmdjnEOQZOswvATZAqJpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2361998"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2361998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 08:06:03 -0800
X-CSE-ConnectionGUID: HtgbmJs7QSujkf9Xu7ssGQ==
X-CSE-MsgGUID: ORJ8voURRfq4ObwiFyuizw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6468510"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2026 08:06:00 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOH1J-00000000iwJ-24Wz;
	Tue, 03 Nov 2026 16:05:57 +0000
Date: Wed, 4 Nov 2026 00:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	jassisinghbrar@gmail.com, michal.simek@amd.com, tanmay.shah@amd.com,
	saeed.nowshadi@amd.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ssengar@linux.microsoft.com,
	tgopinath@linux.microsoft.com, srivatsa@csail.mit.edu
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
Message-ID: <202611032308.xkvLFqmo-lkp@intel.com>
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103062051.676519-1-ptsm@linux.microsoft.com>

Hi Prasanna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jassibrar-mailbox/for-next]
[also build test WARNING on linus/master xilinx-xlnx/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasanna-Kumar-T-S-M/soc-xilinx-Fix-event-manager-CPU-hotplug-state-cleanup/20261102-223515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20261103062051.676519-1-ptsm%40linux.microsoft.com
patch subject: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261103/202611032308.xkvLFqmo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611032308.xkvLFqmo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611032308.xkvLFqmo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mailbox/zynqmp-ipi-mailbox.c:141 struct member 'hp_state' not described in 'zynqmp_ipi_pdata'
>> Warning: drivers/mailbox/zynqmp-ipi-mailbox.c:141 struct member 'hp_state' not described in 'zynqmp_ipi_pdata'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
