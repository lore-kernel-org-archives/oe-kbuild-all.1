Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A991ABEC2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731404233; cv=none; b=m6wz/T01m2iEFR0tT1t+GAz9Nc/EFqY95+DM4TT7eC1oQyDRoppIiWCowzmwJli4Pm5pryB3SMuUfpyO/kPewbrVER0Iea0DnmdIBMSWkN0cVQ0C4ClX+niS6KTZBbiPh8kZ84s886Kvnr5DNK8Xub74G78/kOYc8TWifXpbeDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731404233; c=relaxed/simple;
	bh=FD/eikd5qMHaYwD/uU93xvbkgscrHyMZ1c5VM2bNoqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukbAmaCqyENbFhTeDc2+aj6dZr9sVLuBiUwYLeyDM9/I8j4miYvXczP7mxPyzzPHMAZFQa000XmFuFodUF9cMg2pXDHuqCCGiTMs6sLJwkdMlYLybN6s2RMu2EOSwhBE+ygbnc4fqu3DB/UkhcepaiHMV2joMv/jcnXU93EGyEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwnTGsXK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwnTGsXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731404231; x=1762940231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FD/eikd5qMHaYwD/uU93xvbkgscrHyMZ1c5VM2bNoqY=;
  b=NwnTGsXKRJS+AFPgNk2Azl+nQ6LeTJ8NtyMsFT8vVdJRn5BBk0oFopFv
   WsN5km9xmIqGxOPxBrCqxMds8t3fwpTA0HznlXKy9qT7fI2wAXRCHhr16
   /J+y96WFy7KKeEhizX++eNCQO/Iq91w7pb4dMrrzYqJ1HG9psXHQtJXBP
   VCk3SCPbXRoAsDTAL4QkVcgkwnxFVAQDI2+xZpo9ye+/N0+h6DFJSh0Vs
   +zpo25lRxL19eQCpUtOg/ZaiwRN342GxuJNHpKZk87CTRkb2UyrVS8S76
   iBCw8DaDobOp1ubaAP/pTq9LVaTvk7Ay6DdPpQ3OJhRoKzA2fmbDqCrRL
   Q==;
X-CSE-ConnectionGUID: NEyh0Vz5RS6iVGoVslgbbg==
X-CSE-MsgGUID: tDNG/EqBTA2bygUTo5hm9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31324303"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="31324303"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 01:37:10 -0800
X-CSE-ConnectionGUID: O1KHx7zxSEqMfGYNqFmp9A==
X-CSE-MsgGUID: pXbrb84pQ1mgU7rObFzI2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="86945102"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Nov 2024 01:37:10 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAnKd-0000fp-2K;
	Tue, 12 Nov 2024 09:37:07 +0000
Date: Tue, 12 Nov 2024 17:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 08/13] um: nommu: configure fs register on host
 syscall invocation
Message-ID: <202411121758.PVa39iuK-lkp@intel.com>
References: <894d17f7924e7d31bfd5d6595ee84158f7411e47.1731290567.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <894d17f7924e7d31bfd5d6595ee84158f7411e47.1731290567.git.thehajime@gmail.com>

Hi Hajime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on uml/next]
[also build test WARNING on next-20241112]
[cannot apply to kees/for-next/execve uml/fixes linus/master v6.12-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hajime-Tazaki/fs-binfmt_elf_efpic-add-architecture-hook-elf_arch_finalize_exec/20241111-182943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/894d17f7924e7d31bfd5d6595ee84158f7411e47.1731290567.git.thehajime%40gmail.com
patch subject: [RFC PATCH v2 08/13] um: nommu: configure fs register on host syscall invocation
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20241112/202411121758.PVa39iuK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121758.PVa39iuK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121758.PVa39iuK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/um/os-Linux/cpu.c:18: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * get_host_cpu_features() return true with X86_FEATURE_FSGSBASE even

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +18 arch/um/os-Linux/cpu.c

    16	
    17	/**
  > 18	 * get_host_cpu_features() return true with X86_FEATURE_FSGSBASE even
    19	 * if the kernel is older and disabled using fsgsbase instruction.
    20	 * thus detection is based on whether SIGILL is raised or not.
    21	 */
    22	static jmp_buf jmpbuf;
    23	static void sigill(int sig, siginfo_t *si, void *ctx_void)
    24	{
    25		siglongjmp(jmpbuf, 1);
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
