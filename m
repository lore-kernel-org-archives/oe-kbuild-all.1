Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE8E16400
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688139938; x=1719675938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XmzhBpxejKqu2oFbV3ArSAxpcW4QBguoZuzK/xM/cOQ=;
  b=i+RZ7PCw9RSoBnqMh2IY99TaqtA2/F6Rx+o/gjhFYp9BFgPX5jwQ/ShK
   SY0qzT3kfVKoq/l9M6mtp29sKSFv+dI0EyeG6BZDoJhF6vL1Pv7uPTLxG
   JOATfv1JlUZuyCyEmuL3ddY/uHX1DcqeHwGekPQhxSifKOfVB3j0Mo7WR
   aTAvNjXbpVYzu5tV2Jg5b6jFrVfnSGGAqYfvG2WmMAECoTiQH1txTUPVZ
   sSmYoZLj3+oUvnE+xH/8vYuMROwYsZ0r+wIwiDV211y7Fqhl51Fj9F/6V
   mP1of2K1hxRSeDgRlcJrVuu7QR+6DXWcKVZL5IVI4KeLrvnL9c9V7+Y+W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="342008740"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="342008740"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 08:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="711852175"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="711852175"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Jun 2023 08:45:33 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFGJQ-000F6N-1T;
	Fri, 30 Jun 2023 15:45:32 +0000
Date: Fri, 30 Jun 2023 23:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 17239/29940]
 security/selinux/ss/hashtab.c:173:13: warning: no previous declaration for
 'hashtab_cache_init'
Message-ID: <202306302302.6dtqPAhj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   e8c1340cbb0f24693dd9056f8d5a7808e4597b80
commit: b86e8759d93cce8d89d227760e464fcc7f3f1370 [17239/29940] BACKPORT: selinux: wrap global selinux state
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230630/202306302302.6dtqPAhj-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302302.6dtqPAhj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302302.6dtqPAhj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/selinux/ss/hashtab.c:173:13: warning: no previous declaration for 'hashtab_cache_init' [-Wmissing-declarations]
    void __init hashtab_cache_init(void)
                ^~~~~~~~~~~~~~~~~~


vim +/hashtab_cache_init +173 security/selinux/ss/hashtab.c

   172	
 > 173	void __init hashtab_cache_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
