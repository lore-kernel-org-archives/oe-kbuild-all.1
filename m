Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAB1200D5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 04:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710734993; cv=none; b=o9Lh5oV/eZnRBpeWHGMeoamUcRYy0pjX9O9HnINQZoTyEv5ZeSIJVvIQEoKhJrdLTKPd0D+BKfb9ysWbh/pLdoSOiJ3p86ctmShMU1ZYkqKQ7Qsv26B+wqNhgJO4Qg14NJSeNsB9VoFEVS8ZDofP+2MMOTu6TVrVz70lPPIkUTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710734993; c=relaxed/simple;
	bh=pJVOD09IFpbi3LLH6wQVwqhcuiDckKhPQhpcPmdvIYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ca6r4xOX+oSBke88GFSqGbRZzR6V5P1IbRefJjuPtwXmeKUNwlFMHMmt1GzLJLm+YZ/W2qdUfclptJPVir+IdbMaiqrKDcfnBIIj9L9yGnm8+gLq3Ep12UagOWEsUm56i2VPA0xGcmboqAFMu3H4HpE1lqLlNjl/ThhKpPuiULw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixahqaxN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixahqaxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710734991; x=1742270991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJVOD09IFpbi3LLH6wQVwqhcuiDckKhPQhpcPmdvIYg=;
  b=ixahqaxN7xULV0lgXaNl8XgUxn0GO0+n74UWYehl7n3NuatyGEtPr2XO
   S4knvWnX2o5kiqCKO98TieGxQccSc1ifOieXLjurPlKpv8BcMa8xfl2tg
   NdU4fn8VrsRHq0UMKOQM56AQwmmYcqjaYs/KT6LgqwNKlpccccApOh8ab
   K0bglzi8Ze+GsdpWhuklHfqkIYRYKnN1jjDuNCsiYVDM9xpNrFc6MYdOW
   Li42EcM2yJd199Rh15EcLI5Y01f4HMoB2SiKNgZKrkUubVW9LlmxHT+H2
   b3HzA8u6mStNRr7Hwas/p70kcvoAqAXRHknrdeNMxLOE53Mrp+NfygOnD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5405646"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5405646"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 21:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="13262555"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2024 21:09:48 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rm4Jk-000GdJ-1h;
	Mon, 18 Mar 2024 04:09:44 +0000
Date: Mon, 18 Mar 2024 12:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:twf-hoist 580/618] fs/xfs/scrub/attr.c:309:52: error:
 too many arguments to function call, expected 4, have 5
