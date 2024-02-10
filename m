Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC1E366
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 02:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707532983; cv=none; b=qPJx6Z4dsN/uuN9jeTTCX416AI2RJPxMyuIF8gsBIVfFmz0uzx/Zof0QmcdE/oevvSvdsDPQmUSiM5c7I1Y+aHX7SqRATieTkstVvenA36yxMp5euc2JXtfOGVMp2929OT++K++yxLRU6z6rkoZ9jhOuSmdOhvcZiQI9Aqua9N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707532983; c=relaxed/simple;
	bh=iNNfVeNivjvuug1ViolbgJ5TwJ3il4titR6Dy379UaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jgsEbMz5tySkz7xeQcPLDf9JJkk9nNxtWk+UjO4XBojn+aiSGGLVutVWWY6OxWlaYBlffmqKYxtZ2olgKlFi9wropiasX+sLNmIZxTWJFsCJ2zHdwo2ka+trasnYus9m/2BqzaKj6pp2F6SUNzuPPGJQTSCQ3BcKYy8+sR/swfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sj9TbQKF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sj9TbQKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707532981; x=1739068981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iNNfVeNivjvuug1ViolbgJ5TwJ3il4titR6Dy379UaM=;
  b=Sj9TbQKFh4veLj3e6VpUud/Cna2LnTU7FZxYtPBksUVDC1MFBjhxuKHG
   wTIyAmyZ9UZ8fkiN2OoabbUvOuy5HDWWuUVhcQy4El9Lsg5DBWH8vMCtq
   yDEzjlL1/xSm2F4057uWjk0qjwjA0L08prUIGUyStESJz4WQwq1D4YF8s
   EhyHyX28bbVrkqydbJqWY7w9TJHzkK3emJ9ZVnTyHmppPjkOf2CHjwl2z
   Q2mdeSC4I5lS550e/3xVULkSCw37l+020dGEmWyRamC9l1oh+KZp85+6P
   8lBbCyNM86TkR7R9GtCBc1NJb7qcVEEC+IsBj7DBbocg8TF+AtVwmlTmx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1679416"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="1679416"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 18:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="2402903"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2024 18:42:59 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYdKT-0005Hy-03;
	Sat, 10 Feb 2024 02:42:57 +0000
Date: Sat, 10 Feb 2024 10:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	Daeho Jeong <daehojeong@google.com>
Subject: [jaegeuk-f2fs:dev-test 18/20] fs/f2fs/f2fs.h:2522: undefined
 reference to `__divdi3'
Message-ID: <202402101027.xBy2m1xD-lkp@intel.com>
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
config: i386-randconfig-001-20240210 (https://download.01.org/0day-ci/archive/20240210/202402101027.xBy2m1xD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101027.xBy2m1xD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101027.xBy2m1xD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/f2fs/segment.o: in function `get_blocktype_secs':
>> fs/f2fs/f2fs.h:2522: undefined reference to `__divdi3'
>> ld: fs/f2fs/f2fs.h:2522: undefined reference to `__divdi3'
>> ld: fs/f2fs/f2fs.h:2522: undefined reference to `__divdi3'
>> ld: fs/f2fs/f2fs.h:2522: undefined reference to `__divdi3'
>> ld: fs/f2fs/f2fs.h:2522: undefined reference to `__divdi3'


vim +2522 fs/f2fs/f2fs.h

  2519	
  2520	static inline int get_blocktype_secs(struct f2fs_sb_info *sbi, int block_type)
  2521	{
> 2522		return (get_pages(sbi, block_type) + BLKS_PER_SEC(sbi) - 1) /
  2523								BLKS_PER_SEC(sbi);
  2524	}
  2525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
