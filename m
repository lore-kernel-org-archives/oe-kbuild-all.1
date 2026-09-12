Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A7647208D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212393; cv=none; b=ptXEpjvASxa5O/BfJBUbyWr3+3jdwf9dko8u1jnNBlaMZpXZPRs6CLcffvztJ552UAznjmUxgXXvvi62hxIQl8ah3ZglFvhpkz+9itiDzLgRt4IwcEYnmnJUkclL6IBy8Mzz+pIBr6C0xLzqscwRhoj5Z6vO6EOAaObNVqr5kgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212393; c=relaxed/simple;
	bh=TqnLrQqSUkQdpPaydIbMwLsACLKIenCml3h+qS/fyVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gzcOGcVd9UBqeic2xCA0IxBxYn8Rq0jfYdx3awTMg0eRxiEjpDst9zzKSeD828NWf7skpG4ET2U0GaQu2x0Nz4CK9pNah61zBOBsU0iKbozJzOdR1AlODJCJb+qmD3A7rhBcZG5GRvfM+dMK6zkoSSvjMNtnyViHROV1X5nO6+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ftfwb1gj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ftfwb1gj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789212390; x=1820748390;
  h=date:from:to:cc:subject:message-id;
  bh=TqnLrQqSUkQdpPaydIbMwLsACLKIenCml3h+qS/fyVg=;
  b=Ftfwb1gjAAwT6pHYYn7lHOHJjIvblgjlnTWFDfnNlxuZQ9rmPo/I4exg
   yyjDPLUQqif5N+vYsG8+eJha2MeDvmbzt1Aocb55os61Ky+Sj6aS39o1E
   gFGaouue0oMIWcM7aX/Cb60fGfZr7zdZSFpTlOEE3jGEP/2lAg1ItLMxM
   UiPCbzzseJIx7ktlQwtItlxQzmE4ES0DT8Ur49uMEIWhAWxznSS/mzYj0
   jL8yqObf/hkve8DwHtB18L812GbL4MdtXPg9tMedK7GtGWnoWN++0Qp/C
   /uHn/OfKIG7MSmYynKJ8OmhUdRjLe+9nSLOo6iP3xuC6D+zwWCGXR0vFV
   A==;
X-CSE-ConnectionGUID: E35/K3mCTFuKvzKQpWS8WA==
X-CSE-MsgGUID: Vz/CB7B3SZmRr3rbpIQ15A==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89864822"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="89864822"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 04:26:24 -0700
X-CSE-ConnectionGUID: 8TIfgoU9RRCsyoWZuA6xvw==
X-CSE-MsgGUID: yjCcFjOPTd6sVf+6jnib2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="275913929"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 Sep 2026 04:26:22 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5LsB-0000000014P-36KX;
	Sat, 12 Sep 2026 11:26:19 +0000
Date: Sat, 12 Sep 2026 13:25:31 +0200
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [linux-next:master 5325/6369] kismet: WARNING: unmet direct
 dependencies detected for QCOM_SCM when selected by QCOM_MDT_LOADER
Message-ID: <202609121313.T53mVXq1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   68142f986ff04b2b70b31db00f719bf690f64a9a
commit: 8fecd3194de338bdc0c57597be61fdcf33e1832d [5325/6369] firmware: QCOM interfaces should depend on ARCH_QCOM
config: openrisc-kismet-CONFIG_QCOM_SCM-CONFIG_QCOM_MDT_LOADER-0-0 (https://download.01.org/0day-ci/archive/20260912/202609121313.T53mVXq1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260912/202609121313.T53mVXq1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121313.T53mVXq1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCOM_SCM when selected by QCOM_MDT_LOADER
   WARNING: unmet direct dependencies detected for QCOM_SCM
     Depends on [n]: ARCH_QCOM || COMPILE_TEST [=n]
     Selected by [y]:
     - QCOM_MDT_LOADER [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
