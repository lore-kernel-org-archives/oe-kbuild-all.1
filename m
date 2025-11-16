Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C6421B9E2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 16:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763308879; cv=none; b=n/gQWWvTFtBQWf6+B1rcO3fcAQE+ciqarb8npQokDkthFLWZPst8nThDA7nuNdDPMVa4dWEG/s0LRL5/ykLyGV1D3Urj/e/oTynmPiDtIsB8jfdl20ROE12UcE1UMvDeUJdKr3kKS7pxyKYyehY1vAHLKS96mT8G0K19mHFKgs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763308879; c=relaxed/simple;
	bh=+50pULhO7jW7bUQYjCEdTzoael3aZyuCALrB48Qxchc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYNF0/OvV9/h59jwNVmGhrXtKunj5LWag6ldGa3sn3Xseaur0pf8s290HLx1aaZJpG56yBFPmYdIMqMP38fIW0Zkg0cqhg9lhhgCOGKV5HWEcOUTlQHzMB9gLLFd8oO73uXG9U+Jn+q1krVXVPCPYRIqyvIqGZt507uEVQqdJ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIG090ml; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIG090ml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763308877; x=1794844877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+50pULhO7jW7bUQYjCEdTzoael3aZyuCALrB48Qxchc=;
  b=nIG090mlnl9PIOA+A0Yo5YZDODFxVcuQdYV08ZEPoh5O+GlcMni1/zLY
   bb4qdaY2vK4EW07RuXmAAFf+4jW9rBhB+CJS/i0MPXidABfURrrPywplB
   ERSyzj/XxmifdyLDDS7dV/iIVClfVgVULc/CEvt3Ad7WXLWG+E/qlG23P
   2SQkPQtZ8MkWACKX8tJ+RAgSu4Pd1AThCbM8MKvwlZI18zDysYgn+Hbgn
   sXKLf2mMUl0kNFlddWPIx55PrNImhdACAQ8IwaVkpDkoeESPVrLSoPxSP
   XFISU4dxc6NPIcGHXwyRPvd6kXLnjCfzHAEcBzjsNlFin3iAlP7UHhTrI
   w==;
X-CSE-ConnectionGUID: BeihYvwsT16wApAJ9Hs68w==
X-CSE-MsgGUID: 9YHP20oEQUy2mbMZ06WnaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82713707"
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="82713707"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 08:01:16 -0800
X-CSE-ConnectionGUID: ijs9zLdZRAKifVnHm5b7Lw==
X-CSE-MsgGUID: xTlQmkDEQ7+4HMCAEzNQ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="190052639"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Nov 2025 08:01:15 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKfBh-0008sd-0f;
	Sun, 16 Nov 2025 16:01:13 +0000
Date: Mon, 17 Nov 2025 00:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet
 support
Message-ID: <202511162313.yUFpIObu-lkp@intel.com>
References: <20251110203926.692242-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110203926.692242-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-devel/next]
[also build test ERROR on linus/master v6.18-rc5]
[cannot apply to next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-renesas-rzt2h-n2h-evk-Enable-Ethernet-support/20251111-044225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20251110203926.692242-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v3] arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support
config: arm64-randconfig-r071-20251114 (https://download.01.org/0day-ci/archive/20251116/202511162313.yUFpIObu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511162313.yUFpIObu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511162313.yUFpIObu-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:77.1-7 Label or path ethss not found
   Error: arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:87.1-7 Label or path gmac1 not found
   Error: arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:96.1-7 Label or path gmac2 not found
   Error: arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:118.1-7 Label or path mdio1 not found
   Error: arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:129.1-7 Label or path mdio2 not found
   Error: arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:140.1-11 Label or path mii_conv0 not found
   Error: arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:145.1-11 Label or path mii_conv1 not found
   Error: arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:150.1-11 Label or path mii_conv2 not found
   Error: arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:155.1-11 Label or path mii_conv3 not found
   Error: arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts:152.1-11 Label or path mdio1_phy not found
   Error: arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts:156.1-11 Label or path mdio2_phy not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
