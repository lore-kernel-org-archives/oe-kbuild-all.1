Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2618E7EF03
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 18:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707502299; cv=none; b=bxOLWDRTTa8R5Vcwl3p9SvuncdMS0e7WC7IbmjZI3RgM0CkXS0+d291SUl54nllzCioq/EEQf4WzqZYNhL5HHWkQxrXWrN45lfTgRybyUgSflGnnFalpaQRXZ26FILzX1gWbSLIur0H8F5/RHUqVjUSQ11PaASlVb/WEpK1+6jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707502299; c=relaxed/simple;
	bh=TeyFZ3Uf10/ENZtnse02lhW6DQaLP5pXVtknT44L50A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EWSakjTHDyxSC6lwGDwMk/aGTZGayLI0MqCwF1woPhHNjs7cY5VhXdyvM9vNa7WegzaQfOwzb7SFxp+XFmQHPIImbLa3Bpz/yL0ulxuxZB7EywFefhmMoAkvn5fsazX2CqmlTZRSmCQQQnflGvHl0anxLXk5NHBlsVFHoFBuZFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3CcXZfw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3CcXZfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707502298; x=1739038298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TeyFZ3Uf10/ENZtnse02lhW6DQaLP5pXVtknT44L50A=;
  b=g3CcXZfwKR00nYjgOOdKWvTtznjrhWCWOZbDRzyDZN80iMYeNc5iwYzW
   SBivxPN6pR6v0tXQrHCSsqxPs/WQgrb7Z9PaeFUa1oY4/sM9Q412cA7j6
   wxR6regWa4WlumDphrniSedvv2A5EK7yAby3PwBXOPxLVlrbmQR2p/WDu
   8RXr5NDwjjYQEn36MQZPqdySuo1wF9nhNtuKyticy8TJDM1QSO0bcPEq8
   DbXtJDRkjXL/jDualmLSAZprCDkE1b2Mzm3vPTa5ELGdCrcFzSAon7R/T
   HwGrYygzYxu3lQkloDjdTfVjLvDgNEpbI/2jXy8/AHoBIDoAdr+LLKVRH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1373274"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1373274"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 10:11:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="2303414"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2024 10:11:36 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYVLa-000506-0u;
	Fri, 09 Feb 2024 18:11:34 +0000
Date: Sat, 10 Feb 2024 02:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [frederic-dynticks:timers/anna 27/28]
 kernel/time/timer_migration.c:18:10: fatal error:
 trace/events/timer_migration.h: No such file or directory
Message-ID: <202402100230.4paGWSBs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/anna
head:   7e542ba8af9a26c2951f3c5ec4c5e1513da16201
commit: ca2080d0534d1f1a3ea73d415dcfd5d7760abcb6 [27/28] timer_migration: Add tracepoints
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240210/202402100230.4paGWSBs-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100230.4paGWSBs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100230.4paGWSBs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/timer_migration.c:18:10: fatal error: trace/events/timer_migration.h: No such file or directory
      18 | #include <trace/events/timer_migration.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +18 kernel/time/timer_migration.c

    16	
    17	#define CREATE_TRACE_POINTS
  > 18	#include <trace/events/timer_migration.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
