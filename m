Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06481DDF4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 21:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725139944; cv=none; b=cyATKdoR5occzKmYgwZ/L+CPh+/2zivCu8dVMYMmKEUPcpVU7qwdDyFFauCQtj6ZpyG9PCUQKOsHi5ZYlk0nDFLpBWk2CZ6iDkN8tUMqwRxcWjp0LBLZeISPvp3L6g+VbFTHDsKRe4bFY+qbOm/znefrWkrOatU3KFbvCBhf54Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725139944; c=relaxed/simple;
	bh=7lH/gPasO3XRrEODKiybxteYTvxsB0nwOUWQFqfDCtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IL9PS06FOp7rcEbhVz0Nse7V5DqI/iNezaeYy/ohcwAMrpFUWYvO+qYu75RnwnK3NsOsOT+vsBgRPQUkaBStGklgFhb5O/qsL9S8UQkuLwy5ioNXY6k8btDuR7LM3Z/xsUtA4W4xVgawlAkCIk7kXdAuTxeIc3cKf0QHd1npeKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVim018K; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVim018K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725139942; x=1756675942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7lH/gPasO3XRrEODKiybxteYTvxsB0nwOUWQFqfDCtw=;
  b=XVim018KlPjnTFOhR8+fvmHFxd7Xu8NeYGhnNrPm9F1OdfTz28A3m4Fl
   bVDiIJQL3FEwLRmT5Hff4YV9wGoSabK7/4lXsJsxXo9q6IKeBNqB25Vrw
   d2Ek6IG7suYGFDMFyn+0vsRGULkMMia3Ws6qY0IVFHd2xbySblfHsgy9k
   SX4O6r3CWOe4zQNKK+MgmV0iphKNt70MUDn5ZH61xwAssBdGzA1f2Qab/
   vIxPxtBUdzbgqjtBQdcZMw0r+ikpFArTy0B1JSQbqORcyzN2xHI0hqIGW
   uEdiNPNqCWoeDrPNSposJ9Z/BSvTcT0ROiS1ktK/i74KqR0jYuRCMhrG+
   w==;
X-CSE-ConnectionGUID: oO3dx5SOR6+FCPH0+P6z4A==
X-CSE-MsgGUID: mqQRebZUTx2e7mjbRUGZZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23893785"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23893785"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 14:32:22 -0700
X-CSE-ConnectionGUID: /8i+lAa4RrmOTsOntwmolA==
X-CSE-MsgGUID: I3LlcREYQ4ul5EwbnTbB1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="63913029"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2024 14:32:21 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skVhj-00039A-00;
	Sat, 31 Aug 2024 21:32:19 +0000
Date: Sun, 1 Sep 2024 05:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, NeilBrown <neil@brown.name>,
	Jeff Layton <jlayton@kernel.org>
Subject: [snitzer:nfs-localio-for-next.v14-neilb 17/26] nfsctl.c:undefined
 reference to `nfs_uuid_invalidate_clients'
Message-ID: <202409010536.LnrMqBrY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next.v14-neilb
head:   70cce93a681fa1956cb736e574953994bfd5aae0
commit: 311a9e7ccc6022120e8d153b28e99238622a259d [17/26] nfsd: implement server support for NFS_LOCALIO_PROGRAM
config: mips-maltaup_xpa_defconfig (https://download.01.org/0day-ci/archive/20240901/202409010536.LnrMqBrY-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010536.LnrMqBrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010536.LnrMqBrY-lkp@intel.com/

All errors (new ones prefixed by >>):

   mipsel-linux-ld: fs/nfsd/nfsctl.o: in function `nfsd_net_pre_exit':
>> nfsctl.c:(.text+0x164): undefined reference to `nfs_uuid_invalidate_clients'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
