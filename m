Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908EA7605D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712647737; cv=none; b=uu9+f1R8XIFBlPgyykhBluq8vBxb6ZSSOULqYxsNQCz2CrGPoIak00+V6qqTEBXm69hIm/x43On58rpZGFo+tb2GBOlPxfS7fqKnnlpncxJ27NRJ/6f7FiIA+RYW+C493sAYz1V0tqtrtTr4e/WAxLE8GALv5g7H54BPs1kkK+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712647737; c=relaxed/simple;
	bh=9XGDtuPhV2vuHBcUU/7/nFvbgkiU79QikMK99EKL644=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gyDsSPTm3igdno1QeAi1hzdp9JPVvfu308sK9o0bnMrBkm5Vi0jtp1A3n6OxsSElea9/DRy4HKm33cBX4VjiyfwFAvRYMymOqfT1NZGvdg+wxxNz9ct3I08NooEP26/Y1pPVb/8gBi2FZl+Jg51JKbLL0jfsIsu9JJygdAuyRdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ks0Ek7Zo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ks0Ek7Zo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712647735; x=1744183735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9XGDtuPhV2vuHBcUU/7/nFvbgkiU79QikMK99EKL644=;
  b=Ks0Ek7ZocLMcfPKJ+LUwK0skA8zDArUbSVpiyJZzHLP+UNG4d1lBKYlz
   AY5GMdz0UhaAZb04tTHJUrAeXsxjyCyZTUruQ2yhYEu6znmJJ9DhRO7oo
   WoMP/B4mnd2XrnIuHvHmWsKaXZeMW8kga1TfCOFxSeyebkTVv85nCf337
   0+Uf6wHCvfRbaPccPl3mbS8/b1Mv909y9/Bh0mLLdRAVL/1s08udOasB5
   kN53w1V0GJNjkLsSvF8idoZ4GCnHaDn0lfQxsVprKhKlCxyIaoVPAop0s
   sZuFh82iuxghaD6g6U+SrONZ2DMfVsZGDeiGEY0JcRaN2wonsNx6ou2Cp
   g==;
X-CSE-ConnectionGUID: XYbLQDdcRq6eMWdoic1fZw==
X-CSE-MsgGUID: xcUyw5LTQwy3xq8sNu+qsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8110586"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8110586"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 00:28:55 -0700
X-CSE-ConnectionGUID: udkdV77MT1eqTn9w4JAw5g==
X-CSE-MsgGUID: 2NCIvDUvQCyna4xS+M1c8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="24925972"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Apr 2024 00:28:54 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru5uV-0005rY-0u;
	Tue, 09 Apr 2024 07:28:51 +0000
Date: Tue, 9 Apr 2024 15:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 439/456] fs/xfs/xfs_ioctl.c:1981:10:
 error: call to undeclared function 'fsverity_ioctl_disable'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202404091547.W1SZIgTx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   7a558c88692bfaf587bfeb687ea9fe0d4d98632c
