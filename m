Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C391481CD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 06:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731132399; cv=none; b=h7zlaV4vdcqA/5TTKAzV1VWbd070P7QBStWCIdNyCFz+RL+8j+uspPlWXAP/83zcF83WSLQ5F1EOL51CObbPGVYBYW8NlWseGssBksaFBUbJV1vlOmF4kbfN0oJ4eFLOwtMrbpKBvuR/LGNoUTwma1wAzVt21Q8BuJ1OT5B4I20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731132399; c=relaxed/simple;
	bh=n3h0ytP7z5N3KOGDUFudj9p5ohcbk8AZYM708mEBh08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MXSxo4Ak+fjc1nv+Rp48KFjyr73eOc7W7bsznRgF7hOjZHdkHSlp2Z8iar+cY2IbSCfe6t2PGgZroD2MdG2hKkWt4M0CcxWmmrkaxGT2Lq9Ufog9IjwrFgAHNq1DACI0KV5Anh+v55G1aqBf7+kAIL6X5w2J7DLlAunMOIX/RkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaoNAaSZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaoNAaSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731132398; x=1762668398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n3h0ytP7z5N3KOGDUFudj9p5ohcbk8AZYM708mEBh08=;
  b=iaoNAaSZvhE5kHGPdIANogFxfDtMfw+e8iDeeVyddhc5eekDLYTYmqTX
   YoMoNEHceS9vuCQnMS6ohJLi7NT1VHDEadglIEF5p9JSKAD7cMIy07IcM
   /Sy4fYBZN0DDJM81B23gguB6+cLMF7gOQeDgy3+6aMohP9qd8RaWbZHBI
   d6fvCjCOguSlLqw8vbBYvTIjA1Oi7uU1h7gQgLEsBO+CZOlnBkmrTAuMQ
   7URMFjUSSb7e9vgnTzWeqd2/ik/1NdIZg/ishHW67no+lFtst9ARG4YWA
   M5l9rByhnbFZ2WG2QPlD18UXeERlToYfxZdbT4ncJneuXiuPxXeNEJJKJ
   Q==;
X-CSE-ConnectionGUID: R9/f8iGDTD+uU2IrmOY59g==
X-CSE-MsgGUID: 7UyABtFcQ76s0SppZydbiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30786595"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30786595"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 22:06:36 -0800
X-CSE-ConnectionGUID: JJ9vbQkvThuhMLq1NL+gVA==
X-CSE-MsgGUID: M8y/mo4MQjyR1hVXtPj0Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="89860092"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Nov 2024 22:06:35 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9ecC-000s7s-2h;
	Sat, 09 Nov 2024 06:06:32 +0000
Date: Sat, 9 Nov 2024 14:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 19/19]
 kernel/trace/bpf_trace.c:1031:1: warning: control reaches end of non-void
 function
Message-ID: <202411091453.q96QZ724-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   45b6f29f12043a3d5cb155ac4e09fa61229ebb00
commit: 45b6f29f12043a3d5cb155ac4e09fa61229ebb00 [19/19] bpf: Use ftrace_get_symaddr() in get_entry_ip()
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241109/202411091453.q96QZ724-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091453.q96QZ724-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091453.q96QZ724-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/ftrace.h:23,
                    from include/linux/kprobes.h:28,
                    from kernel/trace/bpf_trace.c:15:
   kernel/trace/bpf_trace.c: In function 'get_entry_ip':
>> arch/x86/include/asm/ftrace.h:56:41: error: implicit declaration of function 'arch_frace_get_symaddr'; did you mean 'arch_ftrace_get_symaddr'? [-Werror=implicit-function-declaration]
      56 | #define ftrace_get_symaddr(fentry_ip)   arch_frace_get_symaddr(fentry_ip)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c:1029:14: note: in expansion of macro 'ftrace_get_symaddr'
    1029 |         if (!ftrace_get_symaddr(fentry_ip))
         |              ^~~~~~~~~~~~~~~~~~
>> kernel/trace/bpf_trace.c:1031:1: warning: control reaches end of non-void function [-Wreturn-type]
    1031 | }
         | ^
   cc1: some warnings being treated as errors


vim +1031 kernel/trace/bpf_trace.c

9b99edcae5c80c Jiri Olsa                 2021-07-14  1026  
c09eb2e578eb16 Jiri Olsa                 2022-09-26  1027  static unsigned long get_entry_ip(unsigned long fentry_ip)
c09eb2e578eb16 Jiri Olsa                 2022-09-26  1028  {
45b6f29f12043a Masami Hiramatsu (Google  2024-09-13  1029) 	if (!ftrace_get_symaddr(fentry_ip))
c09eb2e578eb16 Jiri Olsa                 2022-09-26  1030  		return fentry_ip;
a8497506cd2c0f Andrii Nakryiko           2024-03-19 @1031  }
c09eb2e578eb16 Jiri Olsa                 2022-09-26  1032  

:::::: The code at line 1031 was first introduced by commit
:::::: a8497506cd2c0fc90a64f6f5d2744a0ddb2c81eb bpf: Avoid get_kernel_nofault() to fetch kprobe entry IP

:::::: TO: Andrii Nakryiko <andrii@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
