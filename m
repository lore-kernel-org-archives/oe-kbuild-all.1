Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7358E156F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdAhGR6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698519036; x=1730055036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LNkYyM3FT2RcGlDLrvg6A3UkUfIogyx//DMvj2kzpIM=;
  b=jdAhGR6CiWBenvbfqEOk7CzqQAr3TgpHbmXlgbZkrQiAdnm9w6PJlH5S
   /UHmojHQe+wCK63J8bOcVlLMPM8h9XsySZ3bE17t8RQVVRQzCQoRjAPd/
   RjPj0RJ/Fk4NH+44mI1+MFMCnNqddIFHxuaReWorn5BfqudTrEncmmRE/
   cvE59/YJVLexH3Ul9zZxen1KpxfhNdLTCDEEiaiY8MiwVgNOwB8OqOcoy
   pt+AmtsAHx/Wn8Pd05VQNtRkYUpSWgKXENKF/VeoaEs4D9aUcNnQtVb/D
   oBFEkKOWBqCxkQtjpHs+ekFjX/f+eaEhsckz1Dea3tKz2KNO6hGZ2DZ0R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452161969"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="452161969"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 11:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="830312831"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="830312831"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2023 11:50:34 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwoOG-000C03-1E;
	Sat, 28 Oct 2023 18:50:32 +0000
Date: Sun, 29 Oct 2023 02:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_unify_rfc 2/4] net/core/skbuff.c:301:15:
 error: '__napi_alloc_frag_align' undeclared here (not in a function); did
 you mean 'napi_alloc_frag_align'?
Message-ID: <202310290202.89YaW5CS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_unify_rfc
head:   7675d2f57391bcfccc739671a7b3b2a40acfc595
commit: 1ec6b07022b1485c830aa4c58fd4154ba67306cf [2/4] mm/page_alloc: modify page_frag_alloc_align() to accept align as an argument
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20231029/202310290202.89YaW5CS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290202.89YaW5CS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290202.89YaW5CS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from net/core/skbuff.c:37:
>> net/core/skbuff.c:301:15: error: '__napi_alloc_frag_align' undeclared here (not in a function); did you mean 'napi_alloc_frag_align'?
     301 | EXPORT_SYMBOL(__napi_alloc_frag_align);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:23: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   net/core/skbuff.c:301:1: note: in expansion of macro 'EXPORT_SYMBOL'
     301 | EXPORT_SYMBOL(__napi_alloc_frag_align);
         | ^~~~~~~~~~~~~
>> net/core/skbuff.c:322:15: error: '__netdev_alloc_frag_align' undeclared here (not in a function); did you mean 'netdev_alloc_frag_align'?
     322 | EXPORT_SYMBOL(__netdev_alloc_frag_align);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:23: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   net/core/skbuff.c:322:1: note: in expansion of macro 'EXPORT_SYMBOL'
     322 | EXPORT_SYMBOL(__netdev_alloc_frag_align);
         | ^~~~~~~~~~~~~


vim +301 net/core/skbuff.c

dbae2b062824fc Paolo Abeni       2022-09-28  292  
1ec6b07022b148 Yunsheng Lin      2023-10-28  293  void *napi_alloc_frag_align(unsigned int fragsz, unsigned int align)
50fad4b543b30e Alexander Lobakin 2021-02-13  294  {
50fad4b543b30e Alexander Lobakin 2021-02-13  295  	struct napi_alloc_cache *nc = this_cpu_ptr(&napi_alloc_cache);
50fad4b543b30e Alexander Lobakin 2021-02-13  296  
50fad4b543b30e Alexander Lobakin 2021-02-13  297  	fragsz = SKB_DATA_ALIGN(fragsz);
50fad4b543b30e Alexander Lobakin 2021-02-13  298  
1ec6b07022b148 Yunsheng Lin      2023-10-28  299  	return page_frag_alloc_align(&nc->page, fragsz, GFP_ATOMIC, align);
50fad4b543b30e Alexander Lobakin 2021-02-13  300  }
50fad4b543b30e Alexander Lobakin 2021-02-13 @301  EXPORT_SYMBOL(__napi_alloc_frag_align);
50fad4b543b30e Alexander Lobakin 2021-02-13  302  
1ec6b07022b148 Yunsheng Lin      2023-10-28  303  void *netdev_alloc_frag_align(unsigned int fragsz, unsigned int align)
50fad4b543b30e Alexander Lobakin 2021-02-13  304  {
50fad4b543b30e Alexander Lobakin 2021-02-13  305  	void *data;
50fad4b543b30e Alexander Lobakin 2021-02-13  306  
50fad4b543b30e Alexander Lobakin 2021-02-13  307  	fragsz = SKB_DATA_ALIGN(fragsz);
afa79d08c6c8e1 Changbin Du       2021-08-13  308  	if (in_hardirq() || irqs_disabled()) {
32e3573f739209 Yajun Deng        2021-09-14  309  		struct page_frag_cache *nc = this_cpu_ptr(&netdev_alloc_cache);
32e3573f739209 Yajun Deng        2021-09-14  310  
1ec6b07022b148 Yunsheng Lin      2023-10-28  311  		data = page_frag_alloc_align(nc, fragsz, GFP_ATOMIC, align);
50fad4b543b30e Alexander Lobakin 2021-02-13  312  	} else {
32e3573f739209 Yajun Deng        2021-09-14  313  		struct napi_alloc_cache *nc;
32e3573f739209 Yajun Deng        2021-09-14  314  
50fad4b543b30e Alexander Lobakin 2021-02-13  315  		local_bh_disable();
32e3573f739209 Yajun Deng        2021-09-14  316  		nc = this_cpu_ptr(&napi_alloc_cache);
1ec6b07022b148 Yunsheng Lin      2023-10-28  317  		data = page_frag_alloc_align(&nc->page, fragsz, GFP_ATOMIC, align);
50fad4b543b30e Alexander Lobakin 2021-02-13  318  		local_bh_enable();
50fad4b543b30e Alexander Lobakin 2021-02-13  319  	}
50fad4b543b30e Alexander Lobakin 2021-02-13  320  	return data;
50fad4b543b30e Alexander Lobakin 2021-02-13  321  }
50fad4b543b30e Alexander Lobakin 2021-02-13 @322  EXPORT_SYMBOL(__netdev_alloc_frag_align);
50fad4b543b30e Alexander Lobakin 2021-02-13  323  

:::::: The code at line 301 was first introduced by commit
:::::: 50fad4b543b30e9323da485d4090c3a94b2b6271 skbuff: move NAPI cache declarations upper in the file

:::::: TO: Alexander Lobakin <alobakin@pm.me>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
