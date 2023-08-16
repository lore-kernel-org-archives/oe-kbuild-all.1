Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E516717F7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 07:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692170130; x=1723706130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OfCm1FOXgwFkUzryiA3cA+GSgr4qXu2OKoWCEui9Fzo=;
  b=Jts4VJMYtiFgj1LgjA5yoAN84TjoVztJxyqeHi3kc/twPRpfojj/koMC
   XrInZTVMwXRKCqEKF1K1jTVJ/KragRuTpj7/T9fdFdZOrOwV+0aW+04qV
   B8SRNWp2UIJmLJbR1qDZYSu/BtWnNNraUTDbhwCemphnAnqs5oJyRYqwi
   JhA0V8Uy1NzwVIYgkdhmDH2K4m2VUrPxjzQeNuTvV8v4l6fbUFTPs7fpk
   iPxA+82npv7rK8fAA+617Z1/W6auaU2nx6Uj3u2oAE2mefDur/A6OEdrI
   g1viwL8S9SvKspguDCg1CiBPbvhdxptEQq47ViTKCpZL1RCy4XJLHHjp4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436362735"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="436362735"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 00:15:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734100348"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="734100348"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Aug 2023 00:15:27 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWAiC-00005P-19;
	Wed, 16 Aug 2023 07:13:48 +0000
Date: Wed, 16 Aug 2023 15:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 122/141]
 drivers/s390/block/dasd_eckd.c:3656:14: error: implicit declaration of
 function 'dasd_eckd_pprc_enabled'; did you mean 'dasd_eckd_pe_handler'?
Message-ID: <202308161422.RR4wDDAB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   82320ddb4a62efc1d70c8839bddb59ef879e4fb1
commit: 722155c60790e65a3f673b662773ab463d922985 [122/141] s390/dasd: fix command reject error on ESE devices
config: s390-randconfig-r002-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161422.RR4wDDAB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161422.RR4wDDAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161422.RR4wDDAB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/s390/block/dasd_eckd.c:130:47: warning: 'struct dasd_pprc_data_sc4' declared inside parameter list will not be visible outside of this definition or declaration
     130 |                                        struct dasd_pprc_data_sc4 *);
         |                                               ^~~~~~~~~~~~~~~~~~
   drivers/s390/block/dasd_eckd.c: In function 'dasd_in_copy_relation':
>> drivers/s390/block/dasd_eckd.c:3656:14: error: implicit declaration of function 'dasd_eckd_pprc_enabled'; did you mean 'dasd_eckd_pe_handler'? [-Werror=implicit-function-declaration]
    3656 |         if (!dasd_eckd_pprc_enabled(device))
         |              ^~~~~~~~~~~~~~~~~~~~~~
         |              dasd_eckd_pe_handler
>> drivers/s390/block/dasd_eckd.c:3659:30: error: invalid application of 'sizeof' to incomplete type 'struct dasd_pprc_data_sc4'
    3659 |         temp = kzalloc(sizeof(*temp), GFP_KERNEL);
         |                              ^
>> drivers/s390/block/dasd_eckd.c:3663:50: error: passing argument 2 of 'dasd_eckd_query_pprc_status' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3663 |         rc = dasd_eckd_query_pprc_status(device, temp);
         |                                                  ^~~~
         |                                                  |
         |                                                  struct dasd_pprc_data_sc4 *
   drivers/s390/block/dasd_eckd.c:130:40: note: expected 'struct dasd_pprc_data_sc4 *' but argument is of type 'struct dasd_pprc_data_sc4 *'
     130 |                                        struct dasd_pprc_data_sc4 *);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/s390/block/dasd_eckd.c:3665:26: error: invalid use of undefined type 'struct dasd_pprc_data_sc4'
    3665 |                 rc = temp->dev_info[0].state;
         |                          ^~
   drivers/s390/block/dasd_eckd.c: At top level:
>> drivers/s390/block/dasd_eckd.c:129:12: warning: 'dasd_eckd_query_pprc_status' used but never defined
     129 | static int dasd_eckd_query_pprc_status(struct dasd_device *,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +3656 drivers/s390/block/dasd_eckd.c

  3650	
  3651	static int dasd_in_copy_relation(struct dasd_device *device)
  3652	{
  3653		struct dasd_pprc_data_sc4 *temp;
  3654		int rc;
  3655	
> 3656		if (!dasd_eckd_pprc_enabled(device))
  3657			return 0;
  3658	
> 3659		temp = kzalloc(sizeof(*temp), GFP_KERNEL);
  3660		if (!temp)
  3661			return -ENOMEM;
  3662	
> 3663		rc = dasd_eckd_query_pprc_status(device, temp);
  3664		if (!rc)
> 3665			rc = temp->dev_info[0].state;
  3666	
  3667		kfree(temp);
  3668		return rc;
  3669	}
  3670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
