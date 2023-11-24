Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01741946F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIm18R9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700812663; x=1732348663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PhaOf8vB1wbROaQsbcOJvyyveZepcNVsxFfGQVmJeRk=;
  b=RIm18R9hbX017MV8uaeWXQ3fN7ji9Iv3qGKwKVIuHhpeunW7Q7fyGa9R
   H9EJtoP92JdYIXnb5BFVrF3nv7uhxLqmk+wr0eDDk6VIv7fzv84Zrf5N3
   DVPuPeRzz9YGh+gAOBxS1yJnzIXD53uEJqHo7yg4PD6mVqVanGj5Lmzg0
   kqqDZg2LE2CE0eIhByCJkOfOE2P5szmJkmI7PEJQPWJYplJMXh224ADvy
   2o68Q7Z5jGxroIvvUILZvvf5fGBjm35RSS/2ST/33drcoxDBS/fE33443
   LuNLEizfJyUbgC1tQXUTDBe0vC36dWgVTQS/q7ha6jBHyGgYPbRvsyxW4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395199316"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="395199316"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 23:57:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="767393138"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="767393138"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2023 23:57:41 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6R4F-0002FH-07;
	Fri, 24 Nov 2023 07:57:39 +0000
Date: Fri, 24 Nov 2023 15:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 07/11] mm/mempolicy: add task mempolicy syscall
 variants
Message-ID: <202311241239.BTi9CaXx-lkp@intel.com>
References: <20231122211200.31620-8-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122211200.31620-8-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-mempolicy-refactor-do_set_mempolicy-for-code-re-use/20231123-115126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231122211200.31620-8-gregory.price%40memverge.com
patch subject: [RFC PATCH 07/11] mm/mempolicy: add task mempolicy syscall variants
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20231124/202311241239.BTi9CaXx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241239.BTi9CaXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241239.BTi9CaXx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> <stdin>:1585:2: warning: #warning syscall set_task_mempolicy not implemented [-Wcpp]
>> <stdin>:1588:2: warning: #warning syscall get_task_mempolicy not implemented [-Wcpp]
>> <stdin>:1591:2: warning: #warning syscall set_task_mempolicy_home_node not implemented [-Wcpp]
>> <stdin>:1594:2: warning: #warning syscall task_mbind not implemented [-Wcpp]
--
   In file included from arch/alpha/kernel/osf_sys.c:23:
>> include/linux/syscalls.h:819:45: warning: 'struct mbind_args' declared inside parameter list will not be visible outside of this definition or declaration
     819 | asmlinkage long sys_task_mbind(const struct mbind_args __user *uargs,
         |                                             ^~~~~~~~~~
--
   In file included from arch/alpha/kernel/signal.c:24:
>> include/linux/syscalls.h:819:45: warning: 'struct mbind_args' declared inside parameter list will not be visible outside of this definition or declaration
     819 | asmlinkage long sys_task_mbind(const struct mbind_args __user *uargs,
         |                                             ^~~~~~~~~~
   arch/alpha/kernel/signal.c:205:1: warning: no previous prototype for 'do_sigreturn' [-Wmissing-prototypes]
     205 | do_sigreturn(struct sigcontext __user *sc)
         | ^~~~~~~~~~~~
   arch/alpha/kernel/signal.c:233:1: warning: no previous prototype for 'do_rt_sigreturn' [-Wmissing-prototypes]
     233 | do_rt_sigreturn(struct rt_sigframe __user *frame)
         | ^~~~~~~~~~~~~~~
   arch/alpha/kernel/signal.c:523:1: warning: no previous prototype for 'do_work_pending' [-Wmissing-prototypes]
     523 | do_work_pending(struct pt_regs *regs, unsigned long thread_flags,
         | ^~~~~~~~~~~~~~~
--
   In file included from arch/alpha/kernel/pci.c:25:
>> include/linux/syscalls.h:819:45: warning: 'struct mbind_args' declared inside parameter list will not be visible outside of this definition or declaration
     819 | asmlinkage long sys_task_mbind(const struct mbind_args __user *uargs,
         |                                             ^~~~~~~~~~
   arch/alpha/kernel/pci.c:285:1: warning: no previous prototype for 'pcibios_claim_one_bus' [-Wmissing-prototypes]
     285 | pcibios_claim_one_bus(struct pci_bus *b)
         | ^~~~~~~~~~~~~~~~~~~~~
--
   arch/alpha/kernel/asm-offsets.c:15:6: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
      15 | void foo(void)
         |      ^~~
   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> <stdin>:1585:2: warning: #warning syscall set_task_mempolicy not implemented [-Wcpp]
>> <stdin>:1588:2: warning: #warning syscall get_task_mempolicy not implemented [-Wcpp]
>> <stdin>:1591:2: warning: #warning syscall set_task_mempolicy_home_node not implemented [-Wcpp]
>> <stdin>:1594:2: warning: #warning syscall task_mbind not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
