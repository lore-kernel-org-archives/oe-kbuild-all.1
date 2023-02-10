Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C1B2F41
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 23:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676070471; x=1707606471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fd4+3PqTZujyemBuqGmuK6DSB5BDps4d3/is99yha58=;
  b=RnuAE/wlw/5FJhEZq9U6zUg/TjC9IEnGd013vT5mZ/B+VZ7hol1rREhd
   N5j5oCGfvZyHVK1MqQVVwnX9N2/eM0XAe+MFyfLP2oUxWM9qX2+DEgDrs
   HL/tADcVPRMb8gBGZQKyI7zNcnZ+6mhkWf+RKgbiraGeJTdDAeEqpatsA
   Fi4AXwx26ekZikEf6R3EQJcFSIo/I6aly1SEzSMDjUq+4G5Re+KlDl/6Y
   68015hDlYqLFOk7uNAx6FYNEtqiJeQEGc9DcfYTMBtePPd+ojuZq0esJ2
   hBpq4NWVVIL5zQsHor9IrZwny6agePE25jAe3shKecqHUlaVgM8oy6Ia0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="318568529"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="318568529"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 15:07:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="756940247"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="756940247"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2023 15:07:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQcUf-00066l-1B;
	Fri, 10 Feb 2023 23:07:49 +0000
Date: Sat, 11 Feb 2023 07:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 6/6] arch/x86/kvm/kvm-intel.o: warning:
 objtool: __vmx_vcpu_run+0x108: stack layout conflict in alternatives
Message-ID: <202302110731.CwKk2LfT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   b7be6a4563d6f709d0cb82c87bb5dc53ad0bf73f
commit: b7be6a4563d6f709d0cb82c87bb5dc53ad0bf73f [6/6] x86: Tweak FILL_RETURN_BUFFER some more
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230211/202302110731.CwKk2LfT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=b7be6a4563d6f709d0cb82c87bb5dc53ad0bf73f
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/core
        git checkout b7be6a4563d6f709d0cb82c87bb5dc53ad0bf73f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110731.CwKk2LfT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/kvm-intel.o: warning: objtool: __vmx_vcpu_run+0x108: stack layout conflict in alternatives
>> arch/x86/kvm/kvm-intel.o: warning: objtool: __vmx_vcpu_run+0x97: objtool isn't smart enough to handle this CFI save/restore combo


objdump-func vmlinux.o __vmx_vcpu_run:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
