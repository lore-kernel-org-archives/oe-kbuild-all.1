Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250C9379
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 01:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692234758; x=1723770758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p+SulhyzGgViCSUGuNqFjeor4gXysFRwHk5rHr49wfc=;
  b=aVSOzFdIqzeAtzXD+GqdT+ggQ7Vee90k5VuAz4I3nUPe/X2eJ3Jobdyk
   61fFcMQ+W5GGNzbd0win7H1aXDdyF6Z1bgt89sxwA9m46IkR/CfZbkgsH
   6oN6zjtFoU/iXFNtW5EocK9MzG4f8Pfsht8ppVGvGWntKjD8NnxSqW+Ro
   6eO8fAf5lOygpsUjwFW8Con3yMFIg3/iYb3nCKIgFY8v1+Y5IunPWeTr7
   /cDRWAkUh7IVmuNksnf6w/lQNnNZnzkw3RAyTl/0PmGB8ZJNNvpfZEmBZ
   4CGWo3mvY8gX163PuGzJa2f5490b73N327xlfdjHoC8TZwo4jfyNMBcFM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357650935"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="357650935"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 18:12:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="824433673"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="824433673"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2023 18:12:36 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWRYq-0000gz-0p;
	Thu, 17 Aug 2023 01:12:31 +0000
Date: Thu, 17 Aug 2023 09:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 716/6555] kernel/time/time.c:288:5:
 warning: no previous declaration for 'compat_ksys_adjtimex'
Message-ID: <202308170951.LsW2993l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: c2185294ad509ea4a6859dc0b4c5e21a9f4ee224 [716/6555] CHROMIUM: alt-syscall: Make required syscalls available for use
config: x86_64-randconfig-x003-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170951.LsW2993l-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170951.LsW2993l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170951.LsW2993l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/time.c:266:5: warning: no previous declaration for 'ksys_adjtimex' [-Wmissing-declarations]
    int ksys_adjtimex(struct timex __user * txc_p)
        ^~~~~~~~~~~~~
>> kernel/time/time.c:288:5: warning: no previous declaration for 'compat_ksys_adjtimex' [-Wmissing-declarations]
    int compat_ksys_adjtimex(struct compat_timex __user * utp)
        ^~~~~~~~~~~~~~~~~~~~
   kernel/time/time.c:898:5: warning: no previous declaration for '__compat_get_timespec64' [-Wmissing-declarations]
    int __compat_get_timespec64(struct timespec64 *ts64,
        ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/time.c:914:5: warning: no previous declaration for '__compat_put_timespec64' [-Wmissing-declarations]
    int __compat_put_timespec64(const struct timespec64 *ts64,
        ^~~~~~~~~~~~~~~~~~~~~~~


vim +/compat_ksys_adjtimex +288 kernel/time/time.c

   287	
 > 288	int compat_ksys_adjtimex(struct compat_timex __user * utp)
   289	{
   290		struct timex txc;
   291		int err, ret;
   292	
   293		err = compat_get_timex(&txc, utp);
   294		if (err)
   295			return err;
   296	
   297		ret = do_adjtimex(&txc);
   298	
   299		err = compat_put_timex(utp, &txc);
   300		if (err)
   301			return err;
   302	
   303		return ret;
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
