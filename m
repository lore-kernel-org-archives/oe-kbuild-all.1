Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4977C4597A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712220763; cv=none; b=Vivhtgin1xMK9iETN8nnPPshKcLj3exuY8Rb9JGg5/FmlsoqArlaWwqWaNrDG9SXmO1eZYmVadtcn+ZLoP8/PtWovsIcI+sYt+KbKRxs8htRz0WIv/80uIy+ePpyc3kyki3J2tfjbECRlJ6/pOH4UWpdSM3SCFYN779Wpz57NXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712220763; c=relaxed/simple;
	bh=2M/s0KD53TCB3p/5WaQQHa+oPaXCJ4kFnL1Je91iPK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VAbWLvOtSXhA5It2bPyUrEvzafs8v5ZDZV2gReZnDe7aDIJK9U+SLJcVfiPiI1e+blWcISNvowOXMwMJ38u77LF5157KxnMsNbicXySG0AzVAqCmgP+sUFO+iqjL/6hDbDGvuDzxovISNKxL6tNpAEIWR5mjTOIpB7d6HfWh87o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXDpUBJ2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXDpUBJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712220758; x=1743756758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2M/s0KD53TCB3p/5WaQQHa+oPaXCJ4kFnL1Je91iPK0=;
  b=AXDpUBJ2L0b6RXOZYgZa7XqTJbWM2fbwp+OrDDCkWT9ETHEWqdJkcb8S
   WSyY+DYHvj406HaeY5/ZDAwww8Cx6p4lBkeWCYGybFupF0F5u+/ckabx+
   ns8H73heEI8eif1GjcKrqBe3Nf3Zll9OPZoVvlOtSx3GIA5henxU57X0f
   FPH4hKncEMypxcZ/C5oo0D7robcTTPAqNoW3PEwMhEebKjQlvuPYtPwXO
   dymJqLb/j+YNBjBDsLxgTMfYCsVQFXmLBxHr7jLyVz71IxK66FDGcGFjn
   l8gsYCBDXseOgTeSiO0I1vrxWzO1/GOtyovxqlprQJmjkmZV+dJyBGYJa
   A==;
X-CSE-ConnectionGUID: FUe3DQ43TlqT6J9pNfxQRg==
X-CSE-MsgGUID: RF2AAkqRQHSLuqzYx8VvKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11262514"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="11262514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:52:37 -0700
X-CSE-ConnectionGUID: 7UM1MA5STCeI3Qgf4Fx/ag==
X-CSE-MsgGUID: Plnt9/jvSeOT2kp3fnXoEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23401856"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Apr 2024 01:52:36 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsIpm-0000oK-0b;
	Thu, 04 Apr 2024 08:52:34 +0000
Date: Thu, 4 Apr 2024 16:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 19/20] lib/kunit/debugfs.c:149:16: error:
 implicit declaration of function 'iov_iter_count'
Message-ID: <202404041655.UP88wM2h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   434bfd4fff7ae30ffe26a2e330ed50ff5bb34ee4
commit: 13b905238a8f0659e86279b98b72b4529375902f [19/20] lib: convert to read/write iterators
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240404/202404041655.UP88wM2h-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041655.UP88wM2h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041655.UP88wM2h-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/kunit/debugfs.c: In function 'debugfs_run':
>> lib/kunit/debugfs.c:149:16: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     149 |         return iov_iter_count(from);
         |                ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   lib/xz/xz_dec_test.c: In function 'xz_dec_test_write':
>> lib/xz/xz_dec_test.c:104:23: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     104 |         size_t size = iov_iter_count(from);
         |                       ^~~~~~~~~~~~~~
>> lib/xz/xz_dec_test.c:125:30: error: implicit declaration of function 'copy_from_iter'; did you mean 'copy_from_user'? [-Werror=implicit-function-declaration]
     125 |                         if (!copy_from_iter(buffer_in, buffers.in_size, from))
         |                              ^~~~~~~~~~~~~~
         |                              copy_from_user
   cc1: some warnings being treated as errors


vim +/iov_iter_count +149 lib/kunit/debugfs.c

   135	
   136	/*
   137	 * Trigger a test suite to run by writing to the suite's "run" debugfs
   138	 * file found at: /sys/kernel/debug/kunit/<testsuite>/run
   139	 *
   140	 * Note: what is written to this file will not be saved.
   141	 */
   142	static ssize_t debugfs_run(struct kiocb *iocb, struct iov_iter *from)
   143	{
   144		struct inode *f_inode = iocb->ki_filp->f_inode;
   145		struct kunit_suite *suite = (struct kunit_suite *) f_inode->i_private;
   146	
   147		__kunit_test_suites_init(&suite, 1);
   148	
 > 149		return iov_iter_count(from);
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
