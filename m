Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF9D3A9D9D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840201; cv=none; b=cY4mK7mufMSELDM4pwsSK8kXD64gSFfn5scUUhbZ0RelAnz6puRhEg8JPg7aURHUXWkIjYrlCkanwHSh9+mnlJAG+IyS1lobcOk4Tb7cddrCGZgkk6P49YeW/F3J1hjJ/wcgZupqKrCAekQitLs7EuvU2NF7y28Uu3/DkghtFus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840201; c=relaxed/simple;
	bh=9SnA7U1kOlcGyRa7RgTDJgJmZH6Pf9hQjZQvclzvfAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3H8w72RQQH8Vv+sbM5x00B2Vu7oAnIyeyqbVdyduRRY4PkliY9TiuCHPk+UceUbtdnXgiGQtiic5MjCUaOsrF/7Ag+NQuL++p160rFrqenaiQdZE0lKWr4pAvNlJZTUdh3WvtL/1oyMkDvwm4YuCWxixU5ZMhhfIYRoBLsCk+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWgqGQOK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWgqGQOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768840200; x=1800376200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9SnA7U1kOlcGyRa7RgTDJgJmZH6Pf9hQjZQvclzvfAc=;
  b=jWgqGQOK8kQiXJ/gLgpFZsJOPIXToznreiTtSuTrKqVki0WLSONYi+i9
   qSbisHpFsetXHX0hoZgcD9haOq/QjH6jC0XOue/ItP0KGaeCoAPtvLtQi
   TVSOC2HkUUj/nxrtoZTp5vXzoGXxJ8T+4/iIK/OBVMiedbsvnNL3pNWK4
   3ICkqKFNtMtkYEDiY+mLgIixz8LLzR6GusdweBvBboJlhMCoozbFA+He7
   MxjEFVGqIlc2n8ZJZTj4j+2rw+lQJ11y+ITpYv0wCekjoJ66PO5+ty045
   Xtn+2wARthkN7I4PTBpkU9VCF+WZfhmoI3deTWGdxkXvcK+/m5+tIjvP9
   Q==;
X-CSE-ConnectionGUID: g3euTMJeQUe8IDwwgKVhDw==
X-CSE-MsgGUID: IDyIpEzjR6ak7MOroVvHkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70026116"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70026116"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:29:58 -0800
X-CSE-ConnectionGUID: 5rceCgnBTNe8nw7dduJovw==
X-CSE-MsgGUID: R7AclV/ZRa+rxSGJOlghoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205809037"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jan 2026 08:29:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhs8X-00000000O2d-2rK3;
	Mon, 19 Jan 2026 16:29:53 +0000
Date: Tue, 20 Jan 2026 00:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Nirjhar Roy (IBM)" <nirjhar.roy.lists@gmail.com>,
	linux-xfs@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ritesh.list@gmail.com,
	ojaswin@linux.ibm.com, djwong@kernel.org, hch@infradead.org,
	nirjhar.roy.lists@gmail.com
Subject: Re: [PATCH v1] xfs: Fix calculation of m_rtx_per_rbmblock
Message-ID: <202601200031.0j1vAGWr-lkp@intel.com>
References: <2e0f36968b112303466c5e07a88c7e9949f769fe.1768822986.git.nirjhar.roy.lists@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e0f36968b112303466c5e07a88c7e9949f769fe.1768822986.git.nirjhar.roy.lists@gmail.com>

Hi Nirjhar,

kernel test robot noticed the following build errors:

