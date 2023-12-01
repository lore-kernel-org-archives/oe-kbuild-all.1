Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FEB55C18
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 20:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BexK3NX+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701461405; x=1732997405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ekETfT6yloJAYS4ADW7GfipxxrW9w4UX+/1WxVPCns4=;
  b=BexK3NX+IXIP7OYuYdUFJf29mfTeYMy0NuiPV6Oe/lKCRiOaG3DBSr16
   o91xecUwnV03eFnXIVkvMmKdxOgkC6DEadjx13hoDrjHv/h2fuw9VzQXG
   rapRaq0IZ9IEp/rOI+/8yICruuT4VrJb59mOBI6ZoRLYS8HsDBU3+cg8M
   H0OAhNp3/Xj0CPX7R/Lur8xXMdJwPKtAa460t9aPHKLoDnKYLL0oEHFu2
   VojkTG2/lGttFYp5gqh2eXQFqm5/mX1EKVJl6Y+4E8rQ2YDMVZz5zcv/f
   ooOwy979HCKizUhA5Myqnu7QiFm6DDJllzNxc6XELTzdM/jey8MvSr7F2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="397151"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="397151"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 12:10:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="763246779"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="763246779"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 01 Dec 2023 12:10:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r99pm-0004FG-1K;
	Fri, 01 Dec 2023 20:09:58 +0000
Date: Sat, 2 Dec 2023 04:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: thermometer.c:21:10: fatal error: libconfig.h: No such file or
 directory
Message-ID: <202312020401.EaIsKfof-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: 110acbc6a4518145db3a1a9c0686d730bb258bf1 tools/thermal: Add a temperature capture tool
date:   1 year, 6 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231202/202312020401.EaIsKfof-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312020401.EaIsKfof-lkp@intel.com/

All errors (new ones prefixed by >>):

>> thermometer.c:21:10: fatal error: libconfig.h: No such file or directory
      21 | #include <libconfig.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.
   make[2]: *** [Makefile:23: thermometer] Error 1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
