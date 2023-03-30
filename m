Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E5E1105
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 02:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680141742; x=1711677742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0byJSOEuHwsrwEwHcajlzNFK9QkDFFwdFRqeblfHfg=;
  b=d3dTj/fnoRbVo0cml7aaObbCxYXY5yJ2Ja3o7bg8SDiSfiZDH51M+I8P
   f3laUy3HBSwMbhIQJiKUzDanSuoDzOQaKattgpK39o3j5U4iXa64uB5AH
   c61yrHerLCegqnOA7bNlmCiSb1niebNHEF7GVMVY6RvMhaeDTyj0NjOHr
   ZZMteIGWu+zBD0RL/ilVgDbu3xT+H4PP3y/cgTI7NK4OJg5wj6YaB+UG4
   1U+pYsuY/d68NNsSOqCdGbkwE+jp5nrpx2Otb197tJPIq5biwGd6GL5YL
   9iNZdzVyTo8PF5hfn9YX3XtqeGsY43opVXGHtiZ+JuCUsab+npsWsb3Mi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342659257"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="342659257"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 19:02:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="773809822"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="773809822"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Mar 2023 19:02:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phhcK-000KAI-2P;
	Thu, 30 Mar 2023 02:02:20 +0000
Date: Thu, 30 Mar 2023 10:02:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 11/12] drivers/md/dm-verity-target.o:
 warning: objtool: verity_finish_io.cold()+0x1a: unreachable instruction
Message-ID: <202303300931.gl9XNZ2j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   45021642d111b25b928f3f2d25d4f4640ec55c05
commit: 45021642d111b25b928f3f2d25d4f4640ec55c05 [11/12] CHROMIUM: add separate leaf functions for transient verity failures
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230330/202303300931.gl9XNZ2j-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.4
        git checkout 45021642d111b25b928f3f2d25d4f4640ec55c05
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300931.gl9XNZ2j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-verity-target.o: warning: objtool: verity_finish_io.cold()+0x1a: unreachable instruction


objdump-func vmlinux.o verity_finish_io.cold:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
