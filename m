Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444A415A6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 02:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689646272; x=1721182272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gkpV+lRw+3FWvpmfGuKIsA3Ji+TDJk1OUkpequtcMf0=;
  b=Lvopk8sZj1L0cANDLReaYUnn5M7RT2W4C1lrWycd0OGqFcdkBPkXekQ4
   HBNpQlZYN5+Z47FFNDk328q6VwzmI+j8mLa6KW5ptTs8Fe+yPI0X5KxGD
   gDVmRApV6mmFjzwu2IsowGiiuDArim8SdM+hgZhCXb2MniV01Tx3a4N/P
   QiA5jbKfgsgSy0ME+w0C3G+IlCzTniPu9UyiwwwsTKYSQvF46mVwvJSQi
   RpPxiF9bEhebCrKxQLBUysYqAyPZUQLVMmfb4SZK5wg1MvRFLMRBfq4u1
   nC/HwRcaOj4l4pFL+uUuvppGT8b9ddHq+xNaryYeOh53O23dwy6In4Y0b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="356025103"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="356025103"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 19:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726755923"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="726755923"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2023 19:11:10 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLaBB-00004i-2B;
	Tue, 18 Jul 2023 02:11:09 +0000
Date: Tue, 18 Jul 2023 10:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 arch/arm64/kvm/hyp_trace.c:595:36: warning: unused variable 'hyp_trace_ops'
Message-ID: <202307181026.gG5lmlVV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   a16d62a2960b9f3c3e809d8051accf68826f3d32
commit: a6af57723d00e6d80d21f6171f3cb4574aba159d [1/1] ANDROID: KVM: arm64: Remove the non-consuming hyp trace interface
config: arm64-randconfig-r031-20230717 (https://download.01.org/0day-ci/archive/20230718/202307181026.gG5lmlVV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307181026.gG5lmlVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307181026.gG5lmlVV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c:245:6: warning: no previous prototype for function 'hyp_poke_tracing' [-Wmissing-prototypes]
   void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
        ^
   arch/arm64/kvm/hyp_trace.c:245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
   ^
   static 
>> arch/arm64/kvm/hyp_trace.c:595:36: warning: unused variable 'hyp_trace_ops' [-Wunused-const-variable]
   static const struct seq_operations hyp_trace_ops = {
                                      ^
   2 warnings generated.


vim +/hyp_trace_ops +595 arch/arm64/kvm/hyp_trace.c

34305ad4b1bbf0 Vincent Donnefort 2022-08-25  594  
34305ad4b1bbf0 Vincent Donnefort 2022-08-25 @595  static const struct seq_operations hyp_trace_ops = {
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  596  	.start	= ht_start,
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  597  	.next	= ht_next,
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  598  	.stop	= ht_stop,
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  599  	.show	= ht_show,
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  600  };
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  601  

:::::: The code at line 595 was first introduced by commit
:::::: 34305ad4b1bbf0b1938712ef0070a78d8b2c3583 ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
