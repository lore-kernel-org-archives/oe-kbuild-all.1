Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFF1425CFD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 17:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979802; cv=none; b=ktiTV3OkOx8ghtT9d0c/PSVXvgTB77Er2I7p+ZByMKFz8/GZmg2fpI0PLOdwrWx96hNDTLkm5ktpuQq8aSXd1dojNgfSfhLSGygZaeVsZOldYiENxZoh/iXaHzGDJpKCOu+qcXy3dGBBkWF4R72b+THec3mhHzhFcRfQdjsFShs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979802; c=relaxed/simple;
	bh=7/pEtYGYUYhgabEpt2ywbj98DR9gBzWlhzLD37JUWJY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t6lv6cu+T7qnYF1fCWz7TPGZv0l0NL++J/QPLJ92bucdaQOOZZDEeQQRYZoLJ2LDWbMg8yCi2jX6VUZOCMEVYx3Aq/YjkbuzV17wSmN55sZxnjFByL3LZXt6lOzlRC1gareM3QVDiRFE4H0NtxdkqHwkHuDNB4oirvzeyFLZ1Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMkIyilC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMkIyilC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774979799; x=1806515799;
  h=date:from:to:cc:subject:message-id;
  bh=7/pEtYGYUYhgabEpt2ywbj98DR9gBzWlhzLD37JUWJY=;
  b=VMkIyilCJ60OoIYOOe8Ogt96ZvPdnANMeZMxOBKPv9NxZAjXzurdE4Je
   w9NgP82dJH7rVZ4G31b3/ewsf5/HyBA6NoU8uUnYJRjsMYzE/tp8EHnnL
   1LoMlyur8eeCrmtSSPxVFJ2Zmntmi7HMbuS/7ANlU8joQ34tWfpmXhyki
   tCJ73WiDpCNv58AsbMvFtbsjoKwIMPRq04Q2efoNLGvfcDbAATvyB3QOZ
   n0kbsNk4JHrbyfMFG1fOzhwblGtN5iIo9g/FuqkF+U6n1jbLrFYsul1oV
   mdfTEpfbjW7mTQ7Q5hwD9zW7ADNZK9qP2ir8t2ZEp5DXj754slfXPzsjr
   g==;
X-CSE-ConnectionGUID: 6KUA5E95TfSbemjshIip7w==
X-CSE-MsgGUID: Wg8bbvXcR5Wzp6OJnzJWTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="101456541"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="101456541"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:56:34 -0700
X-CSE-ConnectionGUID: Gqf5WiRsRCew1/FZ2Nrt6g==
X-CSE-MsgGUID: jtDZJhkrQieRWKGIyeCg2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223556781"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2026 10:56:33 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7dKI-00000000465-3YFK;
	Tue, 31 Mar 2026 17:56:30 +0000
Date: Wed, 01 Apr 2026 01:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-10 4/4]
 fs/ntfs3/frecord.c:1932:9: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202604010104.8ogKMpVX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-10
