Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5C15AF2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 16:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696006225; x=1727542225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YtgmBG0DGIHf9oQu4KZyDdh9l4V8U6Fg3xFb6EIpJfw=;
  b=QiywOscIbh+NTwp3whdf+PRFu4lIN6iUuH50N6WYKhcVTRKvB/taVa02
   3QO5Ob6gvSQpriBss128Tu+GNeXYstI57LFNNEWp8bBrYYHZ0Zl8ldibB
   7afvp0KnSDMHfwPilAd+U/AdjS8N1mL5wiQd/niBiDvz90mLABboDEg5I
   HYJD3W3ArC+QnYGxay3qrmd9S3d0Q6hfq8O3SPJG50FdswRwM/V6k+3wJ
   ajYc2S4OdRPnCgfdUJAWLfzMIyjVM5zzUSsmcSwby1I4RoL4+DNHvxAQP
   RSP5Wca6Qw+KT60zGr8wsD45XK/83z5Fwi1VJv+v40FE9sGN7veqvTyQ+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="362587188"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="362587188"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 09:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="785149502"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="785149502"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Sep 2023 09:50:21 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmGh1-00034L-2T;
	Fri, 29 Sep 2023 16:50:19 +0000
Date: Sat, 30 Sep 2023 00:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.7-next 213/306]
 loongarch64-linux-ld:./arch/loongarch/kernel/vmlinux.lds:6: undefined symbol
 `screen_info' referenced in expression
Message-ID: <202309300011.jv5wdzPQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7-next
head:   a126cc9f2f87fe0931a7bf053665560587086082
commit: c9623f5ffafb42c7942753436c620b8179756a34 [213/306] [SUBMITTED 20230719] efi: move screen_info into efi init code
config: loongarch-randconfig-001-20230929 (https://download.01.org/0day-ci/archive/20230930/202309300011.jv5wdzPQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309300011.jv5wdzPQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300011.jv5wdzPQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> loongarch64-linux-ld:./arch/loongarch/kernel/vmlinux.lds:6: undefined symbol `screen_info' referenced in expression

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
