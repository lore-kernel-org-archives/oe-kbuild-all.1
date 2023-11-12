Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517A31840
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 04:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3tvidZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699761992; x=1731297992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MlQ3A1IHXJ7KWw2jIwfbeo9pNY/RZcQ6xVa+RwCLXtk=;
  b=G3tvidZ0+o2+G88Slfqq4pcHGVZaStBq4aXcWk1SSW040wY8moG/O//k
   vbt5PnrqyKqUskR7xcMIGojMvBEd0O/XPCVz+P+uuUPjaPxtElgQWK5MB
   hx+bVwksmDtu84Ggy4eP92RGF14teO93uLrZgz4Elb9mqierZXdAxZ/VR
   4kRpJXvghxbBeGjFplE3IQyd2VriyRoKNpHfk8dTEqbhcrvpZkcaTA6pQ
   3Sbq4rdejX+6lJ6IsJBtTgNWxyODugaMJQ7xLc3vWZBq2ypD5yQVG2kai
   Hbz/z4l/orp5TFLU9dAcC2xYdiLkjremi4F5PqoyX0gn6130TecEqhbuk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="476533116"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="476533116"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 20:06:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="764053439"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="764053439"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Nov 2023 20:06:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r21jv-000AwL-2y;
	Sun, 12 Nov 2023 04:06:27 +0000
Date: Sun, 12 Nov 2023 12:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: Hugh Dickins <hughd@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mempolicy: alloc_pages_mpol() for NUMA policy without
 vma: fix
Message-ID: <202311121121.UrQShTXQ-lkp@intel.com>
References: <00dc4f56-e623-7c85-29ea-4211e93063f6@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00dc4f56-e623-7c85-29ea-4211e93063f6@google.com>

Hi Hugh,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20231024-144517/Hugh-Dickins/hugetlbfs-drop-shared-NUMA-mempolicy-pretence/20231003-173301
base:   the 10th patch of https://lore.kernel.org/r/74e34633-6060-f5e3-aee-7040d43f2e93%40google.com
patch link:    https://lore.kernel.org/r/00dc4f56-e623-7c85-29ea-4211e93063f6%40google.com
patch subject: [PATCH] mempolicy: alloc_pages_mpol() for NUMA policy without vma: fix
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231112/202311121121.UrQShTXQ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311121121.UrQShTXQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311121121.UrQShTXQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/zswap.c:41:
   mm/internal.h: In function 'shrinker_debugfs_name_alloc':
   mm/internal.h:1232:9: warning: function 'shrinker_debugfs_name_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1232 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |         ^~~~~~~~
   mm/zswap.c: In function 'zswap_writeback_entry':
>> mm/zswap.c:1322:16: error: implicit declaration of function 'get_task_policy'; did you mean 'get_vma_policy'? [-Werror=implicit-function-declaration]
    1322 |         mpol = get_task_policy(current);
         |                ^~~~~~~~~~~~~~~
         |                get_vma_policy
   mm/zswap.c:1322:14: warning: assignment to 'struct mempolicy *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1322 |         mpol = get_task_policy(current);
         |              ^
   cc1: some warnings being treated as errors


