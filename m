Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766486AA7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 02:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745116973; cv=none; b=lYvhI9oJqqa82wtU06o3ggy3A/kRnZR0ipD56Z1n+Q12h+HBqZYysQCbeVOy3ISeMaCmhu2lNod9WL6GGiUHboSmvq/cepJhLm6qnkRMkxgm9sGK2MnV7WbMMqVt/a6a7zkfr9z8BFjV9CtU+3O/ZVz72qSP0UDKqEWRgQd+p/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745116973; c=relaxed/simple;
	bh=sDoV0cyyeMjfk2oSAAJNkuxJcU5OsSsGFUoxTw4SyyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NUEnT282zuR1YX7UhB6w3ITpveMDjFT20gxU4IpJdBo9PxQBohPszJZmvZutpEW4VcAhjs9o2Q9EtOcsFjC1et+jm6UkbDDiKbO0iMIPQ5hevFIEdpC20rgMLgOHHmPMFjFNa4/YZkXo/g9bDwLZMn31mez+a/FQSAFV8sa69Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GP7lSpiH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GP7lSpiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745116972; x=1776652972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sDoV0cyyeMjfk2oSAAJNkuxJcU5OsSsGFUoxTw4SyyE=;
  b=GP7lSpiHZ0UpL/mxYm8rYOB4jPZSA4m3UDR4FxoSiFueO9zyxdSRxyK+
   Tx5CPjDkN6ZnKh2Z884HGyL+5MH1oEByb33bUfyGI1sFZ5foQ9GC94Tkp
   dyodod0P7BC9C3hLMNd3C4swE8lltc4KcS+UL4pHVYX8lTAUJKmOYXij0
   pwoo2psN3eif7qClDSChJGb7e8z5wIY97ld7kYV9D+rMpsJqYh54n5oaD
   ZSJp3IAWhzB/tdI1IgX+KKJWOVVOtvgd8zzbHVJgoco8vYel3V1dWGTRJ
   +AXfA/8bUlNta2IT3o3a+n0OqD6AO7xwzVNiM80k+Ng14SHLbJNeD3fQu
   Q==;
X-CSE-ConnectionGUID: B5B4nuA9QSeP43BTRB1HAQ==
X-CSE-MsgGUID: orY2EVoWSvqkm6XXxzvkuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="72081494"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="72081494"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 19:42:49 -0700
X-CSE-ConnectionGUID: dlSM+DAPTOWb5At2DH1R9Q==
X-CSE-MsgGUID: C3xOy3FSQhWCz/+0mkNZRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="168623126"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Apr 2025 19:42:47 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Kdo-0004MV-3C;
	Sun, 20 Apr 2025 02:42:44 +0000
Date: Sun, 20 Apr 2025 10:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 110/113]
 fs/bcachefs/btree_io.c:2115:13: error: 'struct btree_write_bio' has no
 member named 'list_idx'
Message-ID: <202504201057.NFZN6X28-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   079f1fc87119d47fa5c2ca76f0089a3bd8b0f2f8
commit: 34a958d70c294801961c8365e098edcdb48f9df0 [110/113] bcachefs: Make various async objs visible in debugfs
config: m68k-apollo_defconfig (https://download.01.org/0day-ci/archive/20250420/202504201057.NFZN6X28-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201057.NFZN6X28-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201057.NFZN6X28-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/bcachefs/btree_io.c: In function 'btree_node_write_work':
>> fs/bcachefs/btree_io.c:2115:13: error: 'struct btree_write_bio' has no member named 'list_idx'
    2115 |         wbio->list_idx = 0;
         |             ^~
   In file included from fs/bcachefs/btree_io.c:3:
   fs/bcachefs/btree_io.c: In function '__bch2_btree_node_write':
>> fs/bcachefs/bcachefs.h:1286:57: warning: statement with no effect [-Wunused-value]
    1286 | #define async_object_list_add(head, obj, idx)           0
         |                                                         ^
   fs/bcachefs/btree_io.c:2466:9: note: in expansion of macro 'async_object_list_add'
    2466 |         async_object_list_add(&c->btree_write_bio_list, wbio, &wbio->list_idx);
         |         ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/bcachefs/io_read.c:9:
   fs/bcachefs/io_read.c: In function '__bch2_read_extent':
>> fs/bcachefs/bcachefs.h:1286:57: warning: statement with no effect [-Wunused-value]
    1286 | #define async_object_list_add(head, obj, idx)           0
         |                                                         ^
   fs/bcachefs/io_read.c:1205:17: note: in expansion of macro 'async_object_list_add'
    1205 |                 async_object_list_add(&c->rbio_list, rbio, &rbio->list_idx);
         |                 ^~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/bcachefs.h:1286:57: warning: statement with no effect [-Wunused-value]
    1286 | #define async_object_list_add(head, obj, idx)           0
         |                                                         ^
   fs/bcachefs/io_read.c:1220:17: note: in expansion of macro 'async_object_list_add'
    1220 |                 async_object_list_add(&c->rbio_list, rbio, &rbio->list_idx);
         |                 ^~~~~~~~~~~~~~~~~~~~~


vim +2115 fs/bcachefs/btree_io.c

  2075	
  2076	static void btree_node_write_work(struct work_struct *work)
  2077	{
  2078		struct btree_write_bio *wbio =
  2079			container_of(work, struct btree_write_bio, work);
  2080		struct bch_fs *c	= wbio->wbio.c;
  2081		struct btree *b		= wbio->wbio.bio.bi_private;
  2082		u64 start_time		= wbio->start_time;
  2083		int ret = 0;
  2084	
  2085		btree_bounce_free(c,
  2086			wbio->data_bytes,
  2087			wbio->wbio.used_mempool,
  2088			wbio->data);
  2089	
  2090		bch2_bkey_drop_ptrs(bkey_i_to_s(&wbio->key), ptr,
  2091			bch2_dev_list_has_dev(wbio->wbio.failed, ptr->dev));
  2092	
  2093		if (!bch2_bkey_nr_ptrs(bkey_i_to_s_c(&wbio->key))) {
  2094			ret = -BCH_ERR_btree_node_write_all_failed;
  2095			goto err;
  2096		}
  2097	
  2098		if (wbio->wbio.first_btree_write) {
  2099			if (wbio->wbio.failed.nr) {
  2100	
  2101			}
  2102		} else {
  2103			ret = bch2_trans_do(c,
  2104				bch2_btree_node_update_key_get_iter(trans, b, &wbio->key,
  2105						BCH_WATERMARK_interior_updates|
  2106						BCH_TRANS_COMMIT_journal_reclaim|
  2107						BCH_TRANS_COMMIT_no_enospc|
  2108						BCH_TRANS_COMMIT_no_check_rw,
  2109						!wbio->wbio.failed.nr));
  2110			if (ret)
  2111				goto err;
  2112		}
  2113	out:
  2114		async_object_list_del(&c->btree_write_bio_list, wbio->list_idx);
> 2115		wbio->list_idx = 0;
  2116		bio_put(&wbio->wbio.bio);
  2117		btree_node_write_done(c, b, start_time);
  2118		return;
  2119	err:
  2120		set_btree_node_noevict(b);
  2121	
  2122		if (!bch2_err_matches(ret, EROFS)) {
  2123			struct printbuf buf = PRINTBUF;
  2124			prt_printf(&buf, "writing btree node: %s\n  ", bch2_err_str(ret));
  2125			bch2_btree_pos_to_text(&buf, c, b);
  2126			bch2_fs_fatal_error(c, "%s", buf.buf);
  2127			printbuf_exit(&buf);
  2128		}
  2129		goto out;
  2130	}
  2131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
