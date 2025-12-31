Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1093041754
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 01:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767143122; cv=none; b=GqZnHd06DrdC7vai/6w8WmQ5nx8WVOkKIBWYwYdYAzxfScwvOJJsVD2dHalZPjYTGuWe6Zhqiwy8vyMFvHB4xmWailQyuCfMN0pL9Bi8qga1YkIbCLAf7cNE69RgSYgGUkKc818bc5InMaJFqZer6hcVZG5IK+ckCgIAl8l3S2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767143122; c=relaxed/simple;
	bh=Zmj0dWnvB8weYw1nxWfMWqtv35X2R1cRxItE9B0NFBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IriPIgtFwlgp60Wks9cfKhD5LcQ1cl1dZZqSj1ct9EVqRfyRQeNzhBQ11TlON7IwgI5KtOBZUDKNze1tIKSz/VnvgDc+0Olmcjw3o6B7gvXOoZON0VudUR97B3oiAJt/7rBaAIAYkvJvBrDFPA/2KOa7ZJyQIPPi9kao/jMrJyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+nQA4fw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+nQA4fw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767143120; x=1798679120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zmj0dWnvB8weYw1nxWfMWqtv35X2R1cRxItE9B0NFBU=;
  b=G+nQA4fwd2qokLkeKtCiyvuwudQP8JIcxE6e8+CzOzqMcjQiqS5401Mr
   AdUj6JMmYOCNYO3BTzUQTM6iKyDfbvzswfvdMbeTQhmVdIpfP+LP4jqqJ
   dvqJbHLqiBJch3jhlGGLEcqqhho+0BQ8Lf5Wu17VBE4UYDyzyNPdtdM8t
   W39ARjHqn+GsXKX+PgP41wFNhK7a2YFROWMhQrwh2U/t4dktYjs++z4e+
   xxQbTzAL+Sukjqz2X+ayzw3G614k+rEgTV1FlMJgzP+LfR32BIbjCs3vH
   nnmDgDyg3TvdmVBcGclLQFOn48TAwsMdIXs5UxIEGkEr/KsQeRMNwkdK2
   A==;
X-CSE-ConnectionGUID: RT/jCjpKQPKWGGkMY0+qew==
X-CSE-MsgGUID: KiesuBKWROGWQ9+3T99o1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68617406"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="68617406"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 17:05:20 -0800
X-CSE-ConnectionGUID: KICrueJ8SbCxDXudxJtzhg==
X-CSE-MsgGUID: 8SAHhc09Sq69JB3gQ3mc5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="201078206"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 30 Dec 2025 17:05:19 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vakeK-0000000083M-19Qr;
	Wed, 31 Dec 2025 01:05:16 +0000
Date: Wed, 31 Dec 2025 02:04:24 +0100
From: kernel test robot <lkp@intel.com>
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [RFC] NFSv4.1: slot table draining + memory reclaim can
 deadlock state manager creation
Message-ID: <202512310232.nVSXAtcB-lkp@intel.com>
References: <20251230071744.9762-1-wangzhaolong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230071744.9762-1-wangzhaolong@huaweicloud.com>

Hi Wang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wang-Zhaolong/NFSv4-1-slot-table-draining-memory-reclaim-can-deadlock-state-manager-creation/20251230-151913
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20251230071744.9762-1-wangzhaolong%40huaweicloud.com
patch subject: [PATCH] [RFC] NFSv4.1: slot table draining + memory reclaim can deadlock state manager creation
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20251231/202512310232.nVSXAtcB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512310232.nVSXAtcB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512310232.nVSXAtcB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/nfs/read.c: In function 'nfs_read_folio':
>> fs/nfs/read.c:385:15: error: too few arguments to function 'nfs_wb_folio'
     385 |         ret = nfs_wb_folio(inode, folio);
         |               ^~~~~~~~~~~~
   In file included from fs/nfs/read.c:21:
   include/linux/nfs_fs.h:639:12: note: declared here
     639 | extern int nfs_wb_folio(struct inode *inode, struct folio *folio, bool sync);
         |            ^~~~~~~~~~~~
