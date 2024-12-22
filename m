Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9712746C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 21:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734901234; cv=none; b=sXgpuEfDmN2wIl8Bp6fsiJhjmWn3DvtI0vMHN+axUgiwBv8Nx5fzoZKiBmM860JD1sWhB6/139gO45SpAsJmoBExRdWBilAdAP73t8D3FCM2V20QSsRW9kizvIHIDRqonrKVOGquVap0Z5vxpfiRPBpUtpPqBqNPUHT7u6QQ9H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734901234; c=relaxed/simple;
	bh=lCI/VEBSEEMeX13KgLA4Fux+YQr87SWEwiY5pmfS6nU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=knH/opZw1EyGUcBUmjFJTHbpC17jypoYpiBlZqgD4esz3iJ/HX2CkZ95gwQ1+Y8SzkBIopvoHloKp+vBEBIK2AxCJHeUVefO7U0Jmp9qTfNG0PI0D5DDK6aly4CHafcHhNBJJWpgY8rscZUPBmazR1jt0vBYfJCeA7bqpHoBhBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwsaAfE5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwsaAfE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734901232; x=1766437232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lCI/VEBSEEMeX13KgLA4Fux+YQr87SWEwiY5pmfS6nU=;
  b=gwsaAfE5iI3KEm/4Duv+sRD8ksCQ0HfT90XC27QgShUKB86Eia/btDUQ
   Szl5wJpieYIlPAuXc54+tkDk+t8CNHhcbhJTMprCG7pfj+36oggHN1pnO
   cDApbFnaZVARpbQHCu2JCLVO69awnk1PFbJatjwAWDc0aEMPO1JkDgWYl
   1qWSsR+VVP3pFtox65+5C+p2dGeFqIU/0LZIZJEURduR34XZQm8Q5a7zB
   NW8aFkM/lKDq04oHdITPSjOYkUyKF9ngcRtbEWeEM4E5kqXADpTaVoACc
   gBShxlEdS8VvBceJLcgAyPkWqWCSeZheznDzYj+SZC2LKsODlaQclv8uy
   A==;
X-CSE-ConnectionGUID: IcCO7GfASKi1cuGFByws/g==
X-CSE-MsgGUID: kVwR7zIwRcukwj1j/JIeOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="46790957"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="46790957"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 13:00:32 -0800
X-CSE-ConnectionGUID: GEnTCL2PQkaNFSTrfj/pPg==
X-CSE-MsgGUID: Up+Z61LWRIG2mDEevSRDcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103130252"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2024 13:00:30 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPT3s-0003BL-1G;
	Sun, 22 Dec 2024 21:00:28 +0000
Date: Mon, 23 Dec 2024 05:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:zoned 125/144] fs/xfs/xfs_zone_alloc.c:669:62: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <202412230407.FNn45tup-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git zoned
head:   e438c133cc544cff3b44f8c3fde87a8ab5f8a3de
commit: aeba972d7108ff837bdc8786fd19f786f9dbd3ba [125/144] xfs: add the zoned space allocator
config: x86_64-randconfig-r132-20241223 (https://download.01.org/0day-ci/archive/20241223/202412230407.FNn45tup-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230407.FNn45tup-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230407.FNn45tup-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_zone_alloc.c:669:62: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted blk_status_t [usertype] status @@     got long @@
   fs/xfs/xfs_zone_alloc.c:669:62: sparse:     expected restricted blk_status_t [usertype] status
   fs/xfs/xfs_zone_alloc.c:669:62: sparse:     got long
>> fs/xfs/xfs_zone_alloc.c:669:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted blk_status_t [usertype] bi_status @@     got int @@
   fs/xfs/xfs_zone_alloc.c:669:33: sparse:     expected restricted blk_status_t [usertype] bi_status
   fs/xfs/xfs_zone_alloc.c:669:33: sparse:     got int

vim +669 fs/xfs/xfs_zone_alloc.c

   621	
   622	void
   623	xfs_zone_alloc_and_submit(
   624		struct iomap_ioend	*ioend,
   625		struct xfs_open_zone	**oz)
   626	{
   627		unsigned int		alloc_len;
   628		struct iomap_ioend	*split;
   629		bool			is_seq;
   630	
   631		if (xfs_is_shutdown(XFS_I(ioend->io_inode)->i_mount))
   632			goto out_error;
   633	
   634		/*
   635		 * If we don't have a cached zone in this write context, see if the
   636		 * last extent before the one we are writing points of an active zone.
   637		 * If so, just continue writing to it.
   638		 */
   639		if (!*oz && ioend->io_offset)
   640			*oz = xfs_last_used_zone(ioend);
   641		if (!*oz) {
   642	select_zone:
   643			*oz = xfs_select_zone(ioend);
   644			if (!*oz)
   645				goto out_error;
   646		}
   647	
   648		alloc_len = xfs_zone_alloc_blocks(ioend, *oz, &is_seq);
   649		if (!alloc_len) {
   650			xfs_open_zone_put(*oz);
   651			goto select_zone;
   652		}
   653	
   654		while ((split = iomap_split_ioend(ioend, alloc_len, is_seq))) {
   655			if (IS_ERR(split))
   656				goto out_split_error;
   657			alloc_len -= split->io_bio.bi_iter.bi_size;
   658			xfs_submit_zoned_bio(split, is_seq);
   659			if (!alloc_len) {
   660				xfs_open_zone_put(*oz);
   661				goto select_zone;
   662			}
   663		}
   664	
   665		xfs_submit_zoned_bio(ioend, is_seq);
   666		return;
   667	
   668	out_split_error:
 > 669		ioend->io_bio.bi_status = blk_status_to_errno(PTR_ERR(split));
   670	out_error:
   671		bio_io_error(&ioend->io_bio);
   672	}
   673	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
