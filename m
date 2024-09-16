Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D04154C19
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726483240; cv=none; b=IrzLHX9/Otrkm803mVp9KigBEqw87O2l00HBQdu7Jypg4a8B8RLr95XH8hvFmf3xCtlfP5zuW7Rmfy3a9tqQ3+1Ah+J6EZNI/tNJudCEEFQaGCVwDqvLTH6gf9YK5SCHpp6BWcglzR/i0IxHchn4Ud54yVs/d1g9EDlJ+tSDwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726483240; c=relaxed/simple;
	bh=J/csFertJID4+YSZueovs9De3DKqgTGFW3ijwFCfec4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gigrM/tEAhZUTCrgVSuL4HJAKz3Tp2MvEB0uixSMUus6zkBoaK2GCR6fK2Wzf1IJ0il+AJRfh5R/57O/TzDNDJeVB31PFDry6wT/x6KhhtXgYHsdlPLnYS94/kMG16nOzb5FKqq+yHiPbqlfPJIEK5V6pyBjiWawOkEH6ya8Sv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FcvrKYoG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FcvrKYoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726483238; x=1758019238;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=J/csFertJID4+YSZueovs9De3DKqgTGFW3ijwFCfec4=;
  b=FcvrKYoGKrrn1pJOpABnaVtOX7YnGSzVYkDA6s3h8gQlfQrlH3CA7gzO
   CCK6Tlf+Xd+tCiYbe5u5UUPY4lu0TYuPyeJqZAAH1g4bpnip2oOvRjOmP
   9YSQEQ4cG2NBq4f4c/lWHRI/tJb2C2Zpb+cISgezCWEJZdB4lvnFEMGfa
   HFjxekm+c451sGn9pOFqKiBLCUe1gWzxz6D5Zc+QR0Sxso5/2E5GFQakI
   +s0dUy6iD/TObQlrJfP5uev6tzikeUsiGq/7VtI7/KiER++uhE9kMLsQG
   rmn0uEzKP0UMmGNqLKxvqFMfwDFAxNtO4HnRBAdu4PB1Bb0ZIufJkY8NS
   g==;
X-CSE-ConnectionGUID: CJETt+AQSgWx2pVV0QA/Dg==
X-CSE-MsgGUID: ZDHE765xQGuvPtTrwVKfQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="35979805"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="35979805"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 03:40:38 -0700
X-CSE-ConnectionGUID: D4bZVAzVQgSAqoeoJ3wFyw==
X-CSE-MsgGUID: rU5IyjqeRnygZaLBnpCyog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="99516587"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Sep 2024 03:40:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq99l-0009ew-0d;
	Mon, 16 Sep 2024 10:40:33 +0000
Date: Mon, 16 Sep 2024 18:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	"Matuesz, Polrola" <mateuszx.potrola@intel.com>
Subject: [intel-lts:4.19/android_s 1260/30000]
 drivers/dma-buf/hyper_dmabuf/xen/hyper_dmabuf_xen_shm.c:76:5: warning: no
 previous prototype for 'xen_be_share_pages'
