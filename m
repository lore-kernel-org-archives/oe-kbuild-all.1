Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81B9101D2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 17:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ds2mREVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697908880; x=1729444880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PKIRI3UJRU2iZMGNfrdDRrFkjg0mdgeTw5CzgFysnZo=;
  b=ds2mREVG4xm/nqhw/RF1UiMSrciEmTS9t4N5fnaUZS/kQs9x6l3s4WX9
   lvERvCYCOAjr09gKL6r12k7UK8L64GWMv494dNI752JhyavFiILZof77z
   5R34G1iWhrAJ0ubaO9b+opFSO8a1FRZkIfyq/bVl1lmYo6FAPMf2NeGy/
   bBLTqGQ4y9AgAFgXXcrsMqEBNWwaDgcUxCzWY9bVMu9pZG6PvSgzYhdMq
   88UvqX/r5p1IEnSX7Ypjg8EapUZyBZzYeHBdXU0U9OuQ2+Ux7wJmr7ACO
   oQwYTjf4pHC7pSoaEAU33u8Zzo8Zc9E/ELj8ZVvezUzyJuAlNgHQ4APKD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="8205782"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="8205782"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 10:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="751232291"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="751232291"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Oct 2023 10:21:17 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quFf0-00054k-2t;
	Sat, 21 Oct 2023 17:21:14 +0000
Date: Sun, 22 Oct 2023 01:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1] mm: zswap: Store large folios without splitting
Message-ID: <202310220117.LhdgAClN-lkp@intel.com>
References: <20231019110543.3284654-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019110543.3284654-1-ryan.roberts@arm.com>

