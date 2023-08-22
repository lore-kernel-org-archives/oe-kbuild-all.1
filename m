Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C017EE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 06:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692684659; x=1724220659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BUQtNqyWNRq0Sa8OqV1S0wc9LorZktAeWcNy7wEmbAg=;
  b=C+nimf/5qo/1nxsuJQ8eS9Z0YeErnPcZ99KyQRXEDx7TqpUhVYMzA/SA
   kpF+BD7BW0PFKIA9boTWUihmuHehP8Fx3hxRcf60fcw/a9/DJJneBtemR
   FMfGiWWbZjGr4qDpWM5dmwCJowj38ZM31iWA6jbk3YGMjjungIvkLFYGV
   M90rO0Cl2ctafCuG+W3XikwTdPghJFOfQMOXSWh1vGuMVTByETeJ9lbP0
   YZSF2QDWD7T8nrNENZ6xe86Bzk38sAU+rA4m4FIk8f33Y6e8zpd8KnC/s
   T03I5X63yQvU91njHUjiZsgoB7Gl1BnJlHzsEhx5xcISGzNVQHBCXGRqB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354121279"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="354121279"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 23:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765621896"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="765621896"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Aug 2023 23:10:56 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYKb6-0001QN-2A;
	Tue, 22 Aug 2023 06:10:40 +0000
Date: Tue, 22 Aug 2023 14:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/usb/common/usb-conn-gpio.c:55: warning: Function parameter or member
 'initial_detection' not described in 'usb_conn_info_vendor'
Message-ID: <202308221411.3b5FcQ4w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3ca64f2c1d4a9c43702fb81c557480d6e43870f2
commit: e77972189dd10a39cbaf3803ed62183681642c2b [2/2] BACKPORT: FROMGIT: usb: common: usb-conn-gpio: Prevent bailing out if initial role is none
config: i386-randconfig-i004-20230821 (https://download.01.org/0day-ci/archive/20230822/202308221411.3b5FcQ4w-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221411.3b5FcQ4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221411.3b5FcQ4w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/common/usb-conn-gpio.c:55: warning: Function parameter or member 'initial_detection' not described in 'usb_conn_info_vendor'


vim +55 drivers/usb/common/usb-conn-gpio.c

    46	
    47	/**
    48	 * struct usb_conn_info_vendor - contains parameters without modifying the format of usb_conn_info
    49	 * @info: contains usb_conn_info structure reference
    50	 * initial_detection: bool to check if it's initial detection after probe
    51	 */
    52	struct usb_conn_info_vendor {
    53		struct usb_conn_info info;
    54		bool initial_detection;
  > 55	};
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
