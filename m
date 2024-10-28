Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055C31D278C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 10:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111879; cv=none; b=Kij63Qj3+E3McxQVANYtAtKlEQ54kGFCWuJCdsJcFzTJFIfFUPWouidbVHRuZ3nW1tTaC06mwSNrzPprWD0rut1howEJ+uctHBjVOCE4SaMjPDfUXriXAZWbgYJDxbOKLDM08eVicuB9uGp6re0Tet/CWxkxk4GJDOKuUVJRUZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111879; c=relaxed/simple;
	bh=OZqeiRHNjswBoNxcdNfjRrc6avlkFgJezADNrf6WviQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WAdYF1d1X3tQOYxt1dFYsJNgE2hAzMeN8noFdjgoEWOT2QCnlW3q4F5osIdTg9uP0STtEofByhUoxs/zlOGsOaqO8aUgzjAF39LSsZ1GIC1RN17ifw/u2xMRBHte+R2psZ4Vf7/5BaSrVhPmdVx9Q9bIlu93v539plSX/WqpfJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXO3stSK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXO3stSK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730111877; x=1761647877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZqeiRHNjswBoNxcdNfjRrc6avlkFgJezADNrf6WviQ=;
  b=DXO3stSKL+a837YJt/YK11a88kX+3KZmx0CANvXeB7xiiQQZO29Avmi8
   U2/P0WCJCpaeb62bkrhntJDXLWR/EJIMhWVEBXQdJkK7oc3xtXIB7qTH2
   S9YrcDPdQyhRhew/r6zKoNXUKBWl6hit0E83753vKjB86U0N7hcH42/pZ
   2MDNQZlMm3XJSilNUziFWbL7sBjl5B1wxFWzLeXnKcokngLFG1AZZSS8C
   VPeiVcILh5ox9og+ERu+2tgCcjfmZCe3j2gKqh7lVFkE0Prm2phuFrEc+
   4veiGHtlA32RPsWnZztNgUfmgSVyZH9OYr7Fr2TVHyvXv2fyALpnMIe9n
   w==;
X-CSE-ConnectionGUID: 7yWyqWlmTKueHlTEppHIJQ==
X-CSE-MsgGUID: nk0NV4liQm2OQrFOMJK7Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="47186776"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="47186776"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 03:37:54 -0700
X-CSE-ConnectionGUID: PNTgO5b6TeGTnu8z052RDQ==
X-CSE-MsgGUID: H30g/l1uRL+5cBIINEJJpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="82394474"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Oct 2024 03:37:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5N8A-000cJm-0B;
	Mon, 28 Oct 2024 10:37:50 +0000
Date: Mon, 28 Oct 2024 18:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
Subject: [uml:next 44/50] arch/x86/um/ptrace.c:245:31: sparse: sparse: symbol
 'user_uml_view' was not declared. Should it be static?
Message-ID: <202410281821.WSPsAwq7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
head:   d3b08e5f3f2829943342b88d3e2b44fb0ccdccab
commit: 3f17fed2149192c7d3b76a45a6a87b4ff22cd586 [44/50] um: switch to regset API and depend on XSTATE
config: um-randconfig-r112-20241026 (https://download.01.org/0day-ci/archive/20241028/202410281821.WSPsAwq7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281821.WSPsAwq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281821.WSPsAwq7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/um/ptrace.c:245:31: sparse: sparse: symbol 'user_uml_view' was not declared. Should it be static?
--
>> arch/x86/um/signal.c:87:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct _xstate [noderef] __user *from_fp64 @@     got void * @@
   arch/x86/um/signal.c:87:19: sparse:     expected struct _xstate [noderef] __user *from_fp64
   arch/x86/um/signal.c:87:19: sparse:     got void *
   arch/x86/um/signal.c:201:9: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:201:9: sparse: sparse: cast removes address space '__user' of expression
>> arch/x86/um/signal.c:201:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got int * @@
   arch/x86/um/signal.c:201:9: sparse:     expected void const volatile [noderef] __user *ptr
   arch/x86/um/signal.c:201:9: sparse:     got int *
   arch/x86/um/signal.c:201:9: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:201:9: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:201:9: sparse: sparse: cast removes address space '__user' of expression
>> arch/x86/um/signal.c:201:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *ptr @@     got int * @@
   arch/x86/um/signal.c:201:9: sparse:     expected void [noderef] __user *ptr
   arch/x86/um/signal.c:201:9: sparse:     got int *
   arch/x86/um/signal.c:387:16: sparse: sparse: Using plain integer as NULL pointer
   arch/x86/um/signal.c:411:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/um/signal.c:411:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char [noderef] __user *__x @@     got void * @@
   arch/x86/um/signal.c:411:24: sparse:     expected char [noderef] __user *__x
   arch/x86/um/signal.c:411:24: sparse:     got void *

vim +/user_uml_view +245 arch/x86/um/ptrace.c

   244	
 > 245	const struct user_regset_view user_uml_view = {
   246	#ifdef CONFIG_X86_32
   247		.name = "i386", .e_machine = EM_386,
   248	#else
   249		.name = "x86_64", .e_machine = EM_X86_64,
   250	#endif
   251		.regsets = uml_regsets, .n = ARRAY_SIZE(uml_regsets)
   252	};
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
