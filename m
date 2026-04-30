Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5D8EACD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 02:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514667; cv=none; b=PNZ0AQsZaFtdQTRlGhuiSIY0o0uBHYic6+Lv8FMWnxUQZjySS+96gDseE1TMSu44Rdhli3i6FfF8g5LPkZAqeUr3RDSOvrCcWRV+dWCbnJnx4C5ynvmgc3AInneOZcmk1MnB1MhRge6RI4rxuHQ8bHKdP9ekXjqD9L9TqIHyhvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514667; c=relaxed/simple;
	bh=7HjaEr1HHDGOBQ24yHQxQLTOgkeyP2xe+3gWjycszgg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k6TL2vtFCBvHlMxbP3AS5zu65aFS5mSTArL95FBIbZMRYyS83VDMEnNVXsNgp4mrGYB1XBTKDoahxzCC2Vicfc9X8aQe3qpvkNsD4Dd2cLU1ZJoFrZOikNDWD4TvRWvV7RfMWwD5mCTjsavE8mXC4irqO/61L6f+qBgkZBp3e4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQqaLSka; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQqaLSka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777514665; x=1809050665;
  h=date:from:to:cc:subject:message-id;
  bh=7HjaEr1HHDGOBQ24yHQxQLTOgkeyP2xe+3gWjycszgg=;
  b=MQqaLSkal/U8/fLpjDPfrZPrg1dwQUCWOxWHVULHq9VdwpJnf40WRvOI
   i0/jMX19a2pZtmC4dHuoG3N5MdEnE61JyioHdZPyDoTJR1+IXIeR78+bs
   LC3wv6O/gvVMWyamDeV+zDWfzFLwKbaj0ovqycGBOkZaP+TMj5K9H1d3m
   SkUuT0oELsb/IETs/jjSVZBjv7l/ky6DcoD9ZSKpfFI7LQlDFFfy0qHT+
   sug5Dfjrm2/hxaO320ZqNFClgkF9TCdjYZj0ROGMXKrAMXYYmC2seTNnd
   0+4XYxVgUP1zE4DmiPD9WBXgW44qULt5ReoEUE62iznRtvky27ziNbC0O
   Q==;
X-CSE-ConnectionGUID: JfGOwo+BT5OLb6Tto1gQOQ==
X-CSE-MsgGUID: ih8Ahqp9QZeb/uFCEiLimw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65987718"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="65987718"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 19:04:24 -0700
X-CSE-ConnectionGUID: d8sJxiAcRliLg2EhFH8TBA==
X-CSE-MsgGUID: erOc6iI2SaWoqjDOnhS4vw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2026 19:04:23 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIGlJ-00000000Bng-0ghU;
	Thu, 30 Apr 2026 02:04:21 +0000
Date: Thu, 30 Apr 2026 10:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:perf/spe-fixes 1/4] drivers/perf/bogo_pmu.c:80:12:
 sparse: sparse: symbol 'bogo_pmu' was not declared. Should it be static?
Message-ID: <202604301051.5oaP798j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git perf/spe-fixes
head:   49f6890ebd9f4439d6f09ddeca19dea974cc41a9
commit: f3947707b3ee63d8b25b90849acac61adf09562d [1/4] HACK: Add bogopmu
config: i386-randconfig-r131-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301051.5oaP798j-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301051.5oaP798j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301051.5oaP798j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/bogo_pmu.c:80:12: sparse: sparse: symbol 'bogo_pmu' was not declared. Should it be static?

vim +/bogo_pmu +80 drivers/perf/bogo_pmu.c

    77	
  > 78	struct hlist_node	hotplug_node;
    79	
  > 80	struct pmu bogo_pmu = {
    81		.module		= THIS_MODULE,
    82		.task_ctx_nr	= perf_sw_context,
    83		.pmu_enable	= bogo_pmu_enable,
    84		.pmu_disable	= bogo_pmu_disable,
    85		.event_init	= bogo_pmu_event_init,
    86		.add		= bogo_pmu_add,
    87		.del		= bogo_pmu_del,
    88		.start		= bogo_pmu_start,
    89		.stop		= bogo_pmu_stop,
    90		.read		= bogo_pmu_read,
    91	};
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
