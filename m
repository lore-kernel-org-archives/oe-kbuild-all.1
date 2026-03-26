Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B7A21B9DA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512672; cv=none; b=DjUo3GmlL9+dBZi/olbQEDGUK2M/zak1JKSBgZXqjwdyDx1Cxk4Et9ehp8bQAjkBhcJpslGHy7f8UvqqeOY+xdRL9tBEGDmkZ7L1rKMSwmociVIeXG2NsnRBiWJ5eiJYHxdHBQH96mLRfLSBmteOKnLxm4x0Fun3EbkrtwdHQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512672; c=relaxed/simple;
	bh=KuXn8AhrtM0bLeW12IZCrDA6o2nJ5HBnzTgSQpAX3jY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VaqVotgJJbcK0bA30ov2c3dQQEqm4K1koYSiBQ054Tf9KT9y3R0yzXQ/LNnTZZMynChye3qieabGk1zxQYAsag8UVtL1RjkzD78mS536HMwRnKYG8VtkcKwAfBEGriAQKfiG/B6baeuPZ288EW0OOtm6kKXKDcu+eMO9vIes2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKkhxxVL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKkhxxVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774512670; x=1806048670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KuXn8AhrtM0bLeW12IZCrDA6o2nJ5HBnzTgSQpAX3jY=;
  b=gKkhxxVL+NM5SdIMTAaSCK/P2ycuVVQilXGSvuYbbZ5l4YMj3JtJ/Lwq
   yCF8vW3BdraouDqBXOYLUxwfIFN6tcLPOk7IoNWhyrvUXba0OkMu90Azk
   SqjsuXhEBKN3cxgYO35d9VCsBNuPv7/K3tHF9MEOMrYzZKAGqQSq0rpsp
   nKG4oEd+Z1iEvop7+qOK6idrGSpTmLU5V1CuTaDbFeJhr8PNRX85kgCql
   WFw7NOCYSCKUAsgTFO/m1kP1CHJtm3TBKsiTI7fw/9ctLrbYles5uaFtm
   f51tD66581keQsQADkX/o7PfkwrXXcWqZRr0M98fISh/uMuqYhWaVw/sR
   Q==;
X-CSE-ConnectionGUID: Vt/nNtH7Sy2BuoCA367iZw==
X-CSE-MsgGUID: LnX87eMhRXeHDaONG6OOLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79468403"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="79468403"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 01:11:09 -0700
X-CSE-ConnectionGUID: FXGIuSZEQyuq/STwli6EHw==
X-CSE-MsgGUID: CA2OZEz+TDaHKsW58RBexw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="224117413"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Mar 2026 01:11:07 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5fo0-000000008dj-3L1y;
	Thu, 26 Mar 2026 08:11:04 +0000
Date: Thu, 26 Mar 2026 16:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/nolibc-rcutorture 40/40]
 kernel/rcu/rcutorture-init.c:3:10: fatal error: unistd.h: No such file or
 directory
Message-ID: <202603261628.iWzLmAwx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/nolibc-rcutorture
head:   a55c66cad77542e2efcb3248af724efce7cc2d87
commit: a55c66cad77542e2efcb3248af724efce7cc2d87 [40/40] rcurorture init
config: parisc-randconfig-r073-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261628.iWzLmAwx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261628.iWzLmAwx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261628.iWzLmAwx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/rcutorture-init.c:3:10: fatal error: unistd.h: No such file or directory
    #include <unistd.h>
             ^~~~~~~~~~
   compilation terminated.


vim +3 kernel/rcu/rcutorture-init.c

     2	
   > 3	#include <unistd.h>
     4	#include <stdio.h>
     5	#include <sys/time.h>
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
