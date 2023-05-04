Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28151C142
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 23:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683242637; x=1714778637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uPeGQb8CTajOYc2waoE9WH9adpo9B740IcAGYVPj0yc=;
  b=RttSIY1NrHZ1xedCO0zSyGh47CMoIE3kGAN9ghWEQlwOVtOvN7EdaB/1
   MiV1CLZlmsUpRENT20xWcSkUbvVXgyWraS38VsJ6HlbCu2Agz/MKuC43f
   chkx3avaSDUVQzYqKrrh/+jFy10ZY+tRrTEtA1cv711lb3ryx/pQo0s4Y
   CfrBWUWg5AarB1ytgFb+A0J1zl1iMSyXgECxpRZ9uRU3Xa7YwkTGsndNo
   gOAiJz32aafeHd7MXqDZXjU+GJ56Jh5fROKLpseoeWsS8ELD5grsIz++M
   aGsSgXAMKEKIAHiYG2SQjE4p28AdhyTHs3WQQOE/dDZCkIM9DyTedqvR6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="412295107"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="412295107"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 16:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="808942633"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="808942633"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 May 2023 16:23:55 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puiIk-0000CO-2Q;
	Thu, 04 May 2023 23:23:54 +0000
Date: Fri, 5 May 2023 07:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 4666/25920] ERROR:
 "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!
Message-ID: <202305050751.HEixPu2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baolin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   4ae65fccad37053a65c3e93fb3084942d5726c19
commit: 3ebeb5687243e405fbf34032249cada998ee4779 [4666/25920] FROMGIT: power: supply: Allow charger manager can be built as a module
config: i386-randconfig-a011-20230501 (https://download.01.org/0day-ci/archive/20230505/202305050751.HEixPu2c-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-kiwi-5.4
        git checkout 3ebeb5687243e405fbf34032249cada998ee4779
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050751.HEixPu2c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
