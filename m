Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96854337688
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 05:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775798952; cv=none; b=m7G+NWIn9E10jkakra1wPmno2t9KtFH+1IgglLcZL/w88HtkLMuH5qMbd3Yf39i0k6GGdx3FRB7yxgPzlk5wHvkfbtnxtNO6SnIn7GeSvpTdCfwZgZa25P+xr0yLxbvxxotPeRBKiIDYm/xmbcKe1wFt1R0C+Th1RQBb2MRV/ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775798952; c=relaxed/simple;
	bh=TJuL6fnKndOq/B2Po1dJCLMG2PxGh8VzGl4t/B/vjgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kA7XhuKEDDvN2DGy3EAJ2/cCzfh8nZl+1mvAl/XzQdWMI28yzoL0Uyf1A4zh/2WFQFNo7ZFDdZ8bqITfiNygl8KY/SRZMw3KEieg754w0iYy/1B2Tnpac7yNS2vRzPqlV3sWvN4qZN4iM571IcV7GugnI8oB7o4zNmc1+YnZwa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYdb81a3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYdb81a3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775798951; x=1807334951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TJuL6fnKndOq/B2Po1dJCLMG2PxGh8VzGl4t/B/vjgU=;
  b=lYdb81a3j5DXu4tEnbQHbF3Xlve9xd/hgx9AN4QTMHhM6uzAavUJz4No
   BD1HvAJAISUL4iWZBybzuTyVvjdxuF4fOlte844arfMOi8PP8bCt7nG/s
   hYO3PPnP1oYTUIc/TBWdVcQE9dOXsNe72tGW5yWV+VNDn5ut49GjVnpF3
   8aN9gpep5n6vHyN93WPzOkaxY2Qa1u9aynRyy6KuJXQ9duwqZ+eXqbYj2
   Y3ntX5bZJWK70yoiZpSAjGwzwbouRh4o+V6gXyNtsOBFNz7HgAri8wQT8
   zO7zb91ndMIUSGPuaR4JeXi5sX4eKiVTlVQ+9PxVj/E+fTxnMalLXmO/d
   w==;
X-CSE-ConnectionGUID: Q9ae+U0yS3u47HsiKQEaUg==
X-CSE-MsgGUID: +Mc2WZRsRSmH7J0o1C+Sfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76833434"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76833434"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 22:29:07 -0700
X-CSE-ConnectionGUID: H61ElRjaSUa3uHxkwwRDXg==
X-CSE-MsgGUID: 0qHPoffYRt2EydB3lDJd5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="266960652"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Apr 2026 22:29:05 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB4QQ-000000003HP-2Tkw;
	Fri, 10 Apr 2026 05:29:02 +0000
Date: Fri, 10 Apr 2026 13:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Roberts <ben.roberts@gsacapital.com>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ben Roberts <ben.roberts@gsacapital.com>
Subject: Re: [PATCH] pNFS: deadlock in pnfs_send_layoutreturn
Message-ID: <202604101309.6eRanxOC-lkp@intel.com>
References: <20260407152035.4034628-1-ben.roberts@gsacapital.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407152035.4034628-1-ben.roberts@gsacapital.com>

Hi Ben,

kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v7.0-rc7 next-20260407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ben-Roberts/pNFS-deadlock-in-pnfs_send_layoutreturn/20260408-135718
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20260407152035.4034628-1-ben.roberts%40gsacapital.com
patch subject: [PATCH] pNFS: deadlock in pnfs_send_layoutreturn
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20260410/202604101309.6eRanxOC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101309.6eRanxOC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101309.6eRanxOC-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/pnfs.c: In function 'pnfs_send_layoutreturn':
>> fs/nfs/pnfs.c:1364:49: error: expected ';' before 'pnfs_clear_layoutreturn_waitbit'
    1364 |                 pnfs_clear_layoutreturn_info(lo)
         |                                                 ^
         |                                                 ;
    1365 |                 pnfs_clear_layoutreturn_waitbit(lo);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  


vim +1364 fs/nfs/pnfs.c

  1345	
  1346	static int
  1347	pnfs_send_layoutreturn(struct pnfs_layout_hdr *lo,
  1348			       const nfs4_stateid *stateid,
  1349			       const struct cred **pcred,
  1350			       enum pnfs_iomode iomode,
  1351			       unsigned int flags)
  1352	{
  1353		struct inode *ino = lo->plh_inode;
  1354		struct pnfs_layoutdriver_type *ld = NFS_SERVER(ino)->pnfs_curr_ld;
  1355		struct nfs4_layoutreturn *lrp;
  1356		const struct cred *cred = *pcred;
  1357		int status = 0;
  1358	
  1359		*pcred = NULL;
  1360		lrp = kzalloc_obj(*lrp, nfs_io_gfp_mask());
  1361		if (unlikely(lrp == NULL)) {
  1362			status = -ENOMEM;
  1363			spin_lock(&ino->i_lock);
> 1364			pnfs_clear_layoutreturn_info(lo)
  1365			pnfs_clear_layoutreturn_waitbit(lo);
  1366			spin_unlock(&ino->i_lock);
  1367			put_cred(cred);
  1368			pnfs_put_layout_hdr(lo);
  1369			goto out;
  1370		}
  1371	
  1372		pnfs_init_layoutreturn_args(&lrp->args, lo, stateid, iomode);
  1373		lrp->args.ld_private = &lrp->ld_private;
  1374		lrp->clp = NFS_SERVER(ino)->nfs_client;
  1375		lrp->cred = cred;
  1376		if (ld->prepare_layoutreturn)
  1377			ld->prepare_layoutreturn(&lrp->args);
  1378	
  1379		status = nfs4_proc_layoutreturn(lrp, flags);
  1380	out:
  1381		dprintk("<-- %s status: %d\n", __func__, status);
  1382		return status;
  1383	}
  1384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
