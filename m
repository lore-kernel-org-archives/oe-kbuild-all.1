Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F62023B0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 19:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755708; cv=none; b=vB7DFgozDHpVNF3uleCIrRFyDY35s5M9Lg8xyslG8O4Tt7kU1F6FgLfDQayW6yvVBp/IUjOTkAIHd5RIZP8FkKfj/1PgSdyQChQMz2UUcMzAI3vbmA/gDrG+I4XhaFKgbzE0vi2JDILnlvvV7X1Imn/wPFMwFKQWeVzXT6IAwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755708; c=relaxed/simple;
	bh=Z/9rqC9Vy2wI209K3Fl8dMXhC9KQemBOPTKkT40Opi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2yhdhCdeszcqhlY0iaR6feilKmOLXlwm2Opa5njzhE1lBRRv3vbZF2ACbZmBWlK8rfb+pSkGT1rvJjfjqtb08xSlYn+ULVhmaU6pvCUTLWbOxBbtk42frCyQdEaiCPVO3Fk6kLMoNdBnzHk/bN8oDQXWDOtlvPsS5qyksXp1SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E96974Fr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E96974Fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756755707; x=1788291707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/9rqC9Vy2wI209K3Fl8dMXhC9KQemBOPTKkT40Opi8=;
  b=E96974FrlDXqO0egs7zYicsZHtoRzvohgHZaMQtFaubPqW81h/BYOSjw
   UPQdW31cp51x9KXFW/daa8SHGCcewyrkTboxEfD5uUAh1E+vAHmnQO69n
   9VYBJNcjKZGNK3uvWAC9n3EzFCFL32gtu1zZM+3czvlAFNfR0W6QRbRyg
   GbgcvKr4BdieCkAbICMFYSHp3PO+laTRN3FcHJoJpJvGtqLQWd0SPj9Xo
   3fAEby5lWPELJMQiWx4PZP6We70H/P5yiUMJNU6JY7K26H3C+ODDh59Ti
   xSNoiXLnkL+0vatQ5VK/h/MV+eIJF2xexzgnVXDWNUZcKJMTS+xkoV0uN
   g==;
X-CSE-ConnectionGUID: vBWSenC2Q7C08UUJuVdDZQ==
X-CSE-MsgGUID: TnylRdCZQLSJ84WzxKAiLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58873399"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58873399"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 12:41:46 -0700
X-CSE-ConnectionGUID: qJEH03foRcygz9NHGQv6CQ==
X-CSE-MsgGUID: /G7pRcArRRKJyrJPi/Yf5Q==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 01 Sep 2025 12:41:44 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utAOn-0000yV-1u;
	Mon, 01 Sep 2025 19:41:17 +0000
Date: Tue, 2 Sep 2025 03:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [akpm-mm:mm-nonmm-unstable 90/91]
 samples/vfs/../../tools/testing/selftests/pidfd/pidfd.h:28:10: fatal error:
 kselftest.h: No such file or directory
Message-ID: <202509020304.IC1Dqlra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   44c3fe32c28a9a6322ce85333810f02affd66431
commit: 98f3e3d66d6b0e97cf3d3875343d9240699a5db7 [90/91] selftests: replace relative includes with non-relative for kselftest.h and kselftest_harness.h
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250902/202509020304.IC1Dqlra-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020304.IC1Dqlra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020304.IC1Dqlra-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from samples/vfs/test-list-all-mounts.c:11:
>> samples/vfs/../../tools/testing/selftests/pidfd/pidfd.h:28:10: fatal error: kselftest.h: No such file or directory
      28 | #include "kselftest.h"
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +28 samples/vfs/../../tools/testing/selftests/pidfd/pidfd.h

    27	
  > 28	#include "kselftest.h"
    29	#include "../clone3/clone3_selftests.h"
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