Message-ID: <202409161802.ctClL0Fc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Dongwon,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: 22195721948ec03aa60db467a3ae26f76f2a04b4 [1260/30000] REVERTME [IOTG]: hyper_dmabuf: Introducing the hyper_dmabuf driver
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240916/202409161802.ctClL0Fc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161802.ctClL0Fc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161802.ctClL0Fc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/hyper_dmabuf/xen/hyper_dmabuf_xen_shm.c:76:5: warning: no previous prototype for 'xen_be_share_pages' [-Wmissing-prototypes]
      76 | int xen_be_share_pages(struct page **pages, int domid, int nents,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/dma-buf/hyper_dmabuf/xen/hyper_dmabuf_xen_shm.c:192:5: warning: no previous prototype for 'xen_be_unshare_pages' [-Wmissing-prototypes]
     192 | int xen_be_unshare_pages(void **refs_info, int nents)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/dma-buf/hyper_dmabuf/xen/hyper_dmabuf_xen_shm.c:255:15: warning: no previous prototype for 'xen_be_map_shared_pages' [-Wmissing-prototypes]
     255 | struct page **xen_be_map_shared_pages(unsigned long lvl3_gref, int domid,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dma-buf/hyper_dmabuf/xen/hyper_dmabuf_xen_shm.c:493:5: warning: no previous prototype for 'xen_be_unmap_shared_pages' [-Wmissing-prototypes]
     493 | int xen_be_unmap_shared_pages(void **refs_info, int nents)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~

New smatch warnings:
drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_drv.c:365 hyper_dmabuf_drv_init() warn: inconsistent returns '&hy_drv_priv->lock'.
drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ioctl.c:76 hyper_dmabuf_rx_ch_setup_ioctl() warn: if statement not indented
drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_remote_sync.c:253 hyper_dmabuf_remote_sync() warn: passing zero to 'PTR_ERR'
drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_remote_sync.c:304 hyper_dmabuf_remote_sync() warn: can 'va_vmapl' even be NULL?
drivers/dma-buf/hyper_dmabuf/xen/hyper_dmabuf_xen_comm.c:555 xen_be_init_rx_rbuf() error: double free of 'map_ops'

Old smatch warnings:
drivers/dma-buf/hyper_dmabuf/hyper_dmabuf_ioctl.c:582 delayed_unexport() warn: can 'exported' even be NULL?

vim +/xen_be_share_pages +76 drivers/dma-buf/hyper_dmabuf/xen/hyper_dmabuf_xen_shm.c

    36	
    37	/*
    38	 * Creates 2 level page directory structure for referencing shared pages.
    39	 * Top level page is a single page that contains up to 1024 refids that
    40	 * point to 2nd level pages.
    41	 *
    42	 * Each 2nd level page contains up to 1024 refids that point to shared
    43	 * data pages.
    44	 *
    45	 * There will always be one top level page and number of 2nd level pages
    46	 * depends on number of shared data pages.
    47	 *
    48	 *      3rd level page                2nd level pages            Data pages
    49	 * +-------------------------+   ┌>+--------------------+ ┌>+------------+
    50	 * |2nd level page 0 refid   |---┘ |Data page 0 refid   |-┘ |Data page 0 |
    51	 * |2nd level page 1 refid   |---┐ |Data page 1 refid   |-┐ +------------+
    52	 * |           ...           |   | |     ....           | |
    53	 * |2nd level page 1023 refid|-┐ | |Data page 1023 refid| └>+------------+
    54	 * +-------------------------+ | | +--------------------+   |Data page 1 |
    55	 *                             | |                          +------------+
    56	 *                             | └>+--------------------+
    57	 *                             |   |Data page 1024 refid|
    58	 *                             |   |Data page 1025 refid|
    59	 *                             |   |       ...          |
    60	 *                             |   |Data page 2047 refid|
    61	 *                             |   +--------------------+
    62	 *                             |
    63	 *                             |        .....
    64	 *                             └-->+-----------------------+
    65	 *                                 |Data page 1047552 refid|
    66	 *                                 |Data page 1047553 refid|
    67	 *                                 |       ...             |
    68	 *                                 |Data page 1048575 refid|
    69	 *                                 +-----------------------+
    70	 *
    71	 * Using such 2 level structure it is possible to reference up to 4GB of
    72	 * shared data using single refid pointing to top level page.
    73	 *
    74	 * Returns refid of top level page.
    75	 */
  > 76	int xen_be_share_pages(struct page **pages, int domid, int nents,
    77			       void **refs_info)
    78	{
    79		grant_ref_t lvl3_gref;
    80		grant_ref_t *lvl2_table;
    81		grant_ref_t *lvl3_table;
    82	
    83		/*
    84		 * Calculate number of pages needed for 2nd level addresing:
    85		 */
    86		int n_lvl2_grefs = (nents/REFS_PER_PAGE +
    87				   ((nents % REFS_PER_PAGE) ? 1 : 0));
    88	
    89		struct xen_shared_pages_info *sh_pages_info;
    90		int i;
    91	
    92		lvl3_table = (grant_ref_t *)__get_free_pages(GFP_KERNEL, 1);
    93		lvl2_table = (grant_ref_t *)__get_free_pages(GFP_KERNEL, n_lvl2_grefs);
    94	
    95		sh_pages_info = kmalloc(sizeof(*sh_pages_info), GFP_KERNEL);
    96	
    97		if (!sh_pages_info)
    98			return -ENOMEM;
    99	
   100		*refs_info = (void *)sh_pages_info;
   101	
   102		/* share data pages in readonly mode for security */
   103		for (i = 0; i < nents; i++) {
   104			lvl2_table[i] = gnttab_grant_foreign_access(domid,
   105						pfn_to_mfn(page_to_pfn(pages[i])),
   106						true /* read only */);
   107			if (lvl2_table[i] == -ENOSPC) {
   108				dev_err(hy_drv_priv->dev,
   109					"No more space left in grant table\n");
   110	
   111				/* Unshare all already shared pages for lvl2 */
   112				while (i--) {
   113					gnttab_end_foreign_access_ref(lvl2_table[i], 0);
   114					gnttab_free_grant_reference(lvl2_table[i]);
   115				}
   116				goto err_cleanup;
   117			}
   118		}
   119	
   120		/* Share 2nd level addressing pages in readonly mode*/
   121		for (i = 0; i < n_lvl2_grefs; i++) {
   122			lvl3_table[i] = gnttab_grant_foreign_access(domid,
   123						virt_to_mfn(
   124						(unsigned long)lvl2_table+i*PAGE_SIZE),
   125						true);
   126	
   127			if (lvl3_table[i] == -ENOSPC) {
   128				dev_err(hy_drv_priv->dev,
   129					"No more space left in grant table\n");
   130	
   131				/* Unshare all already shared pages for lvl3 */
   132				while (i--) {
   133					gnttab_end_foreign_access_ref(lvl3_table[i], 1);
   134					gnttab_free_grant_reference(lvl3_table[i]);
   135				}
   136	
   137				/* Unshare all pages for lvl2 */
   138				while (nents--) {
   139					gnttab_end_foreign_access_ref(
   140								lvl2_table[nents], 0);
   141					gnttab_free_grant_reference(lvl2_table[nents]);
   142				}
   143	
   144				goto err_cleanup;
   145			}
   146		}
   147	
   148		/* Share lvl3_table in readonly mode*/
   149		lvl3_gref = gnttab_grant_foreign_access(domid,
   150				virt_to_mfn((unsigned long)lvl3_table),
   151				true);
   152	
   153		if (lvl3_gref == -ENOSPC) {
   154			dev_err(hy_drv_priv->dev,
   155				"No more space left in grant table\n");
   156	
   157			/* Unshare all pages for lvl3 */
   158			while (i--) {
   159				gnttab_end_foreign_access_ref(lvl3_table[i], 1);
   160				gnttab_free_grant_reference(lvl3_table[i]);
   161			}
   162	
   163			/* Unshare all pages for lvl2 */
   164			while (nents--) {
   165				gnttab_end_foreign_access_ref(lvl2_table[nents], 0);
   166				gnttab_free_grant_reference(lvl2_table[nents]);
   167			}
   168	
   169			goto err_cleanup;
   170		}
   171	
   172		/* Store lvl3_table page to be freed later */
   173		sh_pages_info->lvl3_table = lvl3_table;
   174	
   175		/* Store lvl2_table pages to be freed later */
   176		sh_pages_info->lvl2_table = lvl2_table;
   177	
   178	
   179		/* Store exported pages refid to be unshared later */
   180		sh_pages_info->lvl3_gref = lvl3_gref;
   181	
   182		dev_dbg(hy_drv_priv->dev, "%s exit\n", __func__);
   183		return lvl3_gref;
   184	
   185	err_cleanup:
   186		free_pages((unsigned long)lvl2_table, n_lvl2_grefs);
   187		free_pages((unsigned long)lvl3_table, 1);
   188	
   189		return -ENOSPC;
   190	}
   191	
 > 192	int xen_be_unshare_pages(void **refs_info, int nents)
   193	{
   194		struct xen_shared_pages_info *sh_pages_info;
   195		int n_lvl2_grefs = (nents/REFS_PER_PAGE +
   196				    ((nents % REFS_PER_PAGE) ? 1 : 0));
   197		int i;
   198	
   199		dev_dbg(hy_drv_priv->dev, "%s entry\n", __func__);
   200		sh_pages_info = (struct xen_shared_pages_info *)(*refs_info);
   201	
   202		if (sh_pages_info->lvl3_table == NULL ||
   203		    sh_pages_info->lvl2_table ==  NULL ||
   204		    sh_pages_info->lvl3_gref == -1) {
   205			dev_warn(hy_drv_priv->dev,
   206				 "gref table for hyper_dmabuf already cleaned up\n");
   207			return 0;
   208		}
   209	
   210		/* End foreign access for data pages, but do not free them */
   211		for (i = 0; i < nents; i++) {
   212			if (gnttab_query_foreign_access(sh_pages_info->lvl2_table[i]))
   213				dev_warn(hy_drv_priv->dev, "refid not shared !!\n");
   214	
   215			gnttab_end_foreign_access_ref(sh_pages_info->lvl2_table[i], 0);
   216			gnttab_free_grant_reference(sh_pages_info->lvl2_table[i]);
   217		}
   218	
   219		/* End foreign access for 2nd level addressing pages */
   220		for (i = 0; i < n_lvl2_grefs; i++) {
   221			if (gnttab_query_foreign_access(sh_pages_info->lvl3_table[i]))
   222				dev_warn(hy_drv_priv->dev, "refid not shared !!\n");
   223	
   224			if (!gnttab_end_foreign_access_ref(
   225						sh_pages_info->lvl3_table[i], 1))
   226				dev_warn(hy_drv_priv->dev, "refid still in use!!!\n");
   227	
   228			gnttab_free_grant_reference(sh_pages_info->lvl3_table[i]);
   229		}
   230	
   231		/* End foreign access for top level addressing page */
   232		if (gnttab_query_foreign_access(sh_pages_info->lvl3_gref))
   233			dev_warn(hy_drv_priv->dev, "gref not shared !!\n");
   234	
   235		gnttab_end_foreign_access_ref(sh_pages_info->lvl3_gref, 1);
   236		gnttab_free_grant_reference(sh_pages_info->lvl3_gref);
   237	
   238		/* freeing all pages used for 2 level addressing */
   239		free_pages((unsigned long)sh_pages_info->lvl2_table, n_lvl2_grefs);
   240		free_pages((unsigned long)sh_pages_info->lvl3_table, 1);
   241	
   242		sh_pages_info->lvl3_gref = -1;
   243		sh_pages_info->lvl2_table = NULL;
   244		sh_pages_info->lvl3_table = NULL;
   245		kfree(sh_pages_info);
   246		sh_pages_info = NULL;
   247	
   248		dev_dbg(hy_drv_priv->dev, "%s exit\n", __func__);
   249		return 0;
   250	}
   251	
   252	/* Maps provided top level ref id and then return array of pages
   253	 * containing data refs.
   254	 */
 > 255	struct page **xen_be_map_shared_pages(unsigned long lvl3_gref, int domid,
   256					      int nents, void **refs_info)
   257	{
   258		struct page *lvl3_table_page;
   259		struct page **lvl2_table_pages;
   260		struct page **data_pages;
   261		struct xen_shared_pages_info *sh_pages_info;
   262	
   263		grant_ref_t *lvl3_table;
   264		grant_ref_t *lvl2_table;
   265	
   266		struct gnttab_map_grant_ref lvl3_map_ops;
   267		struct gnttab_unmap_grant_ref lvl3_unmap_ops;
   268	
   269		struct gnttab_map_grant_ref *lvl2_map_ops;
   270		struct gnttab_unmap_grant_ref *lvl2_unmap_ops;
   271	
   272		struct gnttab_map_grant_ref *data_map_ops;
   273		struct gnttab_unmap_grant_ref *data_unmap_ops;
   274	
   275		/* # of grefs in the last page of lvl2 table */
   276		int nents_last = (nents - 1) % REFS_PER_PAGE + 1;
   277		int n_lvl2_grefs = (nents / REFS_PER_PAGE) +
   278				   ((nents_last > 0) ? 1 : 0) -
   279				   (nents_last == REFS_PER_PAGE);
   280		int i, j, k;
   281	
   282		dev_dbg(hy_drv_priv->dev, "%s entry\n", __func__);
   283	
   284		sh_pages_info = kmalloc(sizeof(*sh_pages_info), GFP_KERNEL);
   285		*refs_info = (void *) sh_pages_info;
   286	
   287		lvl2_table_pages = kcalloc(n_lvl2_grefs, sizeof(struct page *),
   288					   GFP_KERNEL);
   289	
   290		data_pages = kcalloc(nents, sizeof(struct page *), GFP_KERNEL);
   291	
   292		lvl2_map_ops = kcalloc(n_lvl2_grefs, sizeof(*lvl2_map_ops),
   293				       GFP_KERNEL);
   294	
   295		lvl2_unmap_ops = kcalloc(n_lvl2_grefs, sizeof(*lvl2_unmap_ops),
   296					 GFP_KERNEL);
   297	
   298		data_map_ops = kcalloc(nents, sizeof(*data_map_ops), GFP_KERNEL);
   299		data_unmap_ops = kcalloc(nents, sizeof(*data_unmap_ops), GFP_KERNEL);
   300	
   301		/* Map top level addressing page */
   302		if (gnttab_alloc_pages(1, &lvl3_table_page)) {
   303			dev_err(hy_drv_priv->dev, "Cannot allocate pages\n");
   304			return NULL;
   305		}
   306	
   307		lvl3_table = (grant_ref_t *)pfn_to_kaddr(page_to_pfn(lvl3_table_page));
   308	
   309		gnttab_set_map_op(&lvl3_map_ops, (unsigned long)lvl3_table,
   310				  GNTMAP_host_map | GNTMAP_readonly,
   311				  (grant_ref_t)lvl3_gref, domid);
   312	
   313		gnttab_set_unmap_op(&lvl3_unmap_ops, (unsigned long)lvl3_table,
   314				    GNTMAP_host_map | GNTMAP_readonly, -1);
   315	
   316		if (gnttab_map_refs(&lvl3_map_ops, NULL, &lvl3_table_page, 1)) {
   317			dev_err(hy_drv_priv->dev,
   318				"HYPERVISOR map grant ref failed");
   319			return NULL;
   320		}
   321	
   322		if (lvl3_map_ops.status) {
   323			dev_err(hy_drv_priv->dev,
   324				"HYPERVISOR map grant ref failed status = %d",
   325				lvl3_map_ops.status);
   326	
   327			goto error_cleanup_lvl3;
   328		} else {
   329			lvl3_unmap_ops.handle = lvl3_map_ops.handle;
   330		}
   331	
   332		/* Map all second level pages */
   333		if (gnttab_alloc_pages(n_lvl2_grefs, lvl2_table_pages)) {
   334			dev_err(hy_drv_priv->dev, "Cannot allocate pages\n");
   335			goto error_cleanup_lvl3;
   336		}
   337	
   338		for (i = 0; i < n_lvl2_grefs; i++) {
   339			lvl2_table = (grant_ref_t *)pfn_to_kaddr(
   340						page_to_pfn(lvl2_table_pages[i]));
   341			gnttab_set_map_op(&lvl2_map_ops[i],
   342					  (unsigned long)lvl2_table, GNTMAP_host_map |
   343					  GNTMAP_readonly,
   344					  lvl3_table[i], domid);
   345			gnttab_set_unmap_op(&lvl2_unmap_ops[i],
   346					    (unsigned long)lvl2_table, GNTMAP_host_map |
   347					    GNTMAP_readonly, -1);
   348		}
   349	
   350		/* Unmap top level page, as it won't be needed any longer */
   351		if (gnttab_unmap_refs(&lvl3_unmap_ops, NULL,
   352				      &lvl3_table_page, 1)) {
   353			dev_err(hy_drv_priv->dev,
   354				"xen: cannot unmap top level page\n");
   355			return NULL;
   356		}
   357	
   358		/* Mark that page was unmapped */
   359		lvl3_unmap_ops.handle = -1;
   360	
   361		if (gnttab_map_refs(lvl2_map_ops, NULL,
   362				    lvl2_table_pages, n_lvl2_grefs)) {
   363			dev_err(hy_drv_priv->dev,
   364				"HYPERVISOR map grant ref failed");
   365			return NULL;
   366		}
   367	
   368		/* Checks if pages were mapped correctly */
   369		for (i = 0; i < n_lvl2_grefs; i++) {
   370			if (lvl2_map_ops[i].status) {
   371				dev_err(hy_drv_priv->dev,
   372					"HYPERVISOR map grant ref failed status = %d",
   373					lvl2_map_ops[i].status);
   374				goto error_cleanup_lvl2;
   375			} else {
   376				lvl2_unmap_ops[i].handle = lvl2_map_ops[i].handle;
   377			}
   378		}
   379	
   380		if (gnttab_alloc_pages(nents, data_pages)) {
   381			dev_err(hy_drv_priv->dev,
   382				"Cannot allocate pages\n");
   383			goto error_cleanup_lvl2;
   384		}
   385	
   386		k = 0;
   387	
   388		for (i = 0; i < n_lvl2_grefs - 1; i++) {
   389			lvl2_table = pfn_to_kaddr(page_to_pfn(lvl2_table_pages[i]));
   390			for (j = 0; j < REFS_PER_PAGE; j++) {
   391				gnttab_set_map_op(&data_map_ops[k],
   392					(unsigned long)pfn_to_kaddr(
   393							page_to_pfn(data_pages[k])),
   394					GNTMAP_host_map | GNTMAP_readonly,
   395					lvl2_table[j], domid);
   396	
   397				gnttab_set_unmap_op(&data_unmap_ops[k],
   398					(unsigned long)pfn_to_kaddr(
   399							page_to_pfn(data_pages[k])),
   400					GNTMAP_host_map | GNTMAP_readonly, -1);
   401				k++;
   402			}
   403		}
   404	
   405		/* for grefs in the last lvl2 table page */
   406		lvl2_table = pfn_to_kaddr(page_to_pfn(
   407					lvl2_table_pages[n_lvl2_grefs - 1]));
   408	
   409		for (j = 0; j < nents_last; j++) {
   410			gnttab_set_map_op(&data_map_ops[k],
   411				(unsigned long)pfn_to_kaddr(page_to_pfn(data_pages[k])),
   412				GNTMAP_host_map | GNTMAP_readonly,
   413				lvl2_table[j], domid);
   414	
   415			gnttab_set_unmap_op(&data_unmap_ops[k],
   416				(unsigned long)pfn_to_kaddr(page_to_pfn(data_pages[k])),
   417				GNTMAP_host_map | GNTMAP_readonly, -1);
   418			k++;
   419		}
   420	
   421		if (gnttab_map_refs(data_map_ops, NULL,
   422				    data_pages, nents)) {
   423			dev_err(hy_drv_priv->dev,
   424				"HYPERVISOR map grant ref failed\n");
   425			return NULL;
   426		}
   427	
   428		/* unmapping lvl2 table pages */
   429		if (gnttab_unmap_refs(lvl2_unmap_ops,
   430				      NULL, lvl2_table_pages,
   431				      n_lvl2_grefs)) {
   432			dev_err(hy_drv_priv->dev,
   433				"Cannot unmap 2nd level refs\n");
   434			return NULL;
   435		}
   436	
   437		/* Mark that pages were unmapped */
   438		for (i = 0; i < n_lvl2_grefs; i++)
   439			lvl2_unmap_ops[i].handle = -1;
   440	
   441		for (i = 0; i < nents; i++) {
   442			if (data_map_ops[i].status) {
   443				dev_err(hy_drv_priv->dev,
   444					"HYPERVISOR map grant ref failed status = %d\n",
   445					data_map_ops[i].status);
   446				goto error_cleanup_data;
   447			} else {
   448				data_unmap_ops[i].handle = data_map_ops[i].handle;
   449			}
   450		}
   451	
   452		/* store these references for unmapping in the future */
   453		sh_pages_info->unmap_ops = data_unmap_ops;
   454		sh_pages_info->data_pages = data_pages;
   455	
   456		gnttab_free_pages(1, &lvl3_table_page);
   457		gnttab_free_pages(n_lvl2_grefs, lvl2_table_pages);
   458		kfree(lvl2_table_pages);
   459		kfree(lvl2_map_ops);
   460		kfree(lvl2_unmap_ops);
   461		kfree(data_map_ops);
   462	
   463		dev_dbg(hy_drv_priv->dev, "%s exit\n", __func__);
   464		return data_pages;
   465	
   466	error_cleanup_data:
   467		gnttab_unmap_refs(data_unmap_ops, NULL, data_pages,
   468				  nents);
   469	
   470		gnttab_free_pages(nents, data_pages);
   471	
   472	error_cleanup_lvl2:
   473		if (lvl2_unmap_ops[0].handle != -1)
   474			gnttab_unmap_refs(lvl2_unmap_ops, NULL,
   475					  lvl2_table_pages, n_lvl2_grefs);
   476		gnttab_free_pages(n_lvl2_grefs, lvl2_table_pages);
   477	
   478	error_cleanup_lvl3:
   479		if (lvl3_unmap_ops.handle != -1)
   480			gnttab_unmap_refs(&lvl3_unmap_ops, NULL,
   481					  &lvl3_table_page, 1);
   482		gnttab_free_pages(1, &lvl3_table_page);
   483	
   484		kfree(lvl2_table_pages);
   485		kfree(lvl2_map_ops);
   486		kfree(lvl2_unmap_ops);
   487		kfree(data_map_ops);
   488	
   489	
   490		return NULL;
   491	}
   492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
