Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93119385D84
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 22:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980736; cv=none; b=nmQSvsIBo9Lde91pWvrbrT2cHEiN6yu5hGrRFtUGAfc3A3XZNw1F/IJ/2uNmgZ4JwR1Wj3L5RXzHVSucKcnSetnc/5GPomP7xoHX1n8h6PHphrezMb6DWnj3fYPN1XZim2t4sYrn6vaNxAJONFK6kNbPl13rfNGm0FTL1q+6nI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980736; c=relaxed/simple;
	bh=5GEjN80MVy+FLGJEOJmh5iKv+1mRmAcbSz449nZxVDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BM0txllyzhuD77ji7CNFihJxRqBKPgvODcPK24vl0RTCJvfX5ik9MMMfWMRans3y6F7XR6MTZ8eAk0yyYB3hS9NM9MLSz7P2NO0GnQvjuJbNiQ3B+Dl7jAHTBiy/7zYNBUc16a5cAHsBenuypwZOw2d4PRlzWzUKejW3gv2zWAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akBshi5f; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akBshi5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783980734; x=1815516734;
  h=date:from:to:cc:subject:message-id;
  bh=5GEjN80MVy+FLGJEOJmh5iKv+1mRmAcbSz449nZxVDM=;
  b=akBshi5feqf5Tg3yDLMXmdBamvUP1AT/gdZ28timPbY66LwzQd8fmuKP
   O9m5HWSgB5iL8UB0uew6Tswf7+yDtvv9t88ikroOg2i9l1nGEpo1ZzgYw
   viPLxKQmzOUC+BPTLnns9YH0trLpwI7RfvvrexAV9qH946dYPUqCA2oTr
   068/UT0Ei6H6YYX1T0Kuy6hmutzja/stIXGej7JOf8pQeMWrk2AQpj56v
   SXP4f4kCm9oN2r2WRqzFSbaO9n4s8a4JZrSEC6hEiyrtPKHxftlyd4KOE
   W2BhH8g/ZerLZZRSdc6X5I8yl5nevLopk4fLnhsTDrlJLTA9+2DlQ6dlk
   Q==;
X-CSE-ConnectionGUID: v68B4jeXRXWZGrjzOf8MjQ==
X-CSE-MsgGUID: aTE20v2SQWuvMgMk+LUBoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84376099"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84376099"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 15:12:10 -0700
X-CSE-ConnectionGUID: tVi5HamqQWaE6ohoLH0W0g==
X-CSE-MsgGUID: 5gSz2HHoQ7K8PVsPvHs6aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252287522"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jul 2026 15:12:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjOsD-00000000M6r-2QoI;
	Mon, 13 Jul 2026 22:11:43 +0000
Date: Tue, 14 Jul 2026 06:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Tee <justin.tee@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [mkp-scsi:for-next 12/80] Warning:
 drivers/scsi/lpfc/lpfc_sli.c:10503 Excess function parameter 'head'
 description in 'lpfc_sli_next_iocb'
Message-ID: <202607140602.z2NJbVl9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   4afcc9ed6a57b1b87e55366f9ff10c1c43b6d6e8
commit: 9c94d8ec73bad73c88e3eba837b2edfda28b5de1 [12/80] scsi: lpfc: Put iocbq on phba->txq when ELS WQ is full or ELS SGL unavailable
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260714/202607140602.z2NJbVl9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607140602.z2NJbVl9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607140602.z2NJbVl9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/lpfc/lpfc_sli.c:10503 Excess function parameter 'head' description in 'lpfc_sli_next_iocb'
>> Warning: drivers/scsi/lpfc/lpfc_sli.c:10503 Excess function parameter 'head' description in 'lpfc_sli_next_iocb'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