head:   674c6395e4cf2ef6091aafc42b63508b1e2f7f58
commit: 5472b587cf71f72fa4be675c30fab677e65c6f63 [4/4] fs/ntfs3: Do copy_to_user out of run_lock
config: i386-randconfig-r123-20260331 (https://download.01.org/0day-ci/archive/20260401/202604010104.8ogKMpVX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010104.8ogKMpVX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010104.8ogKMpVX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ntfs3/frecord.c:1932:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct fiemap_extent [noderef] __user *[assigned] dest @@
   fs/ntfs3/frecord.c:1932:9: sparse:     expected void const *
   fs/ntfs3/frecord.c:1932:9: sparse:     got struct fiemap_extent [noderef] __user *[assigned] dest
>> fs/ntfs3/frecord.c:1932:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct fiemap_extent [noderef] __user *[assigned] dest @@
   fs/ntfs3/frecord.c:1932:9: sparse:     expected void const *
   fs/ntfs3/frecord.c:1932:9: sparse:     got struct fiemap_extent [noderef] __user *[assigned] dest
>> fs/ntfs3/frecord.c:1932:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got struct fiemap_extent [noderef] __user *[assigned] dest @@
   fs/ntfs3/frecord.c:1932:9: sparse:     expected void *
   fs/ntfs3/frecord.c:1932:9: sparse:     got struct fiemap_extent [noderef] __user *[assigned] dest
>> fs/ntfs3/frecord.c:2009:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct fiemap_extent [noderef] __user *fi_extents_start @@     got struct fiemap_extent *[assigned] fe_k @@
   fs/ntfs3/frecord.c:2009:35: sparse:     expected struct fiemap_extent [noderef] __user *fi_extents_start
   fs/ntfs3/frecord.c:2009:35: sparse:     got struct fiemap_extent *[assigned] fe_k

vim +1932 fs/ntfs3/frecord.c

  1898	
  1899	/*
  1900	 * fiemap_fill_next_extent_k - a copy of fiemap_fill_next_extent
  1901	 * but it accepts kernel address for fi_extents_start
  1902	 */
  1903	static int fiemap_fill_next_extent_k(struct fiemap_extent_info *fieinfo,
  1904					     u64 logical, u64 phys, u64 len, u32 flags)
  1905	{
  1906		struct fiemap_extent extent;
  1907		struct fiemap_extent __user *dest = fieinfo->fi_extents_start;
  1908	
  1909		/* only count the extents */
  1910		if (fieinfo->fi_extents_max == 0) {
  1911			fieinfo->fi_extents_mapped++;
  1912			return (flags & FIEMAP_EXTENT_LAST) ? 1 : 0;
  1913		}
  1914	
  1915		if (fieinfo->fi_extents_mapped >= fieinfo->fi_extents_max)
  1916			return 1;
  1917	
  1918		if (flags & FIEMAP_EXTENT_DELALLOC)
  1919			flags |= FIEMAP_EXTENT_UNKNOWN;
  1920		if (flags & FIEMAP_EXTENT_DATA_ENCRYPTED)
  1921			flags |= FIEMAP_EXTENT_ENCODED;
  1922		if (flags & (FIEMAP_EXTENT_DATA_TAIL | FIEMAP_EXTENT_DATA_INLINE))
  1923			flags |= FIEMAP_EXTENT_NOT_ALIGNED;
  1924	
  1925		memset(&extent, 0, sizeof(extent));
  1926		extent.fe_logical = logical;
  1927		extent.fe_physical = phys;
  1928		extent.fe_length = len;
  1929		extent.fe_flags = flags;
  1930	
  1931		dest += fieinfo->fi_extents_mapped;
> 1932		memcpy(dest, &extent, sizeof(extent));
  1933	
  1934		fieinfo->fi_extents_mapped++;
  1935		if (fieinfo->fi_extents_mapped == fieinfo->fi_extents_max)
  1936			return 1;
  1937		return (flags & FIEMAP_EXTENT_LAST) ? 1 : 0;
  1938	}
  1939	
  1940	/*
  1941	 * ni_fiemap - Helper for file_fiemap().
  1942	 *
  1943	 * Assumed ni_lock.
  1944	 * TODO: Less aggressive locks.
  1945	 */
  1946	int ni_fiemap(struct ntfs_inode *ni, struct fiemap_extent_info *fieinfo,
  1947		      __u64 vbo, __u64 len)
  1948	{
  1949		int err = 0;
  1950		struct fiemap_extent __user *fe_u = fieinfo->fi_extents_start;
  1951		struct fiemap_extent *fe_k = NULL;
  1952		struct ntfs_sb_info *sbi = ni->mi.sbi;
  1953		u8 cluster_bits = sbi->cluster_bits;
  1954		struct runs_tree *run;
  1955		struct rw_semaphore *run_lock;
  1956		struct ATTRIB *attr;
  1957		CLST vcn = vbo >> cluster_bits;
  1958		CLST lcn, clen;
  1959		u64 valid = ni->i_valid;
  1960		u64 lbo, bytes;
  1961		u64 end, alloc_size;
  1962		size_t idx = -1;
  1963		u32 flags;
  1964		bool ok;
  1965	
  1966		if (S_ISDIR(ni->vfs_inode.i_mode)) {
  1967			run = &ni->dir.alloc_run;
  1968			attr = ni_find_attr(ni, NULL, NULL, ATTR_ALLOC, I30_NAME,
  1969					    ARRAY_SIZE(I30_NAME), NULL, NULL);
  1970			run_lock = &ni->dir.run_lock;
  1971		} else {
  1972			run = &ni->file.run;
  1973			attr = ni_find_attr(ni, NULL, NULL, ATTR_DATA, NULL, 0, NULL,
  1974					    NULL);
  1975			if (!attr) {
  1976				err = -EINVAL;
  1977				goto out;
  1978			}
  1979			if (is_attr_compressed(attr)) {
  1980				/* Unfortunately cp -r incorrectly treats compressed clusters. */
  1981				err = -EOPNOTSUPP;
  1982				ntfs_inode_warn(
  1983					&ni->vfs_inode,
  1984					"fiemap is not supported for compressed file (cp -r)");
  1985				goto out;
  1986			}
  1987			run_lock = &ni->file.run_lock;
  1988		}
  1989	
  1990		if (!attr || !attr->non_res) {
  1991			err = fiemap_fill_next_extent(
  1992				fieinfo, 0, 0,
  1993				attr ? le32_to_cpu(attr->res.data_size) : 0,
  1994				FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_LAST |
  1995					FIEMAP_EXTENT_MERGED);
  1996			goto out;
  1997		}
  1998	
  1999		/*
  2000		 * To avoid lock problems replace pointer to user memory by pointer to kernel memory.
  2001		 */
  2002		fe_k = kmalloc_array(fieinfo->fi_extents_max,
  2003				     sizeof(struct fiemap_extent),
  2004				     GFP_NOFS | __GFP_ZERO);
  2005		if (!fe_k) {
  2006			err = -ENOMEM;
  2007			goto out;
  2008		}
> 2009		fieinfo->fi_extents_start = fe_k;
  2010	
  2011		end = vbo + len;
  2012		alloc_size = le64_to_cpu(attr->nres.alloc_size);
  2013		if (end > alloc_size)
  2014			end = alloc_size;
  2015	
  2016		down_read(run_lock);
  2017	
  2018		while (vbo < end) {
  2019			if (idx == -1) {
  2020				ok = run_lookup_entry(run, vcn, &lcn, &clen, &idx);
  2021			} else {
  2022				CLST vcn_next = vcn;
  2023	
  2024				ok = run_get_entry(run, ++idx, &vcn, &lcn, &clen) &&
  2025				     vcn == vcn_next;
  2026				if (!ok)
  2027					vcn = vcn_next;
  2028			}
  2029	
  2030			if (!ok) {
  2031				up_read(run_lock);
  2032				down_write(run_lock);
  2033	
  2034				err = attr_load_runs_vcn(ni, attr->type,
  2035							 attr_name(attr),
  2036							 attr->name_len, run, vcn);
  2037	
  2038				up_write(run_lock);
  2039				down_read(run_lock);
  2040	
  2041				if (err)
  2042					break;
  2043	
  2044				ok = run_lookup_entry(run, vcn, &lcn, &clen, &idx);
  2045	
  2046				if (!ok) {
  2047					err = -EINVAL;
  2048					break;
  2049				}
  2050			}
  2051	
  2052			if (!clen) {
  2053				err = -EINVAL; // ?
  2054				break;
  2055			}
  2056	
  2057			if (lcn == SPARSE_LCN) {
  2058				vcn += clen;
  2059				vbo = (u64)vcn << cluster_bits;
  2060				continue;
  2061			}
  2062	
  2063			flags = FIEMAP_EXTENT_MERGED;
  2064			if (S_ISDIR(ni->vfs_inode.i_mode)) {
  2065				;
  2066			} else if (is_attr_compressed(attr)) {
  2067				CLST clst_data;
  2068	
  2069				err = attr_is_frame_compressed(
  2070					ni, attr, vcn >> attr->nres.c_unit, &clst_data);
  2071				if (err)
  2072					break;
  2073				if (clst_data < NTFS_LZNT_CLUSTERS)
  2074					flags |= FIEMAP_EXTENT_ENCODED;
  2075			} else if (is_attr_encrypted(attr)) {
  2076				flags |= FIEMAP_EXTENT_DATA_ENCRYPTED;
  2077			}
  2078	
  2079			vbo = (u64)vcn << cluster_bits;
  2080			bytes = (u64)clen << cluster_bits;
  2081			lbo = (u64)lcn << cluster_bits;
  2082	
  2083			vcn += clen;
  2084	
  2085			if (vbo + bytes >= end)
  2086				bytes = end - vbo;
  2087	
  2088			if (vbo + bytes <= valid) {
  2089				;
  2090			} else if (vbo >= valid) {
  2091				flags |= FIEMAP_EXTENT_UNWRITTEN;
  2092			} else {
  2093				/* vbo < valid && valid < vbo + bytes */
  2094				u64 dlen = valid - vbo;
  2095	
  2096				if (vbo + dlen >= end)
  2097					flags |= FIEMAP_EXTENT_LAST;
  2098	
  2099				err = fiemap_fill_next_extent_k(fieinfo, vbo, lbo, dlen,
  2100								flags);
  2101	
  2102				if (err < 0)
  2103					break;
  2104				if (err == 1) {
  2105					err = 0;
  2106					break;
  2107				}
  2108	
  2109				vbo = valid;
  2110				bytes -= dlen;
  2111				if (!bytes)
  2112					continue;
  2113	
  2114				lbo += dlen;
  2115				flags |= FIEMAP_EXTENT_UNWRITTEN;
  2116			}
  2117	
  2118			if (vbo + bytes >= end)
  2119				flags |= FIEMAP_EXTENT_LAST;
  2120	
  2121			err = fiemap_fill_next_extent_k(fieinfo, vbo, lbo, bytes,
  2122							flags);
  2123			if (err < 0)
  2124				break;
  2125			if (err == 1) {
  2126				err = 0;
  2127				break;
  2128			}
  2129	
  2130			vbo += bytes;
  2131		}
  2132	
  2133		up_read(run_lock);
  2134	
  2135		/*
  2136		 * Copy to user memory out of lock
  2137		 */
  2138		if (copy_to_user(fe_u, fe_k,
  2139				 fieinfo->fi_extents_max *
  2140					 sizeof(struct fiemap_extent))) {
  2141			err = -EFAULT;
  2142		}
  2143	
  2144	out:
  2145		/* Restore original pointer. */
  2146		fieinfo->fi_extents_start = fe_u;
  2147		kfree(fe_k);
  2148		return err;
  2149	}
  2150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
