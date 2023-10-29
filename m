Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA9B17C2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYsgQdvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698575882; x=1730111882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Zn9916IPPIs3DtyNMzEnqj8cMV+AG3e3aAPn84c80cA=;
  b=gYsgQdvCfZobU+WjbLNBknRMPEJovbyUHBpTEUwla9LKSvi4nL2Q2eRe
   N0hUQqLxlvfhKVxedbB2qYflNwBNJJboL29JfH+hb1Qe/6JcbDaoJq/X4
   vztEEoX2In1oCGysxhXQ8BpZUAe51bBUNzMWlM1w7anwfMSAMG6MsO1hr
   tcrBcaOEkBOgZ9qR/1H+eKCsOZMN8T87tTkC52xUHF4LplaWdUB8ofl90
   Iv5bbPhA8j0chaU6++pMsYSHgfzXc5B8lgl7Z+2P4tSeQO1dl4q1BWARS
   l+VMdkeIYsH2pkn/Yd07USFQSdle8Al+3dMxC1PeXz9fYyJkLp2AV/wM9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="386836528"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="386836528"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 03:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="7667137"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2023 03:36:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qx3B4-000CUR-2C;
	Sun, 29 Oct 2023 10:37:54 +0000
Date: Sun, 29 Oct 2023 18:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Paul Durrant <paul@xen.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH] KVM: x86/xen: improve accuracy of Xen timers
Message-ID: <202310291835.JpCiqj3X-lkp@intel.com>
References: <b5a974bdc330be91c2356f5bb2cc68ef1cc7ed40.camel@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5a974bdc330be91c2356f5bb2cc68ef1cc7ed40.camel@infradead.org>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on mst-vhost/linux-next linus/master v6.6-rc7]
[cannot apply to kvm/linux-next next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/KVM-x86-xen-improve-accuracy-of-Xen-timers/20231028-020037
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/b5a974bdc330be91c2356f5bb2cc68ef1cc7ed40.camel%40infradead.org
patch subject: [PATCH] KVM: x86/xen: improve accuracy of Xen timers
config: i386-randconfig-014-20231029 (https://download.01.org/0day-ci/archive/20231029/202310291835.JpCiqj3X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310291835.JpCiqj3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310291835.JpCiqj3X-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/xen.o: in function `kvm_xen_start_timer':
>> arch/x86/kvm/xen.c:171: undefined reference to `kvm_get_monotonic_and_clockread'


vim +171 arch/x86/kvm/xen.c

   147	
   148	static void kvm_xen_start_timer(struct kvm_vcpu *vcpu, u64 guest_abs,
   149					bool linux_wa)
   150	{
   151		uint64_t guest_now, host_tsc, guest_tsc;
   152		int64_t kernel_now, delta;
   153	
   154		/*
   155		 * The guest provides the requested timeout in absolute nanoseconds
   156		 * of the KVM clock — as *it* sees it, based on the scaled TSC and
   157		 * the pvclock information provided by KVM.
   158		 *
   159		 * The kernel doesn't support hrtimers based on CLOCK_MONOTONIC_RAW
   160		 * so use CLOCK_MONOTONIC. In the timescales covered by timers, the
   161		 * difference won't matter much as there is no cumulative effect.
   162		 *
   163		 * Calculate the time for some arbitrary point in time around "now"
   164		 * in terms of both kvmclock and CLOCK_MONOTONIC. Calculate the
   165		 * delta between the kvmclock "now" value and the guest's requested
   166		 * timeout, apply the "Linux workaround" described below, and add
   167		 * the resulting delta to the CLOCK_MONOTONIC "now" value, to get
   168		 * the absolute CLOCK_MONOTONIC time at which the timer should
   169		 * fire.
   170		 */
 > 171		if (!kvm_get_monotonic_and_clockread(&kernel_now, &host_tsc)) {
   172			/*
   173			 * Even in this case, don't fall back to get_kvmclock_ns()
   174			 * because it's broken; it has a systemic error in its
   175			 * results because it scales directly from host TSC to
   176			 * nanoseconds, and doesn't scale first to guest TSC and
   177			 * *then* to nanoseconds as the guest does.
   178			 *
   179			 * There is a small error introduced here because time
   180			 * continues to elapse between the ktime_get() and the
   181			 * subsequent rdtsc().
   182			 */
   183			kernel_now = ktime_get(); /* This is CLOCK_MONOTONIC */
   184			host_tsc = rdtsc();
   185		}
   186	
   187		/* Calculate the guest kvmclock as the guest would do it. */
   188		guest_tsc = kvm_read_l1_tsc(vcpu, host_tsc);
   189		guest_now = __pvclock_read_cycles(&vcpu->arch.hv_clock, guest_tsc);
   190		delta = guest_abs - guest_now;
   191	
   192		/* Xen has a 'Linux workaround' in do_set_timer_op() which
   193		 * checks for negative absolute timeout values (caused by
   194		 * integer overflow), and for values about 13 days in the
   195		 * future (2^50ns) which would be caused by jiffies
   196		 * overflow. For those cases, it sets the timeout 100ms in
   197		 * the future (not *too* soon, since if a guest really did
   198		 * set a long timeout on purpose we don't want to keep
   199		 * churning CPU time by waking it up).
   200		 */
   201		if (linux_wa) {
   202			if ((unlikely((int64_t)guest_abs < 0 ||
   203				      (delta > 0 && (uint32_t) (delta >> 50) != 0)))) {
   204				delta = 100 * NSEC_PER_MSEC;
   205				guest_abs = guest_now + delta;
   206			}
   207		}
   208	
   209		atomic_set(&vcpu->arch.xen.timer_pending, 0);
   210		vcpu->arch.xen.timer_expires = guest_abs;
   211	
   212		if (delta <= 0) {
   213			xen_timer_callback(&vcpu->arch.xen.timer);
   214		} else {
   215			hrtimer_start(&vcpu->arch.xen.timer,
   216				      ktime_add_ns(kernel_now, delta),
   217				      HRTIMER_MODE_ABS_HARD);
   218		}
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
