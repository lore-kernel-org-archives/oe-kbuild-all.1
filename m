Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F405C7482
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 04:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747888681; cv=none; b=KH5uiMgGHr74ZnNV/dGCV6SKRIgp27lwVQQpmD2ryEal6hUXVL+2V5T20UCzV0xEe9HFHuC/qs/abHK5rTSLrbFVIGAvxypKz/2M+3YYMS5dsQSGy9QPdjIbQmLuzO4CsON0A3Tu003ecdq5+WbTZRDD/wsixVWIt/aPkoq4Wr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747888681; c=relaxed/simple;
	bh=F8z2OZRW7JlnsXae4w6V7cwP7nGSRa5bJy7c9kSOJ1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Llo3QJjcCDtqg9lJLdW6bgMiNnL68qIYXCchUaGfXUVAxmRzCNyMFm+L1pGnw4SHkO2EX+mLYxB3ub+W+VNhbypRzohCwIsowOAI08CgFTfO/jJczaMUbOtVcyiAmo7wIqzlQUHTz/7jgeWW/fBJEytkB3bYWsQ8h10m8qO91e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DE9oitpC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DE9oitpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747888679; x=1779424679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F8z2OZRW7JlnsXae4w6V7cwP7nGSRa5bJy7c9kSOJ1g=;
  b=DE9oitpCVYB1Mw5TIBIdEJgxFcW8O09/HtC4ZCZsdjp8Qyd9iH32I71p
   IhRuRzzsAO2DMGM/isdGlZM9v7HRm9Br17QHcm9qL7oez+fRudz2f/hsM
   quggo9vzWtlSmJqHGvvh0sMC44QToIH4RnfUU00vSI9Dk6WngDhA8T9QG
   K1ohb/R0rYfSH0kGY+uXoqyeHKgJjk8ttq93yHD0m76q3NRhMGEVmtQJE
   ljOpJ/6Qr/r85XLxHWf5tLOTtkL3mZ8tT70SODYNjs+xFFVt0WZbRwVhH
   LmHhXTMcnUxXtWSrJ1IBbpQE22crvK7bBaWtjo39LMruYomOPs2UrBuOC
   g==;
X-CSE-ConnectionGUID: hOJQSIqrTFCs2lpEMjt4KA==
X-CSE-MsgGUID: QOTpI1I1SNOHdTw8dFhkYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49998668"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49998668"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 21:37:59 -0700
X-CSE-ConnectionGUID: 77oDGOCyR+uJz4ht4geHug==
X-CSE-MsgGUID: w7VdchriTL6WR2f4sGLivA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="145377126"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 May 2025 21:37:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHxgq-000Oug-0W;
	Thu, 22 May 2025 04:37:56 +0000
Date: Thu, 22 May 2025 12:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap 36/43] ERROR: modpost: "I_BDEV"
 [fs/fuse/fuse.ko] undefined!
Message-ID: <202505221239.4wdGQ8Zw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap
head:   5b397601da90a62bdc9e22c480dee2381a16ec90
commit: 62a8ddd6c0a5180a7eb697ab35f39959470da65f [36/43] fuse: add a notification to add new iomap devices
config: x86_64-buildonly-randconfig-005-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221239.4wdGQ8Zw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221239.4wdGQ8Zw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221239.4wdGQ8Zw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "I_BDEV" [fs/fuse/fuse.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
