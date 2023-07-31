Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0244762D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 02:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690771999; x=1722307999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=toPniKK8ArY3sEMs4fRUsoY2eCeqhoRn0nyipDtGpBg=;
  b=UrDwYtOeTxH0ZKYz0pnMDSn82QGY9xw+Z+RBZYMrN0IWxb0cu5/GQ1CU
   tLYX4xMyHL2l8YHfXj+X0P1e2ioLf/VI1ATwc5ICcGhMd0gD9DT8NJxVx
   e9k924B6HY5C8GlVTSNUeOHIRYD/6Y7vgkX1VPThJPRERfRhegFf/zrzP
   hOY9REF3/ycJzFYBhWoImjVdWlSD4ri0DdjnnzEH+XwC1KHTWzXcZkypp
   en/NbUQsZOT90DY+3qP/iD+5zMqpIvx629vW2yJXlc97fzLfXxmqXMi0l
   v1RqP++03g5u+KyqRxflpNetOC7UcPfG6uD3QqSu5Ng/WjHHO4zODFCey
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="353818046"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="353818046"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 19:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="1058769256"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="1058769256"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jul 2023 19:53:17 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQJ24-0004tf-1K;
	Mon, 31 Jul 2023 02:53:16 +0000
Date: Mon, 31 Jul 2023 10:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Tao <rtoax@foxmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] samples/hw_breakpoint: Fix kernel BUG 'invalid opcode:
 0000'
Message-ID: <202307311055.gvBkinJW-lkp@intel.com>
References: <tencent_E626A858BED28C4E21C219780BC566015D0A@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_E626A858BED28C4E21C219780BC566015D0A@qq.com>

Hi Rong,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on bpf/master linus/master v6.5-rc4]
[cannot apply to next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Tao/samples-hw_breakpoint-Fix-kernel-BUG-invalid-opcode-0000/20230724-185721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/tencent_E626A858BED28C4E21C219780BC566015D0A%40qq.com
patch subject: [PATCH] samples/hw_breakpoint: Fix kernel BUG 'invalid opcode: 0000'
config: i386-randconfig-i063-20230730 (https://download.01.org/0day-ci/archive/20230731/202307311055.gvBkinJW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311055.gvBkinJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311055.gvBkinJW-lkp@intel.com/

All errors (new ones prefixed by >>):

   samples/hw_breakpoint/data_breakpoint.c: In function 'hw_break_module_exit':
>> samples/hw_breakpoint/data_breakpoint.c:73:9: error: implicit declaration of function '__symbol_put'; did you mean '__symbol_get'? [-Werror=implicit-function-declaration]
      73 |         __symbol_put(ksym_name);
         |         ^~~~~~~~~~~~
         |         __symbol_get
   cc1: some warnings being treated as errors


vim +73 samples/hw_breakpoint/data_breakpoint.c

    69	
    70	static void __exit hw_break_module_exit(void)
    71	{
    72		unregister_wide_hw_breakpoint(sample_hbp);
  > 73		__symbol_put(ksym_name);
    74		printk(KERN_INFO "HW Breakpoint for %s write uninstalled\n", ksym_name);
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
