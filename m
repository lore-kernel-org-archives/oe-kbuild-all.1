Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2277F248880
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 01:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765501919; cv=none; b=JcgYNHFZjCZwUrf8EbiAp20P8AjPahoU371LOf3KNnDCn6GMHQGYNz0vvhHePWMZ6H17xouJuUe/jX8toey4RzMnybOdCLODUIUXh1uGF1vStA+iOSE39ZyxRsZT8FAv7BUVdCzEmyB/U/JT1ad0JYHc6/e8UglOELo0UV3fqd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765501919; c=relaxed/simple;
	bh=meN7GIUwHeyjy1fxurc+f4ibfidGZK9zjj7ujp0n6ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvsUoYCCJWn4LiODEgXhQCcq9Ku5fYhYb1dlRVLnOEFXtogMyRjMZBD8K6mKL5M3+o/FHuh6zLubSGb1HCb7+wlgpjsEYbPCB5TMpCB1/qh0BXb6QNslmWejVQ7Yi+XkTRLHOnik5QW4xtS5Wi3B1HaharnfhuH6HwriiQYiv3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKjEkmy1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKjEkmy1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765501917; x=1797037917;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=meN7GIUwHeyjy1fxurc+f4ibfidGZK9zjj7ujp0n6ww=;
  b=WKjEkmy1zkfBTlix8MYZ42ABFk0GUfp3j1K89nT524Vp7jjEq2/CQACA
   PTv17gbrYRAAZBmE0N28e8eFbVa+VrpBledFgsxeK0YJ+uTcX75EbSXvW
   wdC+VreLIE+NYb+Wd13h+Zzfv7puMtwpDmT0th00+W9hMScZVggD2CqqM
   zrZlU1XvjHLN1FwH2Qhq1PUnEYk4iwc4AJszUMAtYnVdXot/4ELYvEvk3
   7ftl0KNMctpuvNFW6JzaBFGszSyYWp6qqxBUAgF2uDli14gwE6p5pyRH2
   edmZvTO9PgvCl0IQGqcoNx7yDuf+MGWdUDaFvzMkaPuaZCDuMNlCdZuy2
   A==;
X-CSE-ConnectionGUID: qfjWMggfTsqT1dVr48Nkyw==
X-CSE-MsgGUID: IGjuUtPeTPC1FVSgl+2ZkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84901551"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="84901551"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 17:11:56 -0800
X-CSE-ConnectionGUID: k74e4enST2+qTIgOaXsIew==
X-CSE-MsgGUID: ibZJ2MsJTCS+H0etBWAw7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196555410"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Dec 2025 17:11:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTrhJ-000000001G8-0bMM;
	Fri, 12 Dec 2025 01:11:53 +0000
Date: Fri, 12 Dec 2025 02:11:32 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lin Yujun <linyujun809@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] htmldocs: ./include/drm/drm_gem.h:224:
 warning: Function parameter or member 'KABI_RESERVE(1' not described in
 'drm_gem_object_funcs'
