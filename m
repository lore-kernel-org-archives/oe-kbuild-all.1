Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825373C07
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680625176; x=1712161176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vMqnjaS3oOnmmd/z4Z0Ql3WCXJt6APKdgJRhVQ7kLDw=;
  b=T/nKbfrP4LXQZY6w7NYhvaU/d5E5TPhBaLpZ03WYK0rRq969k2JFOAF1
   3EzTeW+bT4c/kFl2+3k/DSOjk9IdFkeXhPXOUMLpcwToGY53j2slDqp8P
   jFxZ9NF5Ky5Wg4xgjT9XhjwqjXm59LAXPk643YpBqVg7MzrgfQJPT8L2d
   DqdHQ08vZ/HyGwGBTEW7spE7AIrDCLvj4uQmDi5LUflCN0Kvi1l9e7mCY
   i9vUzfNW3uGXGSblbA7zDgOA5aXO5iASdl3ihBnNYNwn2+rQ640e2ggCn
   +Kz5K8fEBWyE9ChPDqZb9RusFEulPlSBuWg+TI4S/GIm7Oyl+esN0//UL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="343938714"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="343938714"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 09:19:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="718991746"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="718991746"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Apr 2023 09:19:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjjNe-000PtJ-0Q;
	Tue, 04 Apr 2023 16:19:34 +0000
Date: Wed, 5 Apr 2023 00:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 484/9010] diff:
 tools/arch/s390/include/uapi/asm/ptrace.h: No such file or directory
Message-ID: <202304050029.38NdbQPf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a53bda3aaf3de5edeea27d0b1d8781d067640b6
commit: 1f265d2aea0dff1f2f9ecd41f545d601869462c5 [484/9010] selftests/bpf: Remove not used headers
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1f265d2aea0dff1f2f9ecd41f545d601869462c5
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1f265d2aea0dff1f2f9ecd41f545d601869462c5
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304050029.38NdbQPf-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/linux/in.h' differs from latest version at 'include/uapi/linux/in.h'
   Warning: Kernel ABI header at 'tools/include/uapi/linux/perf_event.h' differs from latest version at 'include/uapi/linux/perf_event.h'
   Warning: Kernel ABI header at 'tools/include/linux/bits.h' differs from latest version at 'include/linux/bits.h'
   Warning: Kernel ABI header at 'tools/include/vdso/bits.h' differs from latest version at 'include/vdso/bits.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-features.h' differs from latest version at 'arch/x86/include/asm/disabled-features.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/required-features.h' differs from latest version at 'arch/x86/include/asm/required-features.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h' differs from latest version at 'arch/x86/include/asm/cpufeatures.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/msr-index.h' differs from latest version at 'arch/x86/include/asm/msr-index.h'
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/perf_regs.h' differs from latest version at 'arch/arm64/include/uapi/asm/perf_regs.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/svm.h' differs from latest version at 'arch/x86/include/uapi/asm/svm.h'
>> diff: tools/arch/s390/include/uapi/asm/ptrace.h: No such file or directory
   Warning: Kernel ABI header at 'tools/arch/s390/include/uapi/asm/ptrace.h' differs from latest version at 'arch/s390/include/uapi/asm/ptrace.h'
   Warning: Kernel ABI header at 'tools/arch/x86/lib/memcpy_64.S' differs from latest version at 'arch/x86/lib/memcpy_64.S'
   Warning: Kernel ABI header at 'tools/arch/x86/lib/memset_64.S' differs from latest version at 'arch/x86/lib/memset_64.S'
     PERF_VERSION = 6.2.g1f265d2aea0d

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
