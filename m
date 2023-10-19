Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E792B29CF4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 15:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxcvGmr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697729596; x=1729265596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Z40rGQaojX6+GkIeTG0oClzzBjXurZIcm+e6oHdqJQ=;
  b=jxcvGmr5QG3DUaW8oNlN7uVbhzl60o73hjYkAqVIPtJjOQdIHW0vt8xU
   GjcFGiQOVgmg67IZ1Xgo4/WNK1y7/vrlcKDKDK8oftakgzvRVmpPoFjpV
   SXGmLEEUOd1cIbkp+gz+kI2TcbJe8XsaxCgyPMKI20KzbRpB+JaNBPNFv
   yYY/L8idPbXX1WASCqKnDC7mFZowyIkZovQZ3dWnB+lZIsMSxau3QnAAV
   b4LuYAf7ArA05QepgogH9QT4Dm2pm5lVPemKEaLZbri6IDSJtPK2QgaHJ
   627W/RtUI6KKPMtrvQgs8fU6YXEY3x5tjGnqBWv39fw4wcdB6XNJV1ZN1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386107892"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="386107892"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 08:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="930645181"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930645181"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 08:33:14 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtV1L-0002DC-30;
	Thu, 19 Oct 2023 15:33:11 +0000
Date: Thu, 19 Oct 2023 23:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bob Pearson <rpearsonhpe@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: drivers/infiniband/sw/rxe/rxe_mr.c:106:9: warning: array subscript 0
 is outside array bounds of 'struct sg_table[0]'
Message-ID: <202310192300.lurP44yG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd72f9c7e512da377074d47d990564959b772643
commit: 592627ccbdff0ec6fff00fc761142a76db750dd4 RDMA/rxe: Replace rxe_map and rxe_phys_buf by xarray
date:   9 months ago
config: sparc-randconfig-c023-20211015 (https://download.01.org/0day-ci/archive/20231019/202310192300.lurP44yG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310192300.lurP44yG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310192300.lurP44yG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_mr_fill_pages_from_sgt.constprop':
>> drivers/infiniband/sw/rxe/rxe_mr.c:106:9: warning: array subscript 0 is outside array bounds of 'struct sg_table[0]' [-Warray-bounds=]
     106 |         __sg_page_iter_start(&sg_iter, sgt->sgl, sgt->orig_nents, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: note: source object is likely at address zero
>> drivers/infiniband/sw/rxe/rxe_mr.c:106:9: warning: array subscript 0 is outside array bounds of 'struct sg_table[0]' [-Warray-bounds=]
   cc1: note: source object is likely at address zero


vim +106 drivers/infiniband/sw/rxe/rxe_mr.c

    98	
    99	static int rxe_mr_fill_pages_from_sgt(struct rxe_mr *mr, struct sg_table *sgt)
   100	{
   101		XA_STATE(xas, &mr->page_list, 0);
   102		struct sg_page_iter sg_iter;
   103		struct page *page;
   104		bool persistent = !!(mr->access & IB_ACCESS_FLUSH_PERSISTENT);
   105	
 > 106		__sg_page_iter_start(&sg_iter, sgt->sgl, sgt->orig_nents, 0);
   107		if (!__sg_page_iter_next(&sg_iter))
   108			return 0;
   109	
   110		do {
   111			xas_lock(&xas);
   112			while (true) {
   113				page = sg_page_iter_page(&sg_iter);
   114	
   115				if (persistent && !is_pmem_page(page)) {
   116					rxe_dbg_mr(mr, "Page can't be persistent\n");
   117					xas_set_err(&xas, -EINVAL);
   118					break;
   119				}
   120	
   121				xas_store(&xas, page);
   122				if (xas_error(&xas))
   123					break;
   124				xas_next(&xas);
   125				if (!__sg_page_iter_next(&sg_iter))
   126					break;
   127			}
   128			xas_unlock(&xas);
   129		} while (xas_nomem(&xas, GFP_KERNEL));
   130	
   131		return xas_error(&xas);
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
