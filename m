Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C108E25392C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 05:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762751844; cv=none; b=efMkpPEDE6gyfDppql8uhGBmdA0F34I+wmEjI37HoMkioHSMaDWDUZVR51jl92L0VnvQ9izXFEL1c+tPU6DoDzjd3GyDLOMzvCe4JrR+IMVYbDof/7NUFCo4XIPQBsiSKc6gyoB+kNgxR2n/Teok28CkDK4/QRsZ2KaCuUMXTvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762751844; c=relaxed/simple;
	bh=B8xGLtXLk7UM8HEMQcyCyv4NJfNe+kYjKelm970TQKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCGDYx8KvBaHQ2xEmxQ7qqRoH1CsgZ5QM3WBsCVwIb9eRNLGdR8RRTuVv+mv7+8xAJgUATdXnlIeoaAOEaqexjRrM3xMIlIL09ewMnLIebqakm2jDrq53CZZDAFNPtN8Rktv/hF5YguN9YwkTm4y1wTf5mJhg4rsgFfYa+FkHrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4qiVwcj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4qiVwcj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762751843; x=1794287843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B8xGLtXLk7UM8HEMQcyCyv4NJfNe+kYjKelm970TQKg=;
  b=C4qiVwcjs3/DQl6h/QycXB5puy+j1ZKISHePWchyOXGA3Mw2cOZ2QfKr
   f95xx4ArCYKj73RVU+xnOnar42QZNg4VfilWc+WaF+p92APe3bCwT16va
   CSmP89cyR5KBT72x2vbMp4mDIaFbnlxZaPLD5EmvHaUT+0jb8qsx6xP37
   AmHhR6w2/eQL7+/k+oyHr+ngseb8z3XtMPJoTB2DOXd9OQxtow53zXjNy
   YrrkRTCNg+Vl5oTjADE005lye9FSaa94s3areP8viTq8gePYr8q0PVF4Q
   HOln2Kuw7VwcPWX8iAHqH56CYcqs/vpRGBbLJNDGjIpMjssmpBa9JV5VW
   g==;
X-CSE-ConnectionGUID: uNaxIZt2RY+nN5oxH/V96A==
X-CSE-MsgGUID: G06ghED4QlaE2+YGby6Kog==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64952864"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64952864"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 21:17:22 -0800
X-CSE-ConnectionGUID: 8HR3QZV9S1OSgKIsy81Iug==
X-CSE-MsgGUID: dGB8psDJRTite3V++mI7OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188323433"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Nov 2025 21:17:18 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIKHE-0002gL-0p;
	Mon, 10 Nov 2025 05:17:16 +0000
Date: Mon, 10 Nov 2025 13:16:39 +0800
From: kernel test robot <lkp@intel.com>
To: Wanpeng Li <kernellwp@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH 05/10] sched/fair: Wire up yield deboost in
 yield_to_task_fair()
Message-ID: <202511101338.8AICyae8-lkp@intel.com>
References: <20251110033232.12538-6-kernellwp@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110033232.12538-6-kernellwp@gmail.com>

Hi Wanpeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvm/next tip/sched/core tip/master linus/master v6.18-rc5 next-20251107]
[cannot apply to kvm/linux-next tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wanpeng-Li/sched-Add-vCPU-debooster-infrastructure/20251110-114219
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20251110033232.12538-6-kernellwp%40gmail.com
patch subject: [PATCH 05/10] sched/fair: Wire up yield deboost in yield_to_task_fair()
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251110/202511101338.8AICyae8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511101338.8AICyae8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511101338.8AICyae8-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/sched/fair.o: in function `yield_deboost_calculate_penalty':
>> fair.c:(.text+0x1588): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
