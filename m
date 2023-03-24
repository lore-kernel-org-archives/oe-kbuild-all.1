Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E59A17C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 02:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679624696; x=1711160696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z9oxfkTJwJvUyEJOKiBHDAdtaVEHOVljBsfQaH3kP5E=;
  b=nUl3mgWMx9JRzVRfH/GJrxZ0JNNhU+l+jJEPN4jpwHVwrWLxOHQ/R3v4
   ekquen+MotoyukNTEoRzv8QFgDRpZUcnQnUsDVTKWqyF84ykztaEUi2jv
   8XMgC92FfYqsG/4Hn8NpmVtv41hFECA88J70MTpsAHln6rn+awciHsml/
   Jiym2LXfmRR9uTD+MZGZr8LriDN75QRMafNJPrucfTM3/53t71G4Zu/Aw
   Dxyre0RDzVUjSBRYV1T5gj+DA3VT9xFOG79zdyyR+NqzxKAP/eGcKbgtS
   FYuvB91+lmobFbKIVGQe7htIjaebMZSUmlgZGlVTNeE9OflTomDqx+9U+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367418686"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="367418686"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 19:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="675973059"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="675973059"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Mar 2023 19:24:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfX6s-000Eu0-0E;
	Fri, 24 Mar 2023 02:24:54 +0000
Date: Fri, 24 Mar 2023 10:24:39 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:smp/core 12/13] ERROR: modpost:
 "__tracepoint_ipi_send_cpu" [arch/riscv/kvm/kvm.ko] undefined!
Message-ID: <202303241043.7Z0NwOQE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git smp/core
head:   5c6509a4c573ae4521032e646ee52d163c862aa2
commit: 00cefad5164e17300fcbde1f5bf214508643e1cc [12/13] trace: Add trace_ipi_send_cpu()
config: riscv-randconfig-c041-20230322 (https://download.01.org/0day-ci/archive/20230324/202303241043.7Z0NwOQE-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=00cefad5164e17300fcbde1f5bf214508643e1cc
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue smp/core
        git checkout 00cefad5164e17300fcbde1f5bf214508643e1cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241043.7Z0NwOQE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__tracepoint_ipi_send_cpu" [arch/riscv/kvm/kvm.ko] undefined!
>> ERROR: modpost: "__traceiter_ipi_send_cpu" [arch/riscv/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
