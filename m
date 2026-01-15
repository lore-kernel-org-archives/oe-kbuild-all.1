Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4113335BD5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468018; cv=none; b=Qlp7VtVhS6Hvav1NnUr5ZPCh7fttd7kZ3QoxNIzZ4hM4CStyjQFb/ZNMAj2apF8JZKNgfQe8N1ylBSO/8upJI0S4gom7qc04TdIYNuAf7GnwCTZ7GoFmFdizhVCI/A+3rDZlPujA28L5n6kiF5WOWGUHbN4juY1oWwqYi3cCH8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468018; c=relaxed/simple;
	bh=fU8qGP78qqGkRhCSzmWZzdhgOF4agWCGB7kQeherHEA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LcGiffVwNm6/wCfTnOG6iRXK3+1t3p4IuSRFARRcTFpvXRNAvep+Oy5BIDBHsuPSslhp+n+uE4WGANCPbHlXt/H2C2u8cbw+VbP+453J0na4T9TivfMQTHdzztJBrddcwGQCy47ogrjpFJWTOGGIE1UI/Wpa1lAaXcUch/7P5ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbtNRs2A; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbtNRs2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768468016; x=1800004016;
  h=date:from:to:cc:subject:message-id;
  bh=fU8qGP78qqGkRhCSzmWZzdhgOF4agWCGB7kQeherHEA=;
  b=hbtNRs2A6PqhwFufZTutSuRPhBgV46LXlMO+3OAE9CebCGTRNHjKIGq7
   i4AY/U2P/gY3L1Bi1PuMnBTtmAV7mN+1wDxe4ObP1I1AawKA5O+10qXZO
   AwmThqrYEJtF+mneShvY47W1c6omrU1tG7JMk7Q/4DtgEwW4o3TEq80m6
   /RnFrSmsG1Lxm6Zr5plLhPkpA8RAV4uc+kUgeOPy1GZoFqpl00QvNMqfy
   UWvpKcp/h4RCE84L9xeTZ7LzmsJBR9T5qEng6ynrLokYgy+c6Tl9rfPsB
   WLS5D5YK3fbJXHMUGjhqjL+jNU1EdkUeFU2eXIypguYztxtchSJMzGYEh
   Q==;
X-CSE-ConnectionGUID: Hqn71MKNQM6uMDHjAT3FQQ==
X-CSE-MsgGUID: Ecm9U3NoSfGxsu3fS92DCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73613097"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73613097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 01:06:56 -0800
X-CSE-ConnectionGUID: Q52jiiVJTbOiX8W/Ju4kQg==
X-CSE-MsgGUID: jG5Q8hcYSjy7tJK0qTSCfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="205189430"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jan 2026 01:06:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgJJc-00000000HmG-32Bv;
	Thu, 15 Jan 2026 09:06:52 +0000
Date: Thu, 15 Jan 2026 17:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-restrictions 15/16]
 io_uring.c:(.text+0x7d8): relocation truncated to fit: R_NIOS2_CALL26 against
 `__io_uring_run_bpf_filters'
Message-ID: <202601151724.7gDP9O5h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-restrictions
head:   29ac83fe2b009e9bc007cc44ea21832a904be4fe
commit: 575dae8c0edf27527c2e86d4fce468106bf2c3f9 [15/16] io_uring: add support for BPF filtering for opcode restrictions
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260115/202601151724.7gDP9O5h-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151724.7gDP9O5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151724.7gDP9O5h-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: io_uring/io_uring.o: in function `io_init_req':
   io_uring.c:(.text+0x7d8): undefined reference to `__io_uring_run_bpf_filters'
>> io_uring.c:(.text+0x7d8): relocation truncated to fit: R_NIOS2_CALL26 against `__io_uring_run_bpf_filters'
   nios2-linux-ld: io_uring/register.o: in function `io_free_restrictions':
   register.c:(.text+0x14): undefined reference to `io_uring_put_bpf_filters'
>> register.c:(.text+0x14): relocation truncated to fit: R_NIOS2_CALL26 against `io_uring_put_bpf_filters'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