Hi Ryan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 158978945f3173b8c1a88f8c5684a629736a57ac]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/mm-zswap-Store-large-folios-without-splitting/20231019-190740
base:   158978945f3173b8c1a88f8c5684a629736a57ac
patch link:    https://lore.kernel.org/r/20231019110543.3284654-1-ryan.roberts%40arm.com
patch subject: [RFC PATCH v1] mm: zswap: Store large folios without splitting
config: arc-randconfig-002-20231022 (https://download.01.org/0day-ci/archive/20231022/202310220117.LhdgAClN-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220117.LhdgAClN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220117.LhdgAClN-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/zswap.c: In function 'zswap_store_page':
>> mm/zswap.c:1214:17: error: implicit declaration of function 'obj_cgroup_get'; did you mean 'obj_cgroup_put'? [-Werror=implicit-function-declaration]
    1214 |                 obj_cgroup_get(objcg);
         |                 ^~~~~~~~~~~~~~
         |                 obj_cgroup_put
   cc1: some warnings being treated as errors


vim +1214 mm/zswap.c

  1190	
  1191	static bool zswap_store_page(struct folio *folio, long index,
  1192				     struct obj_cgroup *objcg, struct zswap_pool *pool)
  1193	{
  1194		swp_entry_t swp = folio->swap;
  1195		int type = swp_type(swp);
  1196		pgoff_t offset = swp_offset(swp) + index;
  1197		struct page *page = folio_page(folio, index);
  1198		struct zswap_tree *tree = zswap_trees[type];
  1199		struct zswap_entry *entry, *dupentry;
  1200		struct scatterlist input, output;
  1201		struct crypto_acomp_ctx *acomp_ctx;
  1202		struct zpool *zpool;
  1203		unsigned int dlen = PAGE_SIZE;
  1204		unsigned long handle, value;
  1205		char *buf;
  1206		u8 *src, *dst;
  1207		gfp_t gfp;
  1208		int ret;
  1209	
  1210		/* entry keeps the references if successfully stored. */
  1211		if (!zswap_pool_get(pool))
  1212			return false;
  1213		if (objcg)
> 1214			obj_cgroup_get(objcg);
  1215	
  1216		/* allocate entry */
  1217		entry = zswap_entry_cache_alloc(GFP_KERNEL);
  1218		if (!entry) {
  1219			zswap_reject_kmemcache_fail++;
  1220			goto reject;
  1221		}
  1222		entry->objcg = objcg;
  1223		entry->pool = pool;
  1224	
  1225		if (zswap_same_filled_pages_enabled) {
  1226			src = kmap_atomic(page);
  1227			if (zswap_is_page_same_filled(src, &value)) {
  1228				kunmap_atomic(src);
  1229				entry->swpentry = swp_entry(type, offset);
  1230				entry->length = 0;
  1231				entry->value = value;
  1232				atomic_inc(&zswap_same_filled_pages);
  1233				goto insert_entry;
  1234			}
  1235			kunmap_atomic(src);
  1236		}
  1237	
  1238		if (!zswap_non_same_filled_pages_enabled)
  1239			goto freepage;
  1240	
  1241		/* compress */
  1242		acomp_ctx = raw_cpu_ptr(entry->pool->acomp_ctx);
  1243	
  1244		mutex_lock(acomp_ctx->mutex);
  1245	
  1246		dst = acomp_ctx->dstmem;
  1247		sg_init_table(&input, 1);
  1248		sg_set_page(&input, page, PAGE_SIZE, 0);
  1249	
  1250		/* zswap_dstmem is of size (PAGE_SIZE * 2). Reflect same in sg_list */
  1251		sg_init_one(&output, dst, PAGE_SIZE * 2);
  1252		acomp_request_set_params(acomp_ctx->req, &input, &output, PAGE_SIZE, dlen);
  1253		/*
  1254		 * it maybe looks a little bit silly that we send an asynchronous request,
  1255		 * then wait for its completion synchronously. This makes the process look
  1256		 * synchronous in fact.
  1257		 * Theoretically, acomp supports users send multiple acomp requests in one
  1258		 * acomp instance, then get those requests done simultaneously. but in this
  1259		 * case, zswap actually does store and load page by page, there is no
  1260		 * existing method to send the second page before the first page is done
  1261		 * in one thread doing zwap.
  1262		 * but in different threads running on different cpu, we have different
  1263		 * acomp instance, so multiple threads can do (de)compression in parallel.
  1264		 */
  1265		ret = crypto_wait_req(crypto_acomp_compress(acomp_ctx->req), &acomp_ctx->wait);
  1266		dlen = acomp_ctx->req->dlen;
  1267	
  1268		if (ret)
  1269			goto put_dstmem;
  1270	
  1271		/* store */
  1272		zpool = zswap_find_zpool(entry);
  1273		gfp = __GFP_NORETRY | __GFP_NOWARN | __GFP_KSWAPD_RECLAIM;
  1274		if (zpool_malloc_support_movable(zpool))
  1275			gfp |= __GFP_HIGHMEM | __GFP_MOVABLE;
  1276		ret = zpool_malloc(zpool, dlen, gfp, &handle);
  1277		if (ret == -ENOSPC) {
  1278			zswap_reject_compress_poor++;
  1279			goto put_dstmem;
  1280		}
  1281		if (ret) {
  1282			zswap_reject_alloc_fail++;
  1283			goto put_dstmem;
  1284		}
  1285		buf = zpool_map_handle(zpool, handle, ZPOOL_MM_WO);
  1286		memcpy(buf, dst, dlen);
  1287		zpool_unmap_handle(zpool, handle);
  1288		mutex_unlock(acomp_ctx->mutex);
  1289	
  1290		/* populate entry */
  1291		entry->swpentry = swp_entry(type, offset);
  1292		entry->handle = handle;
  1293		entry->length = dlen;
  1294	
  1295	insert_entry:
  1296		if (objcg) {
  1297			obj_cgroup_charge_zswap(objcg, entry->length);
  1298			/* Account before objcg ref is moved to tree */
  1299			count_objcg_event(objcg, ZSWPOUT);
  1300		}
  1301	
  1302		/* map */
  1303		spin_lock(&tree->lock);
  1304		/*
  1305		 * A duplicate entry should have been removed at the beginning of this
  1306		 * function. Since the swap entry should be pinned, if a duplicate is
  1307		 * found again here it means that something went wrong in the swap
  1308		 * cache.
  1309		 */
  1310		while (zswap_rb_insert(&tree->rbroot, entry, &dupentry) == -EEXIST) {
  1311			WARN_ON(1);
  1312			zswap_duplicate_entry++;
  1313			zswap_invalidate_entry(tree, dupentry);
  1314		}
  1315		if (entry->length) {
  1316			spin_lock(&entry->pool->lru_lock);
  1317			list_add(&entry->lru, &entry->pool->lru);
  1318			spin_unlock(&entry->pool->lru_lock);
  1319		}
  1320		spin_unlock(&tree->lock);
  1321	
  1322		/* update stats */
  1323		atomic_inc(&zswap_stored_pages);
  1324		zswap_update_total_size();
  1325		count_vm_event(ZSWPOUT);
  1326	
  1327		return true;
  1328	
  1329	put_dstmem:
  1330		mutex_unlock(acomp_ctx->mutex);
  1331	freepage:
  1332		zswap_entry_cache_free(entry);
  1333	reject:
  1334		if (objcg)
  1335			obj_cgroup_put(objcg);
  1336		zswap_pool_put(pool);
  1337		return false;
  1338	}
  1339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
