Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE66270040
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740664855; cv=none; b=dyHWsQBgGm0FTZbCFeIa5dAgc6WuLiVoDohtPWmJiPyWVX3Ws45jpSrfx0hvUtwd+44OcFKAnPiEITUZ9Sf05E+vVGKl0YBNPVECXxnMfgt2E72ZR9jynPLne3IkUNl7fQ/hE6WRw2MIvEKKKn6O7XENKXiIQmOPUyF11ZFKmy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740664855; c=relaxed/simple;
	bh=0IFFRcCIA9o5W1r/VAQg8KaFaAP5YPoAio6VfDzmMEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPNgiCWT0piSKsG1No0NN0If6nQrYpr/nxWP7GIfYTj6VYKRA+XVzJMW5HXtMuPrAwd0trLc8P/T73bsp3qyXnjJciTTF+99Ejo3eujuc6TGIJ9/yKLNBymTmIHRr9Ww3dnGcN9/Ge92UcXLiy2Wgd7khJHQSpwKTa0+a0tI1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRM7vFxR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRM7vFxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740664853; x=1772200853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0IFFRcCIA9o5W1r/VAQg8KaFaAP5YPoAio6VfDzmMEs=;
  b=BRM7vFxRXuZjWsO+CtdJ0feQ9rwM36jYaJU69Au+Xq6cRXRIGW7b+xIp
   tya4/CtPdiDrBPxttRVAC/5W4Pi/4yKcFrDO5iSIPahbniS7uZ6I4R1GP
   5rUAT7etrH+1uQY+66HAG8oHFShWfRCn5ulTniccY+cszWu6k56l2gULI
   zWdG4t1tTR6kZj6i1+SjVxT6+6OwEqdZdEGMb29TGTOgExud87wVwgrx7
   xvLwP4UUkUSAhR7F3Dd0T9oo7F8AQbFQbeTs+DjTmV1GCRx6pLYFnEHkP
   QxVoTntTHfidAVximJ6TDmtSav3q/+lE80E2BGzKoarQf1Lhl6gC+q7vB
   w==;
X-CSE-ConnectionGUID: nY7rCe0/R42Gf7S/kR5RMA==
X-CSE-MsgGUID: UBK/x08yT/eEUWGpJkwS/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40793038"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="40793038"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:00:52 -0800
X-CSE-ConnectionGUID: a4tw/TRjRdeX58h4CDKVCw==
X-CSE-MsgGUID: SF1pfHurSdqtSPaTJkrFFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="121976536"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Feb 2025 06:00:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tneRU-000DRw-2u;
	Thu, 27 Feb 2025 14:00:48 +0000
Date: Thu, 27 Feb 2025 22:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/4] ftrace: Add support for function argument to
 graph tracer
Message-ID: <202502272155.zS8WsTRz-lkp@intel.com>
References: <20250225222653.724198940@goodmis.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225222653.724198940@goodmis.org>

Hi Steven,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc4 next-20250227]
[cannot apply to trace/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/ftrace-Add-print_function_args/20250226-063252
base:   linus/master
patch link:    https://lore.kernel.org/r/20250225222653.724198940%40goodmis.org
patch subject: [PATCH v3 2/4] ftrace: Add support for function argument to graph tracer
config: arm-socfpga_defconfig (https://download.01.org/0day-ci/archive/20250227/202502272155.zS8WsTRz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272155.zS8WsTRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272155.zS8WsTRz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ftrace.h:115,
                    from kernel/trace/trace_functions_graph.c:11:
   kernel/trace/trace_functions_graph.c: In function '__graph_entry':
>> include/linux/ftrace_regs.h:22:9: error: implicit declaration of function 'regs_get_kernel_argument'; did you mean 'regs_get_kernel_stack_nth'? [-Wimplicit-function-declaration]
      22 |         regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_functions_graph.c:137:42: note: in expansion of macro 'ftrace_regs_get_argument'
     137 |                         entry->args[i] = ftrace_regs_get_argument(fregs, i);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_functions_graph.c: In function 'print_graph_entry_leaf':
   kernel/trace/trace_functions_graph.c:901:23: warning: variable 'func' set but not used [-Wunused-but-set-variable]
     901 |         unsigned long func;
         |                       ^~~~


vim +22 include/linux/ftrace_regs.h

e4cf33ca48128d Steven Rostedt            2024-10-10  18  
e4cf33ca48128d Steven Rostedt            2024-10-10  19  #define ftrace_regs_get_instruction_pointer(fregs) \
0b582611a8f427 Masami Hiramatsu (Google  2024-10-15  20) 	instruction_pointer(&arch_ftrace_regs(fregs)->regs)
e4cf33ca48128d Steven Rostedt            2024-10-10  21  #define ftrace_regs_get_argument(fregs, n) \
0b582611a8f427 Masami Hiramatsu (Google  2024-10-15 @22) 	regs_get_kernel_argument(&arch_ftrace_regs(fregs)->regs, n)
e4cf33ca48128d Steven Rostedt            2024-10-10  23  #define ftrace_regs_get_stack_pointer(fregs) \
0b582611a8f427 Masami Hiramatsu (Google  2024-10-15  24) 	kernel_stack_pointer(&arch_ftrace_regs(fregs)->regs)
2d17932da44fdc Masami Hiramatsu (Google  2024-10-15  25) #define ftrace_regs_get_return_value(fregs) \
0b582611a8f427 Masami Hiramatsu (Google  2024-10-15  26) 	regs_return_value(&arch_ftrace_regs(fregs)->regs)
e4cf33ca48128d Steven Rostedt            2024-10-10  27  #define ftrace_regs_set_return_value(fregs, ret) \
0b582611a8f427 Masami Hiramatsu (Google  2024-10-15  28) 	regs_set_return_value(&arch_ftrace_regs(fregs)->regs, ret)
e4cf33ca48128d Steven Rostedt            2024-10-10  29  #define ftrace_override_function_with_return(fregs) \
0b582611a8f427 Masami Hiramatsu (Google  2024-10-15  30) 	override_function_with_return(&arch_ftrace_regs(fregs)->regs)
e4cf33ca48128d Steven Rostedt            2024-10-10  31  #define ftrace_regs_query_register_offset(name) \
e4cf33ca48128d Steven Rostedt            2024-10-10  32  	regs_query_register_offset(name)
a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26  33) #define ftrace_regs_get_frame_pointer(fregs) \
a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26  34) 	frame_pointer(&arch_ftrace_regs(fregs)->regs)
e4cf33ca48128d Steven Rostedt            2024-10-10  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
