Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A9C6D39
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711005042; cv=none; b=EzDSS0A8ivExLa+EjySlulNxMji2Co5tcnsVTNPvhoOHWzbDTG/WP0rdKgSehVWcAMvzwDC31JTTBsJUu6ZiQRCfbwkSk0gKFIhSB/5AztBSoFTvJAEwCtKoAtUPud7meyCJFxTTHRPFd22Xvsd+B1OJ48ep603cGBHEQo7QG5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711005042; c=relaxed/simple;
	bh=J71vCATkTf52tt0b9eALxb5PyBJ5IKzAyksICvQuoj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5nU2SSDsu1q3OrBHCCY87qtU0pfsNXJ74FhTPcPTFZ+CAsOPInKKDL+dWc5Hm8fE/UqD16h3acjEkSCq7zhs6OgYE0QsNLBXX09wIKQpe8YyrRTLWtdXf/RM2oiLPGywU8NKQhItg52S+SbR7owDHbZar5S1bfrcK8aANRby8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itSb0+Cc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itSb0+Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711005040; x=1742541040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J71vCATkTf52tt0b9eALxb5PyBJ5IKzAyksICvQuoj4=;
  b=itSb0+CccnRmOjGNajmfi0mhmsbLlCVGObMmG1QcXgfzOOYhKEiua4Fs
   CTMHmp22/3dHc5HPEdKrzZ18oRzSMq3eF34wzVCjDlu3MaHiuI9KqjQtx
   yWUSu9Ew9WbUOxZNdr7KBptVsvGgh8BNkVC8QrxTktgqX0I3RCT8brIH4
   K8aIHA6Ua+yBM6LIfvXpUlmy+BzVOIXtPXpoEBexqY2hhJD0NyhnMN961
   LliUi8/ziIvVtyeKYzOGgp7ZUSNnOI/WdACGSGdKCAdtlWwGLKoPGGlBS
   dqFSyObXgrY5/AHuVe2Ju7DhHGfu4W62FAPI9ljRLHWHqHFEbz2l5HStJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6583516"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="6583516"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 00:10:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="51844403"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Mar 2024 00:10:38 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnCZP-000JEd-1v;
	Thu, 21 Mar 2024 07:10:35 +0000
Date: Thu, 21 Mar 2024 15:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 8/21] fs/fuse/file.c:2050:12: warning:
 'fuse_writepage_locked' defined but not used
Message-ID: <202403211454.VerZc1o2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   866387129eff9ec1e77d0a32544f08884c96b072
commit: 6fb9391d86852e9b8983d6ecaa8272d0e3a7dc1c [8/21] mm: Kill ->launder_folio()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240321/202403211454.VerZc1o2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403211454.VerZc1o2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403211454.VerZc1o2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/file.c:2050:12: warning: 'fuse_writepage_locked' defined but not used [-Wunused-function]
    2050 | static int fuse_writepage_locked(struct folio *folio)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/fuse_writepage_locked +2050 fs/fuse/file.c

660585b56e63ca Miklos Szeredi          2021-09-01  2049  
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28 @2050) static int fuse_writepage_locked(struct folio *folio)
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2051  {
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2052) 	struct address_space *mapping = folio->mapping;
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2053  	struct inode *inode = mapping->host;
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2054  	struct fuse_conn *fc = get_fuse_conn(inode);
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2055  	struct fuse_inode *fi = get_fuse_inode(inode);
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2056  	struct fuse_writepage_args *wpa;
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2057  	struct fuse_args_pages *ap;
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2058) 	struct folio *tmp_folio;
72523425fb434e Miklos Szeredi          2013-10-01  2059  	int error = -ENOMEM;
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2060  
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2061) 	folio_start_writeback(folio);
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2062  
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2063  	wpa = fuse_writepage_args_alloc();
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2064  	if (!wpa)
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2065  		goto err;
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2066  	ap = &wpa->ia.ap;
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2067  
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2068) 	tmp_folio = folio_alloc(GFP_NOFS | __GFP_HIGHMEM, 0);
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2069) 	if (!tmp_folio)
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2070  		goto err_free;
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2071  
72523425fb434e Miklos Szeredi          2013-10-01  2072  	error = -EIO;
a9667ac88e2b20 Miklos Szeredi          2021-09-01  2073  	wpa->ia.ff = fuse_write_file_get(fi);
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2074  	if (!wpa->ia.ff)
27f1b36326bc8b Maxim Patlasov          2014-07-10  2075  		goto err_nofile;
72523425fb434e Miklos Szeredi          2013-10-01  2076  
660585b56e63ca Miklos Szeredi          2021-09-01  2077  	fuse_writepage_add_to_bucket(fc, wpa);
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2078) 	fuse_write_args_fill(&wpa->ia, wpa->ia.ff, folio_pos(folio), 0);
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2079  
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2080) 	folio_copy(tmp_folio, folio);
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2081  	wpa->ia.write.in.write_flags |= FUSE_WRITE_CACHE;
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2082  	wpa->next = NULL;
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2083  	ap->args.in_pages = true;
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2084  	ap->num_pages = 1;
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2085) 	ap->pages[0] = &tmp_folio->page;
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2086  	ap->descs[0].offset = 0;
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2087  	ap->descs[0].length = PAGE_SIZE;
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2088  	ap->args.end = fuse_writepage_end;
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2089  	wpa->inode = inode;
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2090  
93f78d882865cb Tejun Heo               2015-05-22  2091  	inc_wb_stat(&inode_to_bdi(inode)->wb, WB_WRITEBACK);
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2092) 	node_stat_add_folio(tmp_folio, NR_WRITEBACK_TEMP);
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2093  
f15ecfef058d94 Kirill Tkhai            2018-11-09  2094  	spin_lock(&fi->lock);
6b2fb79963fbed Maxim Patlasov          2019-09-19  2095  	tree_insert(&fi->writepages, wpa);
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2096  	list_add_tail(&wpa->queue_entry, &fi->queued_writes);
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2097  	fuse_flush_writepages(inode);
f15ecfef058d94 Kirill Tkhai            2018-11-09  2098  	spin_unlock(&fi->lock);
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2099  
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2100) 	folio_end_writeback(folio);
4a4ac4eba1010e Maxim Patlasov          2013-08-12  2101  
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2102  	return 0;
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2103  
27f1b36326bc8b Maxim Patlasov          2014-07-10  2104  err_nofile:
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2105) 	folio_put(tmp_folio);
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2106  err_free:
33826ebbbe4b45 Miklos Szeredi          2019-09-10  2107  	kfree(wpa);
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2108  err:
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2109) 	mapping_set_error(folio->mapping, error);
e0887e095a803d Matthew Wilcox (Oracle  2024-02-28  2110) 	folio_end_writeback(folio);
72523425fb434e Miklos Szeredi          2013-10-01  2111  	return error;
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2112  }
3be5a52b30aa5c Miklos Szeredi          2008-04-30  2113  

:::::: The code at line 2050 was first introduced by commit
:::::: e0887e095a803d238bd3e2b280baa4c5e70c650c fuse: Convert fuse_writepage_locked to take a folio

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