vim +1322 mm/zswap.c

  1282	
  1283	/*********************************
  1284	* writeback code
  1285	**********************************/
  1286	/*
  1287	 * Attempts to free an entry by adding a page to the swap cache,
  1288	 * decompressing the entry data into the page, and issuing a
  1289	 * bio write to write the page back to the swap device.
  1290	 *
  1291	 * This can be thought of as a "resumed writeback" of the page
  1292	 * to the swap device.  We are basically resuming the same swap
  1293	 * writeback path that was intercepted with the zswap_store()
  1294	 * in the first place.  After the page has been decompressed into
  1295	 * the swap cache, the compressed version stored by zswap can be
  1296	 * freed.
  1297	 */
  1298	static int zswap_writeback_entry(struct zswap_entry *entry,
  1299					 struct zswap_tree *tree)
  1300	{
  1301		swp_entry_t swpentry = entry->swpentry;
  1302		struct page *page;
  1303		struct mempolicy *mpol;
  1304		struct scatterlist input, output;
  1305		struct crypto_acomp_ctx *acomp_ctx;
  1306		struct zpool *pool = zswap_find_zpool(entry);
  1307		bool page_was_allocated;
  1308		u8 *src, *tmp = NULL;
  1309		unsigned int dlen;
  1310		int ret;
  1311		struct writeback_control wbc = {
  1312			.sync_mode = WB_SYNC_NONE,
  1313		};
  1314	
  1315		if (!zpool_can_sleep_mapped(pool)) {
  1316			tmp = kmalloc(PAGE_SIZE, GFP_KERNEL);
  1317			if (!tmp)
  1318				return -ENOMEM;
  1319		}
  1320	
  1321		/* try to allocate swap cache page */
> 1322		mpol = get_task_policy(current);
  1323		page = __read_swap_cache_async(swpentry, GFP_KERNEL, mpol,
  1324					NO_INTERLEAVE_INDEX, &page_was_allocated);
  1325		if (!page) {
  1326			ret = -ENOMEM;
  1327			goto fail;
  1328		}
  1329	
  1330		/* Found an existing page, we raced with load/swapin */
  1331		if (!page_was_allocated) {
  1332			put_page(page);
  1333			ret = -EEXIST;
  1334			goto fail;
  1335		}
  1336	
  1337		/*
  1338		 * Page is locked, and the swapcache is now secured against
  1339		 * concurrent swapping to and from the slot. Verify that the
  1340		 * swap entry hasn't been invalidated and recycled behind our
  1341		 * backs (our zswap_entry reference doesn't prevent that), to
  1342		 * avoid overwriting a new swap page with old compressed data.
  1343		 */
  1344		spin_lock(&tree->lock);
  1345		if (zswap_rb_search(&tree->rbroot, swp_offset(entry->swpentry)) != entry) {
  1346			spin_unlock(&tree->lock);
  1347			delete_from_swap_cache(page_folio(page));
  1348			ret = -ENOMEM;
  1349			goto fail;
  1350		}
  1351		spin_unlock(&tree->lock);
  1352	
  1353		/* decompress */
  1354		acomp_ctx = raw_cpu_ptr(entry->pool->acomp_ctx);
  1355		dlen = PAGE_SIZE;
  1356	
  1357		src = zpool_map_handle(pool, entry->handle, ZPOOL_MM_RO);
  1358		if (!zpool_can_sleep_mapped(pool)) {
  1359			memcpy(tmp, src, entry->length);
  1360			src = tmp;
  1361			zpool_unmap_handle(pool, entry->handle);
  1362		}
  1363	
  1364		mutex_lock(acomp_ctx->mutex);
  1365		sg_init_one(&input, src, entry->length);
  1366		sg_init_table(&output, 1);
  1367		sg_set_page(&output, page, PAGE_SIZE, 0);
  1368		acomp_request_set_params(acomp_ctx->req, &input, &output, entry->length, dlen);
  1369		ret = crypto_wait_req(crypto_acomp_decompress(acomp_ctx->req), &acomp_ctx->wait);
  1370		dlen = acomp_ctx->req->dlen;
  1371		mutex_unlock(acomp_ctx->mutex);
  1372	
  1373		if (!zpool_can_sleep_mapped(pool))
  1374			kfree(tmp);
  1375		else
  1376			zpool_unmap_handle(pool, entry->handle);
  1377	
  1378		BUG_ON(ret);
  1379		BUG_ON(dlen != PAGE_SIZE);
  1380	
  1381		/* page is up to date */
  1382		SetPageUptodate(page);
  1383	
  1384		/* move it to the tail of the inactive list after end_writeback */
  1385		SetPageReclaim(page);
  1386	
  1387		/* start writeback */
  1388		__swap_writepage(page, &wbc);
  1389		put_page(page);
  1390		zswap_written_back_pages++;
  1391	
  1392		return ret;
  1393	
  1394	fail:
  1395		if (!zpool_can_sleep_mapped(pool))
  1396			kfree(tmp);
  1397	
  1398		/*
  1399		 * If we get here because the page is already in swapcache, a
  1400		 * load may be happening concurrently. It is safe and okay to
  1401		 * not free the entry. It is also okay to return !0.
  1402		 */
  1403		return ret;
  1404	}
  1405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
