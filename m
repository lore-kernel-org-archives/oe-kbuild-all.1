Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9112C1DE4DC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 01:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761095664; cv=none; b=t7qTHYljVucFJDW8O47ScZBIJNCopJZ6NBSvKA9B6ALVwWslQIEoHON05a5fLIJGOaccFmE9cIMM0VPpaE5yRiWTEj7cgS7ARp/pIgyuyOr3MYZEZ0QkY4r5HZYNO6CDYvs9ctNQW8NHq8tZkHd6yNDIPzDRQdu4qTvYgZxHGcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761095664; c=relaxed/simple;
	bh=nFp5oCkPvaNzABXQH3swrZci61WZKFN1WWY6X7YrhPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e1BidKTclmEUptOm9gYbqvTjYVip4Qb4veD59DUdibdupyssFlX8XVZPFa2OETNYqQkeRDqThhYSTAU2J/ogP24JMdS/MpXLBFSvWW4c5QOSTTNeMpjDZ9CHZSMPadI0VObr4uAHNgrUJq4ylivI/CkhUiy8mzhVwmJiaJ7UEs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDgemIhE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDgemIhE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761095662; x=1792631662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nFp5oCkPvaNzABXQH3swrZci61WZKFN1WWY6X7YrhPo=;
  b=mDgemIhEr/zGVsLxULhOKDwF89ztqpfZ9JvFeiSrDzmEiBRcNkxBV3FD
   LiV89z2NXtHpMCP49rF/+WiazyBr73595g/gcFO+hn6KfbAk9tUrZvPig
   tbvQdVV4TQeex4eQCJP4It4YYgAf5ItVD+vS/0OmCfClzoEaJA3eoqVDj
   emqsseZA4JmY/3Ydgg6dx21HZ/5y4OVnuzWiyn+o2jd/dnn6AcPC2tDwG
   YIWyops9E4zw46keZ1WIihH/62r8ec2TVOs8YFUKl8AsT/DVbCRPL1Ty+
   LiknqlrvQb6oU41q6gxHH8Swneko6PQRRFbxuf5DWQ6bc2OXd2U0Ccwiz
   Q==;
X-CSE-ConnectionGUID: UxxXwSxPSAWiEHRdM4v4dw==
X-CSE-MsgGUID: uiYloI/tTkaJvflJ9MiSxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74576808"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="74576808"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 18:14:20 -0700
X-CSE-ConnectionGUID: QEFB/ClkTwuv7s7DgVAxjQ==
X-CSE-MsgGUID: czc8I+sARZiHrGz1SqRXsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="188010781"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Oct 2025 18:14:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBNQZ-000Bsz-2h;
	Wed, 22 Oct 2025 01:14:13 +0000
Date: Wed, 22 Oct 2025 09:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-6a5 49/51] lib/dynamic_debug.c:1519:13: warning:
 'ddebug_clear_range' defined but not used
Message-ID: <202510220940.1te9pGGj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-6a5
head:   a2f8b47e22fa6a1a9852e392166bc9adf45cc17d
commit: 81602811f92edaa27e63714ea280ed3077621caa [49/51] dyndbg: ddebug_clear_range - prune module's site info on rmmod
config: nios2-randconfig-002-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220940.1te9pGGj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220940.1te9pGGj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220940.1te9pGGj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_prefix_key':
   lib/dynamic_debug.c:1807:51: warning: left shift count >= width of type [-Wshift-count-overflow]
    1807 |         ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
         |                                                   ^~
   lib/dynamic_debug.c: At top level:
   lib/dynamic_debug.c:1584:12: warning: 'ddebug_remove_module' declared 'static' but never defined [-Wunused-function]
    1584 | static int ddebug_remove_module(const char *mod_name);
         |            ^~~~~~~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:1519:13: warning: 'ddebug_clear_range' defined but not used [-Wunused-function]
    1519 | static void ddebug_clear_range(const struct _ddebug *_start, const int len)
         |             ^~~~~~~~~~~~~~~~~~


vim +/ddebug_clear_range +1519 lib/dynamic_debug.c

  1518	
> 1519	static void ddebug_clear_range(const struct _ddebug *_start, const int len)
  1520	{
  1521		void *ret;
  1522		unsigned long start = (unsigned long) _start;
  1523		MA_STATE(file_mas, &mt_files, start, start);
  1524		MA_STATE(func_mas, &mt_funcs, start, start);
  1525	
  1526		v2pr_info("clearing %3d debugs %px\n", len, _start);
  1527		ret = mtree_erase(&mt_mods, start);
  1528		v2pr_info("mods:  %px %s\n", ret, (char*)ret);
  1529	
  1530		mas_lock(&file_mas);
  1531		for (; mas_erase(&file_mas); file_mas.index = file_mas.last + 1)
  1532			;
  1533		mas_unlock(&file_mas);
  1534	
  1535		mas_lock(&func_mas);
  1536		for (; mas_erase(&func_mas); func_mas.index = func_mas.last + 1)
  1537			;
  1538		mas_unlock(&func_mas);
  1539	}
  1540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
