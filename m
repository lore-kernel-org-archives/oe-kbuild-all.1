Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E92957C1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016913; cv=none; b=Bgim5m4irhhrnTk8x2AXf5b8jJxqrjTTh/PX9ZkbDghP4/Mrqt+XnCG1X45NhRiFfoBGElDNm9v00jjW4bJ453gWjXn5onMwiVbtJ9nHoEt1Hyd/BRQNv23pLzBg+AHFmOqnWRrSKdGziJ3sF+Dv1z/tvrWqy0t+08InCJRHbSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016913; c=relaxed/simple;
	bh=ccqYB3moyXSHuRmSk6nUOIehpTOU7Bgusnp6DQsyxag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d8BIY4rBVyWyAn20KgoNssOLvjFn5UCM0/XJaaxDxDztFTAEj1dGmgDDfnDnI2KACwl91ASwCNKRTYfPb7VaZ+6I0S02wWEGdzxHOFFDhNqNG/hQOd+Q7jbkIRuMk3KpXfxioRHcGR7iOBIY1p7ffCyorbm97eBEH5Lx3Pugyes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvvNiCBR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvvNiCBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748016912; x=1779552912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ccqYB3moyXSHuRmSk6nUOIehpTOU7Bgusnp6DQsyxag=;
  b=CvvNiCBRcgMCulstrVw4zClpWmjLgCivIMykdvI57kEIyJghL1mezotP
   YELyCyfLh7zqb1hYQ+28HYXKROZ7mswpBKcthPNOfvcnUGGHFC0iYRuaj
   sAArxPj2Hx6h8HGe7t7wtT/J3OUrCOMy0d2PSJU5j5S+yH6EMaNSPCt+0
   MDVCDTCnp/Ad8zGjI65wrmWFEtIoV/mucZZ1NeGR63TpCqw4fBvIMaoP+
   QB7mbv5fD7IkGpvPDiEhvEHXDJHpB6ywkm+1PTEH4fsWM2BJAjRJG7HZT
   N2u+Il9a6i+wb1lUnx4qe/sYGe+eSf1D8vSZeV4HTh9F5p4xgi6CJ5v07
   g==;
X-CSE-ConnectionGUID: 4crK3igdSbaXJ6kYjb2E5A==
X-CSE-MsgGUID: REgHbYPaQBWybBBDeZDNmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50075200"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="50075200"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 09:15:11 -0700
X-CSE-ConnectionGUID: /222zuOySGqT4H1iFwXHOw==
X-CSE-MsgGUID: LAymT71xRL+JM3gWhG7pIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="146176902"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2025 09:15:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIV36-000QZM-0G;
	Fri, 23 May 2025 16:15:08 +0000
Date: Sat, 24 May 2025 00:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 47/272] fs/bcachefs/fsck.c:2202:25:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202505240043.i8Z86QBJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   0ce02abdcc71ff27c3be49a4dc78d56c66c3a209
commit: 010c89468134d1991b87122379f86feae23d512f [47/272] bcachefs: Check for casefolded dirents in non casefolded dirs
config: sparc-randconfig-r112-20250523 (https://download.01.org/0day-ci/archive/20250524/202505240043.i8Z86QBJ-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 10.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250524/202505240043.i8Z86QBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240043.i8Z86QBJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/fsck.c: note: in included file:
   fs/bcachefs/bcachefs.h:1009:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/fsck.c:2202:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] subvol @@     got restricted __le32 @@
   fs/bcachefs/fsck.c:2202:25: sparse:     expected unsigned int [usertype] subvol
   fs/bcachefs/fsck.c:2202:25: sparse:     got restricted __le32
>> fs/bcachefs/fsck.c:2205:30: sparse: sparse: restricted __le32 degrades to integer
>> fs/bcachefs/fsck.c:2206:30: sparse: sparse: restricted __le64 degrades to integer

