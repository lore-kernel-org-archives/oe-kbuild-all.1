Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3910110F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 05:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691730192; x=1723266192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tkRNTvZCmg2r2V8njYX1wT5wUIKPbwIvhYjs0xvHC6g=;
  b=LtaPN2+4jBkJ00OJLWFg6gLPmlQXAG71YA9wKo3eGGlIg8MsXvU+r2Vg
   1mZHFywU4K1j0PpEUnnUgOvHahsBCLen3esCDJpJz+vetM6JAnhvwhR8w
   8QKSX4GT7OjtlNowvzDhzVvwXA8v8jWjr/avJKh7Jux7wyvy1hYnDrj34
   3R9CHBis1ZJKZap8vVvxVY3hsbM1YCEwGlwrObdZYl9d8SbVVN/4cuBYz
   SxXVg7ODQ+CE/W4VeYMHkHfeX9VD6nmcpfM7VBMDvYvyPsyG/8MbZaB+J
   f7EDmCt6rnbJIChXljwycSPzQ1Rsk3M5YHZzvI1fq/PuiJ/o5sTbmJFyW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="369066164"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="369066164"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 22:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="762065602"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="762065602"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Aug 2023 22:02:31 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUKIA-0007WK-0e;
	Fri, 11 Aug 2023 05:02:30 +0000
Date: Fri, 11 Aug 2023 13:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: {standard input}:1727: Error: operand out of range (-132 is not
 between -128 and 127)
Message-ID: <202308111233.rbf5C0JD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   25aa0bebba72b318e71fe205bfd1236550cc9534
commit: a6889becb05394255c80b62103677e3b095726a9 refscale: Add tests using SLAB_TYPESAFE_BY_RCU
date:   7 months ago
config: arc-randconfig-r006-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111233.rbf5C0JD-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111233.rbf5C0JD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111233.rbf5C0JD-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:1727: Error: operand out of range (-132 is not between -128 and 127)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
