Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA346182B4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 15:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729955411; cv=none; b=P7FGZ3GjwrThKWwxB6YOvIO63ZI2Ptvj91Bd1ji2H/SjqqReJpiBxclTvbfL7g2u5qFNxKMrgW2tN6SDXjf6Ng3wkf7kXByGBnwq3ja8vJNXrtvkrdlw1jWk26xQ9yMy5BpSXHohLE5o25Wzr/U8HO2LFBwsY9fP2Z+vLkteNSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729955411; c=relaxed/simple;
	bh=HvuknarB5xVbprVOP4n37pFfgExdb8oPtxha4iNy7/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sdQVsQk/6okFz6d1zdgHpomaA9v2k42FyBqtfcH2Gu3OzKeS1eCQ4taztNcn70hhroB2SObp2rdb/YTcSnj92aeCnHpipAfEzCVb9h7/987t3FC1agrXm9fobX+QrvET+08ObE9yZg4UQj0cgzPsiZZ97QBwSlObBp42JVL9QhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OapffFce; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OapffFce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729955408; x=1761491408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HvuknarB5xVbprVOP4n37pFfgExdb8oPtxha4iNy7/o=;
  b=OapffFce0HjJX0X03MmY3LgnRMSZ/grcekd11NSBJqsEjBLSOGFu0QfA
   +kULU92Y1LzwsrrjEJ05IbRHBfvMpIWg5NJWdf+3kae5um4RxQLBnr1r8
   NH7cmj7iFDCrEz8K0OmVk6/xh/aoLxcjqUUZR+VLBLEfDYaB7fj2kP5Wp
   kdCnYGPLt6U6akQbf404Pi9UMtoeS3Cp7FNqCrsJpoB9rAzhulUblSz8x
   0ogN4E/Gycfqf/Erhk7/bRomevzBjW0OC9Faa2I6C7M5vS/4BVLbCVsE0
   VRrYylcjMVpiQOjPqGAy1udOreoDeVejkILRpv0BS2CryKTVSSo1/swvh
   A==;
X-CSE-ConnectionGUID: nlvcrLlIQ2Oji9TQvtkJkA==
X-CSE-MsgGUID: IGDLlLd8SSypb4R1154n5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="29714471"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="29714471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 08:10:08 -0700
X-CSE-ConnectionGUID: Jgx6/H4qTBONeE1tdrkR4w==
X-CSE-MsgGUID: 0+4mQDbqQOWWScWTYfbNXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="81655488"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Oct 2024 08:10:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4iQX-000ZlA-0A;
	Sat, 26 Oct 2024 15:10:05 +0000
Date: Sat, 26 Oct 2024 23:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 10/10] fs/nfsd/filecache.c:1295:
 warning: Function parameter or struct member 'inode_keyp' not described in
 'nfsd_file_acquire_cached'
Message-ID: <202410262335.BStq9dKz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   3a235de0be361b80d2689bfb42e3da7b71840e5b
commit: 3a235de0be361b80d2689bfb42e3da7b71840e5b [10/10] nfsd/filecache: add nfsd_file_acquire_gc_cached
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241026/202410262335.BStq9dKz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410262335.BStq9dKz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410262335.BStq9dKz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/filecache.c:1295: warning: Function parameter or struct member 'inode_keyp' not described in 'nfsd_file_acquire_cached'
>> fs/nfsd/filecache.c:1295: warning: Excess function parameter 'inode_key' description in 'nfsd_file_acquire_cached'


vim +1295 fs/nfsd/filecache.c

  1266	
  1267	/**
  1268	 * nfsd_file_acquire_cached - Get cached GC'd open file using inode
  1269	 * @net: The network namespace in which to perform a lookup
  1270	 * @cred: the user credential with which to validate access
  1271	 * @inode_key: inode to use as opaque lookup key
  1272	 * @may_flags: NFSD_MAY_ settings for the file
  1273	 * @pnf: OUT: found cached GC'd "struct nfsd_file" object
  1274	 *
  1275	 * Rather than make nfsd_file_do_acquire more complex (by training
  1276	 * it to conditionally skip fh_verify(), nfsd_file allocation and
  1277	 * contruction) duplicate the minimalist subset of it that is
  1278	 * needed to achieve nfsd_file lookup using the opaque @inode_key.
  1279	 *
  1280	 * The nfsd_file object returned by this API is reference-counted
  1281	 * and garbage-collected. The object is retained for a few
  1282	 * seconds after the final nfsd_file_put() in case the caller
  1283	 * wants to re-use it.
  1284	 *
  1285	 * Return values:
  1286	 *   %nfs_ok - @pnf points to an nfsd_file with its reference
  1287	 *   count boosted.
  1288	 *
  1289	 * On error, an nfsstat value in network byte order is returned.
  1290	 */
  1291	__be32
  1292	nfsd_file_acquire_cached(struct net *net, const struct cred *cred,
  1293				 void **inode_keyp, unsigned int may_flags,
  1294				 struct nfsd_file **pnf)
> 1295	{
  1296		unsigned char need = may_flags & NFSD_FILE_MAY_MASK;
  1297		void *inode_key;
  1298		struct nfsd_file *nf;
  1299		__be32 status;
  1300	
  1301		rcu_read_lock();
  1302		inode_key = READ_ONCE(*inode_keyp);
  1303		if (!inode_key) {
  1304			rcu_read_unlock();
  1305			return nfserr_noent;
  1306		}
  1307		nf = nfsd_file_lookup_locked(net, cred, inode_key, need, true);
  1308		if (unlikely(!nf)) {
  1309			*inode_keyp = NULL;
  1310			rcu_read_unlock();
  1311			return nfserr_noent;
  1312		}
  1313		rcu_read_unlock();
  1314	
  1315		/*
  1316		 * If the nf is on the LRU then it holds an extra reference
  1317		 * that must be put if it's removed. It had better not be
  1318		 * the last one however, since we should hold another.
  1319		 */
  1320		if (nfsd_file_lru_remove(nf))
  1321			WARN_ON_ONCE(refcount_dec_and_test(&nf->nf_ref));
  1322	
  1323		if (test_bit(NFSD_FILE_PENDING, &nf->nf_flags) ||
  1324		    !test_bit(NFSD_FILE_HASHED, &nf->nf_flags)) {
  1325			status = nfserr_inval;
  1326			goto error;
  1327		}
  1328		this_cpu_inc(nfsd_file_cache_hits);
  1329	
  1330		status = nfserrno(nfsd_open_break_lease(file_inode(nf->nf_file), may_flags));
  1331		if (status != nfs_ok) {
  1332	error:
  1333			nfsd_file_put(nf);
  1334			nf = NULL;
  1335		} else {
  1336			this_cpu_inc(nfsd_file_acquisitions);
  1337			nfsd_file_check_write_error(nf);
  1338			*pnf = nf;
  1339		}
  1340		trace_nfsd_file_acquire(NULL, inode_key, may_flags, nf, status);
  1341		return status;
  1342	}
  1343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
