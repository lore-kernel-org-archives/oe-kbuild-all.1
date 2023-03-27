Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44777EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 05:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679895966; x=1711431966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rYKVOoUtdi3VVPTDTMwZZRCfhbNRWD9hH4LWvYCOpHo=;
  b=RMIMgjrUJQ0ueEBEKk4jt5qp3Trl7RxQ0OIz3H3gUkvgj11v+OC67wwm
   EGKH52Q5JZTTYi2WxbN3Iz8ge4ViG7BXsGne3XkgAts85av9f97WgSgBP
   ZOWdHjeoS+g1yZrjFPF19tNs8QxGRwhtyLpjWAiRKJ/MSwsaPFz+j974S
   1HcrbFawVrLDXwhL+i7SnDRK5cjJM/JTQnZ8PgyVLaszzLvoxBnZz1pPM
   xBQGpn3m0tN9HmHixHwOCk/XrGDaqRZxH+PKEdIgPER2bXqo2wuuH/aWI
   Z5gJYHtn00n1V3xSjuaOVREzQ0s37O/YqhA8d6pBPEh8A+n1XuV6iwPwT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="405108774"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="405108774"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 22:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="772565480"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="772565480"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Mar 2023 22:46:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgfgC-000HZn-2O;
	Mon, 27 Mar 2023 05:46:04 +0000
Date: Mon, 27 Mar 2023 13:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Wen Gu <guwen@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next v4 4/9] net/smc: Introduce SMC-D loopback
 device
Message-ID: <202303271355.xB02Jj7p-lkp@intel.com>
References: <1679887699-54797-5-git-send-email-guwen@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679887699-54797-5-git-send-email-guwen@linux.alibaba.com>

Hi Wen,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Wen-Gu/net-smc-Decouple-ism_dev-from-SMC-D-device-dump/20230327-113116
patch link:    https://lore.kernel.org/r/1679887699-54797-5-git-send-email-guwen%40linux.alibaba.com
patch subject: [RFC PATCH net-next v4 4/9] net/smc: Introduce SMC-D loopback device
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230327/202303271355.xB02Jj7p-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d6844632bbc7e00ef25798248736e84afa0a4e37
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Wen-Gu/net-smc-Decouple-ism_dev-from-SMC-D-device-dump/20230327-113116
        git checkout d6844632bbc7e00ef25798248736e84afa0a4e37
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash net/smc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303271355.xB02Jj7p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/smc/smc_loopback.c: In function 'smc_lo_register_dmb':
>> net/smc/smc_loopback.c:76:30: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      76 |         dmb_node->dma_addr = (dma_addr_t)dmb_node->cpu_addr;
         |                              ^


vim +76 net/smc/smc_loopback.c

    45	
    46	static int smc_lo_register_dmb(struct smcd_dev *smcd, struct smcd_dmb *dmb,
    47				       void *client_priv)
    48	{
    49		struct smc_lo_dev *ldev = smcd->priv;
    50		struct smc_lo_dmb_node *dmb_node;
    51		int sba_idx, rc;
    52	
    53		/* check space for new dmb */
    54		for_each_clear_bit(sba_idx, ldev->sba_idx_mask, SMC_LODEV_MAX_DMBS) {
    55			if (!test_and_set_bit(sba_idx, ldev->sba_idx_mask))
    56				break;
    57		}
    58		if (sba_idx == SMC_LODEV_MAX_DMBS)
    59			return -ENOSPC;
    60	
    61		dmb_node = kzalloc(sizeof(*dmb_node), GFP_KERNEL);
    62		if (!dmb_node) {
    63			rc = -ENOMEM;
    64			goto err_bit;
    65		}
    66	
    67		dmb_node->sba_idx = sba_idx;
    68		dmb_node->cpu_addr = kzalloc(dmb->dmb_len, GFP_KERNEL |
    69				     __GFP_NOWARN | __GFP_NORETRY |
    70				     __GFP_NOMEMALLOC);
    71		if (!dmb_node->cpu_addr) {
    72			rc = -ENOMEM;
    73			goto err_node;
    74		}
    75		dmb_node->len = dmb->dmb_len;
  > 76		dmb_node->dma_addr = (dma_addr_t)dmb_node->cpu_addr;
    77	
    78		/* TODO: token is random but not exclusive !
    79		 * suppose to find token in dmb hask table, if has this token
    80		 * already, then generate another one.
    81		 */
    82		/* add new dmb into hash table */
    83		get_random_bytes(&dmb_node->token, sizeof(dmb_node->token));
    84		write_lock(&ldev->dmb_ht_lock);
    85		hash_add(ldev->dmb_ht, &dmb_node->list, dmb_node->token);
    86		write_unlock(&ldev->dmb_ht_lock);
    87	
    88		dmb->sba_idx = dmb_node->sba_idx;
    89		dmb->dmb_tok = dmb_node->token;
    90		dmb->cpu_addr = dmb_node->cpu_addr;
    91		dmb->dma_addr = dmb_node->dma_addr;
    92		dmb->dmb_len = dmb_node->len;
    93	
    94		return 0;
    95	
    96	err_node:
    97		kfree(dmb_node);
    98	err_bit:
    99		clear_bit(sba_idx, ldev->sba_idx_mask);
   100		return rc;
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
