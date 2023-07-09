Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BE97F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jul 2023 20:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688936399; x=1720472399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KloZCkYP5B/AWtYp/xV0r+yGiPoNmALbfjg2j3dh/eY=;
  b=JVF/2o5Y4cxTo9uWpDkwMhPsRiwoH4UjpzGy5C+w6B9pVfbZPji+Uojd
   SzyYznBuu9HKikeplJPOmkkVRljLtk4dYbMT6Flawu/gsTHCmUL2G7Rf4
   kFyiuyZU5LMU3PZYfFAnEfzUXudiXJbs9G6Dv+yWPyw0dsj/Loa9AqOp1
   tvPFdkrFKgv80peuWLJQ97DyCbAQBJjt6vctir1nd5Ha5Z7QThVNKV9O9
   hxd+JpweD3/tETJRCHgS5i/mNcj/m92CalNLHZGvfyZG7htaopb3xYkzv
   ubtS7SEvPTUFYQxJdR1whtAoJ1HKU12wzLqEVFfDxkTtbUXsO4hZNKB+Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="430277444"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="430277444"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2023 13:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="785920609"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="785920609"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Jul 2023 13:59:56 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIbVb-0003Ng-2A;
	Sun, 09 Jul 2023 20:59:55 +0000
Date: Mon, 10 Jul 2023 04:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <13916275206@139.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: {standard input}:866: Error: value -148 out of range
Message-ID: <202307100413.lPlgpaPd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c192ac7357683f78c2e6d6e75adfcc29deb8c4ae
commit: ef3bcde75d06d65f78ba38a30d5a87fb83a5cdae ASoC: tas2781: Add tas2781 driver
date:   3 weeks ago
config: m68k-randconfig-r015-20230710 (https://download.01.org/0day-ci/archive/20230710/202307100413.lPlgpaPd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307100413.lPlgpaPd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307100413.lPlgpaPd-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:866: Error: value -148 out of range
>> {standard input}:866: Error: value of ffffff6c too large for field of 1 byte at 0000043b

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
