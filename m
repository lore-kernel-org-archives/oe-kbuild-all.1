Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2307B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 16:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678553219; x=1710089219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WQsywKJnI2f+r49OCu8iK6wFycgSl211Z323PBHQRDk=;
  b=Dz5noD0AxUVZUePc1tMzkX0U+hwxSRxt6MCVJq/y3c0yp7pMEgf4y/hl
   jBuBhN8VzC11CGSSNjvZFMVZRx+I/jFhBJO1jPn0fxRC2S2SRAR/yHpxo
   1GvAVQrTIH5muyrUpiuOsb8Fk/yCcGa1LlBhKy6rw/RumtRG89VHFsorK
   uCbRHjyI6wElOUpOLuj2HyWV2HqdcYNk1c4LXSoZ3JOvnHd7U6AA50JKP
   LSK137rUXYLAwl7YTalCe17tNSJfdbRSCC+UNADnwMIT59AT3bneg7/Gp
   5wIl6qpW1tLkjbfRuJBxHdzfv983YdMmR3hPYhMmeHdejjzS+IpY7NvnQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="364577075"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="364577075"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 08:46:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="678183762"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="678183762"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Mar 2023 08:46:57 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb2My-0004hR-2V;
	Sat, 11 Mar 2023 16:46:56 +0000
Date: Sun, 12 Mar 2023 00:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchinth:socwatch_linux_6_0 1/1]
 drivers/platform/x86/sepdk/pax/pax.c:868:22-29: WARNING: kzalloc should be
 used for
Message-ID: <202303120039.LmHg5dZ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mchinth/linux socwatch_linux_6_0
head:   32b2f1b19c12122a110fa6b673c000ef6bd5ee8b
commit: 32b2f1b19c12122a110fa6b673c000ef6bd5ee8b [1/1] SEP/SOCPERF drivers updated to 5.36
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20230312/202303120039.LmHg5dZ2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120039.LmHg5dZ2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/platform/x86/sepdk/pax/pax.c:868:22-29: WARNING: kzalloc should be used for 
>> 	 /* Allocate memory for the PAX control device */ 
>> 	 pax_control  , instead of kmalloc/memset

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
