Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D0E1775A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrDTsGch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701080447; x=1732616447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X3AgPIT05hJu2aPB0zvig/bOTKnurKrjPDbL/IKFz6k=;
  b=FrDTsGch1MO0B2+Nromj2VnPZoUUuzlLaDOS//nK4TyaJ/MJxaeva9yp
   gAIZ6XFM1kFJmjsXzDptw07kGyMYE/vii+JSpCIOnuI6PIFmsmhxza2KA
   WKWhJLxiOTfeJQeCI1+eR+UEiw+/mZwomjDJHlvGwdorS84aRE+RdWuvs
   PzACiUhXK/spa7mWR4cW9tTozFx3xuwrJ3kKThTQb4xq0EFHSLtn49f4y
   1Ke0P0i5N4S4RIb4yP9R1KZefgwoKC6YEwpb8rs4u54CJbG9Wz7d2tAgI
   hAcl2K/VQYmr6DZNjCe7fZeZUL6QLCOfIIKWucX/c/CfWxlR+/bWYjfnz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="389822384"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="389822384"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="802591946"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="802591946"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Nov 2023 02:20:44 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7YjJ-00069I-36;
	Mon, 27 Nov 2023 10:20:41 +0000
Date: Mon, 27 Nov 2023 18:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/4] xfs: clean up the XFS_IOC_FSCOUNTS handler
Message-ID: <202311271644.IMCBnHFv-lkp@intel.com>
References: <20231126130124.1251467-3-hch@lst.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126130124.1251467-3-hch@lst.de>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on linus/master v6.7-rc3 next-20231127]
[cannot apply to djwong-xfs/djwong-devel]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/xfs-clean-up-the-XFS_IOC_FSCOUNTS-handler/20231126-220129
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20231126130124.1251467-3-hch%40lst.de
patch subject: [PATCH 2/4] xfs: clean up the XFS_IOC_FSCOUNTS handler
config: i386-randconfig-062-20231126 (https://download.01.org/0day-ci/archive/20231127/202311271644.IMCBnHFv-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271644.IMCBnHFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271644.IMCBnHFv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_ioctl.c:1918:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct xfs_fsop_counts *uarg @@
   fs/xfs/xfs_ioctl.c:1918:26: sparse:     expected void [noderef] __user *to
   fs/xfs/xfs_ioctl.c:1918:26: sparse:     got struct xfs_fsop_counts *uarg
>> fs/xfs/xfs_ioctl.c:2060:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct xfs_fsop_counts *uarg @@     got void [noderef] __user *arg @@
   fs/xfs/xfs_ioctl.c:2060:48: sparse:     expected struct xfs_fsop_counts *uarg
   fs/xfs/xfs_ioctl.c:2060:48: sparse:     got void [noderef] __user *arg

vim +1918 fs/xfs/xfs_ioctl.c

  1904	
  1905	static int
  1906	xfs_ioctl_fs_counts(
  1907		struct xfs_mount	*mp,
  1908		struct xfs_fsop_counts	*uarg)
  1909	{
  1910		struct xfs_fsop_counts	out = {
  1911			.allocino = percpu_counter_read_positive(&mp->m_icount),
  1912			.freeino = percpu_counter_read_positive(&mp->m_ifree),
  1913			.freedata = percpu_counter_read_positive(&mp->m_fdblocks) -
  1914					xfs_fdblocks_unavailable(mp),
  1915			.freertx = percpu_counter_read_positive(&mp->m_frextents),
  1916		};
  1917	
> 1918		if (copy_to_user(uarg, &out, sizeof(out)))
  1919			return -EFAULT;
  1920		return 0;
  1921	}
  1922	
  1923	/*
  1924	 * These long-unused ioctls were removed from the official ioctl API in 5.17,
  1925	 * but retain these definitions so that we can log warnings about them.
  1926	 */
  1927	#define XFS_IOC_ALLOCSP		_IOW ('X', 10, struct xfs_flock64)
  1928	#define XFS_IOC_FREESP		_IOW ('X', 11, struct xfs_flock64)
  1929	#define XFS_IOC_ALLOCSP64	_IOW ('X', 36, struct xfs_flock64)
  1930	#define XFS_IOC_FREESP64	_IOW ('X', 37, struct xfs_flock64)
  1931	
  1932	/*
  1933	 * Note: some of the ioctl's return positive numbers as a
  1934	 * byte count indicating success, such as readlink_by_handle.
  1935	 * So we don't "sign flip" like most other routines.  This means
  1936	 * true errors need to be returned as a negative value.
  1937	 */
  1938	long
  1939	xfs_file_ioctl(
  1940		struct file		*filp,
  1941		unsigned int		cmd,
  1942		unsigned long		p)
  1943	{
  1944		struct inode		*inode = file_inode(filp);
  1945		struct xfs_inode	*ip = XFS_I(inode);
  1946		struct xfs_mount	*mp = ip->i_mount;
  1947		void			__user *arg = (void __user *)p;
  1948		int			error;
  1949	
  1950		trace_xfs_file_ioctl(ip);
  1951	
  1952		switch (cmd) {
  1953		case FITRIM:
  1954			return xfs_ioc_trim(mp, arg);
  1955		case FS_IOC_GETFSLABEL:
  1956			return xfs_ioc_getlabel(mp, arg);
  1957		case FS_IOC_SETFSLABEL:
  1958			return xfs_ioc_setlabel(filp, mp, arg);
  1959		case XFS_IOC_ALLOCSP:
  1960		case XFS_IOC_FREESP:
  1961		case XFS_IOC_ALLOCSP64:
  1962		case XFS_IOC_FREESP64:
  1963			xfs_warn_once(mp,
  1964		"%s should use fallocate; XFS_IOC_{ALLOC,FREE}SP ioctl unsupported",
  1965					current->comm);
  1966			return -ENOTTY;
  1967		case XFS_IOC_DIOINFO: {
  1968			struct xfs_buftarg	*target = xfs_inode_buftarg(ip);
  1969			struct dioattr		da;
  1970	
  1971			da.d_mem =  da.d_miniosz = target->bt_logical_sectorsize;
  1972			da.d_maxiosz = INT_MAX & ~(da.d_miniosz - 1);
  1973	
  1974			if (copy_to_user(arg, &da, sizeof(da)))
  1975				return -EFAULT;
  1976			return 0;
  1977		}
  1978	
  1979		case XFS_IOC_FSBULKSTAT_SINGLE:
  1980		case XFS_IOC_FSBULKSTAT:
  1981		case XFS_IOC_FSINUMBERS:
  1982			return xfs_ioc_fsbulkstat(filp, cmd, arg);
  1983	
  1984		case XFS_IOC_BULKSTAT:
  1985			return xfs_ioc_bulkstat(filp, cmd, arg);
  1986		case XFS_IOC_INUMBERS:
  1987			return xfs_ioc_inumbers(mp, cmd, arg);
  1988	
  1989		case XFS_IOC_FSGEOMETRY_V1:
  1990			return xfs_ioc_fsgeometry(mp, arg, 3);
  1991		case XFS_IOC_FSGEOMETRY_V4:
  1992			return xfs_ioc_fsgeometry(mp, arg, 4);
  1993		case XFS_IOC_FSGEOMETRY:
  1994			return xfs_ioc_fsgeometry(mp, arg, 5);
  1995	
  1996		case XFS_IOC_AG_GEOMETRY:
  1997			return xfs_ioc_ag_geometry(mp, arg);
  1998	
  1999		case XFS_IOC_GETVERSION:
  2000			return put_user(inode->i_generation, (int __user *)arg);
  2001	
  2002		case XFS_IOC_FSGETXATTRA:
  2003			return xfs_ioc_fsgetxattra(ip, arg);
  2004	
  2005		case XFS_IOC_GETBMAP:
  2006		case XFS_IOC_GETBMAPA:
  2007		case XFS_IOC_GETBMAPX:
  2008			return xfs_ioc_getbmap(filp, cmd, arg);
  2009	
  2010		case FS_IOC_GETFSMAP:
  2011			return xfs_ioc_getfsmap(ip, arg);
  2012	
  2013		case XFS_IOC_SCRUB_METADATA:
  2014			return xfs_ioc_scrub_metadata(filp, arg);
  2015	
  2016		case XFS_IOC_FD_TO_HANDLE:
  2017		case XFS_IOC_PATH_TO_HANDLE:
  2018		case XFS_IOC_PATH_TO_FSHANDLE: {
  2019			xfs_fsop_handlereq_t	hreq;
  2020	
  2021			if (copy_from_user(&hreq, arg, sizeof(hreq)))
  2022				return -EFAULT;
  2023			return xfs_find_handle(cmd, &hreq);
  2024		}
  2025		case XFS_IOC_OPEN_BY_HANDLE: {
  2026			xfs_fsop_handlereq_t	hreq;
  2027	
  2028			if (copy_from_user(&hreq, arg, sizeof(xfs_fsop_handlereq_t)))
  2029				return -EFAULT;
  2030			return xfs_open_by_handle(filp, &hreq);
  2031		}
  2032	
  2033		case XFS_IOC_READLINK_BY_HANDLE: {
  2034			xfs_fsop_handlereq_t	hreq;
  2035	
  2036			if (copy_from_user(&hreq, arg, sizeof(xfs_fsop_handlereq_t)))
  2037				return -EFAULT;
  2038			return xfs_readlink_by_handle(filp, &hreq);
  2039		}
  2040		case XFS_IOC_ATTRLIST_BY_HANDLE:
  2041			return xfs_attrlist_by_handle(filp, arg);
  2042	
  2043		case XFS_IOC_ATTRMULTI_BY_HANDLE:
  2044			return xfs_attrmulti_by_handle(filp, arg);
  2045	
  2046		case XFS_IOC_SWAPEXT: {
  2047			struct xfs_swapext	sxp;
  2048	
  2049			if (copy_from_user(&sxp, arg, sizeof(xfs_swapext_t)))
  2050				return -EFAULT;
  2051			error = mnt_want_write_file(filp);
  2052			if (error)
  2053				return error;
  2054			error = xfs_ioc_swapext(&sxp);
  2055			mnt_drop_write_file(filp);
  2056			return error;
  2057		}
  2058	
  2059		case XFS_IOC_FSCOUNTS:
> 2060			return xfs_ioctl_fs_counts(mp, arg);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
