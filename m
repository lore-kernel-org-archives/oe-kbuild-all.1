Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6BC19CCE7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 04:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727499545; cv=none; b=iVsRzIbgsfq3SYaj9yWoLRn5qPX0Ua55b+i8muSRzXUOjwBx4NryhISa4868kf268GmmDwJqgnVSaWeWYNEzL2/rhcLmJ47kuPvGn7PtttkH4SEvt3X1NyzPHQzZIJSt9bR7OjMfu6KKQ+YGIWUsnBIkES9V21knSOVS6qZw6fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727499545; c=relaxed/simple;
	bh=yVYEthXlASe9u7xeJR6/X2MROucR/wAySiQl6U7iyBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rs4/tRAWNhFgtuiSQdnrL87CwIfn/UF4vYZgZmhmUGUsjAV19/gRrgu348U0VUIL27OK/K4L/229fCNCq6wBD94sDFYh2OEmyAf38qqQzF0QeFeWrsADfNtQtUMEfiQWg3LU3c2tW+50h2P3GKKKFo5hHMY4eqloEL/ASWFnYGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLkOOxhF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLkOOxhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727499543; x=1759035543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yVYEthXlASe9u7xeJR6/X2MROucR/wAySiQl6U7iyBE=;
  b=KLkOOxhFoh0Ax7seDyRfb7s5KDoQ7osF8elQTIJEdoVHCYPoXlJaBuDx
   nRlPHZlZZ1/hnmoX82CBNcXVB8U/29G0vs37NrSoVqY/fUGl4iFdBaz+/
   7Hnz1iuBV4WO8QSoVEThhCTOHMxLD/SLitae3FBuUQonkgmtC8mTF/xX7
   jVeQNHAPfnKucCPLJo89u5lwOxiclqUOk0fvtaj0BFrf/2ZMzCZYSe4Yq
   oFyqsu4dnKyN+d/nxCJyn0hluW16vpGOLdxPs2ZsKROkT1x1lvE56GLql
   qc73cQ1Ga0PSrx6MIYREjHaNYDACFEdLiet/7yP051HM+J0nOFACo222X
   Q==;
X-CSE-ConnectionGUID: +fQ2LYfEQ/aPKq2dDp6sxw==
X-CSE-MsgGUID: JNe9NhqPQVKHh0VYmJa1RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="38040164"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="38040164"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 21:59:01 -0700
X-CSE-ConnectionGUID: Is71+wcwTNKnQwSv8wrnfQ==
X-CSE-MsgGUID: hX7RpMpPTxCdT76yEkGoGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="103549817"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Sep 2024 21:58:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suPXl-000Mvf-2B;
	Sat, 28 Sep 2024 04:58:57 +0000
Date: Sat, 28 Sep 2024 12:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 10131/23799] kernel/sched/debug.o:
 warning: objtool: missing symbol for section .text.unlikely
Message-ID: <202409281256.6EkX99ER-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qiang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: acfa0f545c7dd43f959c28e8ab4b139c927ba387 [10131/23799] svm: reduce log of run queue and atomic->atomic64
config: x86_64-buildonly-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281256.6EkX99ER-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281256.6EkX99ER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281256.6EkX99ER-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/debug.c:797:6: warning: no previous prototype for 'sysrq_sched_debug_tidy' [-Wmissing-prototypes]
     797 | void sysrq_sched_debug_tidy(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/debug.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
