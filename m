Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86229657
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678308664; x=1709844664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WHJAxWcQZrNJ3jAT6CRW9PXupt+AbnHE3zVNPwknq1Y=;
  b=du/gFVSoNeEGvniPZo2PefOlnF6KDQ6wAbZqR1lSEf36RhVJdpEpbjkP
   y2a28+H+5K412U67KIYs9jItoBiYtGprvlkHIfRxOs+t6xPdITkVlOeCA
   cdbSvBZ8U6LmpTBRDTSaTKns39TIJtq9yG1h/D1MInbHc0K4RbDOofZ5h
   lgPPKSnhtVDVJ9lfN+62fRdPNnoKtOnRYdGyAhR5jVSac4xa/rs++qt1l
   YBn4A+EQu/kP+f+yJzo1dq/QBJ9quzZdD/SzYQ8AK0m7d6Rf+bGRd4+EP
   r17Ns7Uy4df98AnL2Z2FCS/l3wa4Eff+7H57m6IYIMxAf45RaiUpC7Ubr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320103099"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="320103099"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 12:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="670468949"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="670468949"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Mar 2023 12:50:58 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa0kT-0002OZ-1i;
	Wed, 08 Mar 2023 20:50:57 +0000
Date: Thu, 9 Mar 2023 04:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 284/288] fs/dlm/lockspace.c:412:9: error:
 implicit declaration of function 'dlm_midcomms_stop'; did you mean
 'dlm_lowcomms_stop'?
Message-ID: <202303090455.a2yJHImD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   22fb0d195f4cb39540659d23b38a609244bfb80a
commit: 313fab3d31360a5b17c8d592a6fb3c97a00cfde9 [284/288] fs: dlm: start midcomms before scand
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230309/202303090455.a2yJHImD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=313fab3d31360a5b17c8d592a6fb3c97a00cfde9
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout 313fab3d31360a5b17c8d592a6fb3c97a00cfde9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/dlm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090455.a2yJHImD-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/dlm/lockspace.c: In function 'threads_start':
>> fs/dlm/lockspace.c:412:9: error: implicit declaration of function 'dlm_midcomms_stop'; did you mean 'dlm_lowcomms_stop'? [-Werror=implicit-function-declaration]
     412 |         dlm_midcomms_stop();
         |         ^~~~~~~~~~~~~~~~~
         |         dlm_lowcomms_stop
   cc1: some warnings being treated as errors


vim +412 fs/dlm/lockspace.c

   391	
   392	static int threads_start(void)
   393	{
   394		int error;
   395	
   396		/* Thread for sending/receiving messages for all lockspace's */
   397		error = dlm_lowcomms_start();
   398		if (error) {
   399			log_print("cannot start dlm midcomms %d", error);
   400			goto fail;
   401		}
   402	
   403		error = dlm_scand_start();
   404		if (error) {
   405			log_print("cannot start dlm_scand thread %d", error);
   406			goto midcomms_fail;
   407		}
   408	
   409		return 0;
   410	
   411	 midcomms_fail:
 > 412		dlm_midcomms_stop();
   413	 fail:
   414		return error;
   415	}
   416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
