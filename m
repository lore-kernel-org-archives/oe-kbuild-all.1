Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32761EB5DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 23:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969552; cv=none; b=QnEGe3PQbFYROs8P6XSoPPCrX9Qeel4MweXo7FRBZXfYK/oqrODpnkDkHyBHVyq9Wt4TwHXIY9jpp0VqVjChw+mObMxjmvFyvBBUdwsitlexjzVtb2abKerxnK2G4U8c2Vbfbv1reaYvUbBqAu13lxHWU/Fn72k16mKMiR+/YFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969552; c=relaxed/simple;
	bh=pD+59j2Nq7XedvC6pW9rr34MiXnhZM9l59s2MrSKLrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HdMZqXlcyRiQo8eGt+5lkrY7Kom+xR7ppeofxag8JdIqDPVIO6gNe40SWYpfa7t69kY5ZlCS2jCp7jyCaasAtjRWJTBaHcjM5/f4gKFbOLyhdR0rEHHgPofgsVu61iNmvbUvjKpvLZi/RzVAZNLNkFa+nscceh1oNVuopmQCjn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQMyb+nB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQMyb+nB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745969550; x=1777505550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pD+59j2Nq7XedvC6pW9rr34MiXnhZM9l59s2MrSKLrc=;
  b=NQMyb+nBnCltZhN3wMjeYSyNlXPNBAlLCLm14fxDu64mPonGi6GcXVDT
   U7Q9HJKblCtdq8ndQarGrwkMUdqBAhVq+jyxkTdeLsDmkoZpjF9BAzTaY
   beuuwOcsuuMPr/CNizS7+T/yWCLF2Cr0YkxOoeGz/OYHKHGEeHGn4++9S
   R0VNJan2OM6/owrqpJ0BtNwAjTisZGJL4z7NHMTkn3LWjsTKdvRDkIlya
   O4vT6k0JfyxDHcyt9F1O4i/IFmvknEYj3G7nAXaQwl53JSL/S5w4MsuhY
   cMufLw6Ny2kxSFlx3ucSM8/228G7jOXmCoBiZZ4pJD17u0BHuj6oBPqXw
   Q==;
X-CSE-ConnectionGUID: fzEMaJD2Q9yJCMQseNu4kg==
X-CSE-MsgGUID: 5BIwX/oSSFe+lqdRQoZAuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51276617"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="51276617"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 16:32:29 -0700
X-CSE-ConnectionGUID: Z4Xy3sbASPKDioN4tuTEng==
X-CSE-MsgGUID: xuy5eHksTXKdPtqGm43Ljg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133671298"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2025 16:32:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9uR7-00031T-2Y;
	Tue, 29 Apr 2025 23:32:25 +0000
Date: Wed, 30 Apr 2025 07:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2175/2175] include/linux/sched/signal.h:
 linux/kabi.h is included more than once.
Message-ID: <202504300733.mAi3Indd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dfd1abba9b4387cb2e9e79e3d6097c2ba507ce32
commit: b53643e68c841ccb6f05f90601ea30b1afeb0a2b [2175/2175] !3695 x86: Add x86 related kabi reservations
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300733.mAi3Indd-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/sched/signal.h: linux/kabi.h is included more than once.

vim +15 include/linux/sched/signal.h

     4	
     5	#include <linux/rculist.h>
     6	#include <linux/signal.h>
     7	#include <linux/sched.h>
     8	#include <linux/sched/jobctl.h>
     9	#include <linux/sched/task.h>
    10	#include <linux/cred.h>
    11	#include <linux/refcount.h>
    12	#include <linux/posix-timers.h>
    13	#include <linux/mm_types.h>
    14	#include <asm/ptrace.h>
  > 15	#include <linux/kabi.h>
    16	
  > 17	#include <linux/kabi.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
