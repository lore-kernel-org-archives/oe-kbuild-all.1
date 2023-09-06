Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6FD10971
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 18:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694024334; x=1725560334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MGNaPyfct9ZA6Jx8Fm3wIdCt4INUWzy/QTzzBAziiG4=;
  b=kk7a7M86NDPZvfM1qdM6T01q9El/4KshwhZ6Tybqbny/445p4Vh8JHOd
   Hqx3gt4azPm2V6B6t/T1sO8OZYUlAtg2nmQ18P+ss9qIqWvnAicz5RWNV
   16rLf1tYT34i3GUWnSA1eQ1iYzOuILGLao8smUNzexCVt5aIFsGYNk4bB
   YMMQNHAb7+qFnVKXif44mgYxIG6quzWCZJcWW7KktAxVBdNNTpZoXPnYx
   OS+IxO1ZEDItEeDX1JcGJ40fIeFfrp3/s9ob2tWKfsWS33m3YJTlUnRch
   oSYIu8YVAFzOmTuc+doIs5Zdxvn5d/yoeFrTZYNpysuuBUhn1JA14ZddK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="367367954"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="367367954"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="718368596"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="718368596"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Sep 2023 11:18:50 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdx72-0000U3-0K;
	Wed, 06 Sep 2023 18:18:48 +0000
Date: Thu, 7 Sep 2023 02:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: Xabier Marquiegui <reibax@gmail.com>, richardcochran@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, chrony-dev@chrony.tuxfamily.org,
	mlichvar@redhat.com, netdev@vger.kernel.org,
	ntp-lists@mattcorallo.com, reibax@gmail.com
Subject: Re: [PATCH 3/3] ptp: support event queue reader channel masks
Message-ID: <202309070203.1o2AVeeS-lkp@intel.com>
References: <20230906104754.1324412-4-reibax@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906104754.1324412-4-reibax@gmail.com>

Hi Xabier,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on net-next/main linus/master next-20230906]
[cannot apply to shuah-kselftest/next shuah-kselftest/fixes horms-ipvs/master v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xabier-Marquiegui/ptp-support-multiple-timestamp-event-readers/20230906-194848
base:   net/main
patch link:    https://lore.kernel.org/r/20230906104754.1324412-4-reibax%40gmail.com
patch subject: [PATCH 3/3] ptp: support event queue reader channel masks
config: i386-randconfig-005-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070203.1o2AVeeS-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070203.1o2AVeeS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070203.1o2AVeeS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:32:
>> ./usr/include/linux/ptp_clock.h:109:2: error: unknown type name 'pid_t'
     109 |  pid_t reader_pid; /* PID of process reading the timestamp event queue */
         |  ^~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
