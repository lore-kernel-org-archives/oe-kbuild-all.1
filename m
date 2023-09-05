Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD82DDCE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693945374; x=1725481374;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bla/inntTOXv5tHSZAIfQeCVoq2aPrNAc7IfucDYDBU=;
  b=cyHISk+hf0R5IGfg/SaYSqzFAYXHXBZkRbAUFzO2cfb3c/86k8n4IUIU
   qrwrPCrS5EVLsVXp/oRueaUIeEaYQZ3eJ0FZlzZHVyk7gKJItAGaf/pz8
   1x7ed0C+IZv0bREvVaC8LMFCXYPvzganl+WnqKikcCt5YnvcRCTuKPoPj
   l9fFk0TV3ttR0iVuObIYVKt3F2a0btmj1f+dv/eYApo+tMGnGKMIr8s7S
   RIBdoOAaIlJAYwAokAKNOB0DOpZ0Lmuad+YszKfuE5A3n4lfZbuWcvOhN
   Zpk7lle4KS/v3GcxsrhFG1vyYDxp5jnJgSxYAJabXgd9tUxJLRe7NoqyS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="361924536"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="361924536"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 13:22:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776314735"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="776314735"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Sep 2023 13:12:42 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdcPe-00022F-2T;
	Tue, 05 Sep 2023 20:12:38 +0000
Date: Wed, 6 Sep 2023 04:12:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Andrew Davis <afd@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 4/382] /usr/bin/ld: warning:
 drivers/of/unittest-data/overlay_gpio_04b.dtbo.o: missing .note.GNU-stack
 section implies executable stack
Message-ID: <202309060416.p27n5mI5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   6c7b09058d06625c8386decb5573da65e3c4ccfc
commit: 5e8b385db99e58a03bab30a80567e67967c764fb [4/382] of: overlay: rename overlay source files from .dts to .dtso
config: um-randconfig-r023-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060416.p27n5mI5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060416.p27n5mI5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060416.p27n5mI5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> /usr/bin/ld: warning: drivers/of/unittest-data/overlay_gpio_04b.dtbo.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms2 has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms2.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: vmlinux has a LOAD segment with RWX permissions

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
