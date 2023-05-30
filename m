Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94A54A0C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685443297; x=1716979297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3XwYbi2YWOP/4yOqq5xe7ZrfYM9fWjV1SGbklfjsvME=;
  b=UglipWKNXTip7h2FSkSY+LbJ93jUMVw5RBc3WI8pSZ2hqupH7QXmkFNN
   GrsXn2GPnojcIigtuqo7P8nxIHL4jVkhF3h221/xHO9RSnem0O3fZp/AH
   eLweVCbwQ5IWi0ptoSKfnLhF+RHDWVwgHQaijSFS4DA0nMet7whIgUq+h
   5S+WLMP9PXQMGdScPEnKZCrPIkmsPlEZ4gpw7dH8dUT0LYbErFWHoY1iL
   /APblVDrptCbPnCGBhyCeXXWK1vGTytSzLd323P5dp4lmPoGYnhdR18oZ
   8dysZFiXB89UPwkAlKxzK1c+7ILoc9KdTt1S+IJvkI9+JDGdKDCW6u/8F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="418362285"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="418362285"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 03:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706375026"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="706375026"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 May 2023 03:41:36 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3wnH-0000Hi-1F;
	Tue, 30 May 2023 10:41:35 +0000
Date: Tue, 30 May 2023 18:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] fdt: Mark "/reserved-memory" nodes as nosave if
 !reusable
Message-ID: <202305301844.lzGXMUkw-lkp@intel.com>
References: <20230530080425.18612-2-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530080425.18612-2-alexghiti@rivosinc.com>

Hi Alexandre,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.4-rc4 next-20230530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/fdt-Mark-reserved-memory-nodes-as-nosave-if-reusable/20230530-160609
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230530080425.18612-2-alexghiti%40rivosinc.com
patch subject: [RFC PATCH 1/1] fdt: Mark "/reserved-memory" nodes as nosave if !reusable
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230530/202305301844.lzGXMUkw-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e6e989bc8043fe16df80c07a2f61d759e148b6fb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/fdt-Mark-reserved-memory-nodes-as-nosave-if-reusable/20230530-160609
        git checkout e6e989bc8043fe16df80c07a2f61d759e148b6fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/of/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305301844.lzGXMUkw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/of/fdt.c: In function '__reserved_mem_nosave_reg':
>> drivers/of/fdt.c:528:48: error: implicit declaration of function 'phys_to_pfn'; did you mean 'page_to_pfn'? [-Werror=implicit-function-declaration]
     528 |                         register_nosave_region(phys_to_pfn(base),
         |                                                ^~~~~~~~~~~
         |                                                page_to_pfn
   drivers/of/fdt.c: At top level:
   drivers/of/fdt.c:641:19: warning: 'fdt_nosave_reserved_mem' defined but not used [-Wunused-function]
     641 | static int __init fdt_nosave_reserved_mem(void)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +528 drivers/of/fdt.c

   497	
   498	/*
   499	 * __reserved_mem_nosave_reg() - Make all memory described in 'reg' property as
   500	 * nosave, unless it is "reusable".
   501	 */
   502	static void __init __reserved_mem_nosave_reg(unsigned long node,
   503						     const char *uname)
   504	{
   505		int t_len = (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32);
   506		phys_addr_t base, size;
   507		int len;
   508		const __be32 *prop;
   509		bool reusable;
   510	
   511		prop = of_get_flat_dt_prop(node, "reg", &len);
   512		if (!prop)
   513			return;
   514	
   515		if (len && len % t_len != 0) {
   516			pr_err("Reserved memory: invalid reg property in '%s', skipping node.\n",
   517			       uname);
   518			return;
   519		}
   520	
   521		reusable = of_get_flat_dt_prop(node, "reusable", NULL) != NULL;
   522	
   523		while (len >= t_len) {
   524			base = dt_mem_next_cell(dt_root_addr_cells, &prop);
   525			size = dt_mem_next_cell(dt_root_size_cells, &prop);
   526	
   527			if (size && !reusable)
 > 528				register_nosave_region(phys_to_pfn(base),
   529						       phys_to_pfn(base + size));
   530	
   531			len -= t_len;
   532		}
   533	}
   534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
