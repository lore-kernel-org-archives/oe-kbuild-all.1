Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F2BBA23
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687791862; x=1719327862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2qtfAV5el/M9/jwFFe8Yda2r/2BI86pz5UV0BNYXFiU=;
  b=VLGmacdaSINFqP6Rjk3/iekIpKH4mpZCm78vtQlpMXBzJ0OJuoruD1kx
   eNbj8vXpdGUXiILYMizOBHtYRwgCMjqramvkxWfJ0vv+uhTvKrzuE3QJ7
   z/P91k1v1ePeXvqQWUp+oL6Ncroh1IGBBQv0AUIZUhX8At8SSciV1G+ky
   MtXjsutRkZOc98syES8MgR7oryoy3u6VqlxcIp1wDuR8ljW/mSNyEVWTp
   ngNxCiW256oEJD0kTZ8gICyKs/sx2kLKl9yPjchBicbs2WF6xk8W8aIgr
   E9NeJMgpnDvSvFrU1IaqZlaBIXUtwdE/ro/LTBK1uUR1ySNHADOC/hhwK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="351068002"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="351068002"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 08:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="693495916"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="693495916"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Jun 2023 08:03:11 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDnkE-000Akr-2W;
	Mon, 26 Jun 2023 15:03:10 +0000
Date: Mon, 26 Jun 2023 23:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ovl: move all parameter handling into params.{c,h}
Message-ID: <202306262225.z0ivclvg-lkp@intel.com>
References: <20230626-fs-overlayfs-mount-api-param-v1-1-29afb997a19f@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626-fs-overlayfs-mount-api-param-v1-1-29afb997a19f@kernel.org>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 62149a745eee03194f025021640c80b84353089b]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/ovl-move-all-parameter-handling-into-params-c-h/20230626-182521
base:   62149a745eee03194f025021640c80b84353089b
patch link:    https://lore.kernel.org/r/20230626-fs-overlayfs-mount-api-param-v1-1-29afb997a19f%40kernel.org
patch subject: [PATCH] ovl: move all parameter handling into params.{c,h}
config: openrisc-randconfig-r005-20230626 (https://download.01.org/0day-ci/archive/20230626/202306262225.z0ivclvg-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306262225.z0ivclvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306262225.z0ivclvg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/overlayfs/params.c:92:13: warning: no previous prototype for 'ovl_redirect_mode' [-Wmissing-prototypes]
      92 | const char *ovl_redirect_mode(struct ovl_config *config)
         |             ^~~~~~~~~~~~~~~~~


vim +/ovl_redirect_mode +92 fs/overlayfs/params.c

    91	
  > 92	const char *ovl_redirect_mode(struct ovl_config *config)
    93	{
    94		return ovl_parameter_redirect_dir[config->redirect_mode].name;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
