Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C81859
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 03:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676257264; x=1707793264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HLJmAL6+MmKcqC3O0dKa859BR3yhc/tv0gwPuOqjlHE=;
  b=cKH6P1GITK1SAlsvyWSpW1TkhWixIpvR2l7xfdBDFC8sXn1dayM+pkSE
   LdSGaf5unHj7irOWmWUjc9ptQwZocTrPJ5sOP4lRrGIlqF94rJDEeCjJr
   7twNfJwMv/IyOq6yjjAgXZ9zb7nXaAUqsL6UmZ4kn1pWDWsPluSs8qnBm
   XPsfVK1ctUn2vUtgKsJznq89yN+LOimETxgFPNdWxdvCmaMvRKMIQ7btK
   vFEfHx590NqxgnhXbPyd66fYaYM6B5I0NmfCviJa4uHptOrTQrvTYSHsL
   UdyxYodTl/R59p72foU8u6eJxIV+8vLlu3pM9psXID+8Jk7DLytVGsG2M
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="329423060"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="329423060"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 19:01:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="792570301"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="792570301"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Feb 2023 19:01:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRP5R-0007Vj-2Y;
	Mon, 13 Feb 2023 03:01:01 +0000
Date: Mon, 13 Feb 2023 11:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Horman <simon.horman@corigine.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH/RFC net-next 1/2] devlink: expose port function commands
 to assign VFs to multiple netdevs
Message-ID: <202302131024.02zp67Vj-lkp@intel.com>
References: <20230206153603.2801791-2-simon.horman@corigine.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206153603.2801791-2-simon.horman@corigine.com>

Hi Simon,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Simon-Horman/devlink-expose-port-function-commands-to-assign-VFs-to-multiple-netdevs/20230206-234121
patch link:    https://lore.kernel.org/r/20230206153603.2801791-2-simon.horman%40corigine.com
patch subject: [PATCH/RFC net-next 1/2] devlink: expose port function commands to assign VFs to multiple netdevs
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/4aacdca405cecdf78c4365b6b745a3525cdcdac5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Simon-Horman/devlink-expose-port-function-commands-to-assign-VFs-to-multiple-netdevs/20230206-234121
        git checkout 4aacdca405cecdf78c4365b6b745a3525cdcdac5
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131024.02zp67Vj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/devlink/devlink-port.rst:264: WARNING: Unexpected indentation.

vim +264 Documentation/networking/devlink/devlink-port.rst

   253	
   254	    $ devlink port show pci/0000:82:00.0/0
   255	    pci/0000:82:00.0/0: type eth netdev enp130s0np0 flavour physical port 0 splittable true lanes 4
   256	        function:
   257	            vf_count 0
   258	
   259	- Set count of VFs assigned to physical port::
   260	    $ devlink port function set pci/0000:82:00.0/0 vf_count 3
   261	
   262	    $ devlink port show pci/0000:82:00.0/0
   263	    pci/0000:82:00.0/0: type eth netdev enp130s0np0 flavour physical port 0 splittable true lanes 4
 > 264	        function:
   265	            vf_count 3
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
