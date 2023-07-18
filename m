Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B87910FB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 00:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689641956; x=1721177956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oSrzA/kTjb6Hzw8J9Y6v+Or8cEJX2mHIPcldxRO5ONk=;
  b=devRlJUPySZDwR5mbTh1F6X8lHwAG9QFI174y3KztQ7Vnt1KJkM4u7S8
   EBA0Fyqp8VRcD73wAR1uss961pWNLfU+jMmo2js22TLo1rXrCD55f45Dq
   OWs/0oxWIPyoX89aRWv3UDMc2n/IiPx2q4reCUTfpQAkgcv/98m3pTlMY
   V/nSmSXNE8jU/VVQqIkW90R8cPdQ3ize5goQyCtItHA4TjJnD4Q5LPZ2x
   qms3fAfiQo6tvH+M/Bhku0lzrpUVQYWU/bhDVICaBdtqg7HhAfstwb4/P
   P/VHJhpp/aqLOPIcPUryOlMGIBr+5eAn+lFH9JbHIHpPutf7zhz3PvC6J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="364950376"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="364950376"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 17:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="717413955"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="717413955"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Jul 2023 17:59:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLZ3Z-000A2z-2p;
	Tue, 18 Jul 2023 00:59:13 +0000
Date: Tue, 18 Jul 2023 08:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 8761/11052]
 arch/arm64/kvm/hyp_trace.c:245:6: warning: no previous prototype for
 function 'hyp_poke_tracing'
Message-ID: <202307180847.OFzzXBso-lkp@intel.com>
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
commit: a262be0c417b3b3b6c6390f34b468049fab254e1 [8761/11052] ANDROID: KVM: arm64: Flush hyp trace pipe when tracing stops
config: arm64-randconfig-r031-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180847.OFzzXBso-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180847.OFzzXBso-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180847.OFzzXBso-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:245:6: warning: no previous prototype for function 'hyp_poke_tracing' [-Wmissing-prototypes]
   void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
        ^
   arch/arm64/kvm/hyp_trace.c:245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
   ^
   static 
   arch/arm64/kvm/hyp_trace.c:713:5: warning: no previous prototype for function 'hyp_trace_release' [-Wmissing-prototypes]
   int hyp_trace_release(struct inode *inode, struct file *file)
       ^
   arch/arm64/kvm/hyp_trace.c:713:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int hyp_trace_release(struct inode *inode, struct file *file)
   ^
   static 
   2 warnings generated.


vim +/hyp_poke_tracing +245 arch/arm64/kvm/hyp_trace.c

   244	
 > 245	void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
   246	{
   247		if (cpu == RING_BUFFER_ALL_CPUS) {
   248			for_each_cpu(cpu, cpus)
   249				WARN_ON_ONCE(ring_buffer_poke(hyp_trace_buffer, cpu));
   250		} else {
   251			WARN_ON_ONCE(ring_buffer_poke(hyp_trace_buffer, cpu));
   252		}
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
