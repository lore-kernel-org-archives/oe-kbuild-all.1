Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB658C0F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 17:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683738043; x=1715274043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3l9rWbmp/YytmHrROLtatNuGSh4sNNckTpogd8t70c4=;
  b=NLYpCZi1xTSBi2TCbIKSV0NNKgLk3Maang5qtxdnmnbgRPzweWs1RlmX
   ZZO1C5SiJdswnJvvXfYUfrSIqPled6yoPZqsrn+tL0zXFgoYCvRDxM0PB
   AllR4QLCAZVXySPKLxxRQUFOhEMMZqgcCq0voFw1v1U40Tv2z40nkhFki
   A+jh30So8ugUDPZ5h+7YlDX3joULapYWuYa5aBYS51Cu8sciPwEIXBel+
   0ks70cUPCBKfwMFHYSS4BGuGVgQd3sdAooILuODJl+qFj3/qp3n49TUGh
   0ZvgFljf3bIZH60bxXsCAKJKNKcZXT5QxaUFF0VfPG7VbUufCiZThjvtM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436590199"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="436590199"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 10:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="764375417"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="764375417"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 May 2023 10:00:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwnB9-0003S1-20;
	Wed, 10 May 2023 17:00:39 +0000
Date: Thu, 11 May 2023 01:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, "Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [bp:rc1-mtrr 2/16] ./usr/include/asm/mtrr.h:88:9: error: unknown
 type name 'bool'
Message-ID: <202305110003.WD5XnBVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git rc1-mtrr
head:   684d1aaeda788353adfa0b2d0968ca194be218be
commit: f4c7a521d7d99a4aee106963b25eba40ebe67e5b [2/16] x86/mtrr: Replace size_or_mask and size_and_mask with a much easier concept
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230511/202305110003.WD5XnBVn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/commit/?id=f4c7a521d7d99a4aee106963b25eba40ebe67e5b
        git remote add bp https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git
        git fetch --no-tags bp rc1-mtrr
        git checkout f4c7a521d7d99a4aee106963b25eba40ebe67e5b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110003.WD5XnBVn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/asm/mtrr.h:88:9: error: unknown type name 'bool'
      88 |         bool have_fixed;
         |         ^~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
