Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F1A360
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 01:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685236355; x=1716772355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q1lKHEdUb1jgq11e7ptEI4qQbzZEdFngNdHPNa1cZ00=;
  b=ILXj75yglXKBFd0JV3uMOWuZWXkZvBphdklutSc1AR/wGZp0RdMp6gZM
   jMek0sr3CTDg2fcgza8ntsr+Hlp3DcpxMI4QmHdDnrsKDNGegCYC7YM4j
   ptgdFkeFUx1aTcXctytnUZL9TsDwUfm56GxKHg2khAkEoKzvz/3ldjLn/
   9OAN5nOZJ6eYwvjYHNEEIXgBgWYan4fBACwaF65cmZL2x7WycDOwkdQHC
   7sRVjXo8CcqWdNk/IDohAWJbVn5jKaO6a4+7VhLZyRkze/RNuUkpGjaU4
   SNlrBgDIis8FOWCNpr1EgXH9TZ/iZwOClS6fO/2OaeODzLmc2iEbJl5WR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="334088229"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="334088229"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 18:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="879935675"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="879935675"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2023 18:12:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q34xU-000KLq-35;
	Sun, 28 May 2023 01:12:32 +0000
Date: Sun, 28 May 2023 09:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Yogesh Lal <quic_ylal@quicinc.com>,
	Elliot Berman <eberman@codeaurora.org>
Subject: [sudeep-holla:android13-5.15/ffa 1113/4062]
 drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol
 'ads_page_owner' was not declared. Should it be static?
Message-ID: <202305280939.YeO6gFGS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: b2df67a932b5cbd6535de9f1a6e63004992ad014 [1113/4062] ANDROID: android: Create debug_symbols driver
config: i386-randconfig-s002-20230528 (https://download.01.org/0day-ci/archive/20230528/202305280939.YeO6gFGS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/commit/?id=b2df67a932b5cbd6535de9f1a6e63004992ad014
        git remote add sudeep-holla https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
        git fetch --no-tags sudeep-holla android13-5.15/ffa
        git checkout b2df67a932b5cbd6535de9f1a6e63004992ad014
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280939.YeO6gFGS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol 'ads_page_owner' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:28:6: sparse: sparse: symbol 'ads_slub_debug' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:29:15: sparse: sparse: symbol 'ads_vmalloc_nr_pages' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:30:15: sparse: sparse: symbol 'ads_pcpu_nr_pages' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:88:9: sparse: sparse: cast removes address space '__percpu' of expression

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
