Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A2E17C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 01:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679622295; x=1711158295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mcH1uPU1FMiF5ViZH8L0gAwAkoIFiSVF599zZ/7gdgY=;
  b=BPzjSigDODZCVt32UhyM8LmeyzwERYCW1ac3TmGXoICbsv7suxj1I/di
   BWcDQlnc3jTeqKgdZLsGszQvVHWPShSChwBPX+LTiDQYjY4xdWRhem6bi
   Ui6kevKSNezSgwAREgW12zB7iGzOYKr80zQGdJ6/uv9MtOdaIoZZcH7nG
   fCFMbp9pATS7at0FibIGSlDF2XNW5ZhySY2kaSyQnGUMhpuLqdHFHTmtk
   /MagSEDSoPgFSGlqdfwumPldiV4LrbhvSkfP00Cv+IXXCLA7qbGx+7mjz
   KoYn3P+QzfX/jHZpNIMN02ajz80m95cALBtlerLd5Qz4nti5lyTGvU88Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="342057958"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="342057958"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 18:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="1012071914"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="1012071914"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Mar 2023 18:44:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfWU9-000Esm-0w;
	Fri, 24 Mar 2023 01:44:53 +0000
Date: Fri, 24 Mar 2023 09:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:smp/core 12/13] ERROR: modpost:
 "__SCK__tp_func_ipi_send_cpu" [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202303240943.r8hJgqWk-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230324/202303240943.r8hJgqWk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=00cefad5164e17300fcbde1f5bf214508643e1cc
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue smp/core
        git checkout 00cefad5164e17300fcbde1f5bf214508643e1cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240943.r8hJgqWk-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__SCT__tp_func_ipi_send_cpu" [arch/x86/kvm/kvm.ko] undefined!
ERROR: modpost: "__tracepoint_ipi_send_cpu" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "__SCK__tp_func_ipi_send_cpu" [arch/x86/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
