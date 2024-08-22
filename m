Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736A96E611
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724357167; cv=none; b=QV8w+qNW2+jerVK0BmEzRGxk+jhKGoD8X6K+hCkHqcU63tDTbxTDYvZC+/Are06Y9sFTjftDbszU5G6VslMsS22ds0SOcP7mBbc2A+GSGF/w3HZaC1HR9lJ/ZNfJheIRq2ALzXl7GXQhLG/EcPWF/tA6B5Hed8fMOsoUvpq72oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724357167; c=relaxed/simple;
	bh=U13I53TlM2aCeJFGilAUnrE7sQ2p1kTqE7jw5+pJOSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nWfdiNl3HTWIQmsERbOgLW6VG2arErt5aaee0gSWbKnEwKnxUFp5K8HqhvJ7ca/UWce48Ps+NCmU4hQNfAznzSilUZd18PXesw2IhPRawWDpLN3i8g3epfSPCpzp7VhJ6qZUcrKINGKOmq77zN2DUE+xwZGWTe5zuXeHi8SuWrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEr6z+Kk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEr6z+Kk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724357164; x=1755893164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U13I53TlM2aCeJFGilAUnrE7sQ2p1kTqE7jw5+pJOSY=;
  b=KEr6z+KkA2dXNnurO44bZVVMnJO0OdU5PbEHLOvHCKJhm324NGQW1IbV
   fdxaxecIqx4rFe9RTkwuQw5ETE8KyxwOy5vg7Wv5qf/pBj61AC/Yb/7vH
   W+butsnnnsOfvfYYRThEo6y2UoSs8t74EqrI0Brrr6ckGAK4t0IFrpilM
   TyymCVmaqrtC7+kvMY0sa0F4Jb1hMbtxvF7cewCJ1uc/XkT7nqxlvYUnj
   LGoazkv98g/gk/X2DIFcqOcitmO4MbvVVrWdTDrwcebL0vaEkmmIRvhUN
   4JmoSALMlqCSNPvHtvrkG0O72t03YB8zoyjG7CpPP1uouj/YetaAyXAyd
   g==;
X-CSE-ConnectionGUID: 4avFb21zQma9SmRyXxX6lA==
X-CSE-MsgGUID: buDkC24dSBCa4PKVkL+8kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34180830"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="34180830"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 13:06:03 -0700
X-CSE-ConnectionGUID: emJ1Z6WfRp+f06LbUJtVVw==
X-CSE-MsgGUID: FKpOC1Y0TEiD9xPmeYZUrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="61701494"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Aug 2024 13:06:01 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shE4F-000DAK-1e;
	Thu, 22 Aug 2024 20:05:59 +0000
Date: Fri, 23 Aug 2024 04:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 46/47] fs/btrfs/file.c:2407:13: error:
 'skip_ilock' undeclared; did you mean 'spin_lock'?