[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on linus/master v6.19-rc6 next-20260116]
[cannot apply to riteshharjani/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nirjhar-Roy-IBM/xfs-Fix-calculation-of-m_rtx_per_rbmblock/20260119-195408
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/2e0f36968b112303466c5e07a88c7e9949f769fe.1768822986.git.nirjhar.roy.lists%40gmail.com
patch subject: [PATCH v1] xfs: Fix calculation of m_rtx_per_rbmblock
config: riscv-randconfig-001-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200031.0j1vAGWr-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200031.0j1vAGWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200031.0j1vAGWr-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/libxfs/xfs_sb.c: In function 'xfs_sb_mount_common':
>> fs/xfs/libxfs/xfs_sb.c:1271:27: error: implicit declaration of function 'xfs_rtbitmap_rtx_per_rbmblock'; did you mean 'xfs_rtx_to_rbmblock'? [-Werror=implicit-function-declaration]
     mp->m_rtx_per_rbmblock = xfs_rtbitmap_rtx_per_rbmblock(mp);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                              xfs_rtx_to_rbmblock
   cc1: some warnings being treated as errors


vim +1271 fs/xfs/libxfs/xfs_sb.c

  1245	
  1246	/*
  1247	 * xfs_mount_common
  1248	 *
  1249	 * Mount initialization code establishing various mount
  1250	 * fields from the superblock associated with the given
  1251	 * mount structure.
  1252	 *
  1253	 * Inode geometry are calculated in xfs_ialloc_setup_geometry.
  1254	 */
  1255	void
  1256	xfs_sb_mount_common(
  1257		struct xfs_mount	*mp,
  1258		struct xfs_sb		*sbp)
  1259	{
  1260		struct xfs_groups	*ags = &mp->m_groups[XG_TYPE_AG];
  1261	
  1262		mp->m_agfrotor = 0;
  1263		atomic_set(&mp->m_agirotor, 0);
  1264		mp->m_maxagi = mp->m_sb.sb_agcount;
  1265		mp->m_blkbit_log = sbp->sb_blocklog + XFS_NBBYLOG;
  1266		mp->m_blkbb_log = sbp->sb_blocklog - BBSHIFT;
  1267		mp->m_sectbb_log = sbp->sb_sectlog - BBSHIFT;
  1268		mp->m_agno_log = xfs_highbit32(sbp->sb_agcount - 1) + 1;
  1269		mp->m_blockmask = sbp->sb_blocksize - 1;
  1270		mp->m_blockwsize = xfs_rtbmblock_size(sbp) >> XFS_WORDLOG;
> 1271		mp->m_rtx_per_rbmblock = xfs_rtbitmap_rtx_per_rbmblock(mp);
  1272	
  1273		ags->blocks = mp->m_sb.sb_agblocks;
  1274		ags->blklog = mp->m_sb.sb_agblklog;
  1275		ags->blkmask = xfs_mask32lo(mp->m_sb.sb_agblklog);
  1276	
  1277		xfs_sb_mount_rextsize(mp, sbp);
  1278	
  1279		mp->m_alloc_mxr[0] = xfs_allocbt_maxrecs(mp, sbp->sb_blocksize, true);
  1280		mp->m_alloc_mxr[1] = xfs_allocbt_maxrecs(mp, sbp->sb_blocksize, false);
  1281		mp->m_alloc_mnr[0] = mp->m_alloc_mxr[0] / 2;
  1282		mp->m_alloc_mnr[1] = mp->m_alloc_mxr[1] / 2;
  1283	
  1284		mp->m_bmap_dmxr[0] = xfs_bmbt_maxrecs(mp, sbp->sb_blocksize, true);
  1285		mp->m_bmap_dmxr[1] = xfs_bmbt_maxrecs(mp, sbp->sb_blocksize, false);
  1286		mp->m_bmap_dmnr[0] = mp->m_bmap_dmxr[0] / 2;
  1287		mp->m_bmap_dmnr[1] = mp->m_bmap_dmxr[1] / 2;
  1288	
  1289		mp->m_rmap_mxr[0] = xfs_rmapbt_maxrecs(mp, sbp->sb_blocksize, true);
  1290		mp->m_rmap_mxr[1] = xfs_rmapbt_maxrecs(mp, sbp->sb_blocksize, false);
  1291		mp->m_rmap_mnr[0] = mp->m_rmap_mxr[0] / 2;
  1292		mp->m_rmap_mnr[1] = mp->m_rmap_mxr[1] / 2;
  1293	
  1294		mp->m_rtrmap_mxr[0] = xfs_rtrmapbt_maxrecs(mp, sbp->sb_blocksize, true);
  1295		mp->m_rtrmap_mxr[1] = xfs_rtrmapbt_maxrecs(mp, sbp->sb_blocksize, false);
  1296		mp->m_rtrmap_mnr[0] = mp->m_rtrmap_mxr[0] / 2;
  1297		mp->m_rtrmap_mnr[1] = mp->m_rtrmap_mxr[1] / 2;
  1298	
  1299		mp->m_refc_mxr[0] = xfs_refcountbt_maxrecs(mp, sbp->sb_blocksize, true);
  1300		mp->m_refc_mxr[1] = xfs_refcountbt_maxrecs(mp, sbp->sb_blocksize, false);
  1301		mp->m_refc_mnr[0] = mp->m_refc_mxr[0] / 2;
  1302		mp->m_refc_mnr[1] = mp->m_refc_mxr[1] / 2;
  1303	
  1304		mp->m_rtrefc_mxr[0] = xfs_rtrefcountbt_maxrecs(mp, sbp->sb_blocksize,
  1305				true);
  1306		mp->m_rtrefc_mxr[1] = xfs_rtrefcountbt_maxrecs(mp, sbp->sb_blocksize,
  1307				false);
  1308		mp->m_rtrefc_mnr[0] = mp->m_rtrefc_mxr[0] / 2;
  1309		mp->m_rtrefc_mnr[1] = mp->m_rtrefc_mxr[1] / 2;
  1310	
  1311		mp->m_bsize = XFS_FSB_TO_BB(mp, 1);
  1312		mp->m_alloc_set_aside = xfs_alloc_set_aside(mp);
  1313		mp->m_ag_max_usable = xfs_alloc_ag_max_usable(mp);
  1314	}
  1315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
