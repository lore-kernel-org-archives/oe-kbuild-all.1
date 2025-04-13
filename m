Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A961D63C3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Apr 2025 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744565384; cv=none; b=KKeIPX9hrxZ0n+F8F2efoqXLZz25dlqqMdsw9pB4J7a15rsfVac4L/9L0GGSE4tB0vk/8d3DYNA6+cm/Qwg1DReHwqZbgCtoN2JEESLgBVq/orhHK8KMYtJJaMIsqksISu5TToq/cKJnxUcudXIBFi+D44QQPEl8qZ8kfQaWrSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744565384; c=relaxed/simple;
	bh=DWEBUSO8a0oegSnPmNDavgE9vB5iGj/E+OuF3LFSoQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BimpUYBUkEeQSwJQuy0kuymCqYqtqKKxCmpmcJCKL/H12NlOMNe0YD5dON2L/uMoKGflrOUAHBeSgvoF1PEj6WU1Du63074/FNJ3de4uNCpmX+jEK6dthBK4x2x3Dszy4g4yI1lt1/cpwtFIOZPGuHVnefnmCCSDoaSTCx4sbiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caxFA3WO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caxFA3WO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744565382; x=1776101382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWEBUSO8a0oegSnPmNDavgE9vB5iGj/E+OuF3LFSoQg=;
  b=caxFA3WOECAPakuGoHp3k9yCy9T5BDHXW6QzdKqAiSxDRNds4bQ+nqgh
   0z9EjANrrM5zBg7ZsYd5f1lvC2nH/e7G8ckeH5SYr+wwOTqHlCAhBXS3f
   7r5migOUJ37dTMzA7QEMIx4NOt+118Bh5e/yTjcN5HRLmNO9T5wd3hjWj
   jlan5pUFG0hg0LOTkKE6+8FMJ5cM5aSuL58KNA1lCWVr/h94n+G2RhxdB
   39+lmVNR01gjIfT7eJJgpstczHsY4FW1Q/5QMP87fCfA1ghZ79Bdr2gVn
   d05IidWb3WjTkZrqKYByuRZeHCx/YWP0UB4cKCJ8jwYtvohe76ggdm0dN
   w==;
X-CSE-ConnectionGUID: DbUbZLFxRhCt5U6Bn2JLmQ==
X-CSE-MsgGUID: jPseCuLSSRmmNFVv6OnHcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46127684"
X-IronPort-AV: E=Sophos;i="6.15,210,1739865600"; 
   d="scan'208";a="46127684"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 10:29:40 -0700
X-CSE-ConnectionGUID: b02Q2dJ0SB6RxygfJBkvSA==
X-CSE-MsgGUID: 7I1VuffBSlWbxf9PN82i9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,210,1739865600"; 
   d="scan'208";a="129478471"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Apr 2025 10:29:38 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u419E-000Cmg-1i;
	Sun, 13 Apr 2025 17:29:36 +0000
Date: Mon, 14 Apr 2025 01:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:reftrack-dbgfs 6/6] ERROR: modpost:
 "ref_tracker_debugfs_create" [lib/test_ref_tracker.ko] undefined!
Message-ID: <202504140126.tRemnIn2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git reftrack-dbgfs
head:   401a57bf3f51268e83dfcd6a333036a0615ed7c3
commit: 401a57bf3f51268e83dfcd6a333036a0615ed7c3 [6/6] ref_tracker: register a file in debugfs for each ref_tracker_dir
config: riscv-randconfig-001-20250413 (https://download.01.org/0day-ci/archive/20250414/202504140126.tRemnIn2-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504140126.tRemnIn2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140126.tRemnIn2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ref_tracker_debugfs_create" [lib/test_ref_tracker.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
