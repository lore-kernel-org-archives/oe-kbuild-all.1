Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ED82773CA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 06:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480329; cv=none; b=D/rXIlx/FqtGp6MGZD0uIfNBG5lYpQ9+HWel5rz0WKDMwt4HFaE4OscDVsjRbqjn74qAbctpwtQtLX0TBMemyguKjNfhpSAOCGtJNRcvqun5bG5fdGkzpVOm/qCjR3laN4N67TJdA4SUwYZthB/W1yJGwOIMYhfKzbCLab6mbXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480329; c=relaxed/simple;
	bh=ne3qgJQCX8y0y6o0L9eg9usyqnOHeV6CTa+t2HcqYfI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DiEpYbN13Hd0Gs/tzP+gQrd8XNpZzgJGv7fR8UR3w5y4V68zz98N5K+peLDhiigspSGAS4FSJybAaKd+2M5PrBD9xW7JFgV6/4fRAzAMdMW2gxKkPg9gdJZ0cO3zBSkTM6vUweppF3hFcGneWreWW1V6wWAWq0qpo9BRsODoDAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jl1hYu2h; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jl1hYu2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785480326; x=1817016326;
  h=date:from:to:cc:subject:message-id;
  bh=ne3qgJQCX8y0y6o0L9eg9usyqnOHeV6CTa+t2HcqYfI=;
  b=Jl1hYu2hvYxIxfpJElZH8jayqSUsXSCaVFpcwXFB61QQbjmSDwjPHl3a
   oXQ1q4EW6rPcTUjNcs18MnLfC/xKidy2fkOGfwW601mzj5OKRAIuQngAM
   8XecKIU+zpCD2YTQE5W4BPh/AcI8bOvkoV5jq+SjNcp2clsCgWGZR39Sb
   RYNR1vQzR9n2SMz2d55Xg1gjwDdywdD2RMcR1MYK2gjxokdCjsS/CnBtz
   CmjU+UeVLjsMcKtZjbxOs+xtJnJyT3Gz8ZgpQRp/gncGXiTwYe3RUutaG
   ltMp8SUR1B2Bukiv2bqzMR8r5MnwAUUKqYYJLzI0y3bBx1rtjDJ+3UR+T
   A==;
X-CSE-ConnectionGUID: 0AVneBo0TMW49g4j8D0DSw==
X-CSE-MsgGUID: fUFe12e5TfakIsJ4F6dnzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88636962"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="88636962"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 23:45:22 -0700
X-CSE-ConnectionGUID: +zlboeHKQK6FhnWTCSFwaA==
X-CSE-MsgGUID: P2f+tO3+QD6bM3MRWJ/j/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="254185271"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jul 2026 23:45:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpgze-000000000FF-1rGn;
	Fri, 31 Jul 2026 06:45:18 +0000
Date: Fri, 31 Jul 2026 14:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v3 71/72]
 arch/riscv/kernel/hw_breakpoint.c:441:22: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202607311439.40kEo7v8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v3
head:   beda8d39b4166d1ca21e78d4ff92e8e8ec11ea6a
commit: d24c3a0af904b9db5fdfddac9594f357e94d426d [71/72] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r112-20260731 (https://download.01.org/0day-ci/archive/20260731/202607311439.40kEo7v8-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311439.40kEo7v8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311439.40kEo7v8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kernel/hw_breakpoint.c:441:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:441:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:441:22: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:442:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:442:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:442:22: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:443:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:443:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:443:22: sparse:     got restricted __le64 [usertype]
>> arch/riscv/kernel/hw_breakpoint.c:454:15: sparse: sparse: cast to restricted __le64
   arch/riscv/kernel/hw_breakpoint.c:558:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata1 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:558:22: sparse:     expected unsigned long tdata1
   arch/riscv/kernel/hw_breakpoint.c:558:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:559:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata2 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:559:22: sparse:     expected unsigned long tdata2
   arch/riscv/kernel/hw_breakpoint.c:559:22: sparse:     got restricted __le64 [usertype]
   arch/riscv/kernel/hw_breakpoint.c:560:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long tdata3 @@     got restricted __le64 [usertype] @@
   arch/riscv/kernel/hw_breakpoint.c:560:22: sparse:     expected unsigned long tdata3
   arch/riscv/kernel/hw_breakpoint.c:560:22: sparse:     got restricted __le64 [usertype]

vim +441 arch/riscv/kernel/hw_breakpoint.c

   423	
   424	/* atomic: counter->ctx->lock is held */
   425	int arch_install_hw_breakpoint(struct perf_event *event)
   426	{
   427		struct arch_hw_breakpoint *bp = counter_arch_bp(event);
   428		union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
   429		struct sbi_dbtr_data_msg *xmit;
   430		struct sbi_dbtr_id_msg *recv;
   431		struct perf_event **slot;
   432		unsigned long idx;
   433		struct sbiret ret;
   434		int err = 0;
   435	
   436		raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
   437				      *this_cpu_ptr(&ecall_lock_flags));
   438	
   439		xmit = &shmem->data;
   440		recv = &shmem->id;
 > 441		xmit->tdata1 = cpu_to_le(bp->tdata1);
 > 442		xmit->tdata2 = cpu_to_le(bp->tdata2);
 > 443		xmit->tdata3 = cpu_to_le(bp->tdata3);
   444	
   445		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
   446				1, 0, 0, 0, 0, 0);
   447	
   448		if (ret.error) {
   449			pr_warn("%s: failed to install trigger\n", __func__);
   450			err = -EIO;
   451			goto done;
   452		}
   453	
 > 454		idx = le_to_cpu(recv->idx);
   455		if (idx >= dbtr_total_num) {
   456			pr_warn("%s: invalid trigger index %lu\n", __func__, idx);
   457			err = -EINVAL;
   458			goto done;
   459		}
   460	
   461		slot = this_cpu_ptr(&pcpu_hw_bp_events[idx]);
   462		if (*slot) {
   463			pr_warn("%s: slot %lu is in use\n", __func__, idx);
   464			err = -EBUSY;
   465			goto done;
   466		}
   467	
   468		pr_debug("Trigger %lu installed at index 0x%lx\n", bp->tdata2, idx);
   469	
   470		/* Save the event - to be looked up in handler */
   471		*slot = event;
   472	
   473	done:
   474		raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
   475					   *this_cpu_ptr(&ecall_lock_flags));
   476		return err;
   477	}
   478	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
