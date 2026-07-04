Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD36A39C019
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153812; cv=none; b=ro9V6I/toc2QbMPBo6FguHhGkoqfK3ULppArGdpQPbq9qvsXpY1wYawi+4//rqi3RCfXKuTWxdONWi9xAIc4zCOGRiTKbI7R29i7atsHv56pGne2n9E17yQg1iBWd2cPH7pf0h8VBCWtJxOexpxIKoCmXt6zetfrfE9HxInRodE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153812; c=relaxed/simple;
	bh=mhi1k3xRLtC1a07c147RC/bXhk6YpLEnRfTU1TN/h50=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AHcrHQMDyEaptPG50j/gwfJcOc5YcS4hTub1l7GHogQfwMl3o5zHEJImloB6Fc3AH9BnLs1/yaeVZOTV5KfR8rBeDzqHOGP8MnQiF55aeTf7MjoaGnvPXBVHvAapjJYoxLyB11o4rl/k2hRhnNIOxRkpKx8QDfJLa13+9GJ9xmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bx3pKXvU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bx3pKXvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783153810; x=1814689810;
  h=date:from:to:cc:subject:message-id;
  bh=mhi1k3xRLtC1a07c147RC/bXhk6YpLEnRfTU1TN/h50=;
  b=bx3pKXvUFsbVJaq+EQNWw2kEFP4JKy9KN780XPPYw4ckYItzV4tWlmJ1
   flGZnRTSu27Hw+a6kCG2DDD+Y7BnAki1u8gJOFd/CnQ+iE5HfkHx7hnth
   UYG5BllHE8O9IezCknFzJfTg/PwMN3C9GCzqv5mIaiNyRPC9ftqAP8VRO
   7lD6r3kCeI/WxN47CeeRoYCUaKmcFxU+icFVDoX2R8D8Fe+4oLa/7jwuV
   FphxNlSYGTXjW46BrEf0uHZ4k51CQLPRNbtMhlW5elDhEsxC92tSMv4AE
   KS2IunHs151APRzOVivEkZhtfKK/UMVb9n1ttC5p5LCJOiikGKLa7NlDW
   g==;
X-CSE-ConnectionGUID: vgsiD/8RTpKtxbg86ON/9Q==
X-CSE-MsgGUID: NyQBm0wRQtCvSWfqIaDQyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86425083"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="86425083"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 01:30:08 -0700
X-CSE-ConnectionGUID: 4lcTIQUoR+6JRpX8ReaDeQ==
X-CSE-MsgGUID: jolFDnOCSlmDA6jiypDhEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="255186762"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jul 2026 01:30:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfvlF-00000000CwF-02hw;
	Sat, 04 Jul 2026 08:30:05 +0000
Date: Sat, 04 Jul 2026 16:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1]
 kernel/trace/ring_buffer.c:813: warning: Function parameter or member 'cpu'
 not described in 'ring_buffer_wake_waiters'
Message-ID: <202607041625.AsllUH9a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   a00af2707c1d0a67daa8f91db74300f65d84db3b
commit: 588f02f8b9d96c4a89db955394ec54e77b1d482f [0/1] ring-buffer: Add ring_buffer_wake_waiters()
config: i386-randconfig-012-20260702 (https://download.01.org/0day-ci/archive/20260704/202607041625.AsllUH9a-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041625.AsllUH9a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041625.AsllUH9a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:813: warning: Function parameter or member 'cpu' not described in 'ring_buffer_wake_waiters'
   kernel/trace/ring_buffer.c:1424: warning: Function parameter or member 'cpu_buffer' not described in 'rb_check_list'
   kernel/trace/ring_buffer.c:1424: warning: Function parameter or member 'list' not described in 'rb_check_list'
   kernel/trace/ring_buffer.c:5005: warning: Excess function parameter 'cpu' description in 'ring_buffer_reset_online_cpus'


vim +813 kernel/trace/ring_buffer.c

   804	
   805	/**
   806	 * ring_buffer_wake_waiters - wake up any waiters on this ring buffer
   807	 * @buffer: The ring buffer to wake waiters on
   808	 *
   809	 * In the case of a file that represents a ring buffer is closing,
   810	 * it is prudent to wake up any waiters that are on this.
   811	 */
   812	void ring_buffer_wake_waiters(struct trace_buffer *buffer, int cpu)
 > 813	{
   814		struct ring_buffer_per_cpu *cpu_buffer;
   815		struct rb_irq_work *rbwork;
   816	
   817		if (cpu == RING_BUFFER_ALL_CPUS) {
   818	
   819			/* Wake up individual ones too. One level recursion */
   820			for_each_buffer_cpu(buffer, cpu)
   821				ring_buffer_wake_waiters(buffer, cpu);
   822	
   823			rbwork = &buffer->irq_work;
   824		} else {
   825			cpu_buffer = buffer->buffers[cpu];
   826			rbwork = &cpu_buffer->irq_work;
   827		}
   828	
   829		rbwork->wait_index++;
   830		/* make sure the waiters see the new index */
   831		smp_wmb();
   832	
   833		rb_wake_up_waiters(&rbwork->work);
   834	}
   835	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
