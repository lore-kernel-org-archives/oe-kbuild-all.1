Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADF83164D0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 22:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763072657; cv=none; b=fBAhLXME2XGBmliiAwx1f2t4Icb0m7eoqoDH5s2vw6/X2pKVkHex10c4JxySMFLAng/Hgpqs5GU+UDmprOC81KD2GNdWNcbwnPbAgMYQXGihs3DMTe8BTn0npZV9MUvGgU+/EtYfwnEgnoOsFJmEHMhmKs+t0h1XBzNBacItP/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763072657; c=relaxed/simple;
	bh=k4h+KVJlJlZfDAdsoKSJ7ZLYCY5tMmtrBUe6jFBtgHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihu+V0N/XHJbNRNMgsBt6MiUAueYqHiCdO3+7qRycuPSL538e2/phIDFc38Ux82YIZ+VCDxwH7YQY6grWPXee+WC8ZNaN63v7/SdGn0iB/wWWypivdOR4GDNMYGINrz8ZFSaXDizlqqCu95faCaRcNqQZ5PvBpcbWXxJnn2YzRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJPKRHro; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJPKRHro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763072655; x=1794608655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k4h+KVJlJlZfDAdsoKSJ7ZLYCY5tMmtrBUe6jFBtgHE=;
  b=RJPKRHroKv/c5xjAopHTljlJwrtSeu18mrPQQyBE8FMFx8Gjyb/oX9HW
   /DtKNZaPrA3XDgYX54m7Ml6LvOAEUsCL4dw4HQFLdf82FNXDVrbVKRy2x
   3G6bwGJ5NqZRK4mcPC1qq39J29njUmOkbdTKmOJXrRtSgHk8jdmFECmu/
   E4e8Qb7RiVV6rDXWpGdybtuypcLKzGhurGLCTD3X3FLX8TVQs/GNkQ6A8
   pAFAowlDoGGCtGu/T0WR/ES2ysWkup1wFR6Knr5uVT4BKnkisdSf0JGb/
   i4qH0JhQW3IwS5JGIV34zkdfTIiq3Wry2dGQLCXgxHeth8E3yAQDNXLar
   w==;
X-CSE-ConnectionGUID: EApGvkmdRGa/k4wpepbyqQ==
X-CSE-MsgGUID: mxu1d7mZRxitYkfSDW3IdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82798562"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="82798562"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 14:24:15 -0800
X-CSE-ConnectionGUID: plj3lY1XS7KhzkqyWYluUA==
X-CSE-MsgGUID: k5OKquFcSXWZXjm28KtF9A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2025 14:24:14 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJfjg-0005wd-0Q;
	Thu, 13 Nov 2025 22:24:12 +0000
Date: Fri, 14 Nov 2025 06:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:inode-time-nowait.2 4/13] ERROR: modpost: "vfs_utimes"
 [fs/btrfs/btrfs.ko] undefined!
Message-ID: <202511140647.g7sZIJEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git inode-time-nowait.2
head:   c1eb91d90ea399b63adb47c0ab7ffe5e66ec1b2e
commit: fd3cc37e9a0c2391d31a5ab29eb357f567e79a68 [4/13] btrfs: use vfs_utimes to update file timestamps
config: x86_64-buildonly-randconfig-003-20251113 (https://download.01.org/0day-ci/archive/20251114/202511140647.g7sZIJEd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140647.g7sZIJEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140647.g7sZIJEd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "vfs_utimes" [fs/btrfs/btrfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
