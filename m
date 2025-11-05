Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36762F56
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762349027; cv=none; b=M6pEssqdBXs8+iiZZU7hmrtDtxVSkKFcQeQBbtifnREPEVzV8Y6S7ydZeDXqp0C+6oAf6BKO5Nk0uwS2Zt6H/Jzjl5Oik3FNJeB7zIR8ZmiTgMtxvBjI3xguBFAvZyOvzEZ7PF7MuRWxE/QgTFeBA3jp65C6yk4eZ+4lGoFHR90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762349027; c=relaxed/simple;
	bh=RqUG1tqNQAj4YhqR4DyVuJtMSIP/u2bEZW1sUj0zNnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=muCGAgZyoBWNk+Kxia9z/qddTutCOt0AoMMufpp/pRHyIH5e5EtrlXrwxbNc+SO2y05NkiT++gpelDGZaAQUoS0aMBseESVzl+XANmDJ5j02aamVhZE0/Ak8wzfS1BtvJTEUKgEVENwmE4N1RGUM/O7soQAlnvuWzK84kS/25x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLpFaPry; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLpFaPry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762349022; x=1793885022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RqUG1tqNQAj4YhqR4DyVuJtMSIP/u2bEZW1sUj0zNnw=;
  b=fLpFaPryCmQ/wMMKiOSqX8tKSsyxXydbSJAO9JGfE0ZtNWWuXhapHiau
   xNuuZ+NpaND6CB+IYtgZOwhpwDj78c/LNLey7HlQi2oWFFJb7lYL6g4o2
   7YAo2jeqeWFIlVuHgtFn1FIesNpls9AzlfcdEEYhp3Ktvf7QcShnL3d5k
   LGLH1AdB1KDE8jeEiH9QwjqznzALin7NwtApCYDNDgqgsHdcrk9+TrvGl
   L9mfN3YXd2gmuon4VeBU01JVZbJeV7JAW3W3rkFvN1tE6GMrSQBuhgbGd
   1hAjkhTcLVZAPHDpqmx71n4fPdTR4OfPXnAS0mvNaD3tC9Z632ffdXnb2
   A==;
X-CSE-ConnectionGUID: w1146G49Q5O042EiamJQgQ==
X-CSE-MsgGUID: PnNNI/X5RuO5jqjYTUkltg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="63470675"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="63470675"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 05:23:41 -0800
X-CSE-ConnectionGUID: cjYb2Mq4Q++dOS4Bcg3+KA==
X-CSE-MsgGUID: SSRYrhxuS2OWmNpXWkizVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187145726"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2025 05:23:39 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGdU8-000SbQ-2q;
	Wed, 05 Nov 2025 13:23:36 +0000
Date: Wed, 5 Nov 2025 21:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.all 241/253] fs/xfs/xfs_ioctl.c:1392:38:
 warning: this statement may fall through
