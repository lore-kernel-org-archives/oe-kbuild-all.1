Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0180A370
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 07:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694244714; x=1725780714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KZR7dHjXDWLxpgtmCOKU1u52EgY3UPZQnAioqRA/Uuo=;
  b=CjUbny5GX10GlaLg03JScYgxw6rNxmuS3kx4MS6Z5wd2r8v9qO/xYmr8
   WEWuMmJbP4J55FW8v/jzv8VdDzR8H/qq/FBZd2GJiDZVKa1R2tRkL7g/P
   k/GnnOXW6nwRZR8fOulU5pYfZ85yXD2w6Ab+QEdg6maj05hcUHArvZpMC
   KwElQAa1PRhxLbM0vlPlTPhzOAIeXktl2RyZJvM3gck7CyR5d4+jON86L
   kjCs+S1xcx1QMEv7gcqTJlAnGwphOvbQJaFoXO6LnpAAtKzhMrKtzJH0e
   iahNZ95YeZX4KnE7ngRNPOYW3XFDvNTH0xUsI9ACkxo+I1bprzBpCbinn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="358107678"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="358107678"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 00:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="772001763"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="772001763"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Sep 2023 00:31:52 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qesRa-000356-0G;
	Sat, 09 Sep 2023 07:31:50 +0000
Date: Sat, 9 Sep 2023 15:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] bpf: Using binary search to improve the performance
 of btf_find_by_name_kind
Message-ID: <202309091546.52tWvlAB-lkp@intel.com>
References: <20230909055202.306518-1-pengdonglin@sangfor.com.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230909055202.306518-1-pengdonglin@sangfor.com.cn>

Hi Donglin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master linus/master v6.5 next-20230908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donglin-Peng/bpf-Using-binary-search-to-improve-the-performance-of-btf_find_by_name_kind/20230909-140210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230909055202.306518-1-pengdonglin%40sangfor.com.cn
patch subject: [RFC PATCH] bpf: Using binary search to improve the performance of btf_find_by_name_kind
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230909/202309091546.52tWvlAB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091546.52tWvlAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091546.52tWvlAB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/btf.c:557:5: warning: no previous prototype for 'btf_type_cnt' [-Wmissing-prototypes]
     557 | u32 btf_type_cnt(const struct btf *btf)
         |     ^~~~~~~~~~~~
   kernel/bpf/btf.c: In function 'btf_seq_show':
   kernel/bpf/btf.c:7362:29: warning: function 'btf_seq_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7362 |         seq_vprintf((struct seq_file *)show->target, fmt, args);
         |                             ^~~~~~~~
   kernel/bpf/btf.c: In function 'btf_snprintf_show':
   kernel/bpf/btf.c:7399:9: warning: function 'btf_snprintf_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7399 |         len = vsnprintf(show->target, ssnprintf->len_left, fmt, args);
         |         ^~~


vim +/btf_type_cnt +557 kernel/bpf/btf.c

   556	
 > 557	u32 btf_type_cnt(const struct btf *btf)
   558	{
   559		return btf->start_id + btf->nr_types;
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
