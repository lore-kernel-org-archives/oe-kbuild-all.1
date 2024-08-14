Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67513CFAB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723629287; cv=none; b=DIl2mka5e76iCf++YBIqmiHuP+3CdhspVXoERyQrNmIHD3TySpE5ank/m5uRUj47/yjbG2c97oXbNvhF24klSMJCEEDVQKzJIpC03aaaaMEe7JMlIf5ir85we1jaf5JMRfPujti7va3uhFcE0kAk/4nUws0c7RYAsv0XWMvzHYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723629287; c=relaxed/simple;
	bh=irVuwPxpps+3GZUKhq8eOw5jRmUBEl6nfFmbGOQ7Fy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B3ez9AHpHfCUjk+RKn0TUJ3VZiFtdF9dOWoKo5foa4/C5c8NUEWcV0cQxT0Hi8wXW6yCIOPODaCWqP+5mQlyNjm0Zk8oWWopYrVgxActECCt0qsRRerMQIZyRytjudjiXMEdfG1U7/wec3D6Edjs257Em0KK5uEPZnuVuEs4gwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkZnmMTo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkZnmMTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723629285; x=1755165285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=irVuwPxpps+3GZUKhq8eOw5jRmUBEl6nfFmbGOQ7Fy4=;
  b=FkZnmMToHk8KO946b+987nAKPmGTz6SeM5T/KwKANtW0cM+s0VISFnYf
   YQqWRVpfa3zymq4mROLobpRpyu2ht+zq5czEtz/OSsNcDkrGpt6ORJa1+
   TrRFa1oLuEtWguBpcjZe8s1hp/m7VMrYqt1S2xK4nJTPWbH2m+We2Me/x
   TUIxiRR9uLAfmlRtreRj11lR7zkJaqLc3ykwjs3n/kVuTdvCw/YfeYdtn
   Ks+AeDrZEetFeamxsj+V5N3gd+ySq7iEao1ey/zNhu6E2ZKz3dhtRiM2V
   lGMQkqr9t9kMWb3cNOzFJMSwgE2e1w4ymIeOD2omqvql14Qfv79P+QNJO
   A==;
X-CSE-ConnectionGUID: HfEGY3T1RESiqwk713TtLg==
X-CSE-MsgGUID: s4mqQOwDS1i3DOXYctAfTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21706246"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; 
   d="scan'208";a="21706246"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 02:54:44 -0700
X-CSE-ConnectionGUID: X78uvGbASaOJRydXgrukrA==
X-CSE-MsgGUID: W5Sgn+8bQw+sEWW6rEjZsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; 
   d="scan'208";a="96471141"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2024 02:54:43 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seAiG-0001Yo-2g;
	Wed, 14 Aug 2024 09:54:40 +0000
Date: Wed, 14 Aug 2024 17:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 230/253] fs/xfs/xfs_bmap_util.c:2224:1: error:
 expected identifier or '('
Message-ID: <202408141740.oswCFaIq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git hch-wtf
head:   dabb7872a6f25b04b590e544cc0f5f3ac560194e
commit: d889f27844ddd965dcfdbfbdab2a41bae07d33bf [230/253] xfs: add an ioctl to map free space into a file
config: i386-buildonly-randconfig-002-20240814 (https://download.01.org/0day-ci/archive/20240814/202408141740.oswCFaIq-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141740.oswCFaIq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141740.oswCFaIq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_bmap_util.c:2224:1: error: expected identifier or '('
    2224 | xfs_map_free_rt_space(
         | ^
   fs/xfs/xfs_bmap_util.h:89:49: note: expanded from macro 'xfs_map_free_rt_space'
      89 | # define xfs_map_free_rt_space(ip, off, len)                    (-EOPNOTSUPP)
         |                                                                  ^
>> fs/xfs/xfs_bmap_util.c:2224:1: error: expected ')'
   fs/xfs/xfs_bmap_util.h:89:49: note: expanded from macro 'xfs_map_free_rt_space'
      89 | # define xfs_map_free_rt_space(ip, off, len)                    (-EOPNOTSUPP)
         |                                                                  ^
   fs/xfs/xfs_bmap_util.c:2224:1: note: to match this '('
   fs/xfs/xfs_bmap_util.h:89:48: note: expanded from macro 'xfs_map_free_rt_space'
      89 | # define xfs_map_free_rt_space(ip, off, len)                    (-EOPNOTSUPP)
         |                                                                 ^
   2 errors generated.


vim +2224 fs/xfs/xfs_bmap_util.c

  2183	
  2184	/*
  2185	 * Allocate all free physical space between off and len and map it to this
  2186	 * regular non-realtime file.
  2187	 */
  2188	int
  2189	xfs_map_free_rt_space(
  2190		struct xfs_inode	*ip,
  2191		xfs_off_t		off,
  2192		xfs_off_t		len)
  2193	{
  2194		struct xfs_mount	*mp = ip->i_mount;
  2195		xfs_rtblock_t		off_rtb = XFS_B_TO_FSB(mp, off);
  2196		xfs_rtblock_t		end_rtb = XFS_B_TO_FSBT(mp, off + len);
  2197		xfs_rtxnum_t		off_rtx;
  2198		xfs_rtxnum_t		end_rtx;
  2199		int			error = 0;
  2200	
  2201		/* Compute rt extents from the input parameters. */
  2202		off_rtx = xfs_rtb_to_rtxup(mp, off_rtb);
  2203		end_rtx = xfs_rtb_to_rtx(mp, end_rtb);
  2204	
  2205		if (off_rtx >= mp->m_sb.sb_rextents)
  2206			return 0;
  2207		if (end_rtx >= mp->m_sb.sb_rextents)
  2208			end_rtx = mp->m_sb.sb_rextents - 1;
  2209	
  2210		trace_xfs_map_free_rt_space(ip, off, len);
  2211	
  2212		while (off_rtx < end_rtx) {
  2213			error = xfs_map_free_rt_extent(ip, &off_rtx, end_rtx);
  2214			if (error)
  2215				break;
  2216		}
  2217	
  2218		if (error == -ENOSPC)
  2219			return 0;
  2220		return error;
  2221	}
  2222	#else
  2223	int
> 2224	xfs_map_free_rt_space(

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
