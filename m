Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05BDEDE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 01:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734743499; cv=none; b=KtMqI0F71/ednXZfPRYUmFVVvuMUIDHVrWzP5DpvntzXx7Zx6MmnoJVaIjtIg7v05pocpCiJPiOQn4UAksgnfOvpU2ZRHg+kd3bjpfkJtnSH0RNN97bVWRiPE7oZImtswloOpSGoW1p66HdDBcXrsSXvwCIPz9e00REiQlLcoRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734743499; c=relaxed/simple;
	bh=Nt1nafX8DXoT0WC1gwGd8STmxlPr0Bwxn1DCSBMAY9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+ELLsIqBxUF08IUuuMzBAv/JkwB5MoC8Damy2IL1unqbt/AgU1WOnj7uRiU8PYJPzwfpZSiICv5y/Tt6YJcxRhFI4+VIaM0RTNLGhyhAEDnnkBtA8iwswby/5KTG90xExnrtGIgyFZF1AYzpCju8BTwVRmqdLplSwFQA3BhZiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAMGrkHm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAMGrkHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734743498; x=1766279498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nt1nafX8DXoT0WC1gwGd8STmxlPr0Bwxn1DCSBMAY9g=;
  b=FAMGrkHmlflyUdzJzYI3yWbrz7bQ1+YG7pm6EMbReOWXlUgTRm2/MwEX
   kjnR2/NJrX5eFYXY4K2feac1YTinLfjxT1+tYsIKPl13/xqNkkgWTXRtJ
   D4gWWQIXluXv/3QqmJsqKQ1fKwUZVqFWgh0kyBJXqnpObrJVdTEV0KvhB
   yfGEZwHR+VsSIUSaRlTsQfaO2wuwiUEc8guzjwlc03mmUcGMwp8EMzbV6
   5fdOPyuX95K3X7KNhR+Z5e1956sliLz/RyrvsSMwsp0f0mtWppQlhARb2
   Mghv2A7nvFuuo2P/2LKUzqD9TYm/MkUW8eX66HvTpBTqTbInKW4rkGA5+
   A==;
X-CSE-ConnectionGUID: YbX1GK26SOCW6/LdEJfYMg==
X-CSE-MsgGUID: B0/d3ImCQg2zxTmlcWuQmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35464726"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="35464726"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 17:11:37 -0800
X-CSE-ConnectionGUID: myb3ZQiKTge0rsnStLMFwg==
X-CSE-MsgGUID: ev0bpbexQ4ytOWwm5s2ESQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102765791"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2024 17:11:36 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOo1l-0001pH-2n;
	Sat, 21 Dec 2024 01:11:33 +0000
Date: Sat, 21 Dec 2024 09:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/fork.c:3088:2: warning: #warning clone3() entry point is
 missing, please fix
Message-ID: <202412210954.b4AprHmP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   499551201b5f4fd3c0618a3e95e3d0d15ea18f31
commit: 505d66d1abfb90853e24ab6cbdf83b611473d6fc clone3: drop __ARCH_WANT_SYS_CLONE3 macro
date:   5 months ago
config: sparc-sparc32_defconfig (https://download.01.org/0day-ci/archive/20241221/202412210954.b4AprHmP-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210954.b4AprHmP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210954.b4AprHmP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/fork.c: In function '__do_sys_clone3':
>> kernel/fork.c:3088:2: warning: #warning clone3() entry point is missing, please fix [-Wcpp]
    3088 | #warning clone3() entry point is missing, please fix
         |  ^~~~~~~


vim +3088 kernel/fork.c

  3068	
  3069	/**
  3070	 * sys_clone3 - create a new process with specific properties
  3071	 * @uargs: argument structure
  3072	 * @size:  size of @uargs
  3073	 *
  3074	 * clone3() is the extensible successor to clone()/clone2().
  3075	 * It takes a struct as argument that is versioned by its size.
  3076	 *
  3077	 * Return: On success, a positive PID for the child process.
  3078	 *         On error, a negative errno number.
  3079	 */
  3080	SYSCALL_DEFINE2(clone3, struct clone_args __user *, uargs, size_t, size)
  3081	{
  3082		int err;
  3083	
  3084		struct kernel_clone_args kargs;
  3085		pid_t set_tid[MAX_PID_NS_LEVEL];
  3086	
  3087	#ifdef __ARCH_BROKEN_SYS_CLONE3
> 3088	#warning clone3() entry point is missing, please fix
  3089		return -ENOSYS;
  3090	#endif
  3091	
  3092		kargs.set_tid = set_tid;
  3093	
  3094		err = copy_clone_args_from_user(&kargs, uargs, size);
  3095		if (err)
  3096			return err;
  3097	
  3098		if (!clone3_args_valid(&kargs))
  3099			return -EINVAL;
  3100	
  3101		return kernel_clone(&kargs);
  3102	}
  3103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
