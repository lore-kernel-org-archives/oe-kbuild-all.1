Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACA17263B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 02:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782872310; cv=none; b=j//DMilwyjzik+Ztdk65S5+ImYww/zUmsDxwKPhSVY8fNUbx88X9zyHRjdBO7pMVp7HeaOkzAXU7XC6d87SVpGo8q4zn5PWL0pYYmOhdw0jxjjmEGbRecjJ2Xr1G5QVjifm0XE9ilDinyF0Z9EY1Cx5fMTCBwIy8BGTEXrJ+p9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782872310; c=relaxed/simple;
	bh=x3PCDGiuSODepfqx0EWobVgeNTAS6qgeov6ic3jdvIg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q/nwGwHA8H3sWZtKBgWcfncsGnT5Xlde/wiBObwZ9z0N09IWpALXTE1mvK/b3K90TYQwfh1yItQQR8q8OH9fBFzN+zR5zT85m/EvdXd2Gcr33mPrJEsrcE0iUkfl/nj2WAJ2dmfWi77dLh6hARPp6r7z0MOOce+pinKLkxWezOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltKH4Ap5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltKH4Ap5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782872308; x=1814408308;
  h=date:from:to:cc:subject:message-id;
  bh=x3PCDGiuSODepfqx0EWobVgeNTAS6qgeov6ic3jdvIg=;
  b=ltKH4Ap5T+pjeoVn/gwmu7N2NJaHIV7+WjnaFGAq5P7WyROBb9vpGJgA
   k8v0TnS3ezpRdqUYc21FlAmraQijlC5Y7lCb+8LXc7a6pk/A/Cv6Z0QK6
   gZnMHt6PyHZRXS9ZVorym+pc5b391jQD9BsFtgUqvnvDRgHB4OyzRjSZX
   KP/BbxlwZkzYbru0I9IKFH87BUuPhfqdVclywCpF8yG9wH87JYIracv/G
   58yXokKpmTnpWtXuomcsLraaEntFgAkm1EcOaxSKafr2OHCzvfzMA5heJ
   gl2z6NvtNaXsVH6OsJh/zT4CQ9MJN7YjV6RieGBpMdfyr3nRBMMOIq5a7
   g==;
X-CSE-ConnectionGUID: L5evpKtASBu4tL7WwJqQ8Q==
X-CSE-MsgGUID: qPfl67HwR9GR3inVC3pNAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83468952"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="83468952"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 19:18:28 -0700
X-CSE-ConnectionGUID: ozsrJ5XSQ9KASGlNBfceew==
X-CSE-MsgGUID: aOhExL7ZSOGCFErTxmeAHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="290551615"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Jun 2026 19:18:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wekWt-000000008rz-3UDD;
	Wed, 01 Jul 2026 02:18:23 +0000
Date: Wed, 01 Jul 2026 10:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v2 11/13] Warning:
 io_uring/rsrc.c:1428 function parameter 'ctx' not described in
 'io_register_buffers_alloc_for_file'
Message-ID: <202607011035.Hd83Ddvz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v2
head:   da75cc2253180af718ba0b7b3684a091b16b14fb
commit: 83df08bcb3ef8910445506a7f1e4214a12c4ead6 [11/13] io_uring: add IORING_REGISTER_BUFFERS_ALLOC_FOR_FILE (opcode 38)
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260701/202607011035.Hd83Ddvz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011035.Hd83Ddvz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011035.Hd83Ddvz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: io_uring/rsrc.c:1428 function parameter 'ctx' not described in 'io_register_buffers_alloc_for_file'
>> Warning: io_uring/rsrc.c:1428 function parameter 'arg' not described in 'io_register_buffers_alloc_for_file'
>> Warning: io_uring/rsrc.c:1657 function parameter 'ioucmd' not described in 'io_uring_cmd_fixed_buf_get_imu'
>> Warning: io_uring/rsrc.c:1657 function parameter 'issue_flags' not described in 'io_uring_cmd_fixed_buf_get_imu'
>> Warning: io_uring/rsrc.c:1678 function parameter 'ioucmd' not described in 'io_uring_cmd_blk_iobuf_validate'
>> Warning: io_uring/rsrc.c:1678 function parameter 'issue_flags' not described in 'io_uring_cmd_blk_iobuf_validate'
>> Warning: io_uring/rsrc.c:1678 function parameter 'expected_q' not described in 'io_uring_cmd_blk_iobuf_validate'
>> Warning: io_uring/rsrc.c:1428 function parameter 'ctx' not described in 'io_register_buffers_alloc_for_file'
>> Warning: io_uring/rsrc.c:1428 function parameter 'arg' not described in 'io_register_buffers_alloc_for_file'
>> Warning: io_uring/rsrc.c:1657 function parameter 'ioucmd' not described in 'io_uring_cmd_fixed_buf_get_imu'
>> Warning: io_uring/rsrc.c:1657 function parameter 'issue_flags' not described in 'io_uring_cmd_fixed_buf_get_imu'
>> Warning: io_uring/rsrc.c:1678 function parameter 'ioucmd' not described in 'io_uring_cmd_blk_iobuf_validate'
>> Warning: io_uring/rsrc.c:1678 function parameter 'issue_flags' not described in 'io_uring_cmd_blk_iobuf_validate'
>> Warning: io_uring/rsrc.c:1678 function parameter 'expected_q' not described in 'io_uring_cmd_blk_iobuf_validate'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
