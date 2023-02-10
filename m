Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605F77E2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 03:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676001200; x=1707537200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fl9znPNRoMp4bQw1tWGZEVDq7KHtxJOd4ABdc1O8Nak=;
  b=hPDsRrmCoUaB5X6S8/ONQuwp1CkyW2btW4wnrAXk4uRyIqvzA5Yd7yKs
   Ve/FmDt2FawsopPKDA2sQ431mA4L1824Z+oCppL0ROZwmOS1Dh607+Snh
   pJ0ivuWbLzqqjB34+BJAHGSiLrs37kxyRvENqHsmg/hvb8hWqaenp+fm5
   jWIeiiXxgYAYUQdhXNAaV7Gjgz42w/BkFZ5O5fxvzTIuhfuwm+KfTW8WF
   w8iZ6oQjE6wx3yJMwWyzvGmY8X+bf7DgDCOBl3WDFVjXWF9cpk2lWkWh8
   4HL4COTb0ybog5lCaSAIXVF7IVWFC+46DWjGf0ux7j+eUg3UJlznZOs8p
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="310694170"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="310694170"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 19:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="913391267"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="913391267"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Feb 2023 19:53:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQKTN-0005WI-2C;
	Fri, 10 Feb 2023 03:53:17 +0000
Date: Fri, 10 Feb 2023 11:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Zhang <markzhang@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-rc 4/4] drivers/infiniband/core/cma.c:4808:51:
 sparse: sparse: incorrect type in argument 2 (different base types)
Message-ID: <202302101121.6VUW1ZUP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-rc
head:   2bd8bd268058902993314811636def4b198b6b7f
commit: 2bd8bd268058902993314811636def4b198b6b7f [4/4] RDMA/cma: Allow UD qp_type to join multicast only
config: arm-randconfig-s033-20230209 (https://download.01.org/0day-ci/archive/20230210/202302101121.6VUW1ZUP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/commit/?id=2bd8bd268058902993314811636def4b198b6b7f
        git remote add leon-rdma https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git
        git fetch --no-tags leon-rdma rdma-rc
        git checkout 2bd8bd268058902993314811636def4b198b6b7f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/infiniband/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101121.6VUW1ZUP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/core/cma.c:4808:51: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] qkey @@     got restricted __be32 [usertype] qkey @@
   drivers/infiniband/core/cma.c:4808:51: sparse:     expected unsigned int [usertype] qkey
   drivers/infiniband/core/cma.c:4808:51: sparse:     got restricted __be32 [usertype] qkey
   drivers/infiniband/core/cma.c: note: in included file (through include/linux/swait.h, include/linux/completion.h):
   include/linux/spinlock.h:405:9: sparse: sparse: context imbalance in 'destroy_id_handler_unlock' - wrong count at exit
   drivers/infiniband/core/cma.c:2062:6: sparse: sparse: context imbalance in 'rdma_destroy_id' - unexpected unlock
   drivers/infiniband/core/cma.c:2205:17: sparse: sparse: context imbalance in 'cma_ib_handler' - unexpected unlock
   drivers/infiniband/core/cma.c:2397:17: sparse: sparse: context imbalance in 'cma_ib_req_handler' - unexpected unlock
   drivers/infiniband/core/cma.c:2521:17: sparse: sparse: context imbalance in 'cma_iw_handler' - unexpected unlock
   drivers/infiniband/core/cma.c:2566:17: sparse: sparse: context imbalance in 'iw_conn_req_handler' - unexpected unlock
   drivers/infiniband/core/cma.c:2980:17: sparse: sparse: context imbalance in 'cma_work_handler' - unexpected unlock
   drivers/infiniband/core/cma.c:3485:17: sparse: sparse: context imbalance in 'addr_handler' - unexpected unlock
   drivers/infiniband/core/cma.c:4205:17: sparse: sparse: context imbalance in 'cma_sidr_rep_handler' - unexpected unlock

vim +4808 drivers/infiniband/core/cma.c

  4795	
  4796	static int cma_ib_mc_handler(int status, struct ib_sa_multicast *multicast)
  4797	{
  4798		struct cma_multicast *mc = multicast->context;
  4799		struct rdma_id_private *id_priv = mc->id_priv;
  4800		struct rdma_cm_event event = {};
  4801		int ret = 0;
  4802	
  4803		mutex_lock(&id_priv->handler_mutex);
  4804		if (READ_ONCE(id_priv->state) == RDMA_CM_DEVICE_REMOVAL ||
  4805		    READ_ONCE(id_priv->state) == RDMA_CM_DESTROYING)
  4806			goto out;
  4807	
> 4808		ret = cma_set_qkey(id_priv, multicast->rec.qkey);
  4809		if (!ret) {
  4810			cma_make_mc_event(status, id_priv, multicast, &event, mc);
  4811			ret = cma_cm_event_handler(id_priv, &event);
  4812		}
  4813		rdma_destroy_ah_attr(&event.param.ud.ah_attr);
  4814		WARN_ON(ret);
  4815	
  4816	out:
  4817		mutex_unlock(&id_priv->handler_mutex);
  4818		return 0;
  4819	}
  4820	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
