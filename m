Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4CD3D7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 04:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689048764; x=1720584764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1KjmRULYu+aQVuxyXjma/BhzKaij91iJVJGuygt4muw=;
  b=WAnX0gNVfHSjUd9OTAlTNY4eWwvnLbOl83MXa209/k8lbXZrLEAPawDy
   AiMmNrLp8OqnZxJPfMwts8TGWKHI4csdrKVL7PY6LH2JfW832Z2mL1p1K
   RPVD0JhSQ86wcfCeNgXNe5aIEMHix7P+0AHNBL17//OC1vkfvdT639/CF
   XGrXhaku/pNC79ohgAu8A5BN+XFKpaYp13PFd2V+bhgHK87ZIKJMUKtD/
   5NOhOwKd1M+8YanVlyQp0VdqgZAzrnG9Ub2zac20a81v//Y6L0Ae2Sm1/
   mPzQDYbkkT9Nutbt7kFfoWXxzjWAcej8j6JgtzzUTv3VVAcuE8Bz6ko4W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344839116"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="344839116"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 21:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="845121920"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="845121920"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Jul 2023 21:12:40 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ4jw-0004Id-0k;
	Tue, 11 Jul 2023 04:12:40 +0000
Date: Tue, 11 Jul 2023 12:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:trace/urgent 3/6] kernel/trace/fgraph.c:282:15: error:
 conflicting types for 'ftrace_return_to_handler'; have 'long unsigned
 int(struct fgraph_ret_regs *)'
Message-ID: <202307111244.ROIg200M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/urgent
head:   76ae40eccaa12b3b73256118ed3463dba523812d
commit: 8eebd18ffba37df7c5a78fdae9f9757b54795588 [3/6] tracing: arm64: Avoid missing-prototype warnings
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230711/202307111244.ROIg200M-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111244.ROIg200M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111244.ROIg200M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/fgraph.c:282:15: error: conflicting types for 'ftrace_return_to_handler'; have 'long unsigned int(struct fgraph_ret_regs *)'
     282 | unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/fgraph.c:12:
   include/linux/ftrace.h:45:15: note: previous declaration of 'ftrace_return_to_handler' with type 'long unsigned int(long unsigned int)'
      45 | unsigned long ftrace_return_to_handler(unsigned long frame_pointer);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~


vim +282 kernel/trace/fgraph.c

e73e679f656e67 Steven Rostedt (VMware  2018-11-15  276) 
a1be9ccc57f07d Donglin Peng            2023-04-08  277  /*
a1be9ccc57f07d Donglin Peng            2023-04-08  278   * After all architecures have selected HAVE_FUNCTION_GRAPH_RETVAL, we can
a1be9ccc57f07d Donglin Peng            2023-04-08  279   * leave only ftrace_return_to_handler(ret_regs).
a1be9ccc57f07d Donglin Peng            2023-04-08  280   */
a1be9ccc57f07d Donglin Peng            2023-04-08  281  #ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
a1be9ccc57f07d Donglin Peng            2023-04-08 @282  unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs)
a1be9ccc57f07d Donglin Peng            2023-04-08  283  {
a1be9ccc57f07d Donglin Peng            2023-04-08  284  	return __ftrace_return_to_handler(ret_regs,
a1be9ccc57f07d Donglin Peng            2023-04-08  285  				fgraph_ret_regs_frame_pointer(ret_regs));
a1be9ccc57f07d Donglin Peng            2023-04-08  286  }
a1be9ccc57f07d Donglin Peng            2023-04-08  287  #else
a1be9ccc57f07d Donglin Peng            2023-04-08  288  unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
a1be9ccc57f07d Donglin Peng            2023-04-08  289  {
a1be9ccc57f07d Donglin Peng            2023-04-08  290  	return __ftrace_return_to_handler(NULL, frame_pointer);
a1be9ccc57f07d Donglin Peng            2023-04-08  291  }
a1be9ccc57f07d Donglin Peng            2023-04-08  292  #endif
a1be9ccc57f07d Donglin Peng            2023-04-08  293  

:::::: The code at line 282 was first introduced by commit
:::::: a1be9ccc57f07d54278be34eed6bd679bc941c97 function_graph: Support recording and printing the return value of function

:::::: TO: Donglin Peng <pengdonglin@sangfor.com.cn>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
