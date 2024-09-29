Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2506D29429
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727630684; cv=none; b=qKgTbZGUb3IsrG33yjULgfjMSCrsy4O/Ag0Ic3wuL/uzxfkwYIF7Gq1oxpSd6y4zQFESgfMdmn+dOuaBNfVOdaJCbUkZs7prF11DdSy8MSaAgDyMWXGuJqATuMueneMe7MN0KBN/vtxA9thfSVhzefKgyhbqSvvVfR7WhQNf1bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727630684; c=relaxed/simple;
	bh=DQk2iGmC1L6dHj9FvSEzvqW0JVsc7hyih0RSXApP9+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bwfG8lTsUlnbtAIvo1u5y4mp0w9wrYgJk8CcbK+QFlB3VnljaXRn/X7CWprpGae5dNl2B1iP/Apfy5NS4PfUXrcyJuRadUZFZiVDCj0T841ViJNoNMnz9Yl6QkpKA6/jqjCa1Wwsd0XcmDleavRBn7V45wH6RYTEYKRn9lDN9KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCxIs3Uh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCxIs3Uh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727630682; x=1759166682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DQk2iGmC1L6dHj9FvSEzvqW0JVsc7hyih0RSXApP9+k=;
  b=OCxIs3UhBuKr5IHIC2S4k2qzja27xdaLpgh2oId2AofNPGzj6+56WKHX
   nJKJ+HFk8HR3U5UcyF3p1r6y5MS/Tk4IlYJtzurUgw2kP8MRi6hiZgyIy
   14a5/N6ndi6HtmFIxxInU0Ho0sSDkJ0D4PdbhPil00w/f2YnrQiRFKsKX
   KQ71qSxVGc3WrS9/6aM6e1UnROu7NvYTjibAzA+Y0CSkxlDV+DhSL/J/e
   AS4ie9LW5SiRDcBiRa1yet06oqdJdLCHL25wZKZcCSDfoeq1M+rZOwei3
   OPQc7IBhUL0R6TublTYF0hes9ekK1y6E+FnSCsBK0fa5vZ1/aPCuuUQGy
   g==;
X-CSE-ConnectionGUID: ICoIzcXTQxiTACaVCxNMkQ==
X-CSE-MsgGUID: /09gMS+TTciyezszKtph9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26592677"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26592677"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:24:42 -0700
X-CSE-ConnectionGUID: lfZMKWtxTHGG0BtcZKWLsA==
X-CSE-MsgGUID: 7CIhCLvpQEWHIithyIDfAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="103858834"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Sep 2024 10:24:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suxew-000OV9-0y;
	Sun, 29 Sep 2024 17:24:38 +0000
Date: Mon, 30 Sep 2024 01:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 861/966]
 arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202409300153.A95u5a8s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: d63797ef38e208e07c700d537b70b4eda4d2e86d [861/966] arm64: dts: renesas: r8a774c0-cat874: Add support for AISTARVISION MIPI Adapter V2.1
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240930/202409300153.A95u5a8s-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300153.A95u5a8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300153.A95u5a8s-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
