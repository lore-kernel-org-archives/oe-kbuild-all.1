Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884537E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 00:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hE2pSvb2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700095116; x=1731631116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Nban/4GtABuUf72xG+2olETq56cTiUKc24hK+K823A=;
  b=hE2pSvb2SUNh05ozUhU6ZcThlB3aLVgrPhPdew1pcmI9/YD3OwbmHptN
   CTYpO5Y9rmyRVWoDzgK06Fb5RQP1vTu93u5cfOCtCARInj/wgONGiA+S2
   UCZvIa55xBU89srGjR+r0F6p697JhDR3lodgHqxOKG9LpmPBPWAXEOy7P
   ZhYY6jJ8bzTKL4tuoaV5CAgVvbsA7eXMxDY3UM2ioPf2TMdmYfjfS2zJ8
   pE7xtH/MVWPqfAXknaRI0sQJAS8bPTzVMGt0rltovghBxzjoXUFUAXU7Z
   IwM6r9kvP7RAFd+peYRE7qQidYb6fOnReAyNZzsDMx9Qzdi+5b+UCTIfc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388150583"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="388150583"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 16:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="888739641"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="888739641"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Nov 2023 16:38:04 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3QOP-00013E-2V;
	Thu, 16 Nov 2023 00:38:01 +0000
Date: Thu, 16 Nov 2023 08:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Aurelien Aptel <aaptel@nvidia.com>, linux-nvme@lists.infradead.org,
	netdev@vger.kernel.org, sagi@grimberg.me, hch@lst.de,
	kbusch@kernel.org, axboe@fb.com, chaitanyak@nvidia.com,
	davem@davemloft.net, kuba@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Boris Pismenny <borisp@nvidia.com>,
	aaptel@nvidia.com, aurelien.aptel@gmail.com, smalin@nvidia.com,
	malin1024@gmail.com, ogerlitz@nvidia.com, yorayz@nvidia.com,
	galshalom@nvidia.com, mgurtovoy@nvidia.com, edumazet@google.com,
	pabeni@redhat.com, dsahern@kernel.org, ast@kernel.org,
	jacob.e.keller@intel.com
Subject: Re: [PATCH v19 01/20] net: Introduce direct data placement tcp
 offload
Message-ID: <202311160837.5lnRXiOm-lkp@intel.com>
References: <20231114124255.765473-2-aaptel@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114124255.765473-2-aaptel@nvidia.com>

Hi Aurelien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master v6.7-rc1 next-20231115]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aurelien-Aptel/net-Introduce-direct-data-placement-tcp-offload/20231114-205106
base:   net/main
patch link:    https://lore.kernel.org/r/20231114124255.765473-2-aaptel%40nvidia.com
patch subject: [PATCH v19 01/20] net: Introduce direct data placement tcp offload
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231116/202311160837.5lnRXiOm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160837.5lnRXiOm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160837.5lnRXiOm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/skbuff.c:79:
>> include/net/ulp_ddp.h:317:6: warning: no previous prototype for 'ulp_ddp_is_cap_active' [-Wmissing-prototypes]
     317 | bool ulp_ddp_is_cap_active(struct net_device *netdev, int cap_bit_nr)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/ulp_ddp_is_cap_active +317 include/net/ulp_ddp.h

   316	
 > 317	bool ulp_ddp_is_cap_active(struct net_device *netdev, int cap_bit_nr)
   318	{
   319		return false;
   320	}
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
