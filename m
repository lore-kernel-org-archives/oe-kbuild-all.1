Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D113CAD51
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730023085; cv=none; b=BRBoWQNljpimtVsfZ3VPY4P21639gVhgPX/YOCp0yN+5q9lAMUBiVlV1BtlbTy9BUGRNWilfTKu0R193btkI4Kvq8kkpBY7fmwWjoK7JpZbnl8cYQ9tQQgzfaDmDe+lrrNrGOM5hVrfbq286AgIuvqjrr/B7Ea5+J8cN/MWAjvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730023085; c=relaxed/simple;
	bh=iSxx6jfksEGhNGky2LTM+3dEcPKj67NspBcSEbUNHOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R57mWAwS0et8cIBECXws7thynNIHEs5tofjoeUiG5vcvJanegqZwa6sJC7hkFVN70QXoRSe+F3aVqDg4koc402o0uEipWr7Y2+BQMY7IrGTMcBgKH4dzSOmDIX0nWAHckf8SGNYIv5HVrxP3Toh2FdWo1FI5rkTcAyUHdtnd1VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WREQJBMm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WREQJBMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730023083; x=1761559083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iSxx6jfksEGhNGky2LTM+3dEcPKj67NspBcSEbUNHOo=;
  b=WREQJBMm74wHxANA3kjcND7wA8wKYlLIkD/3psr46KG9Wx2qIQbH70Yo
   w68a48DxtipHGQeZqjiI+dzEA3m4kEguEsg6cQFUhbWJElsHR+hlwYySH
   ZZRRbHrCYNAo7M9WrL/+pxNgaVX0vFehMWxeclrdXXbKqaVTg66FHLRR4
   x04K/rT5Vf0Ef6L6dIldMCx8LxUNHE0YAwzyTChkfD3+sW9SHdAI55u0v
   fF/h4rT4dIQOt01PLNWyGT1PT4gMi/MWfPsfgxg/2OnMcowocPQbCX6DU
   nge9n6/jF0CTJ+8UDaZxhfKz1o691J2fpNvxzGLfsHm062g/S2dEMmdJp
   w==;
X-CSE-ConnectionGUID: c61i48+DSMSlabaKRnYwAQ==
X-CSE-MsgGUID: qka9WR2pRVWHK86znQ3A9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="17272166"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="17272166"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 02:58:02 -0700
X-CSE-ConnectionGUID: /chBS6SvRMue2SnVGrRnMw==
X-CSE-MsgGUID: lR+wGMFiTvSSqY70kG816w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81371172"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Oct 2024 02:58:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5023-000abg-1L;
	Sun, 27 Oct 2024 09:57:59 +0000
Date: Sun, 27 Oct 2024 17:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 46/46] ld.lld: error:
 vmlinux.a(init/do_mounts.o):(.debug_str_offsets): uncompress failed: zlib
 error: Z_DATA_ERROR
Message-ID: <202410271751.d5b5kQOw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   79473ee0b7f1157cefef5e4b180fa14e30641d36
commit: 79473ee0b7f1157cefef5e4b180fa14e30641d36 [46/46] xfs: report a XFS_FSOP_GEOM_FLAGS_ZONED in the file system geometry
config: riscv-randconfig-001-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271751.d5b5kQOw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271751.d5b5kQOw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271751.d5b5kQOw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/do_mounts.o):(.debug_str_offsets): uncompress failed: zlib error: Z_DATA_ERROR
>> ld.lld: error: vmlinux.a(init/calibrate.o):(.debug_str_offsets): uncompress failed: zlib error: Z_DATA_ERROR

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