Message-ID: <202403181236.OM1hV5DN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git twf-hoist
head:   4ff673321ea82e29e235e43dd6db0941b90a061f
commit: f9b03bfc5858810a62bc79cae46a9208a5ccc28a [580/618] xfs: teach online repair to evaluate fsverity xattrs
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240318/202403181236.OM1hV5DN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403181236.OM1hV5DN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403181236.OM1hV5DN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/scrub/attr.c:309:52: error: too many arguments to function call, expected 4, have 5
     309 |                 xchk_xattr_verity(sc, args.blkno, name, namelen, valuelen);
         |                 ~~~~~~~~~~~~~~~~~                                ^~~~~~~~
   fs/xfs/scrub/attr.c:232:1: note: 'xchk_xattr_verity' declared here
     232 | xchk_xattr_verity(
         | ^
     233 |         struct xfs_scrub        *sc,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     234 |         xfs_dablk_t             blkno,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     235 |         const unsigned char     *name,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     236 |         unsigned int            namelen)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +309 fs/xfs/scrub/attr.c

   244	
   245	/*
   246	 * Check that an extended attribute key can be looked up by hash.
   247	 *
   248	 * We use the extended attribute walk helper to call this function for every
   249	 * attribute key in an inode.  Once we're here, we load the attribute value to
   250	 * see if any errors happen, or if we get more or less data than we expected.
   251	 */
   252	static int
   253	xchk_xattr_actor(
   254		struct xfs_scrub	*sc,
   255		struct xfs_inode	*ip,
   256		unsigned int		attr_flags,
   257		const unsigned char	*name,
   258		unsigned int		namelen,
   259		const void		*value,
   260		unsigned int		valuelen,
   261		void			*priv)
   262	{
   263		struct xfs_da_args		args = {
   264			.op_flags		= XFS_DA_OP_NOTIME,
   265			.attr_filter		= attr_flags & XFS_ATTR_NSP_ONDISK_MASK,
   266			.geo			= sc->mp->m_attr_geo,
   267			.whichfork		= XFS_ATTR_FORK,
   268			.dp			= ip,
   269			.name			= name,
   270			.namelen		= namelen,
   271			.hashval		= xfs_da_hashname(name, namelen),
   272			.trans			= sc->tp,
   273			.valuelen		= valuelen,
   274			.owner			= ip->i_ino,
   275		};
   276		struct xchk_xattr_buf		*ab;
   277		int				error = 0;
   278	
   279		ab = sc->buf;
   280	
   281		if (xchk_should_terminate(sc, &error))
   282			return error;
   283	
   284		if (attr_flags & XFS_ATTR_INCOMPLETE) {
   285			/* Incomplete attr key, just mark the inode for preening. */
   286			xchk_ino_set_preen(sc, ip->i_ino);
   287			return 0;
   288		}
   289	
   290		/* Only one namespace bit allowed. */
   291		if (hweight32(attr_flags & XFS_ATTR_NSP_ONDISK_MASK) > 1) {
   292			xchk_fblock_set_corrupt(sc, XFS_ATTR_FORK, args.blkno);
   293			return -ECANCELED;
   294		}
   295	
   296		/* Check parent pointer geometry. */
   297		if (attr_flags & XFS_ATTR_PARENT) {
   298			if (!xfs_has_parent(sc->mp)) {
   299				xchk_fblock_set_corrupt(sc, XFS_ATTR_FORK, args.blkno);
   300				return -ECANCELED;
   301			}
   302	
   303			if (!xfs_parent_valuecheck(sc->mp, value, valuelen)) {
   304				xchk_fblock_set_corrupt(sc, XFS_ATTR_FORK, args.blkno);
   305				return -ECANCELED;
   306			}
   307		} else if (attr_flags & XFS_ATTR_VERITY) {
   308			/* Check verity xattr geometry */
 > 309			xchk_xattr_verity(sc, args.blkno, name, namelen, valuelen);
   310			if (sc->sm->sm_flags & XFS_SCRUB_OFLAG_CORRUPT)
   311				return -ECANCELED;
   312		}
   313	
   314		/* Does this name make sense? */
   315		if (!xfs_attr_namecheck(sc->mp, name, namelen, attr_flags)) {
   316			xchk_fblock_set_corrupt(sc, XFS_ATTR_FORK, args.blkno);
   317			return -ECANCELED;
   318		}
   319	
   320		/*
   321		 * Local and shortform xattr values are stored in the attr leaf block,
   322		 * so we don't need to retrieve the value from a remote block to detect
   323		 * corruption problems.
   324		 */
   325		if (value)
   326			return 0;
   327	
   328		/*
   329		 * Try to allocate enough memory to extract the attr value.  If that
   330		 * doesn't work, return -EDEADLOCK as a signal to try again with a
   331		 * maximally sized buffer.
   332		 */
   333		error = xchk_setup_xattr_buf(sc, valuelen);
   334		if (error == -ENOMEM)
   335			error = -EDEADLOCK;
   336		if (error)
   337			return error;
   338	
   339		args.value = ab->value;
   340	
   341		error = xfs_attr_get_ilocked(&args);
   342		/* ENODATA means the hash lookup failed and the attr is bad */
   343		if (error == -ENODATA)
   344			error = -EFSCORRUPTED;
   345		if (!xchk_fblock_process_error(sc, XFS_ATTR_FORK, args.blkno,
   346				&error))
   347			return error;
   348		if (args.valuelen != valuelen)
   349			xchk_fblock_set_corrupt(sc, XFS_ATTR_FORK, args.blkno);
   350	
   351		return 0;
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