Message-ID: <202511052108.cKGuGHcH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.all
head:   767d9e1166d6e5562dfabba4fcabcd571cebea61
commit: 3261f66f8e8baf4619bcfd3425f6cf713fe98a2d [241/253] xfs: use super write guard in xfs_file_ioctl()
config: xtensa-randconfig-r073-20251105 (https://download.01.org/0day-ci/archive/20251105/202511052108.cKGuGHcH-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052108.cKGuGHcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052108.cKGuGHcH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/xfs_ioctl.c: In function 'xfs_file_ioctl':
>> fs/xfs/xfs_ioctl.c:1392:38: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1392 |         case XFS_IOC_FREE_EOFBLOCKS: {
         |                                      ^
   fs/xfs/xfs_ioctl.c:1415:9: note: here
    1415 |         case XFS_IOC_EXCHANGE_RANGE:
         |         ^~~~


vim +1392 fs/xfs/xfs_ioctl.c

b3bb9413e717b4 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2021-12-21  1169  
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1170  /*
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1171   * Note: some of the ioctl's return positive numbers as a
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1172   * byte count indicating success, such as readlink_by_handle.
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1173   * So we don't "sign flip" like most other routines.  This means
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1174   * true errors need to be returned as a negative value.
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1175   */
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1176  long
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1177  xfs_file_ioctl(
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1178  	struct file		*filp,
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1179  	unsigned int		cmd,
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1180  	unsigned long		p)
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1181  {
496ad9aa8ef448 fs/xfs/xfs_ioctl.c           Al Viro             2013-01-23  1182  	struct inode		*inode = file_inode(filp);
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1183  	struct xfs_inode	*ip = XFS_I(inode);
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1184  	struct xfs_mount	*mp = ip->i_mount;
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1185  	void			__user *arg = (void __user *)p;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1186  	int			error;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1187  
cca28fb83d9e60 fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2010-06-24  1188  	trace_xfs_file_ioctl(ip);
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1189  
4d4be482a4d78c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2008-12-09  1190  	switch (cmd) {
a46db60834883c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2011-01-07  1191  	case FITRIM:
a46db60834883c fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2011-01-07  1192  		return xfs_ioc_trim(mp, arg);
f7664b31975bd8 fs/xfs/xfs_ioctl.c           Eric Sandeen        2018-05-15  1193  	case FS_IOC_GETFSLABEL:
f7664b31975bd8 fs/xfs/xfs_ioctl.c           Eric Sandeen        2018-05-15  1194  		return xfs_ioc_getlabel(mp, arg);
f7664b31975bd8 fs/xfs/xfs_ioctl.c           Eric Sandeen        2018-05-15  1195  	case FS_IOC_SETFSLABEL:
f7664b31975bd8 fs/xfs/xfs_ioctl.c           Eric Sandeen        2018-05-15  1196  		return xfs_ioc_setlabel(filp, mp, arg);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1197  	case XFS_IOC_ALLOCSP:
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1198  	case XFS_IOC_FREESP:
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1199  	case XFS_IOC_ALLOCSP64:
4d1b97f9ce7c0d fs/xfs/xfs_ioctl.c           Darrick J. Wong     2022-01-07  1200  	case XFS_IOC_FREESP64:
4d1b97f9ce7c0d fs/xfs/xfs_ioctl.c           Darrick J. Wong     2022-01-07  1201  		xfs_warn_once(mp,
4d1b97f9ce7c0d fs/xfs/xfs_ioctl.c           Darrick J. Wong     2022-01-07  1202  	"%s should use fallocate; XFS_IOC_{ALLOC,FREE}SP ioctl unsupported",
4d1b97f9ce7c0d fs/xfs/xfs_ioctl.c           Darrick J. Wong     2022-01-07  1203  				current->comm);
4d1b97f9ce7c0d fs/xfs/xfs_ioctl.c           Darrick J. Wong     2022-01-07  1204  		return -ENOTTY;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1205  	case XFS_IOC_DIOINFO: {
851c4c96db001f fs/xfs/xfs_ioctl.c           Christoph Hellwig   2025-08-25  1206  		struct kstat		st;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1207  		struct dioattr		da;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1208  
851c4c96db001f fs/xfs/xfs_ioctl.c           Christoph Hellwig   2025-08-25  1209  		error = vfs_getattr(&filp->f_path, &st, STATX_DIOALIGN, 0);
851c4c96db001f fs/xfs/xfs_ioctl.c           Christoph Hellwig   2025-08-25  1210  		if (error)
851c4c96db001f fs/xfs/xfs_ioctl.c           Christoph Hellwig   2025-08-25  1211  			return error;
468210ec76e155 fs/xfs/xfs_ioctl.c           Christoph Hellwig   2025-01-09  1212  
468210ec76e155 fs/xfs/xfs_ioctl.c           Christoph Hellwig   2025-01-09  1213  		/*
851c4c96db001f fs/xfs/xfs_ioctl.c           Christoph Hellwig   2025-08-25  1214  		 * Some userspace directly feeds the return value to
851c4c96db001f fs/xfs/xfs_ioctl.c           Christoph Hellwig   2025-08-25  1215  		 * posix_memalign, which fails for values that are smaller than
851c4c96db001f fs/xfs/xfs_ioctl.c           Christoph Hellwig   2025-08-25  1216  		 * the pointer size.  Round up the value to not break userspace.
468210ec76e155 fs/xfs/xfs_ioctl.c           Christoph Hellwig   2025-01-09  1217  		 */
851c4c96db001f fs/xfs/xfs_ioctl.c           Christoph Hellwig   2025-08-25  1218  		da.d_mem = roundup(st.dio_mem_align, sizeof(void *));
851c4c96db001f fs/xfs/xfs_ioctl.c           Christoph Hellwig   2025-08-25  1219  		da.d_miniosz = st.dio_offset_align;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1220  		da.d_maxiosz = INT_MAX & ~(da.d_miniosz - 1);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1221  		if (copy_to_user(arg, &da, sizeof(da)))
b474c7ae4395ba fs/xfs/xfs_ioctl.c           Eric Sandeen        2014-06-22  1222  			return -EFAULT;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1223  		return 0;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1224  	}
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1225  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1226  	case XFS_IOC_FSBULKSTAT_SINGLE:
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1227  	case XFS_IOC_FSBULKSTAT:
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1228  	case XFS_IOC_FSINUMBERS:
f736d93d76d3e9 fs/xfs/xfs_ioctl.c           Christoph Hellwig   2021-01-21  1229  		return xfs_ioc_fsbulkstat(filp, cmd, arg);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1230  
0448b6f488fa66 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2019-07-03  1231  	case XFS_IOC_BULKSTAT:
f736d93d76d3e9 fs/xfs/xfs_ioctl.c           Christoph Hellwig   2021-01-21  1232  		return xfs_ioc_bulkstat(filp, cmd, arg);
fba9760a433634 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2019-07-03  1233  	case XFS_IOC_INUMBERS:
fba9760a433634 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2019-07-03  1234  		return xfs_ioc_inumbers(mp, cmd, arg);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1235  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1236  	case XFS_IOC_FSGEOMETRY_V1:
1b6d968de22bff fs/xfs/xfs_ioctl.c           Dave Chinner        2019-04-12  1237  		return xfs_ioc_fsgeometry(mp, arg, 3);
1b6d968de22bff fs/xfs/xfs_ioctl.c           Dave Chinner        2019-04-12  1238  	case XFS_IOC_FSGEOMETRY_V4:
1b6d968de22bff fs/xfs/xfs_ioctl.c           Dave Chinner        2019-04-12  1239  		return xfs_ioc_fsgeometry(mp, arg, 4);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1240  	case XFS_IOC_FSGEOMETRY:
1b6d968de22bff fs/xfs/xfs_ioctl.c           Dave Chinner        2019-04-12  1241  		return xfs_ioc_fsgeometry(mp, arg, 5);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1242  
7cd5006bdb6f6d fs/xfs/xfs_ioctl.c           Darrick J. Wong     2019-04-12  1243  	case XFS_IOC_AG_GEOMETRY:
7cd5006bdb6f6d fs/xfs/xfs_ioctl.c           Darrick J. Wong     2019-04-12  1244  		return xfs_ioc_ag_geometry(mp, arg);
3fa7a6d0c7eb26 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2024-11-03  1245  	case XFS_IOC_RTGROUP_GEOMETRY:
3fa7a6d0c7eb26 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2024-11-03  1246  		return xfs_ioc_rtgroup_geometry(mp, arg);
7cd5006bdb6f6d fs/xfs/xfs_ioctl.c           Darrick J. Wong     2019-04-12  1247  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1248  	case XFS_IOC_GETVERSION:
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1249  		return put_user(inode->i_generation, (int __user *)arg);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1250  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1251  	case XFS_IOC_FSGETXATTRA:
9fefd5db08ce01 fs/xfs/xfs_ioctl.c           Miklos Szeredi      2021-04-07  1252  		return xfs_ioc_fsgetxattra(ip, arg);
233f4e12bbb2c5 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2024-04-22  1253  	case XFS_IOC_GETPARENTS:
233f4e12bbb2c5 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2024-04-22  1254  		return xfs_ioc_getparents(filp, arg);
233f4e12bbb2c5 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2024-04-22  1255  	case XFS_IOC_GETPARENTS_BY_HANDLE:
233f4e12bbb2c5 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2024-04-22  1256  		return xfs_ioc_getparents_by_handle(filp, arg);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1257  	case XFS_IOC_GETBMAP:
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1258  	case XFS_IOC_GETBMAPA:
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1259  	case XFS_IOC_GETBMAPX:
232b51948b99df fs/xfs/xfs_ioctl.c           Christoph Hellwig   2017-10-17  1260  		return xfs_ioc_getbmap(filp, cmd, arg);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1261  
e89c041338ed6e fs/xfs/xfs_ioctl.c           Darrick J. Wong     2017-03-28  1262  	case FS_IOC_GETFSMAP:
e89c041338ed6e fs/xfs/xfs_ioctl.c           Darrick J. Wong     2017-03-28  1263  		return xfs_ioc_getfsmap(ip, arg);
e89c041338ed6e fs/xfs/xfs_ioctl.c           Darrick J. Wong     2017-03-28  1264  
c77b37584c2d10 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2024-04-22  1265  	case XFS_IOC_SCRUBV_METADATA:
c77b37584c2d10 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2024-04-22  1266  		return xfs_ioc_scrubv_metadata(filp, arg);
36fd6e863cb732 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2017-10-17  1267  	case XFS_IOC_SCRUB_METADATA:
71bddbccab436a fs/xfs/xfs_ioctl.c           Darrick J. Wong     2021-03-22  1268  		return xfs_ioc_scrub_metadata(filp, arg);
36fd6e863cb732 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2017-10-17  1269  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1270  	case XFS_IOC_FD_TO_HANDLE:
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1271  	case XFS_IOC_PATH_TO_HANDLE:
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1272  	case XFS_IOC_PATH_TO_FSHANDLE: {
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1273  		xfs_fsop_handlereq_t	hreq;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1274  
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1275  		if (copy_from_user(&hreq, arg, sizeof(hreq)))
b474c7ae4395ba fs/xfs/xfs_ioctl.c           Eric Sandeen        2014-06-22  1276  			return -EFAULT;
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1277  		return xfs_find_handle(cmd, &hreq);
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1278  	}
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1279  	case XFS_IOC_OPEN_BY_HANDLE: {
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1280  		xfs_fsop_handlereq_t	hreq;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1281  
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1282  		if (copy_from_user(&hreq, arg, sizeof(xfs_fsop_handlereq_t)))
b474c7ae4395ba fs/xfs/xfs_ioctl.c           Eric Sandeen        2014-06-22  1283  			return -EFAULT;
d296d30a9948e8 fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2009-01-19  1284  		return xfs_open_by_handle(filp, &hreq);
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1285  	}
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1286  
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1287  	case XFS_IOC_READLINK_BY_HANDLE: {
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1288  		xfs_fsop_handlereq_t	hreq;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1289  
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1290  		if (copy_from_user(&hreq, arg, sizeof(xfs_fsop_handlereq_t)))
b474c7ae4395ba fs/xfs/xfs_ioctl.c           Eric Sandeen        2014-06-22  1291  			return -EFAULT;
d296d30a9948e8 fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2009-01-19  1292  		return xfs_readlink_by_handle(filp, &hreq);
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1293  	}
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1294  	case XFS_IOC_ATTRLIST_BY_HANDLE:
d296d30a9948e8 fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2009-01-19  1295  		return xfs_attrlist_by_handle(filp, arg);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1296  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1297  	case XFS_IOC_ATTRMULTI_BY_HANDLE:
d296d30a9948e8 fs/xfs/linux-2.6/xfs_ioctl.c Christoph Hellwig   2009-01-19  1298  		return xfs_attrmulti_by_handle(filp, arg);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1299  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1300  	case XFS_IOC_SWAPEXT: {
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1301  		struct xfs_swapext	sxp;
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1302  
743bb4650da9e2 fs/xfs/linux-2.6/xfs_ioctl.c sandeen@sandeen.net 2008-11-25  1303  		if (copy_from_user(&sxp, arg, sizeof(xfs_swapext_t)))
b474c7ae4395ba fs/xfs/xfs_ioctl.c           Eric Sandeen        2014-06-22  1304  			return -EFAULT;
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1305  		error = mnt_want_write_file(filp);
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1306  		if (error)
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1307  			return error;
a133d952b44cef fs/xfs/xfs_ioctl.c           Dave Chinner        2013-08-12  1308  		error = xfs_ioc_swapext(&sxp);
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1309  		mnt_drop_write_file(filp);
2451337dd04390 fs/xfs/xfs_ioctl.c           Dave Chinner        2014-06-25  1310  		return error;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1311  	}
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1312  
c2c2620de7577d fs/xfs/xfs_ioctl.c           Christoph Hellwig   2023-12-04  1313  	case XFS_IOC_FSCOUNTS:
c2c2620de7577d fs/xfs/xfs_ioctl.c           Christoph Hellwig   2023-12-04  1314  		return xfs_ioctl_fs_counts(mp, arg);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1315  
64f08b152a3bc1 fs/xfs/xfs_ioctl.c           Christoph Hellwig   2023-12-04  1316  	case XFS_IOC_SET_RESBLKS:
64f08b152a3bc1 fs/xfs/xfs_ioctl.c           Christoph Hellwig   2023-12-04  1317  	case XFS_IOC_GET_RESBLKS:
64f08b152a3bc1 fs/xfs/xfs_ioctl.c           Christoph Hellwig   2023-12-04  1318  		return xfs_ioctl_getset_resblocks(filp, cmd, arg);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1319  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1320  	case XFS_IOC_FSGROWFSDATA: {
07aabd9c4a8812 fs/xfs/xfs_ioctl.c           Gao Xiang           2021-02-02  1321  		struct xfs_growfs_data in;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1322  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1323  		if (copy_from_user(&in, arg, sizeof(in)))
b474c7ae4395ba fs/xfs/xfs_ioctl.c           Eric Sandeen        2014-06-22  1324  			return -EFAULT;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1325  
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1326  		error = mnt_want_write_file(filp);
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1327  		if (error)
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1328  			return error;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1329  		error = xfs_growfs_data(mp, &in);
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1330  		mnt_drop_write_file(filp);
2451337dd04390 fs/xfs/xfs_ioctl.c           Dave Chinner        2014-06-25  1331  		return error;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1332  	}
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1333  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1334  	case XFS_IOC_FSGROWFSLOG: {
07aabd9c4a8812 fs/xfs/xfs_ioctl.c           Gao Xiang           2021-02-02  1335  		struct xfs_growfs_log in;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1336  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1337  		if (copy_from_user(&in, arg, sizeof(in)))
b474c7ae4395ba fs/xfs/xfs_ioctl.c           Eric Sandeen        2014-06-22  1338  			return -EFAULT;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1339  
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1340  		error = mnt_want_write_file(filp);
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1341  		if (error)
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1342  			return error;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1343  		error = xfs_growfs_log(mp, &in);
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1344  		mnt_drop_write_file(filp);
2451337dd04390 fs/xfs/xfs_ioctl.c           Dave Chinner        2014-06-25  1345  		return error;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1346  	}
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1347  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1348  	case XFS_IOC_FSGROWFSRT: {
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1349  		xfs_growfs_rt_t in;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1350  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1351  		if (copy_from_user(&in, arg, sizeof(in)))
b474c7ae4395ba fs/xfs/xfs_ioctl.c           Eric Sandeen        2014-06-22  1352  			return -EFAULT;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1353  
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1354  		error = mnt_want_write_file(filp);
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1355  		if (error)
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1356  			return error;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1357  		error = xfs_growfs_rt(mp, &in);
d9457dc0562499 fs/xfs/xfs_ioctl.c           Jan Kara            2012-06-12  1358  		mnt_drop_write_file(filp);
2451337dd04390 fs/xfs/xfs_ioctl.c           Dave Chinner        2014-06-25  1359  		return error;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1360  	}
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1361  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1362  	case XFS_IOC_GOINGDOWN: {
c8ce540db5f67d fs/xfs/xfs_ioctl.c           Darrick J. Wong     2017-06-16  1363  		uint32_t in;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1364  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1365  		if (!capable(CAP_SYS_ADMIN))
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1366  			return -EPERM;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1367  
c8ce540db5f67d fs/xfs/xfs_ioctl.c           Darrick J. Wong     2017-06-16  1368  		if (get_user(in, (uint32_t __user *)arg))
b474c7ae4395ba fs/xfs/xfs_ioctl.c           Eric Sandeen        2014-06-22  1369  			return -EFAULT;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1370  
2451337dd04390 fs/xfs/xfs_ioctl.c           Dave Chinner        2014-06-25  1371  		return xfs_fs_goingdown(mp, in);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1372  	}
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1373  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1374  	case XFS_IOC_ERROR_INJECTION: {
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1375  		xfs_error_injection_t in;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1376  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1377  		if (!capable(CAP_SYS_ADMIN))
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1378  			return -EPERM;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1379  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1380  		if (copy_from_user(&in, arg, sizeof(in)))
b474c7ae4395ba fs/xfs/xfs_ioctl.c           Eric Sandeen        2014-06-22  1381  			return -EFAULT;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1382  
31965ef34802f4 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2017-06-20  1383  		return xfs_errortag_add(mp, in.errtag);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1384  	}
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1385  
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1386  	case XFS_IOC_ERROR_CLEARALL:
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1387  		if (!capable(CAP_SYS_ADMIN))
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1388  			return -EPERM;
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1389  
31965ef34802f4 fs/xfs/xfs_ioctl.c           Darrick J. Wong     2017-06-20  1390  		return xfs_errortag_clearall(mp);
df26cfe849d8fd fs/xfs/linux-2.6/xfs_ioctl.c Lachlan McIlroy     2008-04-18  1391  
8ca149de804784 fs/xfs/xfs_ioctl.c           Brian Foster        2012-11-07 @1392  	case XFS_IOC_FREE_EOFBLOCKS: {

:::::: The code at line 1392 was first introduced by commit
:::::: 8ca149de80478441352a8622ea15fae7de703ced xfs: add XFS_IOC_FREE_EOFBLOCKS ioctl

:::::: TO: Brian Foster <bfoster@redhat.com>
:::::: CC: Ben Myers <bpm@sgi.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
