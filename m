Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C2B2DCC02
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 03:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747971483; cv=none; b=Rwz8ukJ0tyqfd+TDPVoEmMskRLbXACcjxQB870QDNJqvb9lswQ4wcfy8WS8YliJn4m+2EVcp9WuPoIjCZ15aFVg4yxPbt1pve6f7B3owaHTWymBmguoE3atchIY8t8uL8mTz91Rt1yOto50SMNWNYcljjFm6M1WuN9S+iz4jq04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747971483; c=relaxed/simple;
	bh=Wd95PV1m3y5/3Z+oLx5mLsAPXJYVxZu8ArJYqJRgYrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=El7k5ksuX7hmTRtrL5mwQpu388290rImOz2tOD0M5HNSU20DIH1MoAJzqLJE79BfxZdW6FOUP34EMTyuxPCCtFFTcf0fIFwMVITZLsRt/bGZ3W+t4qtvGnRjo4h+Iqsg8sQwjg6TRrzTssaZW81i8bFuMZPGElYksCXDsokhOuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ez83SU9x; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ez83SU9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747971481; x=1779507481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wd95PV1m3y5/3Z+oLx5mLsAPXJYVxZu8ArJYqJRgYrg=;
  b=ez83SU9xcEea4oZJw2TZ3sjhOHUUZp9RH59HWzZBAFxgVU7OZ4rMNzdc
   ni+W7g+YOVhlW6Kv/hVyXzXiQSULCYyQEX4OQElypkH7BLdgeGvwRlx8t
   Zj/zVbucPZ5KDAewqI9JsVKpsAHTctpT4Z8Z7LcJczZK2TB5a89lkR4fE
   hjvCdVG1OsQqdPqnOhFoOBde/1bf3GDWJVtdLFtrgTKJ87p3oX724XHZw
   PG+rWkWJ3teAJvrmIdk6UeM5ydgc+oNesv2CSmQZU+VuyiEncC1HSswao
   t0G+wWZu3SgyQb9cw5nkEsbfbosCfnmLF72F6WqPCTthqaKXpIBdCnNK5
   g==;
X-CSE-ConnectionGUID: mZlEdPJjQ3C30wyhlt3MSA==
X-CSE-MsgGUID: AaCmMp9CTGmbIcdHrpecqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61069497"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="61069497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 20:38:01 -0700
X-CSE-ConnectionGUID: 4oyDIRBhTCONqQ+5EDnTLg==
X-CSE-MsgGUID: +vRC+gm4Qo2WENBuHP8Nbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="145762186"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 May 2025 20:38:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIJEM-000Pxy-0R;
	Fri, 23 May 2025 03:37:58 +0000
Date: Fri, 23 May 2025 11:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap 40/43] fs/fuse/file_iomap.c:1054:39: sparse:
 sparse: symbol 'fuse_iomap_aops' was not declared. Should it be static?
Message-ID: <202505231111.yQjmbKSA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap
head:   5b397601da90a62bdc9e22c480dee2381a16ec90
commit: a5943cfcd1cd6371b483c2a22bfd8276e0d07895 [40/43] fuse: implement buffered IO with iomap
config: riscv-randconfig-r111-20250523 (https://download.01.org/0day-ci/archive/20250523/202505231111.yQjmbKSA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250523/202505231111.yQjmbKSA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505231111.yQjmbKSA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/fuse/file_iomap.c:458:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__p @@     got unsigned int [usertype] *const map_dev @@
   fs/fuse/file_iomap.c:458:16: sparse:     expected void [noderef] __user *__p
   fs/fuse/file_iomap.c:458:16: sparse:     got unsigned int [usertype] *const map_dev
>> fs/fuse/file_iomap.c:1054:39: sparse: sparse: symbol 'fuse_iomap_aops' was not declared. Should it be static?

vim +/fuse_iomap_aops +1054 fs/fuse/file_iomap.c

  1053	
> 1054	const struct address_space_operations fuse_iomap_aops = {
  1055		.read_folio		= fuse_iomap_read_folio,
  1056		.readahead		= fuse_iomap_readahead,
  1057		.writepages		= fuse_iomap_writepages,
  1058		.dirty_folio		= iomap_dirty_folio,
  1059		.release_folio		= iomap_release_folio,
  1060		.invalidate_folio	= iomap_invalidate_folio,
  1061		.migrate_folio		= filemap_migrate_folio,
  1062		.is_partially_uptodate  = iomap_is_partially_uptodate,
  1063		.error_remove_folio	= generic_error_remove_folio,
  1064	
  1065		/* These aren't pagecache operations per se */
  1066		.bmap			= fuse_bmap,
  1067		.direct_IO		= fuse_direct_IO,
  1068	};
  1069	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
