Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4302DF701
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jul 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785063983; cv=none; b=nzBXFK92XtR9o0z9a9VVxNlFhwIM1iWZj3x/n/pNCFQ8FLXm1oFTI8XZs711vjiUFfJLQ7YFzeXCgrXzXsrQaUX4QoKsMcHC9N8ztA3Yc5sYBlry52F2ROfTGw8EjxqLDUzqIIBde6EJT+1CxUkzfE+5GnDukD9ItG/NNrPoAIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785063983; c=relaxed/simple;
	bh=PbSUi/qENgeWMlZH3Oys0KK2SEkY1jnJdOrpve7Eg3M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T8ZiiNEx/isBXo2NRk97Cd6GeqdC6kZd5PXyc41BWUt45h2Mdf1DtKt1wNc8M59NMV1/EU76Hx22GbryikJCgKtxSU/xN+uguZDM1Kxz8dbjP8Zmnfws3WKGQRQ4AEwFdzdNYYuCeWQ44ABn/6oXhfQaIyWEnZ7fOpF1lYgYAU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhX+LWHu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhX+LWHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785063981; x=1816599981;
  h=date:from:to:cc:subject:message-id;
  bh=PbSUi/qENgeWMlZH3Oys0KK2SEkY1jnJdOrpve7Eg3M=;
  b=PhX+LWHuCsxU3D1ydFcTte7upjf1iij0N9ITM2ZcnqxnrpchKGi5ORNZ
   K+8KY0lfgsnHVnxD+eofz1ixELT0gImkpSNKInYAMGz5974mbXj6Xzjcs
   BnXW/G4z4vdfKSrNSCO1oyqJDMAH7M8boMPxl35ULOO/Fv2Qww2nlsE0c
   7cY0FiINn3SIw8va7xlj9Tr+WC0YkljOgLu4aWUcvakoPT9MtkHKNTi10
   FkxdCda6Oda+M7lWCYx7uLfBQvz4h3yT2o3+ns+Ckjd7Tc7vOXHVdNEZV
   ip27go+/uwCSSsjzeNs+gJUjFrIA+dTuH5a4fve0bDWy6GXJI41DtlA0o
   w==;
X-CSE-ConnectionGUID: U301/bbbSW2q0Q3B/DwZwA==
X-CSE-MsgGUID: IGYRNdiuT0OqBS6N7JzTJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="96013113"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="96013113"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 04:06:21 -0700
X-CSE-ConnectionGUID: YKceM7zZTnm+k1RtsnOpuQ==
X-CSE-MsgGUID: a+NBG4rATAmqm56tVj4h0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="252811916"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2026 04:06:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnwgS-00000000cUA-1b3y;
	Sun, 26 Jul 2026 11:06:16 +0000
Date: Sun, 26 Jul 2026 19:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 55/59] sparc-linux-ld:
 xfs_verify_media.c:undefined reference to `xfs_csum_verify'
Message-ID: <202607261821.6IrEBLqF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   10c7aa6f2c85085eec34737be592d6ae69583782
commit: 8ccb82b663f5424f58c201241853be9e4d75fece [55/59] xfs: verify data checksums during media verification
config: sparc-randconfig-001 (https://download.01.org/0day-ci/archive/20260726/202607261821.6IrEBLqF-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607261821.6IrEBLqF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607261821.6IrEBLqF-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: fs/xfs/xfs_verify_media.o: in function `xfs_submit_verify_bio_csum.constprop.0':
   xfs_verify_media.c:(.text+0x944): undefined reference to `xfs_rtcsum_read_async'
>> sparc-linux-ld: xfs_verify_media.c:(.text+0xa54): undefined reference to `xfs_csum_verify'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
