Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82483611E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 00:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739752040; cv=none; b=lFSzX9WPALU0giN1iEB18vQXC0yhvplEW/T79yaOEwBklm2jC+oUWQk8BRRL/066onX9NWLNmZVt5/cfaSYzMxWn09B1Ku9Zz05oDer24PAXq4/Z66CEQQuOQyPN1snRAaPj+gSCmSDGMB3ZkUb7oh7cN9cmFCLR0PSmQohKnCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739752040; c=relaxed/simple;
	bh=PGe0/+PNWJ1PObZWNG66B6aLh0UxDKrwU1OGdcX/K+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9f9XmtCdpvPfgbYLja4cVdmxFR1I8PflLfM1LYlOHKQEL+SJyHNQOBEEIfdptsnvXklkD7O0cGqAcEXOJNFrq8kXwoCioWi4zp5KVM8LVDMRMuOW5d0QJtJK+dA320HZaTvYOiPZJWMT2UweEh/i05HZsSlYefUzjCHPWrDQsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atBBf4+3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atBBf4+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739752039; x=1771288039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PGe0/+PNWJ1PObZWNG66B6aLh0UxDKrwU1OGdcX/K+s=;
  b=atBBf4+3WAYZvmJiidsbVArR1n70EPC6ptREgF/tT+b2paku4E6hiN8X
   y36JgSAcmCVYHjvBW4IsSlihSZTeP4MxXGkSPqLqPzxk4P+U3K5M3Z2X7
   2KI+wbNrlIC7FAYzV3Nr7GWkdVomd7jkW9B2zIcolhOIyWeXmujfbwA7S
   xmmntt2WzVvxyEe5/fF2sp5FtoNbOsdiXmqmMTYa4lUQMp0cKZvEmQUuC
   9MhrG20jqz0mtDKajGrwnwo77WXZBBq7x0deOw9nCnyFnxn2GNBFF0yYF
   xzYGyX1NJMdOFnIrgj/UeT0Q9tdjW6A6YDmSZADJ2EVdRiawmzbC39Yk7
   A==;
X-CSE-ConnectionGUID: La7D4rmzTX2qcD2TQy9FXg==
X-CSE-MsgGUID: Fczl89n2S6WH1fyItWYOZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="57957381"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="57957381"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 16:27:15 -0800
X-CSE-ConnectionGUID: KinnFi/aRuCug72mMmbzdA==
X-CSE-MsgGUID: Dew4Rm2dTou3QORDvGjxUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="114603320"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Feb 2025 16:27:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjoye-001CPL-0T;
	Mon, 17 Feb 2025 00:27:12 +0000
Date: Mon, 17 Feb 2025 08:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 8/13] arch/m68k/kernel/embedded_dtb.S:15:7:
 warning: "CONFIG_M547x" is not defined, evaluates to 0
Message-ID: <202502170841.nS3ts5sF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   6e903c856c98dabb890acf18c07497d375765cec
commit: 014d73779642b676ae285ed44a159b1a2c20bde2 [8/13] m68k: implement an embedded devicetree for nonmmu
config: m68k-randconfig-r122-20250215 (https://download.01.org/0day-ci/archive/20250217/202502170841.nS3ts5sF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250217/202502170841.nS3ts5sF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170841.nS3ts5sF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/m68k/kernel/embedded_dtb.S:15:7: warning: "CONFIG_M547x" is not defined, evaluates to 0 [-Wundef]
      15 | #elif CONFIG_M547x
         |       ^~~~~~~~~~~~


vim +/CONFIG_M547x +15 arch/m68k/kernel/embedded_dtb.S

    12	
    13	#ifdef CONFIG_M520x
    14	.incbin "arch/m68k/boot/dts/mcf5208evb.dtb"
  > 15	#elif CONFIG_M547x

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
