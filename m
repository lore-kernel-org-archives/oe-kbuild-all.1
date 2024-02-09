Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EAD2836D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 22:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707519288; cv=none; b=haieaBTTyAjQXT3w0a2ScBp8fOUDMvv8PT2vN9RBUk8tIHLKzpvKFFKmf77JLNQ0mhIMSdefi8MP89EFt/1+l/nbnAtkZOAPWq6229polamp080TKuPeMNIf9uBXn796cIgYoljHNCKaZqqUq5uEtlrTrFNxFwqS9KLB4hcVkAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707519288; c=relaxed/simple;
	bh=r10wSRbaxBpfOn3OBVa99Ju+RhzkKg3Jx/mKQDFraOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SK0H7Ed7DOmI2mTDcY1JG42k21h3Ts9F1rplyAnFrlWkWgVpOhqXqkbGhjrjlICaD3XvsD3uLZ1xySaE80XB+JQGO6UYb3PvnvSLCaBnZbSPkwjqDjGhtLr+ANcVt7ZmIgPl4s4UCSfClntZqK+2aTur6ERQvWb+a62adh0LTkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CE/zRj8/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CE/zRj8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707519286; x=1739055286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r10wSRbaxBpfOn3OBVa99Ju+RhzkKg3Jx/mKQDFraOo=;
  b=CE/zRj8/324KmAcXVcmX+JQsovRZsirCtPRWMkXkLMuXDHoMA5WaubLc
   7UAfmguGRpS8FfdelpsAjkBBavVusT1FZO4NrFkrb8G+wqhMhX63tgOWq
   gQ9xfP2qx9Gbw5vjGXl5JkwGcCkRlhxq1RIriDkwROGeYSmEoYEeYneYj
   atKR2p/xolLreMGgyuwN2du9TQSTBFyikDNT9ZH6yy/KUUfwwvvb6X5wt
   4cQgs0kRcQYFDOV5PVaKGLrHRcnVGZuQ6K+KggFrOgkutGBssNYD4dZUw
   lRD7WIfEjdbctSxz9H1pSGtZdEk1OVQP8vLYucqd2qJraFEG0pVzKXshO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="19021871"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="19021871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 14:54:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="6662253"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Feb 2024 14:54:44 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYZla-0005BA-1j;
	Fri, 09 Feb 2024 22:54:42 +0000
Date: Sat, 10 Feb 2024 06:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.6/linux 2/10] drivers/edac/ieh_edac.c:701:8: error:
 call to undeclared function 'register_nmi_handler'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202402100628.THP6QNBM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   bb56715daf2e0efbbd8cf00a04a020e83baa05cb
commit: 9f721ed885803cd46cb312f7253c60e4864ffab3 [2/10] EDAC/ieh: Add I/O device EDAC driver for Intel CPUs with IEH
config: x86_64-buildonly-randconfig-004-20240210 (https://download.01.org/0day-ci/archive/20240210/202402100628.THP6QNBM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100628.THP6QNBM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100628.THP6QNBM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/edac/ieh_edac.c:701:8: error: call to undeclared function 'register_nmi_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     701 |                 rc = register_nmi_handler(NMI_SERR, ieh_nmi_handler,
         |                      ^
   drivers/edac/ieh_edac.c:701:8: note: did you mean 'register_err_handler'?
   drivers/edac/ieh_edac.c:694:12: note: 'register_err_handler' declared here
     694 | static int register_err_handler(void)
         |            ^
     695 | {
     696 |         bool os_visible = false;
     697 |         int rc;
     698 | 
     699 |         if (has_notification_by(IEH_NMI)) {
     700 |                 init_irq_work(&ieh_irq_work, ieh_irq_work_cb);
     701 |                 rc = register_nmi_handler(NMI_SERR, ieh_nmi_handler,
         |                      ~~~~~~~~~~~~~~~~~~~~
         |                      register_err_handler
>> drivers/edac/ieh_edac.c:701:29: error: use of undeclared identifier 'NMI_SERR'
     701 |                 rc = register_nmi_handler(NMI_SERR, ieh_nmi_handler,
         |                                           ^
>> drivers/edac/ieh_edac.c:727:3: error: call to undeclared function 'unregister_nmi_handler'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     727 |                 unregister_nmi_handler(NMI_SERR, IEH_NMI_NAME);
         |                 ^
   drivers/edac/ieh_edac.c:727:3: note: did you mean 'unregister_err_handler'?
   drivers/edac/ieh_edac.c:724:13: note: 'unregister_err_handler' declared here
     724 | static void unregister_err_handler(void)
         |             ^
     725 | {
     726 |         if (has_notification_by(IEH_NMI)) {
     727 |                 unregister_nmi_handler(NMI_SERR, IEH_NMI_NAME);
         |                 ~~~~~~~~~~~~~~~~~~~~~~
         |                 unregister_err_handler
   drivers/edac/ieh_edac.c:727:26: error: use of undeclared identifier 'NMI_SERR'
     727 |                 unregister_nmi_handler(NMI_SERR, IEH_NMI_NAME);
         |                                        ^
   4 errors generated.


vim +/register_nmi_handler +701 drivers/edac/ieh_edac.c

   693	
   694	static int register_err_handler(void)
   695	{
   696		bool os_visible = false;
   697		int rc;
   698	
   699		if (has_notification_by(IEH_NMI)) {
   700			init_irq_work(&ieh_irq_work, ieh_irq_work_cb);
 > 701			rc = register_nmi_handler(NMI_SERR, ieh_nmi_handler,
   702						  0, IEH_NMI_NAME);
   703			if (rc) {
   704				ieh_printk(KERN_ERR, "Can't register NMI handler\n");
   705				return rc;
   706			}
   707	
   708			os_visible = true;
   709		}
   710	
   711		if (has_notification_by(IEH_MCE)) {
   712			mce_register_decode_chain(&ieh_mce_dec);
   713			os_visible = true;
   714		}
   715	
   716		if (!os_visible) {
   717			ieh_printk(KERN_INFO, "No OS-visible IEH events\n");
   718			return -ENODEV;
   719		}
   720	
   721		return 0;
   722	}
   723	
   724	static void unregister_err_handler(void)
   725	{
   726		if (has_notification_by(IEH_NMI)) {
 > 727			unregister_nmi_handler(NMI_SERR, IEH_NMI_NAME);
   728			irq_work_sync(&ieh_irq_work);
   729		}
   730	
   731		if (has_notification_by(IEH_MCE))
   732			mce_unregister_decode_chain(&ieh_mce_dec);
   733	}
   734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
