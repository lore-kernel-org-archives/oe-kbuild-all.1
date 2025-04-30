Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C3E2DC76F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 01:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745977727; cv=none; b=UhaHBeVqGsxZmSX4uMSfodyK56uyOphcjMtXy3wJJ/duqsepjk0L5UnKN3mm/CPtRqFWbcQEs9fGx927aoQHt8MkC3OWuOUCcC7Jt9uJ3LukT64vNhukl6QZj0YD4TYMXaPyo0dXxDoWeZ4jVuTOj1hzhjKz8LoZnq07kRum0KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745977727; c=relaxed/simple;
	bh=M3NcaQ3JzTT2OHQqe6o8EqKm3iEnEP6VnB8MjtxHiy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E4K0XxLxxskZI7mMLc20bE+jysUrHHBbCzuptJEJHdKut/BwKEnlwQP+7VZS4TseSYDmHF4PQsWXI5ZUzE6qBXmHLPlWA7ZaydO/Yhd7yVLSVJxNAcjG2Fjv1TwUz+kplxFQNDNA5x7bJaRI4zg0/Y0x03FrmUkHVTX6Eg2YRxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDP4oK0S; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDP4oK0S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745977725; x=1777513725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3NcaQ3JzTT2OHQqe6o8EqKm3iEnEP6VnB8MjtxHiy8=;
  b=jDP4oK0SJAX80/I4oxybJiWRvF8HDCd2gOOQ2RDPEv0myPlTKdztPufk
   3hemqA8apXyY5P9qOR9qPPIOBDmez8oXDO8lLBs5Ok0+QQQ9SI8AvKDRY
   l5Yglt3HOVr0BQdI8zotnMfl+Wcje2Kcq+JLudpp9Dyk1Qv/afNq4k2lY
   xWrlpC859NQr/pLhxKoZpobgRPDv+MoCm/KFyCrhAcSERDKemCmNACS/9
   UiQEw5LZ/Iyv7eD6ntvsJJeBUhIG/T1ewmzhqDrx3+FkFPFygNFTAWVzn
   GfoTefOHqZnv/LVAjD9NMXhPxgPwnaY9TLci4htHL+plwDMTzDpzeLe/7
   g==;
X-CSE-ConnectionGUID: cszsK37NQieYGCXib3YFNw==
X-CSE-MsgGUID: VPYLl1sQSMuns0AbyJheNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47773409"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="47773409"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 18:48:44 -0700
X-CSE-ConnectionGUID: Jp9AvKw/S8eFCA064hMvvg==
X-CSE-MsgGUID: dg5dLDXeTYCywhFXPxQjAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="138957374"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Apr 2025 18:48:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9wYy-00035L-1Z;
	Wed, 30 Apr 2025 01:48:40 +0000
Date: Wed, 30 Apr 2025 09:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-handle 5/5] io_uring/openclose.c:546:
 undefined reference to `get_path_from_fd'
Message-ID: <202504300928.F2ipN9le-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-handle
head:   0519531750fa77b52759fc3c717486f69e4d69bc
commit: 0519531750fa77b52759fc3c717486f69e4d69bc [5/5] io_uring: add support for IORING_OP_OPEN_BY_HANDLE
config: um-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300928.F2ipN9le-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300928.F2ipN9le-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300928.F2ipN9le-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: io_uring/openclose.o: in function `io_open_by_handle':
>> io_uring/openclose.c:546: undefined reference to `get_path_from_fd'
   /usr/bin/ld: io_uring/openclose.o: in function `__io_open_by_handle':
>> io_uring/openclose.c:510: undefined reference to `do_handle_to_path'
   /usr/bin/ld: io_uring/openclose.o: in function `io_open_by_handle':
>> io_uring/openclose.c:554: undefined reference to `may_decode_fh'
   collect2: error: ld returned 1 exit status


vim +546 io_uring/openclose.c

   499	
   500	static int __io_open_by_handle(struct io_kiocb *req,
   501				       unsigned int issue_flags,
   502				       const struct export_operations *eops)
   503	{
   504		struct io_open_by_handle *h = io_kiocb_to_cmd(req, struct io_open_by_handle);
   505		struct io_open_by_handle_async *ah = req->async_data;
   506		struct path path __free(path_put) = { };
   507		struct file *file;
   508		int ret, fd;
   509	
 > 510		ret = do_handle_to_path(&ah->handle, &path, &h->ctx);
   511		path_put(&h->ctx.root);
   512		if (ret < 0)
   513			return ret;
   514	
   515		if (!(h->flags & IORING_OPEN_HANDLE_FIXED)) {
   516			fd = get_unused_fd_flags(O_CLOEXEC);
   517			if (fd < 0)
   518				return fd;
   519		}
   520	
   521		if (eops->open)
   522			file = eops->open(&path, h->open_flags);
   523		else
   524			file = file_open_root(&path, "", h->open_flags, 0);
   525		if (IS_ERR(file)) {
   526			if (!(h->flags & IORING_OPEN_HANDLE_FIXED))
   527				put_unused_fd(fd);
   528			return PTR_ERR(file);
   529		}
   530	
   531		if (!(h->flags & IORING_OPEN_HANDLE_FIXED)) {
   532			fd_install(fd, file);
   533			return fd;
   534		}
   535	
   536		return io_fixed_fd_install(req, issue_flags, file, h->file_slot);
   537	}
   538	
   539	int io_open_by_handle(struct io_kiocb *req, unsigned int issue_flags)
   540	{
   541		struct io_open_by_handle *h = io_kiocb_to_cmd(req, struct io_open_by_handle);
   542		struct io_open_by_handle_async *ah = req->async_data;
   543		const struct export_operations *eops;
   544		int ret;
   545	
 > 546		ret = get_path_from_fd(h->dirfd, &h->ctx.root);
   547		if (ret < 0)
   548			goto err;
   549	
   550		eops = h->ctx.root.mnt->mnt_sb->s_export_op;
   551		if (eops && eops->permission)
   552			ret = eops->permission(&h->ctx, h->open_flags);
   553		else
 > 554			ret = may_decode_fh(&h->ctx, h->open_flags);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
