Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C98B1864
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 04:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689653661; x=1721189661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KapuiXsbrVpnrQRhJb26zrxebwlUVw0bp6t27/wbjnU=;
  b=QihlJL8UzeLFmjM3ktReYBVT5gDQkUR4kpl96xCd/1H8KyWH5IQsgjId
   QZgV9h4nqbeBiQFBXhGu5CqNOsXgXNpQvHOVK6otqsVJKfCifkMvc22Jj
   6hZEk6MbytKqP9xgtALcd8N7/muycxLCNfZoi+jJ15WHJnn98+gA9vEjB
   g9Jk2r30flIjrE+IkXec12hQGyL6lEwPpvv69LibGlAzN6tqLFwFWUEBu
   03UfyGFAMoyKTxx+L5mZr6mfmkmFy7VtYWl7qe5TIlMOKny7obs14vWF1
   fLp8+klLWwHzCNEhnc3f35BXyl6iv8DFbmE+KscKFShz9EISOFin4uopq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="396941355"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="396941355"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 21:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="758655220"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="758655220"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Jul 2023 21:14:18 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLc6M-0000Br-0d;
	Tue, 18 Jul 2023 04:14:18 +0000
Date: Tue, 18 Jul 2023 12:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-ia64@vger.kernel.org
Subject: [aegl:resctrl2_v65rc1 2/11] fs/resctrl2/arch/x86/rdt_monitor.c:466:
 undefined reference to `__udivdi3'
Message-ID: <202307181250.VpWoObkT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_v65rc1
head:   16f9fb3b3a3875cdb7f611d60e5072ed15feec27
commit: 6ea3248fa5ec877bbd6a7a1201775ae486016256 [2/11] resctrl2: Arch x86 modules for most of the legacy control/monitor functions Missing: 1) Pseudo-locking 2) AMD SMBA/BMEC 3) Other stuff I haven't noticed
config: i386-randconfig-r006-20230718 (https://download.01.org/0day-ci/archive/20230718/202307181250.VpWoObkT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307181250.VpWoObkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307181250.VpWoObkT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/resctrl2/arch/x86/rdt_monitor.o: in function `mbm_poll_threshold_write':
>> fs/resctrl2/arch/x86/rdt_monitor.c:466: undefined reference to `__udivdi3'


vim +466 fs/resctrl2/arch/x86/rdt_monitor.c

   453	
   454	static ssize_t mbm_poll_threshold_write(char *buf, size_t nbytes)
   455	{
   456		unsigned int mbytes;
   457		int ret;
   458	
   459		ret = kstrtouint(buf, 0, &mbytes);
   460		if (ret)
   461			return ret;
   462		if (mbytes > MBM_POLL_THRESHOLD)
   463			return -EINVAL;
   464	
   465		mbm_poll_threshold = mbytes;
 > 466		mbm_poll_threshold_chunks = ((u64)mbytes << 20) / upscale;
   467	
   468		return nbytes;
   469	}
   470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
