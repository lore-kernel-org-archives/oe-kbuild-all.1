Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA3946AA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXVlhSHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702194097; x=1733730097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vRgyiGCgqomPHbMSPZxXKVYs5y39GKQCXahIcyMcLo=;
  b=WXVlhSHjNnGxt0DwdNwIoWl0J8rfiqkM6h4VIA0onIENmJOVkc9Zpziq
   bvghrsJe83zC4UIhy26+9kK60pubj1y0dfiCJGhbTqQDAhwVcFxZdlhbL
   mdqe1X9+R0c0i1G044cR0XLstBGxKnDsJlF77SJdbOifroA46qQ2v7lfu
   uv0mGX0FVmAJFfUjdioVVlgX/85/1mDRX9jXhkdrbCWfXNylu8tKCrvGi
   9fWdJsRqyzsN9NrcQK9MrfVjr6poNPj7NOVawIdxKAr0x34+e19FMz6jq
   F+1jzCd5virxRbpxt3JXnhIgF9B0d27UzEZ7Iz8C6CGyowM2YWP4bmy/N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="393408239"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="393408239"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 23:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1104043153"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="1104043153"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 09 Dec 2023 23:41:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCERQ-000GYP-1j;
	Sun, 10 Dec 2023 07:41:32 +0000
Date: Sun, 10 Dec 2023 15:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: Wyes Karny <wyes.karny@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>
Subject: include/linux/amd-pstate.h:87:27: warning: 'amd_pstate_mode_string'
 defined but not used
Message-ID: <202312101512.2BOW7iSz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wyes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: 36c5014e5460963ad7766487c0e22a7ff28681fc cpufreq: amd-pstate: optimize driver working mode selection in amd_pstate_param()
date:   10 months ago
config: x86_64-buildonly-randconfig-004-20231010 (https://download.01.org/0day-ci/archive/20231210/202312101512.2BOW7iSz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312101512.2BOW7iSz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312101512.2BOW7iSz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cpufreq/amd-pstate-ut.c:29:
>> include/linux/amd-pstate.h:87:27: warning: 'amd_pstate_mode_string' defined but not used [-Wunused-const-variable=]
      87 | static const char * const amd_pstate_mode_string[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~~~


vim +/amd_pstate_mode_string +87 include/linux/amd-pstate.h

    86	
  > 87	static const char * const amd_pstate_mode_string[] = {
    88		[AMD_PSTATE_DISABLE]     = "disable",
    89		[AMD_PSTATE_PASSIVE]     = "passive",
    90		[AMD_PSTATE_ACTIVE]      = "active",
    91		NULL,
    92	};
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
