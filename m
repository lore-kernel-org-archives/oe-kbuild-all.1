Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47FD1B7E9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 22:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707517427; cv=none; b=SID8zyFZZt1P88ONT4OEY7qsAv1ypLFFRPV6AuGO5T08boxejs8adjRF6MYwwdr1WUiiq2KtFe9vaxnWpx3ycYQldP0jvCYZo0xNCD0gaDympUgBFZxZOxA74GNxv2scdRJIQkhrl902jOaU9WxAE5D4XsMdUj35v9tygml1l7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707517427; c=relaxed/simple;
	bh=TxMhQynAi0TWjg+eWlX7wo0fy3/iS4Wsd7hy+iYYy8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KV8awUAcxHwv/LtZgSCzwZzdBWTdN7x30spaOfqZuYqVex5z92qO8T+7pl6FNmh4zsBo2B9n7LnL48wMZra9Cnx2Q0dfU9vjbKmYEPeQfvhB0V0sIoASHBt1Ki+xcW2qp1XVMT1shyHJgkWGVEE/B8SesQje2JbigzPO5Kwj7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDwuOCec; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDwuOCec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707517426; x=1739053426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TxMhQynAi0TWjg+eWlX7wo0fy3/iS4Wsd7hy+iYYy8w=;
  b=TDwuOCec5idSRiWfKdmJ+8GPgmHvMZCEwj6pgXIYHl6tebg5qeVCcwvu
   nI+9Lku3j+AcbRI8Lz4BJ5Cw6Ibsr9cxAzWov083tvkd5La1/DDmtnzfT
   QXskd/sRRYiIiuGZFOOecb/Gcl285rdxLS+J0MehyhcCKbUqjEu13YXBI
   MXA5d0KpgXiTuqBWoJvjxjePHQppM5fjQbdV3eIkY3cfoh/eFEKlKn+of
   MtWyuPsJkhOxwY1oQyNoAufJYF4XKLfvXN6nilJB3sjJ2NT/BLmv1jkwU
   NO6TCCB6Nwn77OCVflNrGvFjPesIMvXADrOnbyYn2O+oOd2jMxXANTtUz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="19016979"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="19016979"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 14:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="2254838"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2024 14:23:44 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYZHa-0005AQ-0H;
	Fri, 09 Feb 2024 22:23:42 +0000
Date: Sat, 10 Feb 2024 06:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	Daeho Jeong <daehojeong@google.com>
Subject: [jaegeuk-f2fs:dev-test 18/20] segment.c:undefined reference to
 `__divdi3'
Message-ID: <202402100609.eXG721f8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jaegeuk,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   4469e8487429b45bba20b1f95f34143a1a16ab5d
commit: 728f5c019e921428fac77ee4fd48a03b2d435c19 [18/20] f2fs: use BLKS_PER_SEG, BLKS_PER_SEC, and SEGS_PER_SEC
config: i386-buildonly-randconfig-002-20240210 (https://download.01.org/0day-ci/archive/20240210/202402100609.eXG721f8-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100609.eXG721f8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100609.eXG721f8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/f2fs/segment.o: in function `f2fs_need_SSR':
>> segment.c:(.text+0x57fd): undefined reference to `__divdi3'
>> ld: segment.c:(.text+0x5819): undefined reference to `__divdi3'
   ld: segment.c:(.text+0x5838): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
