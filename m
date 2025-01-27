Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666A280B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 00:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737939476; cv=none; b=naeO6Ak0JazkoCIF4T67w/imPSyrdRGoocTBn8QJc9TdXRv5JODuzhMIha5CriJw4C3QGl5+1oyQ0+S2/jXiyR8M+ArnHYdkNdGcfwhX6hxMxoi4hrL7HKJqTYsPIy+8YRBuqR0b8HVa6dZvsetgDR9AJkp4U0Ysy2c7aTK57ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737939476; c=relaxed/simple;
	bh=dDLs1n4vWCKgUW6h0NBBAleTEunk/AbTwql/tdm0WjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JOd55NsIIjMfczmXzt2GvG0ePYfGZqxhmYVp3P4htR8bcUh+IKUeYSVp7Hpcblroq6q9njYPZ4M2hbFrzDkdIC/LnWIxPJj2CeKJI8/10d6tnMir6a6X+gcmTVzci/ImqHzCTWMdOYVbRLdNL2f457wLZcLLTKOmCzbW8QgKxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAIf5KRX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAIf5KRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737939474; x=1769475474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDLs1n4vWCKgUW6h0NBBAleTEunk/AbTwql/tdm0WjM=;
  b=MAIf5KRXqVkXufK6jhCMXemq8xKPvKenF3K4tNtfyZwMhjmgT/FjdyRw
   /+fKV6O13YSFWNJoFA1GtwYBjaTvz9V7KwTLls/2NoQHOLP2aXCkYTczA
   rRR72yjdGMPF3yQqrNh7KDFwgHqfcGEn7uNNEUKYmLCBR3m3RoqfORSBD
   wgzuiJrhm9izS8qeahys/ZrOu8ikFBnaHEF2oDRT8+cu7u6Aj7WQEbhPY
   xrEoVELvE/NTGERQa3bsCpNcE1YV1eC0HBBlJis+gfZfHZJ2RL3RTMq30
   MBHWOMJ6fj3FS65X252dO1Rzh8pVKRPyVBSyv+anoh/HZX6Y0GUP3k75Y
   g==;
X-CSE-ConnectionGUID: hqSyTm0NTU6IlKjGbSIwgg==
X-CSE-MsgGUID: vg9CtOylQuG4MxoZqyxvhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="25994573"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="25994573"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 16:57:54 -0800
X-CSE-ConnectionGUID: s5UEwSceSVuhomItNgDCIA==
X-CSE-MsgGUID: yTe0J1+dTGKDExCU7dlHPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="139152544"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Jan 2025 16:57:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcDRm-000gGH-0o;
	Mon, 27 Jan 2025 00:57:50 +0000
Date: Mon, 27 Jan 2025 08:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: James Clark <james.clark@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [arm-integrator:b4/dead-deamons 2/5] ld:
 mm/percpu.o:mm/percpu.c:2755: multiple definition of `__per_cpu_offset';
 arch/x86/kernel/setup_percpu.o:arch/x86/kernel/setup_percpu.c:35: first
 defined here
Message-ID: <202501270840.bM3udyED-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/dead-deamons
head:   337a23015919bdcaf25c1f3bbfcb7b5bd11d7029
commit: a3a4fafbdc9963ed91b21a60f503fdf1ccdc8183 [2/5] Allow no SMP builds
config: i386-buildonly-randconfig-001-20250127 (https://download.01.org/0day-ci/archive/20250127/202501270840.bM3udyED-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501270840.bM3udyED-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270840.bM3udyED-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: mm/percpu.o:mm/percpu.c:2755: multiple definition of `__per_cpu_offset'; arch/x86/kernel/setup_percpu.o:arch/x86/kernel/setup_percpu.c:35: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
