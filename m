Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FA214281
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 22:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687820185; x=1719356185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o3PebcNZRnHYfs8eRR/MqaInkKCjuJ2eNQkh3jA9Pvs=;
  b=eHNLO2gSJl/V2jziUo7eH32XSDVJaX6oncBxHjmLJu2/VW4JhNVg7vbC
   T3b65ujGITbWBoG3pedjDqS56AXP+5yV332FAOTIrtqozsOGSNwAdw7aB
   IsHcdTUFWxiYVdCSe9Vv0+d7E7fgo3v7YykyXeCI9qruC3UOk19Neu3go
   gZwcACimVhVI2GQj4RvbFGrh0u1NooTERz5SSgn53+N7hbo+dKmV28T/C
   Gv4Rn1tOz85QA3pmzp/1OWUkO+zyD0A2p/511g3LCVlRZcA/nW/r8UYya
   IKuXVwuFCK2ohRT1hxupD6+S1JppIfIZMUl+VPton6FgRfqFlaykZ1A3P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341751621"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="341751621"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 15:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="840457661"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="840457661"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Jun 2023 15:56:23 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDv8A-000B09-2N;
	Mon, 26 Jun 2023 22:56:22 +0000
Date: Tue, 27 Jun 2023 06:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2j 18/20] ld: vmlinux.o:(__dyndbg_class_users+0x8):
 undefined reference to `drm_debug_classes'
Message-ID: <202306270637.ciKqsDiT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2j
head:   e723a1fdae00c0e147dd20d003b14f9ec411a30b
commit: 49e02213788a5706c6ad6c0a4ab0a51f9f92941f [18/20] drm-dbg: isolate weird build prob
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230627/202306270637.ciKqsDiT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306270637.ciKqsDiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306270637.ciKqsDiT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: vmlinux.o:(__dyndbg_class_users+0x8): undefined reference to `drm_debug_classes'
   ld: vmlinux.o:(__dyndbg_class_users+0x18): undefined reference to `drm_debug_classes'
   ld: vmlinux.o:(__dyndbg_class_users+0x28): undefined reference to `drm_debug_classes'
   ld: vmlinux.o:(__dyndbg_class_users+0x38): undefined reference to `drm_debug_classes'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
