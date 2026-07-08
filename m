Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DC21E98EF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 01:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783473197; cv=none; b=EskTDphxnMD0jGHXYpn8nAYztlpYUGc8pKdQVfB9mpooYbsB1m9ajDDjhKFk8YFn18qttN4Ur0SsKa8WHLY7vxaKKikBzMztBbk33ws74v9Z90JzrLu0MvW0KecfIi33Kpnqdtw5/nmOjJThBGa1GvHGHTjuvpwy2GeRbtiNi+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783473197; c=relaxed/simple;
	bh=bWSmQyxuSbBQEjWb+DVWidftokZqqHGp+NC0JNaakaE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h3zy5erumxEE7fg90Hg54meB61hYzinEHb4FUOY6IAkgM+z2FgKdFpd//9PQpgnn/ilS4O92TQQSyDC9TbrIJmyCUEWk8wmrheHqRyW6QdL3nPASGcd4hJLb4WrivkRv6f6M8CH/6uBY6Dww890Gm16DEMC/5lS1agtck0xc59E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcrHHqOX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcrHHqOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783473195; x=1815009195;
  h=date:from:to:cc:subject:message-id;
  bh=bWSmQyxuSbBQEjWb+DVWidftokZqqHGp+NC0JNaakaE=;
  b=AcrHHqOXaizw7TC0PZXJ7Xt5F1bwU960NAFJX1kAXTYuqJydHKbssWpk
   cjECyVGSdWQNIyXcTogN9c+p8wQ2bKugLlFFrMxlks/FO45NASuyszT6q
   KIK1TWu6Vbm2PubSdpnlcY146MKTx9ddkL1I+q7qUHCUhPx7GoaNhIJPC
   qkZhMwVLOUxkmknDDlXCKKxFA3mjHeeRg+zIaQqy9HT5vRNpnk+KaVsl5
   b8wTdEqlo9VXMXkyu14e2oo5EyM8r7u4sdLNLRiOg3FSEEZtoME/GvOt8
   Z9h/JnYDWHiT5YPETo0ChXqZBexTAbJ4YFjhuC5Zl1JabQhLXFQqLD93l
   A==;
X-CSE-ConnectionGUID: hdEUIaWMSgCeE5FbKEKXWA==
X-CSE-MsgGUID: +/L+Hx4qT2ilN+eDSWuPPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84322928"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84322928"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 18:13:15 -0700
X-CSE-ConnectionGUID: PWQcgdUBQ+Sio02RChL1iQ==
X-CSE-MsgGUID: jfTmXN5CTBeT46ThddyGgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250790997"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jul 2026 18:13:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whGqd-00000000FrT-3ulE;
	Wed, 08 Jul 2026 01:13:11 +0000
Date: Wed, 08 Jul 2026 09:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zctx/devmem 14/15] io_uring/rsrc.c:1227:36:
 sparse: sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202607080831.vyhUT1Ca-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux zctx/devmem
head:   ad3d2185448cf828c65336fa4b71233098473a4a
commit: cd188445aee6477a09e0908f090106517becc7c0 [14/15] io_uring/rsrc: add zcrx backed registered buffers
config: arc-randconfig-r122-20260708 (https://download.01.org/0day-ci/archive/20260708/202607080831.vyhUT1Ca-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080831.vyhUT1Ca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080831.vyhUT1Ca-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/rsrc.c:1227:36: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __user *buf @@     got void * @@
   io_uring/rsrc.c:1227:36: sparse:     expected void [noderef] __user *buf
   io_uring/rsrc.c:1227:36: sparse:     got void *
   io_uring/rsrc.c: note: in included file:
   io_uring/filetable.h:55:35: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/filetable.h:55:35: sparse: sparse: restricted io_req_flags_t degrades to integer

vim +1227 io_uring/rsrc.c

  1222	
  1223	static int io_import_from_zcrx(int ddir, struct iov_iter *iter,
  1224					struct io_mapped_ubuf *imu,
  1225					u64 buf_addr, size_t len)
  1226	{
> 1227		iov_iter_ubuf(iter, ddir, (void *)(unsigned long)buf_addr, len);
  1228		return 0;
  1229	}
  1230	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