commit: d0d7fbd672bf1bf29e17c1380755a3a688bae198 [439/456] xfs: make it possible to disable fsverity
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240409/202404091547.W1SZIgTx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404091547.W1SZIgTx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091547.W1SZIgTx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_ioctl.c:1981:10: error: call to undeclared function 'fsverity_ioctl_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1981 |                 return fsverity_ioctl_disable(filp);
         |                        ^
   fs/xfs/xfs_ioctl.c:1981:10: note: did you mean 'fsverity_ioctl_enable'?
   include/linux/fsverity.h:344:19: note: 'fsverity_ioctl_enable' declared here
     344 | static inline int fsverity_ioctl_enable(struct file *filp,
         |                   ^
   1 error generated.


vim +/fsverity_ioctl_disable +1981 fs/xfs/xfs_ioctl.c

  1711	
  1712	/*
  1713	 * Note: some of the ioctl's return positive numbers as a
  1714	 * byte count indicating success, such as readlink_by_handle.
  1715	 * So we don't "sign flip" like most other routines.  This means
  1716	 * true errors need to be returned as a negative value.
  1717	 */
  1718	long
  1719	xfs_file_ioctl(
  1720		struct file		*filp,
  1721		unsigned int		cmd,
  1722		unsigned long		p)
  1723	{
  1724		struct inode		*inode = file_inode(filp);
  1725		struct xfs_inode	*ip = XFS_I(inode);
  1726		struct xfs_mount	*mp = ip->i_mount;
  1727		void			__user *arg = (void __user *)p;
  1728		int			error;
  1729	
  1730		trace_xfs_file_ioctl(ip);
  1731	
  1732		switch (cmd) {
  1733		case FITRIM:
  1734			return xfs_ioc_trim(mp, arg);
  1735		case FS_IOC_GETFSLABEL:
  1736			return xfs_ioc_getlabel(mp, arg);
  1737		case FS_IOC_SETFSLABEL:
  1738			return xfs_ioc_setlabel(filp, mp, arg);
  1739		case XFS_IOC_ALLOCSP:
  1740		case XFS_IOC_FREESP:
  1741		case XFS_IOC_ALLOCSP64:
  1742		case XFS_IOC_FREESP64:
  1743			xfs_warn_once(mp,
  1744		"%s should use fallocate; XFS_IOC_{ALLOC,FREE}SP ioctl unsupported",
  1745					current->comm);
  1746			return -ENOTTY;
  1747		case XFS_IOC_DIOINFO: {
  1748			struct xfs_buftarg	*target = xfs_inode_buftarg(ip);
  1749			struct dioattr		da;
  1750	
  1751			da.d_mem =  da.d_miniosz = target->bt_logical_sectorsize;
  1752			da.d_maxiosz = INT_MAX & ~(da.d_miniosz - 1);
  1753	
  1754			if (copy_to_user(arg, &da, sizeof(da)))
  1755				return -EFAULT;
  1756			return 0;
  1757		}
  1758	
  1759		case XFS_IOC_FSBULKSTAT_SINGLE:
  1760		case XFS_IOC_FSBULKSTAT:
  1761		case XFS_IOC_FSINUMBERS:
  1762			return xfs_ioc_fsbulkstat(filp, cmd, arg);
  1763	
  1764		case XFS_IOC_BULKSTAT:
  1765			return xfs_ioc_bulkstat(filp, cmd, arg);
  1766		case XFS_IOC_INUMBERS:
  1767			return xfs_ioc_inumbers(mp, cmd, arg);
  1768	
  1769		case XFS_IOC_FSGEOMETRY_V1:
  1770			return xfs_ioc_fsgeometry(mp, arg, 3);
  1771		case XFS_IOC_FSGEOMETRY_V4:
  1772			return xfs_ioc_fsgeometry(mp, arg, 4);
  1773		case XFS_IOC_FSGEOMETRY:
  1774			return xfs_ioc_fsgeometry(mp, arg, 5);
  1775	
  1776		case XFS_IOC_AG_GEOMETRY:
  1777			return xfs_ioc_ag_geometry(mp, arg);
  1778		case XFS_IOC_RTGROUP_GEOMETRY:
  1779			return xfs_ioc_rtgroup_geometry(mp, arg);
  1780	
  1781		case XFS_IOC_GETVERSION:
  1782			return put_user(inode->i_generation, (int __user *)arg);
  1783	
  1784		case XFS_IOC_FSGETXATTRA:
  1785			return xfs_ioc_fsgetxattra(ip, arg);
  1786		case XFS_IOC_GETPARENTS:
  1787			return xfs_ioc_getparents(filp, arg);
  1788		case XFS_IOC_GETPARENTS_BY_HANDLE:
  1789			return xfs_ioc_getparents_by_handle(filp, arg);
  1790		case XFS_IOC_GETBMAP:
  1791		case XFS_IOC_GETBMAPA:
  1792		case XFS_IOC_GETBMAPX:
  1793			return xfs_ioc_getbmap(filp, cmd, arg);
  1794	
  1795		case FS_IOC_GETFSMAP:
  1796			return xfs_ioc_getfsmap(ip, arg);
  1797	
  1798		case XFS_IOC_GETFSREFCOUNTS:
  1799			return xfs_ioc_getfsrefcounts(ip, arg);
  1800	
  1801		case XFS_IOC_SCRUBV_METADATA:
  1802			return xfs_ioc_scrubv_metadata(filp, arg);
  1803		case XFS_IOC_SCRUB_METADATA:
  1804			return xfs_ioc_scrub_metadata(filp, arg);
  1805	
  1806		case XFS_IOC_FD_TO_HANDLE:
  1807		case XFS_IOC_PATH_TO_HANDLE:
  1808		case XFS_IOC_PATH_TO_FSHANDLE: {
  1809			xfs_fsop_handlereq_t	hreq;
  1810	
  1811			if (copy_from_user(&hreq, arg, sizeof(hreq)))
  1812				return -EFAULT;
  1813			return xfs_find_handle(cmd, &hreq);
  1814		}
  1815		case XFS_IOC_OPEN_BY_HANDLE: {
  1816			xfs_fsop_handlereq_t	hreq;
  1817	
  1818			if (copy_from_user(&hreq, arg, sizeof(xfs_fsop_handlereq_t)))
  1819				return -EFAULT;
  1820			return xfs_open_by_handle(filp, &hreq);
  1821		}
  1822	
  1823		case XFS_IOC_READLINK_BY_HANDLE: {
  1824			xfs_fsop_handlereq_t	hreq;
  1825	
  1826			if (copy_from_user(&hreq, arg, sizeof(xfs_fsop_handlereq_t)))
  1827				return -EFAULT;
  1828			return xfs_readlink_by_handle(filp, &hreq);
  1829		}
  1830		case XFS_IOC_ATTRLIST_BY_HANDLE:
  1831			return xfs_attrlist_by_handle(filp, arg);
  1832	
  1833		case XFS_IOC_ATTRMULTI_BY_HANDLE:
  1834			return xfs_attrmulti_by_handle(filp, arg);
  1835	
  1836		case XFS_IOC_SWAPEXT: {
  1837			struct xfs_swapext	sxp;
  1838	
  1839			if (copy_from_user(&sxp, arg, sizeof(xfs_swapext_t)))
  1840				return -EFAULT;
  1841			error = mnt_want_write_file(filp);
  1842			if (error)
  1843				return error;
  1844			error = xfs_ioc_swapext(&sxp);
  1845			mnt_drop_write_file(filp);
  1846			return error;
  1847		}
  1848	
  1849		case XFS_IOC_FSCOUNTS:
  1850			return xfs_ioctl_fs_counts(mp, arg);
  1851	
  1852		case XFS_IOC_SET_RESBLKS:
  1853		case XFS_IOC_GET_RESBLKS:
  1854			return xfs_ioctl_getset_resblocks(filp, cmd, arg);
  1855	
  1856		case XFS_IOC_FSGROWFSDATA: {
  1857			struct xfs_growfs_data in;
  1858	
  1859			if (copy_from_user(&in, arg, sizeof(in)))
  1860				return -EFAULT;
  1861	
  1862			error = mnt_want_write_file(filp);
  1863			if (error)
  1864				return error;
  1865			error = xfs_growfs_data(mp, &in);
  1866			mnt_drop_write_file(filp);
  1867			return error;
  1868		}
  1869	
  1870		case XFS_IOC_FSGROWFSLOG: {
  1871			struct xfs_growfs_log in;
  1872	
  1873			if (copy_from_user(&in, arg, sizeof(in)))
  1874				return -EFAULT;
  1875	
  1876			error = mnt_want_write_file(filp);
  1877			if (error)
  1878				return error;
  1879			error = xfs_growfs_log(mp, &in);
  1880			mnt_drop_write_file(filp);
  1881			return error;
  1882		}
  1883	
  1884		case XFS_IOC_FSGROWFSRT: {
  1885			xfs_growfs_rt_t in;
  1886	
  1887			if (copy_from_user(&in, arg, sizeof(in)))
  1888				return -EFAULT;
  1889	
  1890			error = mnt_want_write_file(filp);
  1891			if (error)
  1892				return error;
  1893			error = xfs_growfs_rt(mp, &in);
  1894			mnt_drop_write_file(filp);
  1895			return error;
  1896		}
  1897	
  1898		case XFS_IOC_GOINGDOWN: {
  1899			uint32_t in;
  1900	
  1901			if (!capable(CAP_SYS_ADMIN))
  1902				return -EPERM;
  1903	
  1904			if (get_user(in, (uint32_t __user *)arg))
  1905				return -EFAULT;
  1906	
  1907			return xfs_fs_goingdown(mp, in);
  1908		}
  1909	
  1910		case XFS_IOC_ERROR_INJECTION: {
  1911			xfs_error_injection_t in;
  1912	
  1913			if (!capable(CAP_SYS_ADMIN))
  1914				return -EPERM;
  1915	
  1916			if (copy_from_user(&in, arg, sizeof(in)))
  1917				return -EFAULT;
  1918	
  1919			return xfs_errortag_add(mp, in.errtag);
  1920		}
  1921	
  1922		case XFS_IOC_ERROR_CLEARALL:
  1923			if (!capable(CAP_SYS_ADMIN))
  1924				return -EPERM;
  1925	
  1926			return xfs_errortag_clearall(mp);
  1927	
  1928		case XFS_IOC_FREE_EOFBLOCKS: {
  1929			struct xfs_fs_eofblocks	eofb;
  1930			struct xfs_icwalk	icw;
  1931	
  1932			if (!capable(CAP_SYS_ADMIN))
  1933				return -EPERM;
  1934	
  1935			if (xfs_is_readonly(mp))
  1936				return -EROFS;
  1937	
  1938			if (copy_from_user(&eofb, arg, sizeof(eofb)))
  1939				return -EFAULT;
  1940	
  1941			error = xfs_fs_eofblocks_from_user(&eofb, &icw);
  1942			if (error)
  1943				return error;
  1944	
  1945			trace_xfs_ioc_free_eofblocks(mp, &icw, _RET_IP_);
  1946	
  1947			sb_start_write(mp->m_super);
  1948			error = xfs_blockgc_free_space(mp, &icw);
  1949			sb_end_write(mp->m_super);
  1950			return error;
  1951		}
  1952	
  1953		case XFS_IOC_EXCHANGE_RANGE:
  1954			return xfs_ioc_exchange_range(filp, arg);
  1955		case XFS_IOC_START_COMMIT:
  1956			return xfs_ioc_start_commit(filp, arg);
  1957		case XFS_IOC_COMMIT_RANGE:
  1958			return xfs_ioc_commit_range(filp, arg);
  1959	
  1960		case XFS_IOC_MAP_FREESP:
  1961			return xfs_ioc_map_freesp(filp, arg);
  1962	
  1963		case FS_IOC_ENABLE_VERITY:
  1964			if (!xfs_has_verity(mp))
  1965				return -EOPNOTSUPP;
  1966			return fsverity_ioctl_enable(filp, arg);
  1967	
  1968		case FS_IOC_MEASURE_VERITY:
  1969			if (!xfs_has_verity(mp))
  1970				return -EOPNOTSUPP;
  1971			return fsverity_ioctl_measure(filp, arg);
  1972	
  1973		case FS_IOC_READ_VERITY_METADATA:
  1974			if (!xfs_has_verity(mp))
  1975				return -EOPNOTSUPP;
  1976			return fsverity_ioctl_read_metadata(filp, arg);
  1977	
  1978		case FS_IOC_DISABLE_VERITY:
  1979			if (!xfs_has_verity(mp))
  1980				return -EOPNOTSUPP;
> 1981			return fsverity_ioctl_disable(filp);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
