Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668BD1117
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 17:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687021726; x=1718557726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rtllzcFj6Zgcz2/hCnnUOkS6Oh4GCKycbHvLiOhcEvY=;
  b=AC6lCszsblkVQ9JKADItgCh40TXzrxmVNtIXrA1RQAomtuPAGy7S6TRD
   RblzBznCf3qZ3f8za9RacLwpAzUchOi9MppHmsTbqzDdUcHHt4QhPzwbC
   usFx7GLQGJRgQijO0FBfwSm2A+TbNDg3iBVmX71RBggikP9LGT1n2P4Z/
   vq4XwJIl0N3SHMR05RBYf6cG814B7WH17Okun5QieR8QqR4CvdceGh+4B
   Aqz+dBtsL2/k5bI9X5hHsDStwFWzavRgz+TNJlPKgoz94yJAQMDYOLuw6
   M7719YfmGdwFAsw2jRtVUEWQiWEXOHLjx1v3G/Qa0d924jKbKgFXhwMcf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="358280000"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="358280000"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 10:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="742986056"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="742986056"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Jun 2023 10:08:44 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAZPn-0002xk-1U;
	Sat, 17 Jun 2023 17:08:43 +0000
Date: Sun, 18 Jun 2023 01:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/210-gpu 227/227] /bin/bash: line 1: rustc: command
 not found
Message-ID: <202306180144.FTYHPLJn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   496a1b061691f01602aa63d2a8027cf3020d4bb8
commit: 496a1b061691f01602aa63d2a8027cf3020d4bb8 [227/227] rust: 1.70 compat hack
config: sparc64-randconfig-r036-20230617 (https://download.01.org/0day-ci/archive/20230618/202306180144.FTYHPLJn-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180144.FTYHPLJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180144.FTYHPLJn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: rustc: command not found
   expr: syntax error: unexpected argument '1.69.0'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
