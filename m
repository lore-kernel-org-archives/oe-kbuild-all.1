Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB747E5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 01:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675301706; x=1706837706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J/ZbnOOWGQyaltpY5ZXjym/QBf6OsO4SuT5wCLUEGkg=;
  b=ddnzYVYfmV6IKQaIjJin2eZvW3d6F79nbCg6WF8XY3eaA14str/KfOtf
   n5Ag21YRarsgSXwQlDGAXCvC6HVPejtoAv2gzXDPmCeYQPKRY4U5bPh69
   zhhfuRKe2uayqSeTakL+VGsZGUEr7hpozmKxVmwS3L7CZtHuFPYfppoSV
   ndX8b7TeP6jPNOeB9x1MRE8rdK712IbMCbrE5Nstod80XlwQsfzX6dR7P
   BJfUgknbpFX37YRkgqXoZBLqBWBOw+vPCnTakQm0jWAcG9n6GptqQCxle
   55C9MDqQPda3dFXamKveWayncyoKB5tKOlG0+74sPjEGaq1LmgEML2txB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355658944"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="355658944"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 17:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728647972"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="728647972"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Feb 2023 17:35:01 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNOVB-0005zs-0I;
	Thu, 02 Feb 2023 01:35:01 +0000
Date: Thu, 2 Feb 2023 09:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ajit Khaparde <ajit.khaparde@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, andrew.gospodarek@broadcom.com,
	davem@davemloft.net, edumazet@google.com, jgg@ziepe.ca,
	kuba@kernel.org, leon@kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, michael.chan@broadcom.com,
	netdev@vger.kernel.org, pabeni@redhat.com,
	selvin.xavier@broadcom.com, gregkh@linuxfoundation.org,
	Leon Romanovsky <leonro@nvidia.com>
Subject: Re: [PATCH net-next v10 1/8] bnxt_en: Add auxiliary driver support
Message-ID: <202302020909.KDHYiYu4-lkp@intel.com>
References: <20230201204500.19420-2-ajit.khaparde@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201204500.19420-2-ajit.khaparde@broadcom.com>

Hi Ajit,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Ajit-Khaparde/bnxt_en-Add-auxiliary-driver-support/20230202-044848
patch link:    https://lore.kernel.org/r/20230201204500.19420-2-ajit.khaparde%40broadcom.com
patch subject: [PATCH net-next v10 1/8] bnxt_en: Add auxiliary driver support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302020909.KDHYiYu4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/896eba0b6cd806dd11640cafa66d35f8b483f550
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ajit-Khaparde/bnxt_en-Add-auxiliary-driver-support/20230202-044848
        git checkout 896eba0b6cd806dd11640cafa66d35f8b483f550
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/broadcom/bnxt/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c: In function 'bnxt_aux_dev_release':
>> drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c:483:22: warning: unused variable 'bp' [-Wunused-variable]
     483 |         struct bnxt *bp = netdev_priv(aux_priv->edev->net);
         |                      ^~


vim +/bp +483 drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c

   478	
   479	static void bnxt_aux_dev_release(struct device *dev)
   480	{
   481		struct bnxt_aux_priv *aux_priv =
   482			container_of(dev, struct bnxt_aux_priv, aux_dev.dev);
 > 483		struct bnxt *bp = netdev_priv(aux_priv->edev->net);
   484	
   485		ida_free(&bnxt_aux_dev_ids, aux_priv->id);
   486		kfree(aux_priv->edev);
   487		kfree(aux_priv);
   488	}
   489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