--
>> Warning: fs/nfs/write.c:2035 function parameter 'sync' not described in 'nfs_wb_folio'


vim +/nfs_wb_folio +385 fs/nfs/read.c

a308996ed7c02d Christoph Hellwig       2024-07-11  360  
a308996ed7c02d Christoph Hellwig       2024-07-11  361  /*
a308996ed7c02d Christoph Hellwig       2024-07-11  362   * Synchronously read a folio.
a308996ed7c02d Christoph Hellwig       2024-07-11  363   *
a308996ed7c02d Christoph Hellwig       2024-07-11  364   * This is not heavily used as most users to try an asynchronous
a308996ed7c02d Christoph Hellwig       2024-07-11  365   * large read through ->readahead first.
^1da177e4c3f41 Linus Torvalds          2005-04-16  366   */
65d023af7f29eb Matthew Wilcox (Oracle  2022-04-29  367) int nfs_read_folio(struct file *file, struct folio *folio)
^1da177e4c3f41 Linus Torvalds          2005-04-16  368  {
ab75bff1140733 Trond Myklebust         2023-01-19  369  	struct inode *inode = file_inode(file);
fada32ed6dbc74 Christoph Hellwig       2024-07-11  370  	loff_t pos = folio_pos(folio);
fada32ed6dbc74 Christoph Hellwig       2024-07-11  371  	size_t len = folio_size(folio);
49dee70052b894 Dave Wysochanski        2021-01-28  372  	int ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  373  
fada32ed6dbc74 Christoph Hellwig       2024-07-11  374  	trace_nfs_aop_readpage(inode, pos, len);
91d5b47023b608 Chuck Lever             2006-03-20  375  	nfs_inc_stats(inode, NFSIOS_VFSREADPAGE);
fada32ed6dbc74 Christoph Hellwig       2024-07-11  376  	task_io_account_read(len);
91d5b47023b608 Chuck Lever             2006-03-20  377  
^1da177e4c3f41 Linus Torvalds          2005-04-16  378  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  379  	 * Try to flush any pending writes to the file..
^1da177e4c3f41 Linus Torvalds          2005-04-16  380  	 *
ab75bff1140733 Trond Myklebust         2023-01-19  381  	 * NOTE! Because we own the folio lock, there cannot
^1da177e4c3f41 Linus Torvalds          2005-04-16  382  	 * be any new pending writes generated at this point
ab75bff1140733 Trond Myklebust         2023-01-19  383  	 * for this folio (other folios can be written to).
^1da177e4c3f41 Linus Torvalds          2005-04-16  384  	 */
ab75bff1140733 Trond Myklebust         2023-01-19 @385  	ret = nfs_wb_folio(inode, folio);
49dee70052b894 Dave Wysochanski        2021-01-28  386  	if (ret)
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  387  		goto out_unlock;
ab75bff1140733 Trond Myklebust         2023-01-19  388  	if (folio_test_uptodate(folio))
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  389  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds          2005-04-16  390  
49dee70052b894 Dave Wysochanski        2021-01-28  391  	ret = -ESTALE;
5f004cf2aa8494 Trond Myklebust         2006-09-14  392  	if (NFS_STALE(inode))
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  393  		goto out_unlock;
5f004cf2aa8494 Trond Myklebust         2006-09-14  394  
000dbe0bec058c Dave Wysochanski        2023-02-20  395  	ret = nfs_netfs_read_folio(file, folio);
e0340f16a08d03 Dave Wysochanski        2021-06-29  396  	if (ret)
a308996ed7c02d Christoph Hellwig       2024-07-11  397  		ret = nfs_do_read_folio(file, folio);
000dbe0bec058c Dave Wysochanski        2023-02-20  398  out:
fada32ed6dbc74 Christoph Hellwig       2024-07-11  399  	trace_nfs_aop_readpage_done(inode, pos, len, ret);
49dee70052b894 Dave Wysochanski        2021-01-28  400  	return ret;
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  401  out_unlock:
ab75bff1140733 Trond Myklebust         2023-01-19  402  	folio_unlock(folio);
000dbe0bec058c Dave Wysochanski        2023-02-20  403  	goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  404  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  405  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
