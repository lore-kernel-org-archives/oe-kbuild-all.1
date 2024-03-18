Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14F71EF0D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 04:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710734991; cv=none; b=kkJprdgxxtFTOEkRquMsatsQIv3YGfMznlQFcVC6RWcEd9qMk29RvWnOwL21tWtKSs5IeWxaLNjG6K14GFtblz+ifpmULfQwsi9/nqlrwRuog3vMkb2ZWj2DFpymIf6IxvLQx4t9zPkqt+D8yeHCc9iOOqcSEn0caXf3u989Zp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710734991; c=relaxed/simple;
	bh=y+g2O89siaBhy/z85D2CrmlgBrHmASxJgSnbfieQZWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BS9WWFuuTHTWMbSF2OQl0bqIAS9NcKp1aH+0eWgluiUKlfMHvGDp0CwEi35jCmCzFCZH5KR54Ta5ZmPVqZyKURRZAgRWnamLVH/PkljrCFBR/LOwtJOEUuxGmsZw+q5CjTgcBwqPL3ybcSSgZzxy6+BN6Z8xUN1ci2E/ieqG9rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkGainIE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkGainIE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710734989; x=1742270989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y+g2O89siaBhy/z85D2CrmlgBrHmASxJgSnbfieQZWM=;
  b=LkGainIE69wZkRFre9ph50NrTwvHUHsO4AXg7rhnv4AZQ/T0Rau5gq1t
   zFH8SYlC18W3fEBowct5P9tzUOsVdmZiRdYITyuLFrcVB9NfSeW8gWr/s
   qrbPYxBO7mIqAIq4kNdMqeV9eUdj+95AIpi/ftA/PckpNgCJxMoi3nHhW
   liA4o1YHqzMIXdIHd1tY2284OIvKwnkzrrjDqZW6gbVM/ygzn0x83zFfp
   cbAdTQmEJvur49Ro59de9JBHD2Ytgjhxt1xdhKWahGjn0rWtMbRK6Y9su
   SiSXBkMh+XaQm+xVPT08hw+yRPn5m8nQQE7eNcqf7rYk/M5v7joSsu5Hx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5405644"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5405644"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 21:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="13262554"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2024 21:09:48 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rm4Jk-000GdH-1b;
	Mon, 18 Mar 2024 04:09:44 +0000
Date: Mon, 18 Mar 2024 12:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:twf-hoist 580/618] fs/xfs/scrub/attr.c:309:17: error:
 too many arguments to function 'xchk_xattr_verity'
Message-ID: <202403181214.kGghaTj0-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-003-20240318 (https://download.01.org/0day-ci/archive/20240318/202403181214.kGghaTj0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403181214.kGghaTj0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403181214.kGghaTj0-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/attr.c: In function 'xchk_xattr_actor':
>> fs/xfs/scrub/attr.c:309:17: error: too many arguments to function 'xchk_xattr_verity'
     309 |                 xchk_xattr_verity(sc, args.blkno, name, namelen, valuelen);
         |                 ^~~~~~~~~~~~~~~~~
   fs/xfs/scrub/attr.c:232:1: note: declared here
     232 | xchk_xattr_verity(
         | ^~~~~~~~~~~~~~~~~


vim +/xchk_xattr_verity +309 fs/xfs/scrub/attr.c

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
