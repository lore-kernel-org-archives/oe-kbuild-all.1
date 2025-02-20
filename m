Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7141F1E0E11
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 04:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740025343; cv=none; b=YrcBLWnz6BbdBOHFZ7VyljgFGXuUD4X6w98aWFT/fHhSIxEGWIRGDcbrNLS8onpxWvptOFCGMhviYGR5KdSC7Gu6xBtXWf5YsTa/jGw3QTcpxYO0BSex0yBv3yK3HR9XThc0zMbPPKMchKy0Rz4MuGgbZkzJqoGokGCmzXEv/6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740025343; c=relaxed/simple;
	bh=mPcfgY2679Hxmx6a2waRJb/PemT7pMoLWtgOQPOh5bY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OCF8yCrNO1FXIWwb/zIgNUHcjO2D7vkMrZ7N2+r0WGYSiyjjMS/n0/ugF6j941DbvmwgtjRhtZd8DwYU/SLU1JJW+wbPx0ONBQlE0E4sKR+x2s44lInAZTCSmpZWja+ESlUkbdFBxXYN19UMcrR8HQ2rLEIjDo+uZrs7MU+f/Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIh8oXQh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIh8oXQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740025342; x=1771561342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mPcfgY2679Hxmx6a2waRJb/PemT7pMoLWtgOQPOh5bY=;
  b=BIh8oXQhE3t5HhkiDOHhkx+uUoPbI/qW9WQhVNuVCyWCDLnHuaseeXYL
   KdADWGskYLifR6rojg4V74Sea/Em/zBVtpjDuitBTGszYyhbiE2P026tT
   ggQl3fEJvhToDDhgBOBce/sndnVE6Dl9qkPzjL6RyyoxZeZ59CKMpkOTr
   Di5cGf2leXdDzR2lEHKB57u2MTz9jyWpvlfyj6kcQRpXYmQnJhxKtK5Ny
   gwFH4xnW0EwDG9+VHBPfjflao2Y4ujheuD9jJEhKJRBRPu/T+Hufc4iNW
   DjTyZjndKUMe/fSka7qtZjFiq1c8+kHlOmIhRYF2OWLUU4KSf5xmYoGc2
   A==;
X-CSE-ConnectionGUID: Ed6cJmJyT/CQo5sko4CwlQ==
X-CSE-MsgGUID: OboRD2+ITFCtR0HiwgLt2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="52197939"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="52197939"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 20:22:21 -0800
X-CSE-ConnectionGUID: 20gMMyfdTgeG7MN3Stkprg==
X-CSE-MsgGUID: 3tWz1PQXSrC7X+VmtZ9EPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115825402"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Feb 2025 20:22:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tky4n-0003rF-1S;
	Thu, 20 Feb 2025 04:22:17 +0000
Date: Thu, 20 Feb 2025 12:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4579/4901]
 arch/x86/kernel/cpu/mce/severity.c:305:22: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202502201215.ZkIMdQVr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8936cec5cb6e27649b86fabf383d7ce4113bba49
commit: 599382062e7b91fb049e339db93c3a0b840d2b6e [4579/4901] x86/mce: add EX_TYPE_EFAULT_REG as in-kernel recovery context to fix copy-from-user operations regression
config: x86_64-buildonly-randconfig-004-20250220 (https://download.01.org/0day-ci/archive/20250220/202502201215.ZkIMdQVr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502201215.ZkIMdQVr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502201215.ZkIMdQVr-lkp@intel.com/

Note: the linux-next/master HEAD 8936cec5cb6e27649b86fabf383d7ce4113bba49 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/mce/severity.c: In function 'error_context':
>> arch/x86/kernel/cpu/mce/severity.c:305:22: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     305 |         fixup_type = FIELD_GET(EX_DATA_TYPE_MASK, e->data);
         |                      ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +305 arch/x86/kernel/cpu/mce/severity.c

   275	
   276	/*
   277	 * If mcgstatus indicated that ip/cs on the stack were
   278	 * no good, then "m->cs" will be zero and we will have
   279	 * to assume the worst case (IN_KERNEL) as we actually
   280	 * have no idea what we were executing when the machine
   281	 * check hit.
   282	 * If we do have a good "m->cs" (or a faked one in the
   283	 * case we were executing in VM86 mode) we can use it to
   284	 * distinguish an exception taken in user from from one
   285	 * taken in the kernel.
   286	 */
   287	static noinstr int error_context(struct mce *m, struct pt_regs *regs)
   288	{
   289		const struct exception_table_entry *e;
   290		int fixup_type, imm;
   291		bool copy_user;
   292	
   293		if ((m->cs & 3) == 3)
   294			return IN_USER;
   295	
   296		if (!mc_recoverable(m->mcgstatus))
   297			return IN_KERNEL;
   298	
   299		e = search_exception_tables(m->ip);
   300		if (!e)
   301			return IN_KERNEL;
   302	
   303		/* Allow instrumentation around external facilities usage. */
   304		instrumentation_begin();
 > 305		fixup_type = FIELD_GET(EX_DATA_TYPE_MASK, e->data);
   306		imm  = FIELD_GET(EX_DATA_IMM_MASK,  e->data);
   307		copy_user  = is_copy_from_user(regs);
   308		instrumentation_end();
   309	
   310		switch (fixup_type) {
   311		case EX_TYPE_UACCESS:
   312			if (!copy_user)
   313				return IN_KERNEL;
   314			m->kflags |= MCE_IN_KERNEL_COPYIN | MCE_IN_KERNEL_RECOV;
   315			return IN_KERNEL_RECOV;
   316		case EX_TYPE_IMM_REG:
   317			if (!copy_user || imm != -EFAULT)
   318				return IN_KERNEL;
   319			m->kflags |= MCE_IN_KERNEL_COPYIN | MCE_IN_KERNEL_RECOV;
   320			return IN_KERNEL_RECOV;
   321		case EX_TYPE_FAULT_MCE_SAFE:
   322		case EX_TYPE_DEFAULT_MCE_SAFE:
   323			m->kflags |= MCE_IN_KERNEL_RECOV;
   324			return IN_KERNEL_RECOV;
   325	
   326		default:
   327			return IN_KERNEL;
   328		}
   329	}
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
