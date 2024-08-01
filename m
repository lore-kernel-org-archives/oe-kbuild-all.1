Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161158F70
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722510934; cv=none; b=WDyowWpyDF3GMQ8TQ2P2AiwCLInnY2WBE+FsIe71j8zxHYb49DWoEK2vbd36jzkKLc19E+36sycYyxnmckaiDTfNqtyBsbK6RJqSxx4hPFD9qd8kXSD4jr1X65DBDh2iGJqaC0UBetVl+T/THOz7Re5LvEBch7ZNS+1h/WMpvv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722510934; c=relaxed/simple;
	bh=BGFfhXwEpuPzUJdNpbhdWzaMd+R/4VwUXFkpcmhBa24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KkQiP5vMAkOF5SzSFtFrsQgQfYAS2rDFDRAcCQSUC3QJVI0wsSatA7/RNcIw1D0YlSjU18MIP325BFLoPuhpOHsraud4qnFtTuGlqDfE4M0xe5MVqHb6XcXM4fBJFlHxrUHFHxbyNCKUCZi4ehj1l7MiQ42KUMTd+B/MFqG1aHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lu3WYTZ4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lu3WYTZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722510933; x=1754046933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BGFfhXwEpuPzUJdNpbhdWzaMd+R/4VwUXFkpcmhBa24=;
  b=Lu3WYTZ4zp98a10YziDeMF7IMi0aCU58dfxT2NUuJMNuj03NWp/kHBxw
   HoLPYwbQsiv6c2MdguXRg5N3nY468WWfSrwjdyYIXRboPCOQgH3vxhoJy
   4oUgBKBpVO4PCJ+e9dLE6BVJb4/qXPjwpOaCU8+yATTT4FTYEA5d5hjdh
   Y79MZawA7SeU74UeXW498IFoNnbRCuBMykyc8/J+SNNPk8GsM5SysdC4c
   b72Fg/bgiwCd8as8/Etx58MHaT3v87BFsZn0rZxJEAEY6qMO9AkUYYtfF
   WB9JgW3iGPNA66rUJYr5G4imgm3cL9j+E2/vn/NhSBD0CqTB/YiGkobYv
   Q==;
X-CSE-ConnectionGUID: jGJx2hx8RW+IlJTksfOs5Q==
X-CSE-MsgGUID: wu5eQC4TQ8SREqOdmTcbJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37921627"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="37921627"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 04:15:33 -0700
X-CSE-ConnectionGUID: o97iQxxzShWrpwDaC2n9+w==
X-CSE-MsgGUID: RhL4ffE2RBqoEFmMqVD5Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59119982"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Aug 2024 04:15:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZTmI-000vWo-1T;
	Thu, 01 Aug 2024 11:15:26 +0000
Date: Thu, 1 Aug 2024 19:14:43 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9265/9880] kernel/cgroup/sli.c:537:7: warning: no
 previous prototype for 'disk_name'
Message-ID: <202408011917.HyVYnKBc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   336eee539414035fa6531cd17d4d833f36100834
commit: aa493c7aa24a8bfeafb0e8a2b806c57e6b431ac4 [9265/9880] sli/io: backport iolat function from tk3
config: x86_64-oc_stream_base_config (https://download.01.org/0day-ci/archive/20240801/202408011917.HyVYnKBc-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011917.HyVYnKBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011917.HyVYnKBc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/cgroup/sli.c:14:
   kernel/cgroup/../sched/sched.h: In function 'mm_cid_get':
   kernel/cgroup/../sched/sched.h:3581:25: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
    3581 |         struct cpumask *cpumask;
         |                         ^~~~~~~
   kernel/cgroup/sli.c: At top level:
>> kernel/cgroup/sli.c:537:7: warning: no previous prototype for 'disk_name' [-Wmissing-prototypes]
     537 | char *disk_name(struct gendisk *hd, int partno, char *buf)
         |       ^~~~~~~~~
>> kernel/cgroup/sli.c:549:13: warning: no previous prototype for 'bio_devname' [-Wmissing-prototypes]
     549 | const char *bio_devname(struct bio *bio, char *buf)
         |             ^~~~~~~~~~~
   kernel/cgroup/sli.c:807:16: warning: no previous prototype for 'get_cgroup_from_task_id' [-Wmissing-prototypes]
     807 | struct cgroup *get_cgroup_from_task_id(struct task_struct *task, int event_nr)
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/sli.c: In function 'disk_name':
>> kernel/cgroup/sli.c:544:51: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     544 |                 snprintf(buf, BDEVNAME_SIZE, "%s%d", hd->disk_name, partno);
         |                                                   ^
   In function 'disk_name',
       inlined from 'disk_name' at kernel/cgroup/sli.c:537:7:
   kernel/cgroup/sli.c:544:17: note: 'snprintf' output between 2 and 43 bytes into a destination of size 32
     544 |                 snprintf(buf, BDEVNAME_SIZE, "%s%d", hd->disk_name, partno);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/sli.c: In function 'disk_name':
>> kernel/cgroup/sli.c:542:50: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 0 and 31 [-Wformat-truncation=]
     542 |                 snprintf(buf, BDEVNAME_SIZE, "%sp%d", hd->disk_name, partno);
         |                                                  ^~
   In function 'disk_name',
       inlined from 'disk_name' at kernel/cgroup/sli.c:537:7:
   kernel/cgroup/sli.c:542:46: note: using the range [-2147483648, 2147483647] for directive argument
     542 |                 snprintf(buf, BDEVNAME_SIZE, "%sp%d", hd->disk_name, partno);
         |                                              ^~~~~~~
   kernel/cgroup/sli.c:542:17: note: 'snprintf' output between 3 and 44 bytes into a destination of size 32
     542 |                 snprintf(buf, BDEVNAME_SIZE, "%sp%d", hd->disk_name, partno);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/disk_name +537 kernel/cgroup/sli.c

   535	
   536	/* copy from v5.4, adapt gendisk */
 > 537	char *disk_name(struct gendisk *hd, int partno, char *buf)
   538	{
   539		if (!partno)
   540			snprintf(buf, BDEVNAME_SIZE, "%s", hd->disk_name);
   541		else if (isdigit(hd->disk_name[strlen(hd->disk_name)-1]))
 > 542			snprintf(buf, BDEVNAME_SIZE, "%sp%d", hd->disk_name, partno);
   543		else
 > 544			snprintf(buf, BDEVNAME_SIZE, "%s%d", hd->disk_name, partno);
   545	
   546		return buf;
   547	}
   548	
 > 549	const char *bio_devname(struct bio *bio, char *buf)
   550	{
   551		return disk_name(bio->bi_bdev->bd_disk, bio->bi_bdev->bd_partno, buf);
   552	}
   553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