Message-ID: <202408230447.yzRGPEUQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   ae30386317f21239fb5c3828122ffd6cec6c9b21
commit: 29349f0a02fdd1b1d14abb4b4dc53bed974b7d55 [46/47] UPSTREAM: btrfs: fix double inode unlock for direct IO sync writes
config: arm-randconfig-001-20240823 (https://download.01.org/0day-ci/archive/20240823/202408230447.yzRGPEUQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230447.yzRGPEUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230447.yzRGPEUQ-lkp@intel.com/

Note: the chrome-os/chromeos-5.15 HEAD ae30386317f21239fb5c3828122ffd6cec6c9b21 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/btrfs/file.c: In function 'btrfs_sync_file':
>> fs/btrfs/file.c:2407:13: error: 'skip_ilock' undeclared (first use in this function); did you mean 'spin_lock'?
    2407 |         if (skip_ilock)
         |             ^~~~~~~~~~
         |             spin_lock
   fs/btrfs/file.c:2407:13: note: each undeclared identifier is reported only once for each function it appears in
>> fs/btrfs/file.c:2408:32: error: 'struct inode' has no member named 'i_mmap_lock'
    2408 |                 up_write(&inode->i_mmap_lock);
         |                                ^~


vim +2407 fs/btrfs/file.c

  2166	
  2167	/*
  2168	 * fsync call for both files and directories.  This logs the inode into
  2169	 * the tree log instead of forcing full commits whenever possible.
  2170	 *
  2171	 * It needs to call filemap_fdatawait so that all ordered extent updates are
  2172	 * in the metadata btree are up to date for copying to the log.
  2173	 *
  2174	 * It drops the inode mutex before doing the tree log commit.  This is an
  2175	 * important optimization for directories because holding the mutex prevents
  2176	 * new operations on the dir while we write to disk.
  2177	 */
  2178	int btrfs_sync_file(struct file *file, loff_t start, loff_t end, int datasync)
  2179	{
  2180		struct dentry *dentry = file_dentry(file);
  2181		struct inode *inode = d_inode(dentry);
  2182		struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  2183		struct btrfs_root *root = BTRFS_I(inode)->root;
  2184		struct btrfs_trans_handle *trans;
  2185		struct btrfs_log_ctx ctx;
  2186		int ret = 0, err;
  2187		u64 len;
  2188		bool full_sync;
  2189	
  2190		trace_btrfs_sync_file(file, datasync);
  2191	
  2192		btrfs_init_log_ctx(&ctx, inode);
  2193	
  2194		/*
  2195		 * Always set the range to a full range, otherwise we can get into
  2196		 * several problems, from missing file extent items to represent holes
  2197		 * when not using the NO_HOLES feature, to log tree corruption due to
  2198		 * races between hole detection during logging and completion of ordered
  2199		 * extents outside the range, to missing checksums due to ordered extents
  2200		 * for which we flushed only a subset of their pages.
  2201		 */
  2202		start = 0;
  2203		end = LLONG_MAX;
  2204		len = (u64)LLONG_MAX + 1;
  2205	
  2206		/*
  2207		 * We write the dirty pages in the range and wait until they complete
  2208		 * out of the ->i_mutex. If so, we can flush the dirty pages by
  2209		 * multi-task, and make the performance up.  See
  2210		 * btrfs_wait_ordered_range for an explanation of the ASYNC check.
  2211		 */
  2212		ret = start_ordered_ops(inode, start, end);
  2213		if (ret)
  2214			goto out;
  2215	
  2216		btrfs_inode_lock(inode, BTRFS_ILOCK_MMAP);
  2217	
  2218		atomic_inc(&root->log_batch);
  2219	
  2220		/*
  2221		 * Always check for the full sync flag while holding the inode's lock,
  2222		 * to avoid races with other tasks. The flag must be either set all the
  2223		 * time during logging or always off all the time while logging.
  2224		 */
  2225		full_sync = test_bit(BTRFS_INODE_NEEDS_FULL_SYNC,
  2226				     &BTRFS_I(inode)->runtime_flags);
  2227	
  2228		/*
  2229		 * Before we acquired the inode's lock and the mmap lock, someone may
  2230		 * have dirtied more pages in the target range. We need to make sure
  2231		 * that writeback for any such pages does not start while we are logging
  2232		 * the inode, because if it does, any of the following might happen when
  2233		 * we are not doing a full inode sync:
  2234		 *
  2235		 * 1) We log an extent after its writeback finishes but before its
  2236		 *    checksums are added to the csum tree, leading to -EIO errors
  2237		 *    when attempting to read the extent after a log replay.
  2238		 *
  2239		 * 2) We can end up logging an extent before its writeback finishes.
  2240		 *    Therefore after the log replay we will have a file extent item
  2241		 *    pointing to an unwritten extent (and no data checksums as well).
  2242		 *
  2243		 * So trigger writeback for any eventual new dirty pages and then we
  2244		 * wait for all ordered extents to complete below.
  2245		 */
  2246		ret = start_ordered_ops(inode, start, end);
  2247		if (ret) {
  2248			btrfs_inode_unlock(inode, BTRFS_ILOCK_MMAP);
  2249			goto out;
  2250		}
  2251	
  2252		/*
  2253		 * We have to do this here to avoid the priority inversion of waiting on
  2254		 * IO of a lower priority task while holding a transaction open.
  2255		 *
  2256		 * For a full fsync we wait for the ordered extents to complete while
  2257		 * for a fast fsync we wait just for writeback to complete, and then
  2258		 * attach the ordered extents to the transaction so that a transaction
  2259		 * commit waits for their completion, to avoid data loss if we fsync,
  2260		 * the current transaction commits before the ordered extents complete
  2261		 * and a power failure happens right after that.
  2262		 *
  2263		 * For zoned filesystem, if a write IO uses a ZONE_APPEND command, the
  2264		 * logical address recorded in the ordered extent may change. We need
  2265		 * to wait for the IO to stabilize the logical address.
  2266		 */
  2267		if (full_sync || btrfs_is_zoned(fs_info)) {
  2268			ret = btrfs_wait_ordered_range(inode, start, len);
  2269		} else {
  2270			/*
  2271			 * Get our ordered extents as soon as possible to avoid doing
  2272			 * checksum lookups in the csum tree, and use instead the
  2273			 * checksums attached to the ordered extents.
  2274			 */
  2275			btrfs_get_ordered_extents_for_logging(BTRFS_I(inode),
  2276							      &ctx.ordered_extents);
  2277			ret = filemap_fdatawait_range(inode->i_mapping, start, end);
  2278		}
  2279	
  2280		if (ret)
  2281			goto out_release_extents;
  2282	
  2283		atomic_inc(&root->log_batch);
  2284	
  2285		smp_mb();
  2286		if (skip_inode_logging(&ctx)) {
  2287			/*
  2288			 * We've had everything committed since the last time we were
  2289			 * modified so clear this flag in case it was set for whatever
  2290			 * reason, it's no longer relevant.
  2291			 */
  2292			clear_bit(BTRFS_INODE_NEEDS_FULL_SYNC,
  2293				  &BTRFS_I(inode)->runtime_flags);
  2294			/*
  2295			 * An ordered extent might have started before and completed
  2296			 * already with io errors, in which case the inode was not
  2297			 * updated and we end up here. So check the inode's mapping
  2298			 * for any errors that might have happened since we last
  2299			 * checked called fsync.
  2300			 */
  2301			ret = filemap_check_wb_err(inode->i_mapping, file->f_wb_err);
  2302			goto out_release_extents;
  2303		}
  2304	
  2305		/*
  2306		 * We use start here because we will need to wait on the IO to complete
  2307		 * in btrfs_sync_log, which could require joining a transaction (for
  2308		 * example checking cross references in the nocow path).  If we use join
  2309		 * here we could get into a situation where we're waiting on IO to
  2310		 * happen that is blocked on a transaction trying to commit.  With start
  2311		 * we inc the extwriter counter, so we wait for all extwriters to exit
  2312		 * before we start blocking joiners.  This comment is to keep somebody
  2313		 * from thinking they are super smart and changing this to
  2314		 * btrfs_join_transaction *cough*Josef*cough*.
  2315		 */
  2316		trans = btrfs_start_transaction(root, 0);
  2317		if (IS_ERR(trans)) {
  2318			ret = PTR_ERR(trans);
  2319			goto out_release_extents;
  2320		}
  2321		trans->in_fsync = true;
  2322	
  2323		ret = btrfs_log_dentry_safe(trans, dentry, &ctx);
  2324		btrfs_release_log_ctx_extents(&ctx);
  2325		if (ret < 0) {
  2326			/* Fallthrough and commit/free transaction. */
  2327			ret = 1;
  2328		}
  2329	
  2330		/* we've logged all the items and now have a consistent
  2331		 * version of the file in the log.  It is possible that
  2332		 * someone will come in and modify the file, but that's
  2333		 * fine because the log is consistent on disk, and we
  2334		 * have references to all of the file's extents
  2335		 *
  2336		 * It is possible that someone will come in and log the
  2337		 * file again, but that will end up using the synchronization
  2338		 * inside btrfs_sync_log to keep things safe.
  2339		 */
  2340		btrfs_inode_unlock(inode, BTRFS_ILOCK_MMAP);
  2341	
  2342		if (ret == BTRFS_NO_LOG_SYNC) {
  2343			ret = btrfs_end_transaction(trans);
  2344			goto out;
  2345		}
  2346	
  2347		/* We successfully logged the inode, attempt to sync the log. */
  2348		if (!ret) {
  2349			ret = btrfs_sync_log(trans, root, &ctx);
  2350			if (!ret) {
  2351				ret = btrfs_end_transaction(trans);
  2352				goto out;
  2353			}
  2354		}
  2355	
  2356		/*
  2357		 * At this point we need to commit the transaction because we had
  2358		 * btrfs_need_log_full_commit() or some other error.
  2359		 *
  2360		 * If we didn't do a full sync we have to stop the trans handle, wait on
  2361		 * the ordered extents, start it again and commit the transaction.  If
  2362		 * we attempt to wait on the ordered extents here we could deadlock with
  2363		 * something like fallocate() that is holding the extent lock trying to
  2364		 * start a transaction while some other thread is trying to commit the
  2365		 * transaction while we (fsync) are currently holding the transaction
  2366		 * open.
  2367		 */
  2368		if (!full_sync) {
  2369			ret = btrfs_end_transaction(trans);
  2370			if (ret)
  2371				goto out;
  2372			ret = btrfs_wait_ordered_range(inode, start, len);
  2373			if (ret)
  2374				goto out;
  2375	
  2376			/*
  2377			 * This is safe to use here because we're only interested in
  2378			 * making sure the transaction that had the ordered extents is
  2379			 * committed.  We aren't waiting on anything past this point,
  2380			 * we're purely getting the transaction and committing it.
  2381			 */
  2382			trans = btrfs_attach_transaction_barrier(root);
  2383			if (IS_ERR(trans)) {
  2384				ret = PTR_ERR(trans);
  2385	
  2386				/*
  2387				 * We committed the transaction and there's no currently
  2388				 * running transaction, this means everything we care
  2389				 * about made it to disk and we are done.
  2390				 */
  2391				if (ret == -ENOENT)
  2392					ret = 0;
  2393				goto out;
  2394			}
  2395		}
  2396	
  2397		ret = btrfs_commit_transaction(trans);
  2398	out:
  2399		ASSERT(list_empty(&ctx.list));
  2400		err = file_check_and_advance_wb_err(file);
  2401		if (!ret)
  2402			ret = err;
  2403		return ret > 0 ? -EIO : ret;
  2404	
  2405	out_release_extents:
  2406		btrfs_release_log_ctx_extents(&ctx);
> 2407		if (skip_ilock)
> 2408			up_write(&inode->i_mmap_lock);
  2409		else
  2410			btrfs_inode_unlock(inode, BTRFS_ILOCK_MMAP);
  2411		goto out;
  2412	}
  2413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
