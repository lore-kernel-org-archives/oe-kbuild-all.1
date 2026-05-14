Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88928336ED2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 03:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778728880; cv=none; b=IhkBZtkEODU8JaQDI5mMg/ctgKAvkoXU4qzIuDc4cy5zyvRx/+1o8akT6iWIgKLXDmh8OjHgO5ZA9iRRkgswQopucsURfMS6SOlz3V0ydC6eRPB5LExmYmz1/B9aefLAVIUB6KpZNkAtKPwtGXXxo/QpJ347stosr5akroqWxR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778728880; c=relaxed/simple;
	bh=LCsQY6vAaPUN4WkwgYCCucmJrVGtV9lq8lARSXzCzvU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=plbfl8CIxsikFAsKpx1pFIJqvGqpBAJcY5OfAqA8ZIYxLPk9IumN7LMYOPh6QIgg6Zj87/zcz5umxqwvaAyN4DChRknaZMWsYU/t9vzuh95OYev5Kruo1lDpnKZPPaSf2Mi3JG841LacD8N7JZzZMQyZGgartOjfgxiPAJb+ONE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R71r3yxb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R71r3yxb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778728871; x=1810264871;
  h=date:from:to:cc:subject:message-id;
  bh=LCsQY6vAaPUN4WkwgYCCucmJrVGtV9lq8lARSXzCzvU=;
  b=R71r3yxbeG4S485MOqiKp2MjoZz5jYUzm4FBQ082JYWRa8S491eHkM02
   zxmJdt0cET9dlHCo2/321wUO7Muu5M8p6TI2ywMZjkeCgm8xSYPjaPavU
   jQ6+YCBBNzJnsJMtHUYD5ToMc9rj9QEXqzeQnlMLWYZYOcSb8wciN8dYa
   pSxxYcwU8MPSH2Zcl3RsyyVQE0CP6H2DwmN7nwW67KREH1veJ8CAHngWs
   9CslgbwBLVXHoDeuJYGyDDGNnoCwxkXfArxm5UjwllibIVA5ZD7KKmSFU
   NvUe1C/Wp9GoxNFZLGu00iea6uEqndquGXsHUSwW2funNy+hh8388Lzoc
   Q==;
X-CSE-ConnectionGUID: Mli8kVtfSaeZsuTe3rKHnQ==
X-CSE-MsgGUID: kPzT0oSsSyGg7oZsSW4hgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105124466"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="105124466"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 20:20:55 -0700
X-CSE-ConnectionGUID: 0b/8NfGhTGmnptOypQxYwA==
X-CSE-MsgGUID: oV/PwxjqQN2XM97tg9gIPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="243245991"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 May 2026 20:20:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNMd1-000000008jz-072x;
	Thu, 14 May 2026 03:20:51 +0000
Date: Thu, 14 May 2026 05:19:53 +0200
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [groeck-staging:hwmon-next 26/29]
 ./include/linux/hwmon.h:498:25: error: expected ')' before 'struct'
Message-ID: <202605140525.qZcK92K2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   7fb80897aad0a4da2e8ce77ac54af988605aae39
commit: aa3ec1484bdd619e8fa2ce569ec653d35fbf3615 [26/29] hwmon: Support guard() and scoped_guard for subsystem locks
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260514/202605140525.qZcK92K2-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140525.qZcK92K2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140525.qZcK92K2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/power/supply/power_supply_hwmon.c:7:
>> ./include/linux/hwmon.h:498:25: error: expected ')' before 'struct'
     498 | DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_T))
         |                         ^~~~~~~
         |                         )


vim +498 ./include/linux/hwmon.h

   497	
 > 498	DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_T))
   499	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
