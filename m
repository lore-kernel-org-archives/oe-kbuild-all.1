Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4C46FB7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 16:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688487842; x=1720023842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IU7melb8rhLfyx0tEaoT4j4F9TgxO0PEm03ySx8INDQ=;
  b=Q8mF++IUHaMZ9pX/DCAX8PDubl3ldnomtjc9oYVA1nr0gMqEbtHliDmU
   XH4G5aIPTblJHL7x0dNjsUMrFMU+kDSh1HDajjMsZujzv0bwvi+Na2H8m
   TYrzff9Im0Sv9qwYLhirgVKxjoviuNi0i67CZpug4e5bvxEV+M17XlSGO
   9FiNGpfmjrCW/Fu6iNy77fQA3cxOZBGy0gWGZ1prsSijQuZlyS/Y4jJhU
   ByxA3Otg39H6mppTYlQrNBrT/k5MuMYIoqE0SONgDZgW2PbOTrDBUohFq
   SMcO2XUfpPxU7RYB858BoRqAOO+YgKr2dKPkuRM3z9Xn8nxy+tgOVSeKH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="366637882"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="366637882"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 09:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="748455157"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="748455157"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Jul 2023 09:24:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGiop-000INH-2k;
	Tue, 04 Jul 2023 16:23:59 +0000
Date: Wed, 5 Jul 2023 00:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-4.14 2/4] kernel/time/hrtimer.c:708: undefined
 reference to `tick_nohz_hres_to_lres'
Message-ID: <202307050040.fXPnoXL9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-4.14
head:   4d89af6ae49b62b28be9c5bacc14997e409188d3
commit: cdc5027eae87be4fbce2aa7892bdd12b38388f63 [2/4] CHROMIUM: hrtimer: Add a sysctl to lower resolution of timers
config: i386-randconfig-i002-20230704 (https://download.01.org/0day-ci/archive/20230705/202307050040.fXPnoXL9-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050040.fXPnoXL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050040.fXPnoXL9-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/time/hrtimer.o: in function `hrtimer_switch_to_lres':
>> kernel/time/hrtimer.c:708: undefined reference to `tick_nohz_hres_to_lres'
>> ld: kernel/time/hrtimer.c:708: undefined reference to `tick_nohz_hres_to_lres'


vim +708 kernel/time/hrtimer.c

   697	
   698	/*
   699	 * Switch to low resolution mode
   700	 */
   701	void hrtimer_switch_to_lres(void)
   702	{
   703		struct hrtimer_cpu_base *base = this_cpu_ptr(&hrtimer_bases);
   704	
   705		if (!__hrtimer_hres_active(base))
   706			return;
   707	
 > 708		tick_nohz_hres_to_lres();
   709		base->hres_active = 0;
   710		hrtimer_resolution = LOW_RES_NSEC;
   711	}
   712	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
