Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407497;
	b=DVbTGT7twOc8LMjKpK9sUHYaDJFZj6a5Lx9Kyn8DSi9IUQJ1zmtnvw8wbfqvNLdCz14C
	 iedwJW36f7eJgmmihbM7Jt4DAYFaSfIyj1vSurfP4/cOV6BXI6uMRh/uowUnXWOZYqVFJ
	 t3/2gmgoMFTc6QWkoKeSBHSYfJmdTEdk6W13YPI5z2DUOn+yNActmgIQQi1DJrZgbLvCr
	 t9a/i5fh0l2U9WebWXJlDHVfYEYwm50Ew8H/3qeWD3W+U2Sy2PIYIkTiC1HzqfRn1j7+z
	 30ONfz6XkMQsqJ/xSMVGyiyvF3ceQzhwjcxfICktV7nIxctrA4x0PBsyeNhfWgDUdtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407497;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SHfH1vImLuM5lMbfU0PujALlcSPUAopfScAtFVgxaPY=;
	b=MaBtEkduxbd9uArZKq7XbJ4aE5OFjUjPMWOLsyYAyXDqiCLlc6KEBmAi1fd+Dx6KHNtu
	 rqn9F4HIlCtw11xYnN4pU8F/16xGDNkZnGbwIEvQ6F5ZDnzbp+4AO4/1Tycq481DhHXM1
	 F9+PLHt39oIwRmz5TsFIBtaLZilIi+ZAO71rjcz/ExGCqxwN8mMfbBp2YeDdUsFUurkKJ
	 XTmN5GCXKBKW6nhD6bsx7eVxN14ChEt20Lz+JK0Uyaht5oJDGYHROG5OA4PK64T0N6/4a
	 aoTjCiukR9ocLcZTDJFZrHyqfC5cF+16+zkUcrXxhHye3Dq/tcnV4HieXV3pTih2M+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nbuMJhCn;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2560606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 00:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2560606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nbuMJhCn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793407494; x=1824943494;
  h=date:from:to:cc:subject:message-id;
  bh=V4yhReoCIM7hYIQuYyqTL8Llfkty2+6RypDLHGjPK+o=;
  b=nbuMJhCnukiYyro2YgCnmA9+sEnumWQ0FRV1tXwRkfyYaxMVndOXxzrM
   JAt8PKg5gwyv7HqpQDjPLyKOh3COmaOCSZk7xww9mnoD+/R04xSKchaW+
   a+U4d2Aq5kkbbuAeh5mc8YS0bml15YLVRTKU7qg7/GIkzOUz5ZMYxMWxJ
   dEzlRghPNveZG8/lTSr+cwZ5endRSawxvvTHfjy37ejSOjFwsrKq0jw4T
   EX6fQS7N5IkFGhIdO8Ka+b/yr7ofx7UuACFrqNMtVnyybp7/wx3MkH0D5
   8SkgRwek4cTen+F1TJzSsnCYexHESsLc5G6YTZZSGHoDF9IBGEGyjwBr4
   g==;
X-CSE-ConnectionGUID: USJfWwlzRCmLhyiaA9pUeQ==
X-CSE-MsgGUID: TkrAOeUlTIO7k2VJllSuLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2182573"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2182573"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 17:44:53 -0700
X-CSE-ConnectionGUID: S+eS9uMkQnaqTAVVOesCdw==
X-CSE-MsgGUID: ITx8ifolSmaK+FaHNrsqOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5910488"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Oct 2026 17:44:52 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMxDF-00000000cOW-3f6P;
	Sat, 31 Oct 2026 00:44:49 +0000
Date: Sat, 31 Oct 2026 08:44:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:tty-nowait 15/21]
 fs/notify/inotify/inotify_user.c:698:16: error: 'fdf' is a pointer; did you
 mean to use '->'?
Message-ID: <202610310718.lgNYcWMP-lkp@intel.com>
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
commit: 6b374784aaf96cc671d327e748e7b9df7d88a84f [15/21] inotify: convert read to read_iter
config: arm-randconfig-1003-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310718.lgNYcWMP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310718.lgNYcWMP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310718.lgNYcWMP-lkp@intel.com/

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
