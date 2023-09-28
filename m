Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA6F5253
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 19:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695927924; x=1727463924;
  h=date:from:cc:subject:message-id:mime-version;
  bh=OL4II3e4G6Ehlz7IsZmuZG5L7Fja/5utG7CZ0roBPnA=;
  b=QR9aQABIncAmjefell/5S1AtL5qjTb6c9WZRpBvVJu4kd6E/TJvxvN25
   nWfm8r0kA95H8E3yP39V73DhUhyrZB4NY8xFt6aAlJm13cfu0LabMOzYL
   RGWLw4SernS4FEUse3u/KLSN24WHnUglM+cVqJ48u3ur+WSXscMPtqpl1
   QkwX+P/CGZR095/aYAXakJk73UqVvmvPlhnWmAhv/Fbalh4LNQmZK6r6l
   qoQNWY4MlhBgxH8HhN8X2jOh5DhqCQya+RDLFGBWJZyRCN6SQGuTdC5Nb
   07ZRsYEXGViF4iW87gsmcvug6YvSM1kyOHrhvEhu/EbUmONukk8I8UAhN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="381037882"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="381037882"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 12:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="840021888"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="840021888"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2023 12:05:22 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlwK7-0001pV-3A
	for oe-kbuild-all@lists.linux.dev;
	Thu, 28 Sep 2023 19:05:19 +0000
Date: Fri, 29 Sep 2023 03:04:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_t 9522/30000] cc1: error:
 '-fsanitize=shadow-call-stack' requires '-ffixed-x18'
Message-ID: <202309290302.smjAkxkI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 332eaac720a2ecaa3227b70cc792a1698cafdfb9 [9522/30000] FROMLIST: arm64: implement Shadow Call Stack
config: arm64-randconfig-r015-20230907 (https://download.01.org/0day-ci/archive/20230929/202309290302.smjAkxkI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290302.smjAkxkI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290302.smjAkxkI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: '-fsanitize=shadow-call-stack' requires '-ffixed-x18'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
