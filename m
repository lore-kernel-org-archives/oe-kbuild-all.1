Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9851D2BF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 13:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683897832; x=1715433832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6X+3GfpyxKT/S16jZP9gJGbi+00Q+/qTxoM5vjZRSP0=;
  b=bdaqHYs5IlwkOT/61uGFdH9vk8xpz6AsEwo4s51XbucnYeIMqIcYUEoL
   EnBn/ZqyZqWOhrKwrF86wyxCRqIEHiNkmdHC1lCv8AGlGRzrG4a/YBS6n
   1mCBsFdNGC4Hss/Zeg4oCeOanwVcOEk/M62q5xf+MN3To+IV4015AWyqa
   Ed9Soshrw5hczb+8x6kVOTvmF1xUWMnaAOlsid1KwIM8sjwXiUNQ/cl7Y
   gd1avZ4Bsgs5nME9+WI9SZaei7RAwQL+Eixyft+GUAD6nIjD1Lt0jFs1F
   HJQLLBusmf1byxUFjkNXKRA7oXeHfhxYiqkSNrxvALtZgcg6pZHBU6wrS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="378922987"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="378922987"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 06:23:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="677660442"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="677660442"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 May 2023 06:23:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxSkN-0004sk-2H;
	Fri, 12 May 2023 13:23:47 +0000
Date: Fri, 12 May 2023 21:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: alison.schofield@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/3] ACPI: NUMA: Apply SRAT proximity domain to entire
 CFMWS window
Message-ID: <202305122146.bDOHcFyN-lkp@intel.com>
References: <79a10b7101a8fab56f9ff3f9a4de73bee3156b40.1683742429.git.alison.schofield@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79a10b7101a8fab56f9ff3f9a4de73bee3156b40.1683742429.git.alison.schofield@intel.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/mm]
[also build test ERROR on rafael-pm/linux-next linus/master tip/x86/core v6.4-rc1 next-20230512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alison-schofield-intel-com/x86-numa-Introduce-numa_find_node-start-end/20230511-024625
base:   tip/x86/mm
patch link:    https://lore.kernel.org/r/79a10b7101a8fab56f9ff3f9a4de73bee3156b40.1683742429.git.alison.schofield%40intel.com
patch subject: [RFC 3/3] ACPI: NUMA: Apply SRAT proximity domain to entire CFMWS window
config: loongarch-randconfig-r021-20230511 (https://download.01.org/0day-ci/archive/20230512/202305122146.bDOHcFyN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d57adefd6ec7de8a3caca2d922877038dee708c3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review alison-schofield-intel-com/x86-numa-Introduce-numa_find_node-start-end/20230511-024625
        git checkout d57adefd6ec7de8a3caca2d922877038dee708c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/acpi/numa/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305122146.bDOHcFyN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/numa/srat.c: In function 'acpi_parse_cfmws':
>> drivers/acpi/numa/srat.c:323:22: error: implicit declaration of function 'numa_find_node'; did you mean 'numa_clear_node'? [-Werror=implicit-function-declaration]
     323 |         found_node = numa_find_node(start, end);
         |                      ^~~~~~~~~~~~~~
         |                      numa_clear_node
>> drivers/acpi/numa/srat.c:325:17: error: implicit declaration of function 'numa_remove_memblks'; did you mean 'numa_remove_cpu'? [-Werror=implicit-function-declaration]
     325 |                 numa_remove_memblks(found_node, start, end);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 numa_remove_cpu
   cc1: some warnings being treated as errors


vim +323 drivers/acpi/numa/srat.c

   300	
   301	static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
   302					   void *arg, const unsigned long table_end)
   303	{
   304		int node, found_node, *fake_pxm = arg;
   305		struct acpi_cedt_cfmws *cfmws;
   306		u64 start, end;
   307	
   308		cfmws = (struct acpi_cedt_cfmws *)header;
   309		start = cfmws->base_hpa;
   310		end = cfmws->base_hpa + cfmws->window_size;
   311	
   312		/*
   313		 * The SRAT may have already described the NUMA details for
   314		 * this CFMWS HPA range, yet it may not have created memblks
   315		 * for the entire range. Look for a node with a memblk covering
   316		 * any part of the HPA range. Don't bother figuring out if it
   317		 * is partially or wholly described. Replace any memblks in the
   318		 * range with one single memblk that covers the entire range.
   319		 *
   320		 * This preserves the SRAT defined node and Proximity Domain.
   321		 */
   322	
 > 323		found_node = numa_find_node(start, end);
   324		if (found_node != NUMA_NO_NODE) {
 > 325			numa_remove_memblks(found_node, start, end);
   326			if (numa_add_memblk(found_node, start, end) < 0) {
   327				/* CXL driver must handle the NUMA_NO_NODE case */
   328				pr_warn("ACPI NUMA: failed to add memblk for CFMWS node %d [mem %#llx-%#llx]\n",
   329					found_node, start, end);
   330			}
   331			return 0;
   332		}
   333	
   334		/*
   335		 * SRAT did not describe this window at all.
   336		 * Create a new node with a fake proximity domain. Add a
   337		 * memblk covering the entire HPA range.
   338		 */
   339		node = acpi_map_pxm_to_node(*fake_pxm);
   340	
   341		if (node == NUMA_NO_NODE) {
   342			pr_err("ACPI NUMA: Too many proximity domains while processing CFMWS.\n");
   343			return -EINVAL;
   344		}
   345		if (numa_add_memblk(node, start, end) < 0) {
   346			/* CXL driver must handle the NUMA_NO_NODE case */
   347			pr_warn("ACPI NUMA: Failed to add memblk for CFMWS node %d [mem %#llx-%#llx]\n",
   348				node, start, end);
   349		}
   350		node_set(node, numa_nodes_parsed);
   351	
   352		/* Set the next available fake_pxm value */
   353		(*fake_pxm)++;
   354		return 0;
   355	}
   356	#else
   357	static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
   358					   void *arg, const unsigned long table_end)
   359	{
   360		return 0;
   361	}
   362	#endif /* defined(CONFIG_X86) || defined (CONFIG_ARM64) */
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
