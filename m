Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793318370;
	b=ux26Cu6Au8NC0o3aoV0PJ4A6ii/IbMfpDH75yMUNUVp9EgO6Kesf6jSusQKWDnPVCgEH
	 eAUnwlpccazZfaLDZ5VeAbAnBBTyCvcRh+qmy5w3TCqJzmSlUe/hR7IJ7SiisWU7dff4k
	 bmry+O4ctyKGfeseEDDTV0Nqq5w/UKl3/RPehTR5jFbhPSCubthUx08euJl9fgmyU8O0M
	 88Kc/MhUL3SsAHoREwwQZ8a3aFr+vWI49iCh3bnfLxCskZIOmFdUF3khq3kPjIxHQTFMf
	 b6/1IFSSIv9ECkyLjsMMiuP/OyiyUdErr6lN+IaJ4yFVvaRvoQiXqkXJpJoBO1r4xwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793318370;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=288PsVUJQPNrtm0VVrfS/JVLYzg5eaklgdro7oDcJIo=;
	b=FrmO1sDAkJTJSnX8Qfpxka9Zr4NDQfV7MmgG3YyRjHbYn8aO8FGLxjGIDCfrZkOslhfa
	 YwWLqwEGPo9g4Ks0ZfKVY469K/oogW+cPnKRCkDQjDDOL6e6kfcnISIBb9LXV0rlqqu/n
	 1626XzqrXizugjbM5pJyd7X54q7FsVzR3OidtVUIGOMj0jvAaHa042X1SxjwmgOlyMSAS
	 41H4iorCgTxv6YmEJkK/DfWwKHg21cNTZUrpTpJ57EgHamRq9yqAS/XtljZT5B41H5PWO
	 wjeAhEVNHWrt/Xk76RUjOl4rTkxZ+CB/gDl8rFTKPpr68rNlhj6qZmAGXlrqVsGtvJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NH8CiDiM;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE65F606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 23:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE65F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NH8CiDiM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793318369; x=1824854369;
  h=date:from:to:cc:subject:message-id;
  bh=2B5Ylz3EfQQMj6fqnTiKK7zq+uGHDpFfdGZL/aXn/sM=;
  b=NH8CiDiMAzSgSq0CDRthcNpzCX1uCxAuE5mrGprO9vHqHWBum9vJNYnn
   d/eOSkR+R7daX5J9YUH54rmyMftuEfbJYRrQp1gKpU27x+WWMgHXddfXX
   +Br2lyFYk2tViSL2CYUayyLCWOKO8HUQGIFqDZOAq8FiX+AzxsoV9zkNY
   DtcA1Xg9/H9gcu8ZxktGh2ovFydOvSMhFamspMoAEsiU5gUhSE7pO6jIy
   RbAIyZZjzh/fo4L3B5YZlhyrBRiGXnZJsOQ6nxhBA/XHrtyWsE+IqKkqk
   DEUOT3yKuTuC861Q5ygjtLvq9p+y5L540ozUlNWzzM+flbwlP7zPVsfdE
   Q==;
X-CSE-ConnectionGUID: sdZv4RrxS/67V6/Ap0gx8g==
X-CSE-MsgGUID: k10qE6pJRsuxvoJO5uJOyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1955551"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1955551"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 16:59:28 -0700
X-CSE-ConnectionGUID: CQuBjzCPQo2N5//h3pk4gQ==
X-CSE-MsgGUID: CvKH0r+XSJCyP0z6b9h00g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5823348"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2026 16:59:27 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMa1k-000000005PT-1Jwg;
	Thu, 29 Oct 2026 23:59:24 +0000
Date: Fri, 30 Oct 2026 00:58:42 +0100
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:tty-nowait 15/21]
 fs/notify/inotify/inotify_user.c:698:16: error: 'fdf' is a pointer; did you
 mean to use '->'?
Message-ID: <202610300011.j6ebX0iz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tty-nowait
head:   6ce7bd6c31981898360c3e36c9c270b0215cd020
commit: 29b6c55defd03d6cd9ea2b19545a3b67fd618fa3 [15/21] inotify: convert read to read_iter
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261030/202610300011.j6ebX0iz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300011.j6ebX0iz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300011.j6ebX0iz-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/notify/inotify/inotify_user.c: In function 'do_inotify_init':
>> fs/notify/inotify/inotify_user.c:698:16: error: 'fdf' is a pointer; did you mean to use '->'?
     698 |         if (fdf.err) {
         |                ^
         |                ->
   fs/notify/inotify/inotify_user.c:700:27: error: 'fdf' is a pointer; did you mean to use '->'?
     700 |                 return fdf.err;
         |                           ^
         |                           ->


vim +698 fs/notify/inotify/inotify_user.c

   676	
   677	
   678	/* inotify syscalls */
   679	static int do_inotify_init(int flags)
   680	{
   681		struct fsnotify_group *group;
   682	
   683		/* Check the IN_* constants for consistency.  */
   684		BUILD_BUG_ON(IN_CLOEXEC != O_CLOEXEC);
   685		BUILD_BUG_ON(IN_NONBLOCK != O_NONBLOCK);
   686	
   687		if (flags & ~(IN_CLOEXEC | IN_NONBLOCK))
   688			return -EINVAL;
   689	
   690		/* fsnotify_obtain_group took a reference to group, we put this when we kill the file in the end */
   691		group = inotify_new_group(inotify_max_queued_events);
   692		if (IS_ERR(group))
   693			return PTR_ERR(group);
   694	
   695		FD_PREPARE(fdf, O_RDONLY | flags,
   696			   anon_inode_getfile_fmode("inotify", &inotify_fops, group,
   697						    O_RDONLY | flags, FMODE_NOWAIT));
 > 698		if (fdf.err) {
   699			fsnotify_destroy_group(group);
   700			return fdf.err;
   701		}
   702	
   703		return fd_publish(fdf);
   704	}
   705	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