vim +2202 fs/bcachefs/fsck.c

  2131	
  2132	static int check_dirent(struct btree_trans *trans, struct btree_iter *iter,
  2133				struct bkey_s_c k,
  2134				struct bch_hash_info *hash_info,
  2135				struct inode_walker *dir,
  2136				struct inode_walker *target,
  2137				struct snapshots_seen *s)
  2138	{
  2139		struct bch_fs *c = trans->c;
  2140		struct inode_walker_entry *i;
  2141		struct printbuf buf = PRINTBUF;
  2142		int ret = 0;
  2143	
  2144		ret = bch2_check_key_has_snapshot(trans, iter, k);
  2145		if (ret) {
  2146			ret = ret < 0 ? ret : 0;
  2147			goto out;
  2148		}
  2149	
  2150		ret = snapshots_seen_update(c, s, iter->btree_id, k.k->p);
  2151		if (ret)
  2152			goto err;
  2153	
  2154		if (k.k->type == KEY_TYPE_whiteout)
  2155			goto out;
  2156	
  2157		if (dir->last_pos.inode != k.k->p.inode && dir->have_inodes) {
  2158			ret = check_subdir_dirents_count(trans, dir);
  2159			if (ret)
  2160				goto err;
  2161		}
  2162	
  2163		i = walk_inode(trans, dir, k);
  2164		ret = PTR_ERR_OR_ZERO(i);
  2165		if (ret < 0)
  2166			goto err;
  2167	
  2168		ret = check_key_has_inode(trans, iter, dir, i, k);
  2169		if (ret)
  2170			goto err;
  2171	
  2172		if (!i)
  2173			goto out;
  2174	
  2175		if (dir->first_this_inode)
  2176			*hash_info = bch2_hash_info_init(c, &i->inode);
  2177		dir->first_this_inode = false;
  2178	
  2179		ret = bch2_str_hash_check_key(trans, s, &bch2_dirent_hash_desc, hash_info, iter, k);
  2180		if (ret < 0)
  2181			goto err;
  2182		if (ret) {
  2183			/* dirent has been deleted */
  2184			ret = 0;
  2185			goto out;
  2186		}
  2187	
  2188		if (k.k->type != KEY_TYPE_dirent)
  2189			goto out;
  2190	
  2191		struct bkey_s_c_dirent d = bkey_s_c_to_dirent(k);
  2192	
  2193		/* check casefold */
  2194		if (fsck_err_on(d.v->d_casefold != !!hash_info->cf_encoding,
  2195				trans, dirent_casefold_mismatch,
  2196				"dirent casefold does not match dir casefold\n%s",
  2197				(printbuf_reset(&buf),
  2198				 bch2_bkey_val_to_text(&buf, c, k),
  2199				 buf.buf))) {
  2200			struct qstr name = bch2_dirent_get_name(d);
  2201			u32 subvol = d.v->d_type == DT_SUBVOL
> 2202				? d.v->d_parent_subvol
  2203				: 0;
  2204			u64 target = d.v->d_type == DT_SUBVOL
> 2205				? d.v->d_child_subvol
> 2206				: d.v->d_inum;
  2207			u64 dir_offset;
  2208	
  2209			ret =   bch2_hash_delete_at(trans,
  2210						    bch2_dirent_hash_desc, hash_info, iter,
  2211						    BTREE_UPDATE_internal_snapshot_node) ?:
  2212				bch2_dirent_create_snapshot(trans, subvol,
  2213							    d.k->p.inode, d.k->p.snapshot,
  2214							    hash_info,
  2215							    d.v->d_type,
  2216							    &name,
  2217							    target,
  2218							    &dir_offset,
  2219							    BTREE_ITER_with_updates|
  2220							    BTREE_UPDATE_internal_snapshot_node|
  2221							    STR_HASH_must_create) ?:
  2222				bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc);
  2223	
  2224			/* might need another check_dirents pass */
  2225			goto out;
  2226		}
  2227	
  2228		if (d.v->d_type == DT_SUBVOL) {
  2229			ret = check_dirent_to_subvol(trans, iter, d);
  2230			if (ret)
  2231				goto err;
  2232		} else {
  2233			ret = get_visible_inodes(trans, target, s, le64_to_cpu(d.v->d_inum));
  2234			if (ret)
  2235				goto err;
  2236	
  2237			if (fsck_err_on(!target->inodes.nr,
  2238					trans, dirent_to_missing_inode,
  2239					"dirent points to missing inode:\n%s",
  2240					(printbuf_reset(&buf),
  2241					 bch2_bkey_val_to_text(&buf, c, k),
  2242					 buf.buf))) {
  2243				ret = bch2_fsck_remove_dirent(trans, d.k->p);
  2244				if (ret)
  2245					goto err;
  2246			}
  2247	
  2248			darray_for_each(target->inodes, i) {
  2249				ret = bch2_check_dirent_target(trans, iter, d, &i->inode, true);
  2250				if (ret)
  2251					goto err;
  2252			}
  2253	
  2254			darray_for_each(target->deletes, i)
  2255				if (fsck_err_on(!snapshot_list_has_id(&s->ids, *i),
  2256						trans, dirent_to_overwritten_inode,
  2257						"dirent points to inode overwritten in snapshot %u:\n%s",
  2258						*i,
  2259						(printbuf_reset(&buf),
  2260						 bch2_bkey_val_to_text(&buf, c, k),
  2261						 buf.buf))) {
  2262					struct btree_iter delete_iter;
  2263					bch2_trans_iter_init(trans, &delete_iter,
  2264							     BTREE_ID_dirents,
  2265							     SPOS(k.k->p.inode, k.k->p.offset, *i),
  2266							     BTREE_ITER_intent);
  2267					ret =   bch2_btree_iter_traverse(trans, &delete_iter) ?:
  2268						bch2_hash_delete_at(trans, bch2_dirent_hash_desc,
  2269								  hash_info,
  2270								  &delete_iter,
  2271								  BTREE_UPDATE_internal_snapshot_node);
  2272					bch2_trans_iter_exit(trans, &delete_iter);
  2273					if (ret)
  2274						goto err;
  2275	
  2276				}
  2277		}
  2278	
  2279		ret = bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc);
  2280		if (ret)
  2281			goto err;
  2282	
  2283		for_each_visible_inode(c, s, dir, d.k->p.snapshot, i) {
  2284			if (d.v->d_type == DT_DIR)
  2285				i->count++;
  2286			i->i_size += bkey_bytes(d.k);
  2287		}
  2288	out:
  2289	err:
  2290	fsck_err:
  2291		printbuf_exit(&buf);
  2292		bch_err_fn(c, ret);
  2293		return ret;
  2294	}
  2295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
