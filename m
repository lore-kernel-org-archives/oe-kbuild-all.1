Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2221D353A8E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637248; cv=none; b=Gh9rb7wDS1ofnI/1ktrkf8qUQGq0S6qAOWXbXkdZBxpsuvAmB9GKIpwwUq1gelP3GjbEJqQ+TpMWhNHyyknX3gfxjxq3mxIodH8Ly9VUSbzvuPUI043GF7oR6gFHf4J0crxlckOMMu6TwRWAfmkF58AeZDSzJhs64rx5VZ3Yhi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637248; c=relaxed/simple;
	bh=7BKEtIsa0/5RLaMXeUWVfoakETzjQRCLsWljHt7RkGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNPsrZp4IMOEE/6+CaZK9XIEbjpvrQ96XCqQD9S2no1QJt9UcUUVp+Xh1k/8w8esasVVXprsPvKFVv6w2V168Al231jn+iH8EzD4d5/EzWZxETGthvaw4mjhv2Dn5WrygPEq27hxetw0SpSeO6s/VuyA007GjmBirx5jbTKs/tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpQgEYSg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpQgEYSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791637242; x=1823173242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7BKEtIsa0/5RLaMXeUWVfoakETzjQRCLsWljHt7RkGA=;
  b=bpQgEYSg/k+EwB7YJvg+NeVayyUzBs0eS/6L5KiLJua/mH96jgeQ7rFy
   juCd9uuzQ1RVo/U9138mkPSasbi4Y5xhBQqPKOjlP9SvQJUn8PlH80+9n
   wAQ34Q/m5n5npW7xWJJBvr/qpTrSqCwvVTRK2MDqfgJGv4VB9QIuQA5ha
   nDWFHtaWU0P1kaxihRfQ7qmt30JqyTjsfSLQf/nFjyeAC3F8swZEMYE6V
   TodLxF9T1XP0E63N5vc05FE5/A8QssNN3FpLQ/IHwtXRJ7Jq3Z4QVKv9Y
   DkW6ozlZDt5iaNM54jvxfNa65G1b1V3KGlEEGt7CUJJrECCEEFjUFytk4
   w==;
X-CSE-ConnectionGUID: 90If1t/dSzGxV6xTDVAmrQ==
X-CSE-MsgGUID: /7bZqvTDRL+Vtu17Cz10Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="299083"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="299083"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 06:00:37 -0700
X-CSE-ConnectionGUID: 9YwX2uzuT/e8UQCZWbc2Ww==
X-CSE-MsgGUID: wwZHlEO1Sy6rroeZqg72zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="492071"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2026 06:00:37 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFWgk-000000009jv-3CMo;
	Sat, 10 Oct 2026 13:00:34 +0000
Date: Sat, 10 Oct 2026 21:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 8/8] nfs: allow P2PDMA pages for O_DIRECT on RDMA
 mounts
Message-ID: <202610102028.Yv2iFdar-lkp@intel.com>
References: <20261006233248.705086-9-praan@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006233248.705086-9-praan@google.com>

Hi Pranjal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20261006]
[cannot apply to linux-review/Pranjal-Shrivastava/nfs-make-nfs_page-pin-aware/20260814-143251 trondmy-nfs/linux-next v7.3-rc6 v7.3-rc5 v7.3-rc4 linus/master v7.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pranjal-Shrivastava/sunrpc-introduce-XDRBUF_P2PDMA-flag/20261006-233241
base:   next-20261006
patch link:    https://lore.kernel.org/r/20261006233248.705086-9-praan%40google.com
patch subject: [RFC PATCH v1 8/8] nfs: allow P2PDMA pages for O_DIRECT on RDMA mounts
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20261010/202610102028.Yv2iFdar-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610102028.Yv2iFdar-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610102028.Yv2iFdar-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/direct.c: In function 'nfs_direct_extract_pages':
>> fs/nfs/direct.c:171:14: error: implicit declaration of function 'pnfs_enabled_sb' [-Werror=implicit-function-declaration]
     171 |             !pnfs_enabled_sb(server))
         |              ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pnfs_enabled_sb +171 fs/nfs/direct.c

   154	
   155	static ssize_t nfs_direct_extract_pages(struct nfs_direct_req *dreq,
   156						struct iov_iter *iter,
   157						size_t size, loff_t *pos,
   158						struct list_head *list)
   159	{
   160		struct nfs_server *server = NFS_SERVER(dreq->inode);
   161		bool pinned = iov_iter_extract_will_pin(iter);
   162		iov_iter_extraction_t flags = 0;
   163		struct page **pagevec = NULL;
   164		ssize_t result, bytes = 0;
   165		int err = 0;
   166		unsigned int npages, i;
   167		size_t pgbase;
   168	
   169		/* Allow P2PDMA pages only on RDMA mounts that do not use pNFS */
   170		if (server->nfs_client->cl_proto == XPRT_TRANSPORT_RDMA &&
 > 171		    !pnfs_enabled_sb(server))
   172			flags = ITER_ALLOW_P2PDMA;
   173	
   174		result = iov_iter_extract_pages(iter, &pagevec, size, ~0U, flags,
   175						&pgbase);
   176		if (result <= 0)
   177			return result;
   178	
   179		npages = (result + pgbase + PAGE_SIZE - 1) >> PAGE_SHIFT;
   180		for (i = 0; i < npages; i++) {
   181			struct nfs_page *req;
   182			unsigned int req_len = min_t(size_t, result - bytes, PAGE_SIZE - pgbase);
   183	
   184			req = nfs_page_create_from_page(dreq->ctx, pagevec[i],
   185							pinned, pgbase, *pos,
   186							req_len);
   187			if (IS_ERR(req)) {
   188				err = PTR_ERR(req);
   189				break;
   190			}
   191	
   192			list_add_tail(&req->wb_list, list);
   193			pgbase = 0;
   194			bytes += req_len;
   195			*pos += req_len;
   196		}
   197	
   198		if (i < npages) {
   199			iov_iter_revert(iter, result - bytes);
   200			nfs_direct_release_pages(pagevec + i, npages - i, pinned);
   201		}
   202	
   203		kvfree(pagevec);
   204		return bytes ? bytes : err;
   205	}
   206	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
