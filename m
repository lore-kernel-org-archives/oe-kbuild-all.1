Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C32779D7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 07:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686295371; x=1717831371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=82UYhh7EzWzGbwx2ugDFENfvhDkwZhvC12M3ucabpw4=;
  b=hg+e1e17oetyp3FuIkw6lFYhiLFw65KL4g398VAzNyGd7IFYWESSLErP
   ZYGGp0i5TJuYzPMnsmN9MmkZ7NsoGaV3dcxx7txEvyp89bRktzsSoOS87
   bRk52v7Q7OsJj9rr1CR5PewuuG++yk0LNZOanZ0sgcJ8z0JGtrj8KImIh
   PJGiQ2yxE9BKhqWeZsZphLLsufzS57XQ/8jJkCh0pQHlYc26PGmw1gJGm
   bWNG0KXnHMv3ak2/2SlSBkc24HtNDyRKCkOA70bVrq4SKvLbR/lPE+PXU
   lZppIFSL1JZosVB7gkoyG+8Owv7+t6tXCAdKRB+HM3r6XxD2/A19LODi/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="443905951"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="443905951"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 00:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="1040408104"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="1040408104"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Jun 2023 00:22:48 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7WSN-0008lS-26;
	Fri, 09 Jun 2023 07:22:47 +0000
Date: Fri, 9 Jun 2023 15:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: Naveen N Rao <naveen@kernel.org>, linux-trace-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] trace/kprobe: Display the actual notrace function when
 rejecting a probe
Message-ID: <202306091507.njZTnqSN-lkp@intel.com>
References: <20230609045545.418677-1-naveen@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609045545.418677-1-naveen@kernel.org>

Hi Naveen,

kernel test robot noticed the following build errors:

[auto build test ERROR on e46ad59233cf16daf4f3b9dd080003f01ac940fe]

url:    https://github.com/intel-lab-lkp/linux/commits/Naveen-N-Rao/trace-kprobe-Display-the-actual-notrace-function-when-rejecting-a-probe/20230609-125904
base:   e46ad59233cf16daf4f3b9dd080003f01ac940fe
patch link:    https://lore.kernel.org/r/20230609045545.418677-1-naveen%40kernel.org
patch subject: [PATCH] trace/kprobe: Display the actual notrace function when rejecting a probe
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230609/202306091507.njZTnqSN-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout e46ad59233cf16daf4f3b9dd080003f01ac940fe
        b4 shazam https://lore.kernel.org/r/20230609045545.418677-1-naveen@kernel.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091507.njZTnqSN-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_kprobe.c: In function '__register_trace_kprobe':
>> kernel/trace/trace_kprobe.c:490:41: error: macro "within_notrace_func" passed 2 arguments, but takes just 1
     490 |         if (within_notrace_func(tk, addr)) {
         |                                         ^
   kernel/trace/trace_kprobe.c:473: note: macro "within_notrace_func" defined here
     473 | #define within_notrace_func(tk) (false)
         | 
>> kernel/trace/trace_kprobe.c:490:13: error: 'within_notrace_func' undeclared (first use in this function)
     490 |         if (within_notrace_func(tk, addr)) {
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_kprobe.c:490:13: note: each undeclared identifier is reported only once for each function it appears in


vim +/within_notrace_func +490 kernel/trace/trace_kprobe.c

   475	
   476	/* Internal register function - just handle k*probes and flags */
   477	static int __register_trace_kprobe(struct trace_kprobe *tk)
   478	{
   479		unsigned long addr = trace_kprobe_address(tk);
   480		char symname[KSYM_NAME_LEN];
   481		int i, ret;
   482	
   483		ret = security_locked_down(LOCKDOWN_KPROBES);
   484		if (ret)
   485			return ret;
   486	
   487		if (trace_kprobe_is_registered(tk))
   488			return -EINVAL;
   489	
 > 490		if (within_notrace_func(tk, addr)) {
   491			pr_warn("Could not probe notrace function %s\n",
   492				lookup_symbol_name(addr, symname) ? trace_kprobe_symbol(tk) : symname);
   493			return -EINVAL;
   494		}
   495	
   496		for (i = 0; i < tk->tp.nr_args; i++) {
   497			ret = traceprobe_update_arg(&tk->tp.args[i]);
   498			if (ret)
   499				return ret;
   500		}
   501	
   502		/* Set/clear disabled flag according to tp->flag */
   503		if (trace_probe_is_enabled(&tk->tp))
   504			tk->rp.kp.flags &= ~KPROBE_FLAG_DISABLED;
   505		else
   506			tk->rp.kp.flags |= KPROBE_FLAG_DISABLED;
   507	
   508		if (trace_kprobe_is_return(tk))
   509			ret = register_kretprobe(&tk->rp);
   510		else
   511			ret = register_kprobe(&tk->rp.kp);
   512	
   513		return ret;
   514	}
   515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
