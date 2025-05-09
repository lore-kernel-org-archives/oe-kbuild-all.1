Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745B126B968
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778248; cv=none; b=gObvWJJIdDJQEafK/yX1m4IZ9YSGpqpkyY82rWhougtM+BXSPqGsl601JtVtXnhyINgmr4POx51vzTi0ZcKHCVyg9JVXoqJ9iAOoXxyuHMnZaXOEvBWofSPPQojopKDZQNDCcfkI5oTCZz/K2X5eGET8ngQLD3Fc4WyKWJipvIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778248; c=relaxed/simple;
	bh=cv0MiAJV1ZVlTxvYTCg+NR1rmHX7SpD7tgV5hKYutus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ghZsyRrL2B0h2NPcjEhArNIzLw2mUId7UC0jGf5PwkkDd2+fZZ+xxQglNpqvTZuZJtI9zyafovkg6BvSLBSFwo0Ox+QzsJhc2wcrkiU3+lFkZHDgfT3IQ7XpmqSrgjv0CQ9YTabAidWcbS9/GcSkX1AjE1Cg2MTW1pcV4JJzspA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSaGl5e4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSaGl5e4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746778247; x=1778314247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cv0MiAJV1ZVlTxvYTCg+NR1rmHX7SpD7tgV5hKYutus=;
  b=QSaGl5e4tYDUyevTQLF63bejBrrt97aljs9+w8NfllMcYestKz3wxTGo
   kph9vYsc7+aC9BcfLnkD2Hiiyd6S29We/P6YknBdY/62zjJLCt5L2oOQl
   u2rfIGu5e5nOzJQoWgUyL0+p+5wOTGEH2k7FN992dyR/6xlUMhOUw3dFn
   TuCY70tZoF0hEKfqHiX/Srl1jlW3ZD2/lQP2RXwL9Z2dz8ZWcB+uXPSet
   cVSBH874cVSlEBHvcHRNRLwk6XDSJtJa972FKRYYOzoykaV0BxSQehbXp
   Z5+U+EfSVMEVe9I1RJ2oqOr8ZrVW91D92Qd2E4Qt+6wDklz3roD8dv/3t
   A==;
X-CSE-ConnectionGUID: qkj+tTbMS2uNFWTcqefPEQ==
X-CSE-MsgGUID: +KDnkkxDQCeGuzi4CLXulA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59259367"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59259367"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 01:10:45 -0700
X-CSE-ConnectionGUID: o0p9QitbTaeV6tuln33Uzw==
X-CSE-MsgGUID: xiOjFVZ6QXeNUMRgvUud9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141325390"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2025 01:10:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDIob-000Bo9-1J;
	Fri, 09 May 2025 08:10:41 +0000
Date: Fri, 9 May 2025 16:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] kismet: WARNING: unmet direct
 dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
Message-ID: <202505091618.67Zey2IL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   1c2d70f8f169526119c3724bf454b1e7cfd65a16
commit: 3aecfb5d583a915dc68f9fb5b5bc7dd643d5016d [11/11] anolis: spi: add support for Phytium SPI
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PCI-0-0 (https://download.01.org/0day-ci/archive/20250509/202505091618.67Zey2IL-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250509/202505091618.67Zey2IL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091618.67Zey2IL-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PCI [=y] && SPI [=y] && SPI_MASTER [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
