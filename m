Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3986C15C0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 23:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749769572; cv=none; b=ElrS+F8gr+SjyivvasH/QdU/2yWRTUbXxYzPZFikryVbdNbkroPTOG8TmlMoJrf4PsfzLzWNvMV4xymcEi5m26nETvFy4qG0xp1k3Zu3e/khP0oRGj8xKogFEDSvDelFTJqwBi6m4Y4Ld25HhqGHTNUsvDd2djf+ZgHbX7RnURY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749769572; c=relaxed/simple;
	bh=nRLPzL1dJeyhBKvh90HJrBSJuQOqwhd7B7lxEB72yf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DSsx4XUD6v12Bo9Vx2KpFWdMzhOdYtbJIuuQ+6gIAptAf3NgaiBlsIw9WmqHmcxQGHN/vPsza2FnrEcSCd/tzivMmlW6/+yjhrz4B5Rp6JW+OUSC/JnsMTh6hTwSBbuP0Fuwg9UeCZOQsbp/V1OcvPy+pQaEknmbTaPpoJOpE8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1GAcGKf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1GAcGKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749769571; x=1781305571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nRLPzL1dJeyhBKvh90HJrBSJuQOqwhd7B7lxEB72yf4=;
  b=S1GAcGKf4HrXqkXb5nYsV3fdoE9YTo+zNSnyAGGVo1uB86SzLmZmztJL
   QZzfuUgt636AKPRjXs9kblOJ8dArJfFU1zBpSBNiOwBeKxo+gM5uKA4Ca
   Ug+lnSXx4Dn3TM6qf67qlL73wvGOymarFAU1qroITHTISq91EVw51Njq2
   z7rNzq+W90BNPNL5/OHUYwPmtYhHTlsyl+CmUl9RGE2DEP9QAQP6qJ8ZI
   We2yiPAi4JoW+nU8+x2gA/vsAAnSwjMSQewntSuiouweMsX06tuffkNE3
   pDWouVk9LPXpFiUcSi1Z/sIsJW+YiSdhLO6SSSoEbPbIkiPdY9iIO54aj
   w==;
X-CSE-ConnectionGUID: qlgs6K9uQBevgOBzY4v8UQ==
X-CSE-MsgGUID: c83+fAYoS3W92rpN5QeWug==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52118260"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="52118260"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 16:06:10 -0700
X-CSE-ConnectionGUID: UYtKGb9QTJS4J3b7OyAbyw==
X-CSE-MsgGUID: XW2HxrmkRkmzvYCofXdgdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="147516904"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2025 16:06:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPqzm-000C14-2D;
	Thu, 12 Jun 2025 23:06:06 +0000
Date: Fri, 13 Jun 2025 07:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.16-rc1 7/83] Warning:
 drivers/acpi/pptt.c:348 function parameter 'cpus' not described in
 'acpi_pptt_get_cpus_from_container'
Message-ID: <202506130717.eE608TPa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.16-rc1
head:   8872f14d9fa3dabda25ac1679ab2bf2a7520a07c
commit: 740b1dc99e2a74d80207cdad3663210a1ab6a719 [7/83] ACPI / PPTT: Add a helper to fill a cpumask from a processor container
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250613/202506130717.eE608TPa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130717.eE608TPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130717.eE608TPa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/acpi/pptt.c:348 function parameter 'cpus' not described in 'acpi_pptt_get_cpus_from_container'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
