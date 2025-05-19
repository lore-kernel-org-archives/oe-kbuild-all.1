Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241F41DE2A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671348; cv=none; b=sWRzKJ33+kWTUO0UhnvHqFz2dRexcjuxQ/MJwApbk9OXseURpF7WS/QWu/UAIVNzBT25+HngAEalvAgG3fDhRL14DaBP3SB79LbZeuTD4gBMu8rLAOcvaZG9EHfbTjXxSxvBE/5UBNR+BVuYJ+v+CSLFue+BCJaKIsfRi6E6O98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671348; c=relaxed/simple;
	bh=WJulGMP5CiP1eUPi8TGf+0yh9KLIFoKBzkx0tJSslrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPdGIOWTy1J2WGLwaUnBKrEZibn2RSHmKizXUKjWhtH/h8dhxe14+7HGVb4vMNLWms8xGn1St4ccth0jJEBtaXmwns/zTMx62OygmNBiFaNuvp8F8Kw5iC8wgTxGExqnh9BIl0NBneuumQDP2Ee/E8xz/NyXB1TmPA/RV92g+2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFJtHA2P; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFJtHA2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747671346; x=1779207346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WJulGMP5CiP1eUPi8TGf+0yh9KLIFoKBzkx0tJSslrI=;
  b=HFJtHA2P8p8mTqEdTRBX04cMMzQ+cq6ruAWl9pHiSWffoxecLxXW7lv7
   O+tsSQ9Ye49zrJhf7T9iOJSpUlUfGeh1Sd4NTG+X32C3KLC+57fxbzLmU
   YynZKBASxD7CmBdDWYEtsp6c1uQCmyWzgJexNZtkLlqxLVHAZMrEMZGy8
   3YRrHRbNvlEXSLvpCZ0bOFYdfCQ6b7XoKv9d8eTN59hUmYXEFgfEgSQ9t
   f30xK91aD54YERgfOIeWHkZl7wY8gWqreMRK6bHzi8mN8YEY/Anp9XvAH
   6uy06HYf2JkvclmnkUFlcuIjX8jKYaLddeAJbzg2KJcI0naA52y2drV3m
   A==;
X-CSE-ConnectionGUID: vvb7H28bQpC8RgGPcbflJg==
X-CSE-MsgGUID: zuc8aRUNSQCastyKSHGSng==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60232103"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="60232103"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 09:15:45 -0700
X-CSE-ConnectionGUID: gg0LTEFDTkSPPiMzOuZTpA==
X-CSE-MsgGUID: yYLSJgWHQ8mPgflBQ3j9hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="170317934"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 May 2025 09:15:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH39R-000LfY-2h;
	Mon, 19 May 2025 16:15:41 +0000
Date: Tue, 20 May 2025 00:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 6/6] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by
 X86_CPU_RESCTRL
Message-ID: <202505200012.nbqoFLNg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   950b90b563b8c87ae35bb6edc4775609bc9471c2
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [6/6] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS_PSEUDO_LOCK-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20250520/202505200012.nbqoFLNg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505200012.nbqoFLNg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200012.nbqoFLNg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=n] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=n] || CPU_SUP_AMD [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