Message-ID: <202512120202.QFuhMvmE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 594c8ec1c427b74f7bba885787c6e41732e32dba [3508/3508] drm: drm_gem.h: Add kabi_reserve
reproduce: (https://download.01.org/0day-ci/archive/20251212/202512120202.QFuhMvmE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120202.QFuhMvmE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./include/drm/drm_connector.h:1897: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_connector'
   ./include/drm/drm_fb_helper.h:107: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_fb_helper_funcs'
   ./include/drm/drm_fb_helper.h:217: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_fb_helper'
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/hdmi.h
>> ./include/drm/drm_gem.h:224: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_gem_object_funcs'
>> ./include/drm/drm_gem.h:432: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_gem_object'
   Error: Cannot open file ./include/linux/host1x.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h


vim +224 ./include/drm/drm_gem.h

686b21b5f6ca2f Rob Clark       2023-05-24   67  
b39b5394fabc79 Noralf Trønnes  2018-11-10   68  /**
b39b5394fabc79 Noralf Trønnes  2018-11-10   69   * struct drm_gem_object_funcs - GEM object functions
b39b5394fabc79 Noralf Trønnes  2018-11-10   70   */
b39b5394fabc79 Noralf Trønnes  2018-11-10   71  struct drm_gem_object_funcs {
b39b5394fabc79 Noralf Trønnes  2018-11-10   72  	/**
b39b5394fabc79 Noralf Trønnes  2018-11-10   73  	 * @free:
b39b5394fabc79 Noralf Trønnes  2018-11-10   74  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10   75  	 * Deconstructor for drm_gem_objects.
b39b5394fabc79 Noralf Trønnes  2018-11-10   76  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10   77  	 * This callback is mandatory.
b39b5394fabc79 Noralf Trønnes  2018-11-10   78  	 */
b39b5394fabc79 Noralf Trønnes  2018-11-10   79  	void (*free)(struct drm_gem_object *obj);
b39b5394fabc79 Noralf Trønnes  2018-11-10   80  
b39b5394fabc79 Noralf Trønnes  2018-11-10   81  	/**
b39b5394fabc79 Noralf Trønnes  2018-11-10   82  	 * @open:
b39b5394fabc79 Noralf Trønnes  2018-11-10   83  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10   84  	 * Called upon GEM handle creation.
b39b5394fabc79 Noralf Trønnes  2018-11-10   85  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10   86  	 * This callback is optional.
b39b5394fabc79 Noralf Trønnes  2018-11-10   87  	 */
b39b5394fabc79 Noralf Trønnes  2018-11-10   88  	int (*open)(struct drm_gem_object *obj, struct drm_file *file);
b39b5394fabc79 Noralf Trønnes  2018-11-10   89  
b39b5394fabc79 Noralf Trønnes  2018-11-10   90  	/**
b39b5394fabc79 Noralf Trønnes  2018-11-10   91  	 * @close:
b39b5394fabc79 Noralf Trønnes  2018-11-10   92  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10   93  	 * Called upon GEM handle release.
b39b5394fabc79 Noralf Trønnes  2018-11-10   94  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10   95  	 * This callback is optional.
b39b5394fabc79 Noralf Trønnes  2018-11-10   96  	 */
b39b5394fabc79 Noralf Trønnes  2018-11-10   97  	void (*close)(struct drm_gem_object *obj, struct drm_file *file);
b39b5394fabc79 Noralf Trønnes  2018-11-10   98  
b39b5394fabc79 Noralf Trønnes  2018-11-10   99  	/**
b39b5394fabc79 Noralf Trønnes  2018-11-10  100  	 * @print_info:
b39b5394fabc79 Noralf Trønnes  2018-11-10  101  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  102  	 * If driver subclasses struct &drm_gem_object, it can implement this
b39b5394fabc79 Noralf Trønnes  2018-11-10  103  	 * optional hook for printing additional driver specific info.
b39b5394fabc79 Noralf Trønnes  2018-11-10  104  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  105  	 * drm_printf_indent() should be used in the callback passing it the
b39b5394fabc79 Noralf Trønnes  2018-11-10  106  	 * indent argument.
b39b5394fabc79 Noralf Trønnes  2018-11-10  107  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  108  	 * This callback is called from drm_gem_print_info().
b39b5394fabc79 Noralf Trønnes  2018-11-10  109  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  110  	 * This callback is optional.
b39b5394fabc79 Noralf Trønnes  2018-11-10  111  	 */
b39b5394fabc79 Noralf Trønnes  2018-11-10  112  	void (*print_info)(struct drm_printer *p, unsigned int indent,
b39b5394fabc79 Noralf Trønnes  2018-11-10  113  			   const struct drm_gem_object *obj);
b39b5394fabc79 Noralf Trønnes  2018-11-10  114  
b39b5394fabc79 Noralf Trønnes  2018-11-10  115  	/**
b39b5394fabc79 Noralf Trønnes  2018-11-10  116  	 * @export:
b39b5394fabc79 Noralf Trønnes  2018-11-10  117  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  118  	 * Export backing buffer as a &dma_buf.
b39b5394fabc79 Noralf Trønnes  2018-11-10  119  	 * If this is not set drm_gem_prime_export() is used.
b39b5394fabc79 Noralf Trønnes  2018-11-10  120  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  121  	 * This callback is optional.
b39b5394fabc79 Noralf Trønnes  2018-11-10  122  	 */
b39b5394fabc79 Noralf Trønnes  2018-11-10  123  	struct dma_buf *(*export)(struct drm_gem_object *obj, int flags);
b39b5394fabc79 Noralf Trønnes  2018-11-10  124  
b39b5394fabc79 Noralf Trønnes  2018-11-10  125  	/**
b39b5394fabc79 Noralf Trønnes  2018-11-10  126  	 * @pin:
b39b5394fabc79 Noralf Trønnes  2018-11-10  127  	 *
805dc614d58a8f Daniel Vetter   2019-06-20  128  	 * Pin backing buffer in memory. Used by the drm_gem_map_attach() helper.
b39b5394fabc79 Noralf Trønnes  2018-11-10  129  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  130  	 * This callback is optional.
b39b5394fabc79 Noralf Trønnes  2018-11-10  131  	 */
b39b5394fabc79 Noralf Trønnes  2018-11-10  132  	int (*pin)(struct drm_gem_object *obj);
b39b5394fabc79 Noralf Trønnes  2018-11-10  133  
b39b5394fabc79 Noralf Trønnes  2018-11-10  134  	/**
b39b5394fabc79 Noralf Trønnes  2018-11-10  135  	 * @unpin:
b39b5394fabc79 Noralf Trønnes  2018-11-10  136  	 *
805dc614d58a8f Daniel Vetter   2019-06-20  137  	 * Unpin backing buffer. Used by the drm_gem_map_detach() helper.
b39b5394fabc79 Noralf Trønnes  2018-11-10  138  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  139  	 * This callback is optional.
b39b5394fabc79 Noralf Trønnes  2018-11-10  140  	 */
b39b5394fabc79 Noralf Trønnes  2018-11-10  141  	void (*unpin)(struct drm_gem_object *obj);
b39b5394fabc79 Noralf Trønnes  2018-11-10  142  
b39b5394fabc79 Noralf Trønnes  2018-11-10  143  	/**
b39b5394fabc79 Noralf Trønnes  2018-11-10  144  	 * @get_sg_table:
b39b5394fabc79 Noralf Trønnes  2018-11-10  145  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  146  	 * Returns a Scatter-Gather table representation of the buffer.
805dc614d58a8f Daniel Vetter   2019-06-20  147  	 * Used when exporting a buffer by the drm_gem_map_dma_buf() helper.
805dc614d58a8f Daniel Vetter   2019-06-20  148  	 * Releasing is done by calling dma_unmap_sg_attrs() and sg_free_table()
805dc614d58a8f Daniel Vetter   2019-06-20  149  	 * in drm_gem_unmap_buf(), therefore these helpers and this callback
805dc614d58a8f Daniel Vetter   2019-06-20  150  	 * here cannot be used for sg tables pointing at driver private memory
805dc614d58a8f Daniel Vetter   2019-06-20  151  	 * ranges.
b39b5394fabc79 Noralf Trønnes  2018-11-10  152  	 *
805dc614d58a8f Daniel Vetter   2019-06-20  153  	 * See also drm_prime_pages_to_sg().
b39b5394fabc79 Noralf Trønnes  2018-11-10  154  	 */
b39b5394fabc79 Noralf Trønnes  2018-11-10  155  	struct sg_table *(*get_sg_table)(struct drm_gem_object *obj);
b39b5394fabc79 Noralf Trønnes  2018-11-10  156  
b39b5394fabc79 Noralf Trønnes  2018-11-10  157  	/**
b39b5394fabc79 Noralf Trønnes  2018-11-10  158  	 * @vmap:
b39b5394fabc79 Noralf Trønnes  2018-11-10  159  	 *
805dc614d58a8f Daniel Vetter   2019-06-20  160  	 * Returns a virtual address for the buffer. Used by the
805dc614d58a8f Daniel Vetter   2019-06-20  161  	 * drm_gem_dmabuf_vmap() helper.
b39b5394fabc79 Noralf Trønnes  2018-11-10  162  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  163  	 * This callback is optional.
b39b5394fabc79 Noralf Trønnes  2018-11-10  164  	 */
7938f4218168ae Lucas De Marchi 2022-02-04  165  	int (*vmap)(struct drm_gem_object *obj, struct iosys_map *map);
b39b5394fabc79 Noralf Trønnes  2018-11-10  166  
b39b5394fabc79 Noralf Trønnes  2018-11-10  167  	/**
b39b5394fabc79 Noralf Trønnes  2018-11-10  168  	 * @vunmap:
b39b5394fabc79 Noralf Trønnes  2018-11-10  169  	 *
f621f3bb33af0f Randy Dunlap    2020-07-14  170  	 * Releases the address previously returned by @vmap. Used by the
805dc614d58a8f Daniel Vetter   2019-06-20  171  	 * drm_gem_dmabuf_vunmap() helper.
b39b5394fabc79 Noralf Trønnes  2018-11-10  172  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  173  	 * This callback is optional.
b39b5394fabc79 Noralf Trønnes  2018-11-10  174  	 */
7938f4218168ae Lucas De Marchi 2022-02-04  175  	void (*vunmap)(struct drm_gem_object *obj, struct iosys_map *map);
b39b5394fabc79 Noralf Trønnes  2018-11-10  176  
c40069cb7bd649 Gerd Hoffmann   2019-10-16  177  	/**
c40069cb7bd649 Gerd Hoffmann   2019-10-16  178  	 * @mmap:
c40069cb7bd649 Gerd Hoffmann   2019-10-16  179  	 *
c40069cb7bd649 Gerd Hoffmann   2019-10-16  180  	 * Handle mmap() of the gem object, setup vma accordingly.
c40069cb7bd649 Gerd Hoffmann   2019-10-16  181  	 *
c40069cb7bd649 Gerd Hoffmann   2019-10-16  182  	 * This callback is optional.
c40069cb7bd649 Gerd Hoffmann   2019-10-16  183  	 *
f621f3bb33af0f Randy Dunlap    2020-07-14  184  	 * The callback is used by both drm_gem_mmap_obj() and
c40069cb7bd649 Gerd Hoffmann   2019-10-16  185  	 * drm_gem_prime_mmap().  When @mmap is present @vm_ops is not
e5516553999f73 Gerd Hoffmann   2019-11-27  186  	 * used, the @mmap callback must set vma->vm_ops instead.
c40069cb7bd649 Gerd Hoffmann   2019-10-16  187  	 */
c40069cb7bd649 Gerd Hoffmann   2019-10-16  188  	int (*mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
c40069cb7bd649 Gerd Hoffmann   2019-10-16  189  
7eabaa892d9c57 Dmitry Osipenko 2022-11-16  190  	/**
7eabaa892d9c57 Dmitry Osipenko 2022-11-16  191  	 * @evict:
7eabaa892d9c57 Dmitry Osipenko 2022-11-16  192  	 *
7eabaa892d9c57 Dmitry Osipenko 2022-11-16  193  	 * Evicts gem object out from memory. Used by the drm_gem_object_evict()
7eabaa892d9c57 Dmitry Osipenko 2022-11-16  194  	 * helper. Returns 0 on success, -errno otherwise.
7eabaa892d9c57 Dmitry Osipenko 2022-11-16  195  	 *
7eabaa892d9c57 Dmitry Osipenko 2022-11-16  196  	 * This callback is optional.
7eabaa892d9c57 Dmitry Osipenko 2022-11-16  197  	 */
7eabaa892d9c57 Dmitry Osipenko 2022-11-16  198  	int (*evict)(struct drm_gem_object *obj);
7eabaa892d9c57 Dmitry Osipenko 2022-11-16  199  
686b21b5f6ca2f Rob Clark       2023-05-24  200  	/**
686b21b5f6ca2f Rob Clark       2023-05-24  201  	 * @status:
686b21b5f6ca2f Rob Clark       2023-05-24  202  	 *
686b21b5f6ca2f Rob Clark       2023-05-24  203  	 * The optional status callback can return additional object state
686b21b5f6ca2f Rob Clark       2023-05-24  204  	 * which determines which stats the object is counted against.  The
686b21b5f6ca2f Rob Clark       2023-05-24  205  	 * callback is called under table_lock.  Racing against object status
686b21b5f6ca2f Rob Clark       2023-05-24  206  	 * change is "harmless", and the callback can expect to not race
686b21b5f6ca2f Rob Clark       2023-05-24  207  	 * against object destruction.
686b21b5f6ca2f Rob Clark       2023-05-24  208  	 *
686b21b5f6ca2f Rob Clark       2023-05-24  209  	 * Called by drm_show_memory_stats().
686b21b5f6ca2f Rob Clark       2023-05-24  210  	 */
686b21b5f6ca2f Rob Clark       2023-05-24  211  	enum drm_gem_object_status (*status)(struct drm_gem_object *obj);
686b21b5f6ca2f Rob Clark       2023-05-24  212  
b39b5394fabc79 Noralf Trønnes  2018-11-10  213  	/**
b39b5394fabc79 Noralf Trønnes  2018-11-10  214  	 * @vm_ops:
b39b5394fabc79 Noralf Trønnes  2018-11-10  215  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  216  	 * Virtual memory operations used with mmap.
b39b5394fabc79 Noralf Trønnes  2018-11-10  217  	 *
b39b5394fabc79 Noralf Trønnes  2018-11-10  218  	 * This is optional but necessary for mmap support.
b39b5394fabc79 Noralf Trønnes  2018-11-10  219  	 */
b39b5394fabc79 Noralf Trønnes  2018-11-10  220  	const struct vm_operations_struct *vm_ops;
594c8ec1c427b7 Lin Yujun       2024-02-04  221  
594c8ec1c427b7 Lin Yujun       2024-02-04  222  	KABI_RESERVE(1)
594c8ec1c427b7 Lin Yujun       2024-02-04  223  	KABI_RESERVE(2)
b39b5394fabc79 Noralf Trønnes  2018-11-10 @224  };
b39b5394fabc79 Noralf Trønnes  2018-11-10  225  

:::::: The code at line 224 was first introduced by commit
:::::: b39b5394fabc79acbaafb26b777fd348c868bf7e drm/gem: Add drm_gem_object_funcs

:::::: TO: Noralf Trønnes <noralf@tronnes.org>
:::::: CC: Noralf Trønnes <noralf@tronnes.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
