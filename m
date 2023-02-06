Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5024F7B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675704311; x=1707240311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9MpOg/e1tMdiWWJ9lP+bpHqg1Mk6yUXpiIjkXYKqsLQ=;
  b=ljh96S1/7gGa2oM4kSsV3mO/X0j0tmEBTR3JIoYK33beZWuWOpTsoEux
   ni+kHGrfXbGxYjX9VsrJSTclmpllPmvWIhpjU/XoVbyWnIcSVDZ+d/9ei
   rOruiWN6snGlPAaF/19oFQ3cu+T1AP8FXKCJXpBHnu5dZC5z+SfcOM9sy
   I6dy4r18gbsfLFIgVRxadKhHzhmbmdajxGKM8LPsCrHuFx7o1oqm3ILve
   QKzHWZWsJ2m/wXvPEfPgL8pkZ8CGakkHR5jbWm89Q/fXMZbr3HEireRkr
   0JshmV2ZqJwr8XcSKApYJSBeWya8aiPl7q/VvV+JyEwH2yV6gZ9+1BEWU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="317270847"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="317270847"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 09:25:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="840435152"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="840435152"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Feb 2023 09:25:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP5Ep-0002hI-0F;
	Mon, 06 Feb 2023 17:25:07 +0000
Date: Tue, 7 Feb 2023 01:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Liu <liumartin@google.com>, robh+dt@kernel.org,
	frowand.list@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, surenb@google.com, minchan@kernel.org,
	tkjos@google.com, liumartin@google.com
Subject: Re: [PATCH] of: reserved-mem: expose reserved-mem details via debugfs
Message-ID: <202302070150.S0t7TNwD-lkp@intel.com>
References: <20230206142714.4151047-1-liumartin@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206142714.4151047-1-liumartin@google.com>

Hi Martin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.2-rc7 next-20230206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Liu/of-reserved-mem-expose-reserved-mem-details-via-debugfs/20230206-222927
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230206142714.4151047-1-liumartin%40google.com
patch subject: [PATCH] of: reserved-mem: expose reserved-mem details via debugfs
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230207/202302070150.S0t7TNwD-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5d479d32b3863f2ec8d10d756aa57cf29046e334
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Martin-Liu/of-reserved-mem-expose-reserved-mem-details-via-debugfs/20230206-222927
        git checkout 5d479d32b3863f2ec8d10d756aa57cf29046e334
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/of/of_reserved_mem.c: In function 'of_reserved_mem_debug_show':
>> drivers/of/of_reserved_mem.c:465:46: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Wformat=]
     465 |                 seq_printf(m, "%pa..%pa ( %7lu KB ) %5s %12s %s\n", &rmem->base,
         |                                           ~~~^
         |                                              |
         |                                              long unsigned int
         |                                           %7llu
     466 |                            &end, rmem->size / 1024,
         |                                  ~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             phys_addr_t {aka long long unsigned int}


vim +465 drivers/of/of_reserved_mem.c

   450	
   451	#if defined(CONFIG_DEBUG_FS)
   452	static int of_reserved_mem_debug_show(struct seq_file *m, void *private)
   453	{
   454		unsigned int i;
   455		size_t sum = 0;
   456	
   457		for (i = 0; i < reserved_mem_count; i++) {
   458			const struct reserved_mem *rmem = &reserved_mem[i];
   459			unsigned long node = rmem->fdt_node;
   460			phys_addr_t end = rmem->base + rmem->size - 1;
   461			bool nomap = (of_get_flat_dt_prop(node, "no-map", NULL)) != NULL;
   462			bool reusable = (of_get_flat_dt_prop(node, "reusable", NULL)) != NULL;
   463	
   464			sum += rmem->size;
 > 465			seq_printf(m, "%pa..%pa ( %7lu KB ) %5s %12s %s\n", &rmem->base,
   466				   &end, rmem->size / 1024,
   467				   nomap ? "nomap" : "map",
   468				   reusable ? "reusable" : "non-reusable",
   469				   rmem->name ? rmem->name : "unknown");
   470		}
   471		seq_printf(m, "Total %d regions, %zu KB\n",
   472			   reserved_mem_count,
   473			   sum / 1024);
   474		return 0;
   475	}
   476	DEFINE_SHOW_ATTRIBUTE(of_reserved_mem_debug);
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
