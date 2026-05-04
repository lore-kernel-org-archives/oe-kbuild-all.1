Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E7381AF5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 22:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777933854; cv=none; b=TCFWRXVEFZhYsUjQmFGYmsxXHU2s11VZDoB/a0uhK8EzvWYx+45wsmzLcEqcmEEDu8+YRyC0xpAMiXNqxdkmSAy/twC04xYDX/9taLsKT2syMr1Hjm4cfeL4SMUAVtfa/9cmF9W85BpDw7Eihwgvw5yy2fGyH4dvEHi9OHLk3fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777933854; c=relaxed/simple;
	bh=/ovehKJoCst29yIojXOITeCdi8/RPGXy7aHV3EFtrkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUMtjBcisHcppvWD5mCZDJXC3/mr9TMzDwzOWAFsopuXXuRiNyfhxHBg+v0FJN+m/LrNHh4mUTSkEAb8+epZyIcRvT4Vymwc0wzqGBrfu1BhjV8Ad1QbBh1C7oz8dTWCSbz2VOL6QTL0fnUCihI0JRAwvAGR/VAAdr1ENZL1GJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7VJ0FPZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7VJ0FPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777933853; x=1809469853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ovehKJoCst29yIojXOITeCdi8/RPGXy7aHV3EFtrkw=;
  b=a7VJ0FPZHFmOxIXxXf8h4YoAGmE2eC/lLsf9hzHA/siUuSkCeIswIrW3
   iRKgz45niist46UM7n8Xq67uhpO92OnAidJmqiCZermw6a+2zX2HqHC+9
   vfSPMEzbo915ED8KkyGjKwtSGHmMqfUM3n6gYnXMKN7UzCUZ+h6vvPe6I
   sZpNOwXrvvBgwvbFnunVA+YtnrFb4scnCr3XqF0RzTXnuhNpEBEk84GXf
   +cBlLyAKwmmR23hG2a/sbrMzVRcTQoZv7GXDX2Sf/2rlZbxFPumPTFZ2f
   bJsG18MVPgGgZAZ2KksF5nQFBKX6Cqkg7u3J3oJoqyHdU12ghNFZcGNJb
   g==;
X-CSE-ConnectionGUID: qegKRlBnQy+RJA/gAF+4hQ==
X-CSE-MsgGUID: U+LobpCgQ2ea94nJBThLEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="77820526"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="77820526"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 15:30:52 -0700
X-CSE-ConnectionGUID: 3Gz0V3gsQiCWZ1n1qxJMTw==
X-CSE-MsgGUID: EsrQ9gobTv2vnj/M0WadXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="235509975"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 04 May 2026 15:30:46 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK1oK-00000000609-0CBH;
	Mon, 04 May 2026 22:30:44 +0000
Date: Tue, 5 May 2026 00:30:18 +0200
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, John Stultz <jstultz@google.com>,
	Vineeth Pillai <vineethrp@google.com>,
	Sonam Sanju <sonam.sanju@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Kunwu Chan <kunwu.chan@linux.dev>, Tejun Heo <tj@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Suleiman Souhlal <suleiman@google.com>,
	kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>,
	kernel-team@android.com
Subject: Re: [PATCH v2 2/2] locking: mutex: Fix proxy-exec potentially
 deactivating tasks marked TASK_RUNNING
Message-ID: <202605050032.Sh1SUziK-lkp@intel.com>
References: <20260430215103.2978955-3-jstultz@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430215103.2978955-3-jstultz@google.com>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on tip/master next-20260430]
[cannot apply to tip/locking/core tip/auto-latest linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/sched-proxy-exec-Close-race-causing-workqueue-work-being-delayed/20260504-045026
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260430215103.2978955-3-jstultz%40google.com
patch subject: [PATCH v2 2/2] locking: mutex: Fix proxy-exec potentially deactivating tasks marked TASK_RUNNING
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260505/202605050032.Sh1SUziK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050032.Sh1SUziK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605050032.Sh1SUziK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:11:
   In file included from include/linux/rbtree.h:24:
   In file included from include/linux/rcupdate.h:27:
>> include/linux/sched.h:2209:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct mutex *' [-Wnon-literal-null-conversion]
    2209 |                 return false;
         |                        ^~~~~
   1 warning generated.
--
>> clang diag: include/linux/sched.h:2209:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct mutex *' [-Wnon-literal-null-conversion]


vim +2209 include/linux/sched.h

  2205	
  2206	static inline struct mutex *task_is_blocked_on(struct task_struct *p)
  2207	{
  2208		if (!sched_proxy_exec())
> 2209			return false;
  2210		return (struct mutex *)((unsigned long)p->blocked_on & PROXY_BLOCKED_LATCH);
  2211	}
  2212	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
