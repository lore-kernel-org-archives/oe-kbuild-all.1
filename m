Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB9A14286
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 13:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687266554; x=1718802554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ai/D2LMp+s2mP/MfxsvoT9bzH8qpgZfPBCP46BL9lsc=;
  b=bJxmiLpNC2gQW7PJhmtws5OsaCYmtGuAfggAjOJVN9A5lGF0QeQY4ZBc
   f+74IvBgq9jQ8vax5rfs1EUTxE7IBubi3uHMI20ttmqQXDKtXGE9q+qYJ
   sUAXdqQ1rDfYxzNHYiT3a2fhoHbH/fdeywouX8nVz5QgKCqco4lNqZNrQ
   +LnCvATb2DxWr/ZxP5arlkqEhisMsPp6h5DUyknI0l294hPViCZ8w7CgF
   uFlSdKRpBYppPrghZNV0TjG1V/HsrLbmON95qqh+hZOrkPSQWOx1YVDY3
   lPi7NRJ1T5ZwyYM1QmlS6rnuAWFaSHMLflsNv30o8ixYJoMPOVYVFnWgx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="389099798"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="389099798"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:09:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="838200348"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="838200348"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Jun 2023 06:09:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBb6e-0005tQ-0d;
	Tue, 20 Jun 2023 13:09:12 +0000
Date: Tue, 20 Jun 2023 21:08:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2022-11 1/1]
 include/trace/hooks/dmabuf.h:21:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202306202100.DAnARtKr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2022-11
head:   a0b645e69943d9a46922dfdfda53e00c73d5ab0c
commit: c5589c7eec414305c3afc44adbbf79b63a9a7120 [1/1] ANDROID: dma-buf: Add vendor hook for deferred dmabuf sysfs stats release
config: i386-randconfig-s003-20230620 (https://download.01.org/0day-ci/archive/20230620/202306202100.DAnARtKr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306202100.DAnARtKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306202100.DAnARtKr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-buf-sysfs-stats.c: note: in included file:
>> include/trace/hooks/dmabuf.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dmabuf.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dmabuf.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +21 include/trace/hooks/dmabuf.h

    20	
  > 21	DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
