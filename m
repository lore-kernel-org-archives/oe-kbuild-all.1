Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7808BF0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 01:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722301996; cv=none; b=jm4JuQaWIKbmb04DSToDoYOpFN8DVFNdbrNpBspsEP8eXv55cvTWXVXEdB1o+zfBhEecYMBWxU7uRHTHocrfhL/xbMatbze6aw0spAozpAOx/1aPa3TMkd/L3+qw9r6aFbn5zhSmeXb7y7yfzji61UfvxGxQSi2KIT77USJ/XOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722301996; c=relaxed/simple;
	bh=jP6iC07DNPXE6IL1El4Pkt5lDgujHfT9H+Lc0gGsfFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cKCxkVVnnYNc32S9y3BaMF0uqTD8m1xCWh3QsJ5RZUEkaQooJNWzg8Odr9xbHQ5EH15VKJXHzp0KWa0PFzQ4xQwJuBz+i6+HZZBE3196/v8k/reOkaldCqs7PBLGntRb+E82e+OLAjKe95B7NQNYqKuLjm2KuEWMz4HEv7dowy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKkwpgz2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKkwpgz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722301994; x=1753837994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jP6iC07DNPXE6IL1El4Pkt5lDgujHfT9H+Lc0gGsfFw=;
  b=fKkwpgz26Zj/+oi9P4sOormFsHSiTohxQf0MVArO37dsPccj9QLHwbjm
   RCISXEG7n9C6GoaadXPjbwn7W+IzsXoZ+G3C+UmsA2M57MxgbmV2+EpPA
   F9DH8/3gJamGAboPB7fa0ndQM7OAZ9A3wTibOsVmdTGphvpODgwTLrsJu
   rgaxwMLuuMyudR7rtilHGWd/MMTbUa/uIdWVpLH4qnrZlH9TKL+3OzCwV
   YnF4uTrQInhFLlip+A1K4050Z7qEtiHFlm5+zq4/TrDaC7IdqEOwPA6Te
   b2FIQvWdLn6SR4jehH1dNYcyJDXiOozukTsuV4XqgTLnG4uAzjKQnAGN6
   g==;
X-CSE-ConnectionGUID: Lbr3K8wsQkGRLp6Bp/FcGQ==
X-CSE-MsgGUID: tFipdqLuTP2C8bmgko0ghA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30722865"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="30722865"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 18:13:14 -0700
X-CSE-ConnectionGUID: 25ePFT9fT/av+DX9eseRqw==
X-CSE-MsgGUID: B6+6cecDSL2iHVicao8eZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54077385"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jul 2024 18:13:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYbQM-000sI2-1e;
	Tue, 30 Jul 2024 01:13:10 +0000
Date: Tue, 30 Jul 2024 09:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-per-rtg-bitmap 15/15] fs/xfs/scrub/cow_repair.c:478:17:
 error: implicit declaration of function 'xfs_rtallocate_repair_extent'; did
 you mean 'xfs_rtallocate_extent'?
Message-ID: <202407300912.7zQfGd1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap
head:   f30a4a99bd08a8b9f43363a4ae0fdff0677c5d33
commit: f30a4a99bd08a8b9f43363a4ae0fdff0677c5d33 [15/15] xfs: use per-RTG bitmaps and summaries
config: x86_64-randconfig-161-20240730 (https://download.01.org/0day-ci/archive/20240730/202407300912.7zQfGd1Q-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300912.7zQfGd1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300912.7zQfGd1Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/scrub/cow_repair.c:29:
   fs/xfs/xfs_rtalloc.h:72:47: error: expected parameter name, found ")"
      72 | # define xfs_growfs_check_rtgeom(mp, d, r, rs,)         (0)
         |                                               ^
   fs/xfs/scrub/cow_repair.c: In function 'xrep_cow_alloc_rt':
>> fs/xfs/scrub/cow_repair.c:478:17: error: implicit declaration of function 'xfs_rtallocate_repair_extent'; did you mean 'xfs_rtallocate_extent'? [-Werror=implicit-function-declaration]
     478 |         error = xfs_rtallocate_repair_extent(sc->tp, maxlen, &repl->fsbno,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 xfs_rtallocate_extent
   cc1: some warnings being treated as errors


vim +478 fs/xfs/scrub/cow_repair.c

   465	
   466	/*
   467	 * Allocate a replacement rt CoW staging extent of up to the given number of
   468	 * blocks, and fill out the mapping.
   469	 */
   470	STATIC int
   471	xrep_cow_alloc_rt(
   472		struct xfs_scrub	*sc,
   473		xfs_extlen_t		maxlen,
   474		struct xrep_cow_extent	*repl)
   475	{
   476		int			error;
   477	
 > 478		error = xfs_rtallocate_repair_extent(sc->tp, maxlen, &repl->fsbno,
   479				&repl->len);
   480		if (error)
   481			return error;
   482		xfs_refcount_alloc_cow_extent(sc->tp, true, repl->fsbno, repl->len);
   483		return 0;
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
