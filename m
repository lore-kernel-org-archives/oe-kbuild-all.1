Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174BC748C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 03:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691033574; x=1722569574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gSS0hvImjpO1adm2Mq8VLtMcxJ5H5BGdVcXARqQ03Cs=;
  b=NdtA478zyWrf2HNcCuLYhaOa6k9jx3fb3S0QUq72lW12dEzroLZapQ5F
   zgzIjxM9hvZCOBsbNj56+O2wh4CJdK92GmEQMOx87YZGes7zi3vRQ0JBB
   iUY8uR2l5VPhR1Gy74IJXQHXYSj52oVuHE9P0khp9UE1ogOmfDqa+8t+L
   ZoO5o/AOJn/Lo9thQvIINZ8z2GK45cRWpflvzsb8guuyz2WLwkGiT/MU7
   k4MLh2WEeoHUL+ZzPoR05M65/ZIWeh0KPRC/venI2UFml5pSl5k0qHd1S
   v5d9kdPWtnMS52LQSrS8llPEQJLupS/5cokGDgVS85xhJW6kcsV1xhL/7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="433599012"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="433599012"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 20:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="853085616"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="853085616"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Aug 2023 20:32:52 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRP51-0001iV-39;
	Thu, 03 Aug 2023 03:32:51 +0000
Date: Thu, 3 Aug 2023 11:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 1/2]
 samples/fprobe/fprobe_example.c:96:36: error: assignment to 'int (*)(struct
 fprobe *, long unsigned int,  long unsigned int,  struct ftrace_regs *, void
 *)' from incompatible pointer type 'int (*)(struct fprobe *, long unsigned
 int,  long unsigned int,  s...
Message-ID: <202308031143.bzGztFoO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   b12390ba014e308f5c07512a3e077d802f5ac793
commit: 24a7af19b386f8b943b0246774e700e8aaa98b0d [1/2] fprobe: Use fprobe_regs in fprobe entry handler
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230803/202308031143.bzGztFoO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031143.bzGztFoO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031143.bzGztFoO-lkp@intel.com/

All errors (new ones prefixed by >>):

   samples/fprobe/fprobe_example.c: In function 'fprobe_init':
>> samples/fprobe/fprobe_example.c:96:36: error: assignment to 'int (*)(struct fprobe *, long unsigned int,  long unsigned int,  struct ftrace_regs *, void *)' from incompatible pointer type 'int (*)(struct fprobe *, long unsigned int,  long unsigned int,  struct pt_regs *, void *)' [-Werror=incompatible-pointer-types]
      96 |         sample_probe.entry_handler = sample_entry_handler;
         |                                    ^
   cc1: some warnings being treated as errors


vim +96 samples/fprobe/fprobe_example.c

6ee64cc3020b5b Masami Hiramatsu 2022-03-15   89  
6ee64cc3020b5b Masami Hiramatsu 2022-03-15   90  static int __init fprobe_init(void)
6ee64cc3020b5b Masami Hiramatsu 2022-03-15   91  {
6ee64cc3020b5b Masami Hiramatsu 2022-03-15   92  	char *p, *symbuf = NULL;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15   93  	const char **syms;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15   94  	int ret, count, i;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15   95  
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  @96  	sample_probe.entry_handler = sample_entry_handler;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15   97  	sample_probe.exit_handler = sample_exit_handler;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15   98  
6ee64cc3020b5b Masami Hiramatsu 2022-03-15   99  	if (strchr(symbol, '*')) {
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  100  		/* filter based fprobe */
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  101  		ret = register_fprobe(&sample_probe, symbol,
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  102  				      nosymbol[0] == '\0' ? NULL : nosymbol);
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  103  		goto out;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  104  	} else if (!strchr(symbol, ',')) {
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  105  		symbuf = symbol;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  106  		ret = register_fprobe_syms(&sample_probe, (const char **)&symbuf, 1);
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  107  		goto out;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  108  	}
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  109  
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  110  	/* Comma separated symbols */
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  111  	symbuf = kstrdup(symbol, GFP_KERNEL);
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  112  	if (!symbuf)
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  113  		return -ENOMEM;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  114  	p = symbuf;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  115  	count = 1;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  116  	while ((p = strchr(++p, ',')) != NULL)
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  117  		count++;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  118  
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  119  	pr_info("%d symbols found\n", count);
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  120  
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  121  	syms = kcalloc(count, sizeof(char *), GFP_KERNEL);
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  122  	if (!syms) {
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  123  		kfree(symbuf);
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  124  		return -ENOMEM;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  125  	}
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  126  
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  127  	p = symbuf;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  128  	for (i = 0; i < count; i++)
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  129  		syms[i] = strsep(&p, ",");
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  130  
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  131  	ret = register_fprobe_syms(&sample_probe, syms, count);
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  132  	kfree(syms);
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  133  	kfree(symbuf);
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  134  out:
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  135  	if (ret < 0)
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  136  		pr_err("register_fprobe failed, returned %d\n", ret);
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  137  	else
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  138  		pr_info("Planted fprobe at %s\n", symbol);
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  139  
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  140  	return ret;
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  141  }
6ee64cc3020b5b Masami Hiramatsu 2022-03-15  142  

:::::: The code at line 96 was first introduced by commit
:::::: 6ee64cc3020b5b5537827c71d8eaac814ad4d346 fprobe: Add sample program for fprobe

:::::: TO: Masami Hiramatsu <mhiramat@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
