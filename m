Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD42033A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 17:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725126377; cv=none; b=tsd4JAsv7iqpWmpCbS0Wlr9VVGwggEQfStbwwr/u4PJmdxhkWb3qjcrARbfXmiQwpi4xitt1I3CDjTtw+0ro5dMsMnQv2bgrLptZMZbZUp2tT9d9IImMYgQwbBYFAzd6/dcB2scPsx2gNjGpAKsVe2oHbI+OKyZExGVjee5tuvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725126377; c=relaxed/simple;
	bh=irDMlWGM282f9AvE16WrJ7M1insn37gzHA/XjGfm8sY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ViXLOemKX/kOg1Z1dOAtCdd4KIgdjtOOURLtKYZ0t6QxIjcyzkP6vHstGtqtSrFeZ8RenLRJzwqux6KEWYHSgx0YMb2RQElGih1d2A8ogLvx/NKAPgOXJQGxGrdHFxSz+myg0eVHBWZn+6FPfiu1VrYRWAWUY1Do3CEYTsFuIzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnZwAnnz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnZwAnnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725126376; x=1756662376;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=irDMlWGM282f9AvE16WrJ7M1insn37gzHA/XjGfm8sY=;
  b=VnZwAnnzY1HoqEbhMRALN3bt3yCWNtqAxuy1Yw/p5y7VnQREeHllN4p9
   4QtrMDcyfwFj0L80X5n6SIvBStzkbuPacVz0bOh2lPb40rG92lkmNRgSV
   sHAdPNu3qlFDfI7YfKEe5I3cwQgq7JAWX8yzlEd1Hc44iEeAFFzesJ60L
   AJcklz1OODie9bMivThtOGR757gQ038flTp5xQtCJVZ5dZesTkkYHjSwF
   x2uIL+5XBujzjD48faBbtsntA682Pu1r/5Do9ER3d/JBZtTmGNoa4kK+4
   tHFeqc1tX1U6UvCSHhEbpUi8NUu1I8W4x18XEGaWnM6NTQzesDZaOaMlV
   g==;
X-CSE-ConnectionGUID: DBdKgLMLQO2aFPQaDUUnwg==
X-CSE-MsgGUID: njX/FpqMSp2oyEC24HQTNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23331228"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23331228"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 10:46:15 -0700
X-CSE-ConnectionGUID: TcOUOjhTSh6ViQB/i2L8ug==
X-CSE-MsgGUID: nNi7331SQhWqFZ+uzdmM9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="69083263"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Aug 2024 10:46:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skSAu-0002yq-1B;
	Sat, 31 Aug 2024 17:46:12 +0000
Date: Sun, 1 Sep 2024 01:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:debug-stream-debugfs 4/4] sound/soc/sof/ipc4.c:18:10: fatal
 error: 'ipc4-telemetry.h' file not found
Message-ID: <202409010145.Kzfvtr4i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/jsarha/linux debug-stream-debugfs
head:   68be79a50fc5b8f83378bdd48de9abf9eb9baa66
commit: 68be79a50fc5b8f83378bdd48de9abf9eb9baa66 [4/4] ASoC: SOF: ipc4: Use generic function for mapping "exception" debugfs file
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240901/202409010145.Kzfvtr4i-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010145.Kzfvtr4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010145.Kzfvtr4i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/ipc4.c:18:10: fatal error: 'ipc4-telemetry.h' file not found
      18 | #include "ipc4-telemetry.h"
         |          ^~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from sound/soc/sof/intel/hda-ipc.c:23:
>> sound/soc/sof/intel/telemetry.h:14:10: fatal error: '../ipc4-telemetry.h' file not found
      14 | #include "../ipc4-telemetry.h"
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +18 sound/soc/sof/ipc4.c

4605af81399c13 Rander Wang    2023-05-30 @18  #include "ipc4-telemetry.h"
b2501c3d236e23 Peter Ujfalusi 2022-02-16  19  #include "ops.h"
b2501c3d236e23 Peter Ujfalusi 2022-02-16  20  

:::::: The code at line 18 was first introduced by commit
:::::: 4605af81399c13687f3837f976a946e4ca5083a0 ASoC: SOF: ipc4: add exception node in sof debugfs directory

:::::: TO: Rander Wang <rander.wang@intel.com>
:::::: CC: Péter Ujfalusi <peter.ujfalusi@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
