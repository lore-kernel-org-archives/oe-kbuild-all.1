Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8056184
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 02:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303098; cv=none; b=Vh3TmFHi4lEjK8UTeJ3gMLO9wKj3gctkyVCnRUdB0Ja7ggnIr8CfnlFIST1ZT7fMGlHyVIgAhgJWpY0RsxQ4xyfxLShZuGOIbxrHwv3faoh+DRK3hTsuzAd23aVmA9zJZjn9NZTYgkwnPgRNBIil90JPDfUVa8xF4A3KiAkUZH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303098; c=relaxed/simple;
	bh=IwUyA+tGMnIb+IRfZu3h1RqUbXVF7BxGxqmjtsONmq8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B868n5UvS/GUZlNLE3mjccv/eLqCHfgDjFPg5+HIPZ3A3488gyixYsG9RjZ8hDcHZzk/8smGG9QcRTVyi3ncpcYUXAaa0dECRUgvbXtuutRjXF7tzu8Y8gr5e2bGGH1072CfzJrm7oiif+X7b2cthB8DlGk3dA9YG25b717Yllk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEsIrBVJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEsIrBVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790303097; x=1821839097;
  h=date:from:to:cc:subject:message-id;
  bh=IwUyA+tGMnIb+IRfZu3h1RqUbXVF7BxGxqmjtsONmq8=;
  b=FEsIrBVJEpLMVCwjSIHtkV7i3F958ufuy4EjHxaBtKcY9fF0ThNe7J8R
   0d2vxYMV2H0p/A5Ln2BFUdVayiTJokegkI68u74upOuJwVeu9losCSk2I
   ZlwN2cts6U1sNp6qDgTtdenZ7GsmUksuTWySd5SFPUF14Rki34Lqz3Lf/
   lgioE4alPyPfAoBb6ffe7kJta0Prtek8WiLLU1itikZ2YBa82obSX3u/5
   n8mBw8xoHjdf8bVTQLI+/krfC7LFK5WCZlH0kf++AFDD375RSER8mEhKV
   RU7uU9c9lvLE6pZjFu/0jpUcOyIR0Bge8Cdazp4JIxy8VIn7xPyFNp+Pl
   A==;
X-CSE-ConnectionGUID: dvbSv2lsQ3q5/aX8os5/UA==
X-CSE-MsgGUID: f+ndSIt3TQOd7Pd3t0Oinw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90307541"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90307541"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 19:24:56 -0700
X-CSE-ConnectionGUID: +5q9mm/1T2urt04tcrpU7g==
X-CSE-MsgGUID: pOGE6Mb8SZql0OiIB8DXKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="277962823"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Sep 2026 19:24:55 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9vcK-00000000JwQ-29JM;
	Fri, 25 Sep 2026 02:24:52 +0000
Date: Fri, 25 Sep 2026 10:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v6 5/13] error[E0063]: missing field
 `init_dma_buf_io_ctx` in initializer of `block_device_operations`
Message-ID: <202609251001.BdTyNOPl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v6
head:   0d82253d5e930981e6a21503e145a1ebd280f995
commit: eafcbbf7e75e75e98d0791b843fae0f2423a4ecd [5/13] block: add dma-buf support for raw bdev
config: x86_64-randconfig-1007-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251001.BdTyNOPl-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251001.BdTyNOPl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251001.BdTyNOPl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `init_dma_buf_io_ctx` in initializer of `block_device_operations`
   --> rust/kernel/block/mq/gen_disk.rs:128:58
   |
   128 |         const TABLE: bindings::block_device_operations = bindings::block_device_operations {
   |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `init_dma_buf_io_ctx`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
