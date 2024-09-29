Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE3B757EB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 18:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727636397; cv=none; b=i6jInFZRpPeqocZeHQH5IF/arvfvG7PeeLBxuYUScLcdAhItXwZWFO8w8Ie+YcqnWoZe7Eg7STKWZMSzJua7YGhTcHZNrvxI6b76r2JSPDIcLMrS8ye8b0ZRn9Dj2i3QBpE5iD2FSXPudQi4xWCgsJ4wOWnVZln9TcYNJGcSygk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727636397; c=relaxed/simple;
	bh=udB4WQrUAe0IOslDg/4jLvKKZrN4LH+Q/hO8SgHYLyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QcBvlDK1D6Yt2D2FGIQU6ljybY4/BdOJKPtnL4zUkSrIQc5aa3UtSJ3tlu2NQxJxCztDEryGd3Sx31yY8FirXDwv9ocKul5fBzJ6Aotj78HRgdTuAbaiDfb61iMFiKAnzP0q8IXQqe6439rZCEaE5bCOUuBD8FM3N773Amo8dME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=glVwh7UR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="glVwh7UR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727636396; x=1759172396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=udB4WQrUAe0IOslDg/4jLvKKZrN4LH+Q/hO8SgHYLyA=;
  b=glVwh7URAmrNJjOzLad/YJiFMVrrLWWpgDH6oSexr6a+hC1aDmGIxOuf
   yop1lGEnIludNkilcQkZeKKRRTTu0k0aNYnPeWGL8dD/Cnt6hUTdGOysp
   ne3PpWYUSRBnFBBPvKpebQ+nNEpWTNCS48Z5+9jh+GbYpt7/Sw6zjZf/q
   m9uPLoKy1oanxB9RqYoj1VJ7g6LlJ2MwPTpV1LFR55Cwg0GwtfJzFx1ge
   Zk/8HOAF5jluakUxmDfVML3ygzS0sDxhi71aUZhms373xK10gRbtw2NQq
   EkZSHVl6u7FxUEe+UFmql1nsCRihyVaRXLv+rQo7/adEcmQjhHuoxi32N
   A==;
X-CSE-ConnectionGUID: gGihnKweS/KZaMXf0fOQEQ==
X-CSE-MsgGUID: iaa6soe5RVqOWq7Z1+eL8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26881214"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26881214"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 11:59:50 -0700
X-CSE-ConnectionGUID: 4m/DCqpWT723OeydfzpFyw==
X-CSE-MsgGUID: wyT/bUfBRXK0eep1UVsB8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="77894013"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Sep 2024 11:59:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suz90-000OcL-19;
	Sun, 29 Sep 2024 18:59:46 +0000
Date: Mon, 30 Sep 2024 02:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4b 81/86] lib/dynamic_debug.c:1428:13: warning:
 'ddebug_clear_range' defined but not used
Message-ID: <202409300254.dghoIGcY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-4b
head:   60c2f66c1f624f6be4bdfec34fcea20bc25524ae
commit: ff39420a71246ae0415f46d21dc3c7e4dec5bd14 [81/86] dyndbg: ddebug_clear_range - prune module's site info on rmmod
config: arc-randconfig-002-20240930 (https://download.01.org/0day-ci/archive/20240930/202409300254.dghoIGcY-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300254.dghoIGcY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300254.dghoIGcY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1428:13: warning: 'ddebug_clear_range' defined but not used [-Wunused-function]
    1428 | static void ddebug_clear_range(const struct _ddebug *_start, const int len)
         |             ^~~~~~~~~~~~~~~~~~


vim +/ddebug_clear_range +1428 lib/dynamic_debug.c

  1427	
> 1428	static void ddebug_clear_range(const struct _ddebug *_start, const int len)
  1429	{
  1430		void *ret;
  1431		unsigned long start = (unsigned long) _start;
  1432		MA_STATE(file_mas, &mt_files, start, start);
  1433		MA_STATE(func_mas, &mt_funcs, start, start);
  1434	
  1435		v2pr_info("clearing %3d debugs %px\n", len, _start);
  1436		ret = mtree_erase(&mt_mods, start);
  1437		v2pr_info("mods:  %px %s\n", ret, (char*)ret);
  1438	
  1439		mas_lock(&file_mas);
  1440		for (; mas_erase(&file_mas); file_mas.index = file_mas.last + 1)
  1441			;
  1442		mas_unlock(&file_mas);
  1443	
  1444		mas_lock(&func_mas);
  1445		for (; mas_erase(&func_mas); func_mas.index = func_mas.last + 1)
  1446			;
  1447		mas_unlock(&func_mas);
  1448	}
  1449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
