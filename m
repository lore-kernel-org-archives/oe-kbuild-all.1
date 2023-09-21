Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62BFA956
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 11:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695296906; x=1726832906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K8aT+q7wtoz10QSssy7pwQ123juZ7rH0zeFJAAkQI3U=;
  b=ljys+wRRO9Vj8qVc8cAMeRL7ZMO2C4LbxnXz5pv8TXz7gpgy9jBLTl28
   5FXdTvHbpa6jx4GLEiedtMSE5oI1ufAKkUDTWlwU6859ezfidm7r4uZpn
   +1MhGDSNs751Y6arU10pwbPUNmla4X9LZX0LMiY7NzG9F1R47GE9tdopY
   uiktCxv1ukNg+RDn5aH4U6jj3qHNgTggxXzkouz/xUWLxnPFhZ3/owaFG
   zNEQ7AVs6GE+q+1lDuQ2fnsnOfVn646f3vA3hHWjKcizG0ZgFy26sC/AL
   qdkTsb5VRUC9ZI5ngQiG3jXYs4Mf6u4np9woB1EThBWBGbLvpnA4mybSe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="370813752"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="370813752"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 04:48:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696697976"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="696697976"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Sep 2023 04:48:24 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjIAQ-0009va-0a;
	Thu, 21 Sep 2023 11:48:22 +0000
Date: Thu, 21 Sep 2023 19:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: ld: cannot find libpcap.a: No such file or directory
Message-ID: <202309211916.BjQsfSM8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ignat,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42dc814987c1feb6410904e58cfd4c36c4146150
commit: 5e1121cd43d4d3436140a462bfc230ff8aeb1693 um: Some fixes to build UML with musl
date:   2 years, 11 months ago
config: um-randconfig-r033-20230730 (https://download.01.org/0day-ci/archive/20230921/202309211916.BjQsfSM8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211916.BjQsfSM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211916.BjQsfSM8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: cannot find libpcap.a: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
