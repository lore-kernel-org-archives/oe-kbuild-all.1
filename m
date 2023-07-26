Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79031C9E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 22:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690410777; x=1721946777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3TinXiCOIIgYrhLeyEnxaIBl7I74tlRa6lCxNKolW2M=;
  b=CyQQE1Db2BO9uaKo61ogJ1bxWt7QyYjz8jCwV4XnZRmcoojHNfAfl5Fc
   F8+U49c1/P156dSY2ms2pYNDgszG+ZuShCkfPOJD5ZKe7twGoPrc2lUUt
   KJ4bX7EJJ1dqOReM2IBTnfvB7hzb9IRUXVpIdUSiUGDSFy5OtenKxwgwc
   zfu9IpUNAydIqtOAhNgs4rtCO7N/3HiavbQbV9nSP8v89hzEKbZLtGrvp
   OdAqsMoIQnWKFvlBRNv18jrmUVbzLewEFIrskAeOdJcA2ym+pRt46FPwt
   ro1wRMXLh2ihyen7dYWvK0wen72W5E1jujUe2dMYdo+IYxQq9stW9sL9Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370823936"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="370823936"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 15:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="761840075"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="761840075"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Jul 2023 15:32:55 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOn3u-0001O1-2I;
	Wed, 26 Jul 2023 22:32:54 +0000
Date: Thu, 27 Jul 2023 06:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] parport: mfc3: avoid empty-body warning
Message-ID: <202307270631.RUr9mtaB-lkp@intel.com>
References: <20230726150944.2265044-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726150944.2265044-2-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on deller-parisc/for-next]
[also build test WARNING on linus/master v6.5-rc3 next-20230726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/parport-mfc3-avoid-empty-body-warning/20230726-231357
base:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
patch link:    https://lore.kernel.org/r/20230726150944.2265044-2-arnd%40kernel.org
patch subject: [PATCH 2/2] parport: mfc3: avoid empty-body warning
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230727/202307270631.RUr9mtaB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270631.RUr9mtaB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270631.RUr9mtaB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/parport/parport_mfc3.c: In function 'control_pc_to_mfc3':
>> drivers/parport/parport_mfc3.c:114:28: warning: "/*" within comment [-Wcomment]
     114 |         if (control & 128) /* /INITP */
         |                             
   drivers/parport/parport_mfc3.c: In function 'mfc3_read_control':
   drivers/parport/parport_mfc3.c:132:16: error: implicit declaration of function 'control_mfc3_to_pc'; did you mean 'control_pc_to_mfc3'? [-Werror=implicit-function-declaration]
     132 |         return control_mfc3_to_pc(pia(p)->ppra & 0xe0);
         |                ^~~~~~~~~~~~~~~~~~
         |                control_pc_to_mfc3
   cc1: some warnings being treated as errors


vim +114 drivers/parport/parport_mfc3.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  108  
^1da177e4c3f41 Linus Torvalds 2005-04-16  109  static unsigned char control_mfc3_to_pc(unsigned char control)
^1da177e4c3f41 Linus Torvalds 2005-04-16  110  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  111  	unsigned char ret = PARPORT_CONTROL_STROBE 
^1da177e4c3f41 Linus Torvalds 2005-04-16  112  			  | PARPORT_CONTROL_AUTOFD | PARPORT_CONTROL_SELECT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  113  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @114  	if (control & 128) /* /INITP */
^1da177e4c3f41 Linus Torvalds 2005-04-16  115  		ret |= PARPORT_CONTROL_INIT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  116  	if (control & 64) /* /AUTOLF */
^1da177e4c3f41 Linus Torvalds 2005-04-16  117  		ret &= ~PARPORT_CONTROL_AUTOFD;
^1da177e4c3f41 Linus Torvalds 2005-04-16  118  	if (control & 32) /* /SELECT_IN */
^1da177e4c3f41 Linus Torvalds 2005-04-16  119  		ret &= ~PARPORT_CONTROL_SELECT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  120  	return ret;
^1da177e4c3f41 Linus Torvalds 2005-04-16  121  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
