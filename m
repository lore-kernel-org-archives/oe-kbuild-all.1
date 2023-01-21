Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28863386
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 03:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674273048; x=1705809048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uZWAxrSdFsWkFAeZwtShMrfQ6/x7uRJKCK64KxgSSFo=;
  b=e273FKIkctY87TjhL1h9zHWL9SF7q64pjksHNKCqSkXkxi3avpdKb7Sb
   9rAq4BqnMp8i9H1SZTvLWwvrSg2OySaw91aB67UdjRMk7mf1QS9K6haY2
   RkSmv8FPCQAtvFpq3VUQq90ntmiIBHd2CxjFpMKiyKFx4HxLuTZUnCsBs
   DIVsqZ/jpmtyxtGkBCE/rUfxAqeVDnjQQ2ycErUBNYsQ41PucDDA6TgoS
   h4L/xMWT9GvjZ6nKIg+LKXfLCKUM6hrArtCdC5Zz8B2lcSmrrVnjRZbmQ
   R+M1j4rJj/XMlt6fVxz/tMK0xDbh4TEC5ZUToP6ismiQap1V0cr4wqGct
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="353009377"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="353009377"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 19:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="662757986"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="662757986"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2023 19:50:46 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ4tx-0003Mk-1S;
	Sat, 21 Jan 2023 03:50:45 +0000
Date: Sat, 21 Jan 2023 11:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/nmitest.2023.01.20a 4/5]
 arch/x86/kernel/nmi.c:441:6: warning: no previous prototype for
 'set_nmi_torture'
Message-ID: <202301211106.33rvYsWW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/nmitest.2023.01.20a
head:   53e298568bde2c728ee2aac4ac634cca8550a4b4
commit: 1f061ebc3647245564abc8b5a47882645af82199 [4/5] x86/nmi: Add a set_nmi_torture() function to control NMI testing
config: x86_64-rhel-8.3-syz (https://download.01.org/0day-ci/archive/20230121/202301211106.33rvYsWW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/1f061ebc3647245564abc8b5a47882645af82199
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/nmitest.2023.01.20a
        git checkout 1f061ebc3647245564abc8b5a47882645af82199
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/nmi.c:441:6: warning: no previous prototype for 'set_nmi_torture' [-Wmissing-prototypes]
     441 | void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
         |      ^~~~~~~~~~~~~~~


vim +/set_nmi_torture +441 arch/x86/kernel/nmi.c

   439	
   440	/* Set the test values as desired. */
 > 441	void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
   442	{
   443		WRITE_ONCE(nmi_delay, nmi_delay_in);
   444		WRITE_ONCE(nmi_halt1, nmi_halt1_in);
   445		WRITE_ONCE(nmi_halt2, nmi_halt2_in);
   446		WRITE_ONCE(nmi_halt3, nmi_halt3_in);
   447		pr_info("%s: Set NMI test parameters nmi_delay=%d nmi_halt1=%d nmi_halt2=%d nmi_halt3=%d\n",
   448			__func__, nmi_delay, nmi_halt1, nmi_halt2, nmi_halt3);
   449	}
   450	EXPORT_SYMBOL_GPL(set_nmi_torture);
   451	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
