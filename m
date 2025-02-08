Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1E62451E8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739016653; cv=none; b=e7jf4QX8RLW+t2VUYaXJKSu27hCF1JUVYtpFHgLmhY6QR0SrWQpWFlDkWVYVHiuOmOk4EQyL5zolKJ5j4VVfj977NL8KD1cxXon41J++k4FPh0c5dUpe7S84WlBPcupP3m8ZXFxjyktVnmdcZoCY8XwB1UZ4CwtzFqwqg1GBsC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739016653; c=relaxed/simple;
	bh=gedZ10rFZMWPs16/6O/KbeedffwccIPIcS97DUiNdhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TXg99CksG1dCE0X6U/akxI7nyoxLT1Z+BKkR1mpAFMLnPy3/5agsiKKZy1v3nxGJ3UHZwmc6xfLFm1A3oOR1BJ9AhpzxC0GHtqMkQCAaLBwBIb492+wwFyq6U606eeZ0OBRTY0XpuDCqNoas/Bo2WnV6alH1mKzyc+PZa5lP9NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/91CWJY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/91CWJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739016652; x=1770552652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gedZ10rFZMWPs16/6O/KbeedffwccIPIcS97DUiNdhE=;
  b=K/91CWJYH0cySSJDHoapWSnF9moZHgzCgDmtKgYw7wByfFLKLfD/ync/
   0tKP556kNYSMYBZ8eC+hBWzuY3WAN2CvrJrnhDZJQYoay2OXqKY+UR5+2
   zYv2x4tF2AKxEysxXFl21XUqDNKVz2qORw/BkMaGLe4JEnyBO1MgqDjY6
   xR6Dmj4zZRGzqtekPwKPGU2qYIK5c9TobvdOUrqoqzSdv6SpVwfbZ9v+j
   O/AVMZI3rgaa6QbVounK1JU/Vq28WIOF3LuSEENA5fq80uSBR08KNKDRD
   G1JTL5vtqblq8cTu4vTy2nUpKCzm53MYArsObFZuaA+HhSR9N0v0F8DZ0
   w==;
X-CSE-ConnectionGUID: ZkF447yVQcWyWk7CEcw2Mw==
X-CSE-MsgGUID: Fb7vv0mZTaWcpZEsWRyQEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="57070801"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="57070801"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 04:10:50 -0800
X-CSE-ConnectionGUID: zadj7Tw9Qp+HqSUxMXLSgg==
X-CSE-MsgGUID: URrAKzBeQWWkFy5Fkcwm7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="116770918"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Feb 2025 04:10:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgjfb-000zwC-03;
	Sat, 08 Feb 2025 12:10:47 +0000
Date: Sat, 8 Feb 2025 20:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dvyukov:dvyukov-rseq-pkey 3/3] kernel/rseq.c:406:9: error: unknown
 type name 'pkey_reg_t'
Message-ID: <202502082017.0GixUctp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dvyukov/linux dvyukov-rseq-pkey
head:   b991732d23294a961eed6a4a2758c16f0430de9c
commit: b991732d23294a961eed6a4a2758c16f0430de9c [3/3] rseq: Make rseq work with protection keys
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20250208/202502082017.0GixUctp-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082017.0GixUctp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082017.0GixUctp-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rseq.c: In function '__rseq_handle_notify_resume':
>> kernel/rseq.c:406:9: error: unknown type name 'pkey_reg_t'
     406 |         pkey_reg_t saved;
         |         ^~~~~~~~~~
>> kernel/rseq.c:426:17: error: implicit declaration of function 'write_pkey_reg' [-Wimplicit-function-declaration]
     426 |                 write_pkey_reg(saved);
         |                 ^~~~~~~~~~~~~~
>> kernel/rseq.c:455:25: error: implicit declaration of function 'switch_to_permissive_pkey_reg' [-Wimplicit-function-declaration]
     455 |                 saved = switch_to_permissive_pkey_reg();
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pkey_reg_t +406 kernel/rseq.c

   390	
   391	/*
   392	 * This resume handler must always be executed between any of:
   393	 * - preemption,
   394	 * - signal delivery,
   395	 * and return to user-space.
   396	 *
   397	 * This is how we can ensure that the entire rseq critical section
   398	 * will issue the commit instruction only if executed atomically with
   399	 * respect to other threads scheduled on the same CPU, and with respect
   400	 * to signal handlers.
   401	 */
   402	void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
   403	{
   404		struct task_struct *t = current;
   405		int ret, sig;
 > 406		pkey_reg_t saved;
   407		bool switched_pkey_reg = false;
   408	
   409		if (unlikely(t->flags & PF_EXITING))
   410			return;
   411	
   412	retry:
   413		/*
   414		 * regs is NULL if and only if the caller is in a syscall path.  Skip
   415		 * fixup and leave rseq_cs as is so that rseq_sycall() will detect and
   416		 * kill a misbehaving userspace on debug kernels.
   417		 */
   418		if (regs) {
   419			ret = rseq_ip_fixup(regs);
   420			if (unlikely(ret < 0))
   421				goto error;
   422		}
   423		if (unlikely(rseq_update_cpu_node_id(t)))
   424			goto error;
   425		if (switched_pkey_reg)
 > 426			write_pkey_reg(saved);
   427		return;
   428	
   429	error:
   430		/*
   431		 * If the application registers rseq, and ever switches to another
   432		 * pkey protection (such that the rseq becomes inaccessible), then
   433		 * any context switch will cause failure here attemping to read/write
   434		 * struct rseq and/or rseq_cs. Since context switches are
   435		 * asynchronous and are outside of the application control
   436		 * (not part of the restricted code scope), we temporarily switch
   437		 * to premissive pkey register to read/write rseq/rseq_cs,
   438		 * similarly to signal delivery.
   439		 *
   440		 * We don't bother to check if the failure really happened due to
   441		 * pkeys or not, since it does not matter (performance-wise and
   442		 * otherwise).
   443		 *
   444		 * If the restricted code installs rseq_cs in inaccessible to it
   445		 * due to pkeys page, we still let this function read the rseq_cs.
   446		 * It's unclear what benefits the resticted code gets by doing this
   447		 * (it probably already hijacked control flow at this point), and
   448		 * presumably any sane sandbox should prohibit restricted code
   449		 * from accessing struct rseq, and this is still better than
   450		 * terminating the app unconditionally (it always has a choice
   451		 * of not using rseq and pkeys together).
   452		 */
   453		if (!switched_pkey_reg) {
   454			switched_pkey_reg = true;
 > 455			saved = switch_to_permissive_pkey_reg();
   456			goto retry;
   457		} else {
   458			write_pkey_reg(saved);
   459		}
   460		sig = ksig ? ksig->sig : 0;
   461		force_sigsegv(sig);
   462	}
   463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
