Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C044CC2E8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680165644; x=1711701644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U/3eSjd9nXyGGXOX8RZIcbLzdsrhzBN95JrCUVhnV3s=;
  b=lV0qy1cOFT5bOjHqoqWAVjhaGUaPFiqhY+V5w/u8ZCqZZauoRi3XqSX6
   WSYDkqxdfWDT8vE22CH0spCAs/8EBkJVe0K0nWKwi6p1dp/9OoTuk2yFc
   pmPelKP6bDHbh//6QG/xGl6qw2JJBq60Odbbv6jjV/gXkjSY7gepbHK/c
   F9FHN0L+vhithqXdjfugEOcDbPjQZJc0CwJ8ttYRsUHrxiJuqfKLMFwkz
   5k+LGuxKqEgbPXeA4LmQM4PshFkwyM3FhDYS3RQ5At+RZrt+0+SkCgTFo
   kl7jHhvXwjR18+9YclydUnTQSktFZeiqtFVg024+9sb+s4+gzcayANP2B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="338605320"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="338605320"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 01:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="773899384"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="773899384"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Mar 2023 01:40:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phnpq-000Kd6-0e;
	Thu, 30 Mar 2023 08:40:42 +0000
Date: Thu, 30 Mar 2023 16:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH net-next 07/15] idpf: configure
 resources for TX queues
Message-ID: <202303301615.t0Mco1AM-lkp@intel.com>
References: <20230329140404.1647925-8-pavan.kumar.linga@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329140404.1647925-8-pavan.kumar.linga@intel.com>

Hi Pavan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavan-Kumar-Linga/virtchnl-add-virtchnl-version-2-ops/20230329-221347
patch link:    https://lore.kernel.org/r/20230329140404.1647925-8-pavan.kumar.linga%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next 07/15] idpf: configure resources for TX queues
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20230330/202303301615.t0Mco1AM-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/306315c1a27395f92f28516fab2493fc68884130
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pavan-Kumar-Linga/virtchnl-add-virtchnl-version-2-ops/20230329-221347
        git checkout 306315c1a27395f92f28516fab2493fc68884130
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/net/ethernet/intel/idpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301615.t0Mco1AM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c: In function 'idpf_vport_queue_ids_init':
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:2123:1: warning: the frame size of 1028 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2123 | }
         | ^


vim +2123 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c

  2070	
  2071	/**
  2072	 * idpf_vport_queue_ids_init - Initialize queue ids from Mailbox parameters
  2073	 * @vport: virtual port for which the queues ids are initialized
  2074	 *
  2075	 * Will initialize all queue ids with ids received as mailbox parameters.
  2076	 * Returns 0 on success, negative if all the queues are not initialized.
  2077	 */
  2078	int idpf_vport_queue_ids_init(struct idpf_vport *vport)
  2079	{
  2080		struct virtchnl2_create_vport *vport_params;
  2081		struct virtchnl2_queue_reg_chunks *chunks;
  2082		struct idpf_vport_config *vport_config;
  2083		u16 vport_idx = vport->idx;
  2084		/* We may never deal with more than 256 same type of queues */
  2085	#define IDPF_MAX_QIDS	256
  2086		u32 qids[IDPF_MAX_QIDS];
  2087		int num_ids;
  2088		u16 q_type;
  2089	
  2090		vport_config = vport->adapter->vport_config[vport_idx];
  2091		if (vport_config->req_qs_chunks) {
  2092			struct virtchnl2_add_queues *vc_aq =
  2093				(struct virtchnl2_add_queues *)vport_config->req_qs_chunks;
  2094			chunks = &vc_aq->chunks;
  2095		} else {
  2096			vport_params = (struct virtchnl2_create_vport *)
  2097					vport->adapter->vport_params_recvd[vport_idx];
  2098			chunks = &vport_params->chunks;
  2099		}
  2100	
  2101		num_ids = idpf_vport_get_queue_ids(qids, IDPF_MAX_QIDS,
  2102						   VIRTCHNL2_QUEUE_TYPE_TX,
  2103						   chunks);
  2104		if (num_ids < vport->num_txq)
  2105			return -EINVAL;
  2106		num_ids = __idpf_vport_queue_ids_init(vport, qids, num_ids,
  2107						      VIRTCHNL2_QUEUE_TYPE_TX);
  2108		if (num_ids < vport->num_txq)
  2109			return -EINVAL;
  2110	
  2111		if (!idpf_is_queue_model_split(vport->txq_model))
  2112			return 0;
  2113	
  2114		q_type = VIRTCHNL2_QUEUE_TYPE_TX_COMPLETION;
  2115		num_ids = idpf_vport_get_queue_ids(qids, IDPF_MAX_QIDS, q_type, chunks);
  2116		if (num_ids < vport->num_complq)
  2117			return -EINVAL;
  2118		num_ids = __idpf_vport_queue_ids_init(vport, qids, num_ids, q_type);
  2119		if (num_ids < vport->num_complq)
  2120			return -EINVAL;
  2121	
  2122		return 0;
> 2123	}
  2124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
