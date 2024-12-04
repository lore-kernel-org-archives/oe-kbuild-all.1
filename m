Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D74F2391A0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 21:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733349229; cv=none; b=RxQ2fs50VvhUw+Qw+HK10+PyDyBSl7YHCAtmvIKbsVJ7Plq8xQxtEH2vEUhzyRClkTzc2Q4WnhzabiOII7WvUatcju1gUOMLR9X69A/JzE5WVIyVABdt3tYVloZPxKzf8dC4Tzg/B9TyrLsoQZhAA/YcFsHG5/R+jUthFs8kU54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733349229; c=relaxed/simple;
	bh=7eoqOowD6ehjzrU2VnjYefWVJx6+rj7vswRHPYiAB7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BIqTZgPLfQj6Rj2SFBxokUCvL8NrrmqAcPCElGe6tY8f4XDjc24iV8kmxedmCwwSSbLpI/sAPuu0FiU3ntejBKs2ugwSG4fAaY7WVvBNx42ok8vU094i0XWGFsF/xBkHIo4Dtxo1o3qxikhqYJrhQv7ycTHuKb9PTftBZzn1kig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aa6JKHT9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aa6JKHT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733349227; x=1764885227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7eoqOowD6ehjzrU2VnjYefWVJx6+rj7vswRHPYiAB7k=;
  b=Aa6JKHT9A6wd/mUl9/E3hvy7evnJHphl4kf1B+Wn/pT82DnEsGQvrCEl
   wNLm8MoZoBq/QqpiXRb9ma0J3GaqCjSW6fm+KVdT6eUNI253xA1BfcU5j
   CYN+zBYpAI52rqfOsZ5DtpgI7xFIHq4kf9RzBUi3M9Wn+sJnduteuk8B0
   +2J/BRH+591SGTrfE/iinPs1QvVwXwH12LGdDQc3+njL107nGjBW8NkpN
   q0xfmYl1pyPa7m/21ttQHN00XQb9BzKPZ/Jl3qTSxwJaKeHeQt7lQWdfu
   pWedvLtuputwP2/vQsnrANlTYuXMl8ppsNf33O44/nw6VkacasRk8+p32
   A==;
X-CSE-ConnectionGUID: NLf3bK0sSUKCHR+6CbgPiA==
X-CSE-MsgGUID: Uk2AwvKXTSmSb9NO4XiCwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51051977"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="51051977"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 13:53:47 -0800
X-CSE-ConnectionGUID: JpMPbrGkRWqYZKchCEqwWQ==
X-CSE-MsgGUID: dUyahQ4nQceL2ur91AcORA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="93741776"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Dec 2024 13:53:47 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIxJX-0003X0-1s;
	Wed, 04 Dec 2024 21:53:43 +0000
Date: Thu, 5 Dec 2024 05:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring 162/163]
 fs/xfs/xfs_notify_failure.c:553:41: warning: variable 'fdev' set but not
 used
Message-ID: <202412050545.liqpoCCn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   3ef6d3267cdc0cf4ed98d255efb948c8d404eaf9
commit: 0940e5a093a2135fd652bf527ef564c15f144da3 [162/163] xfs: add media error reporting ioctl
config: csky-randconfig-r054-20241205 (https://download.01.org/0day-ci/archive/20241205/202412050545.liqpoCCn-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050545.liqpoCCn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050545.liqpoCCn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/xfs_notify_failure.c: In function 'xfs_ioc_media_error':
>> fs/xfs/xfs_notify_failure.c:553:41: warning: variable 'fdev' set but not used [-Wunused-but-set-variable]
     553 |         enum xfs_failed_device          fdev;
         |                                         ^~~~


vim +/fdev +553 fs/xfs/xfs_notify_failure.c

   543	
   544	#define XFS_VALID_MEDIA_ERROR_FLAGS	(XFS_MEDIA_ERROR_DATADEV | \
   545						 XFS_MEDIA_ERROR_LOGDEV | \
   546						 XFS_MEDIA_ERROR_RTDEV)
   547	int
   548	xfs_ioc_media_error(
   549		struct xfs_mount		*mp,
   550		struct xfs_media_error __user	*arg)
   551	{
   552		struct xfs_media_error		me;
 > 553		enum xfs_failed_device		fdev;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
