Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CAA33C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 11:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681902354; x=1713438354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lx2fT498sC93YTPXO3a6wqkTEF8oQ6kHs2h72bBUKTw=;
  b=ElHFn+dArRor7rEqpEdQPg78E4/Vb9Pjle6EkI0RbDiYKVyjG+u+F0Xn
   GQO07SJJ2rsRtGGIq93GLShddvHaRQ3ZCUqB9JrO2NPxUWS/afUmntxC0
   pEA+gsI3c5D9UVrDCOSQmDNMXGHvlKPoYUKHAPRpVffyy+F2OVkNINdvx
   gbGcBihj5JrvpMYeFLv0Cvb/8uVLtETCdm05Wd3ImqAtDTAdgvXLhQJaK
   Ma+zWiZhrosalFTa/PhTyErOqcyyT2PvMI/kCHFPxv0V3+QyB/t1Zykkh
   9Rn9+fFpOWtuTGO2rEy0Z0YJyDV7/g6LIXM8+yLySX0Zks2uiddWGkijI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="345418762"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="345418762"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 04:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="684943753"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="684943753"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Apr 2023 04:05:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp5dE-000eph-04;
	Wed, 19 Apr 2023 11:05:48 +0000
Date: Wed, 19 Apr 2023 19:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Kumar Singh <quic_deesin@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Sarannya S <quic_sarannya@quicinc.com>
Subject: [remoteproc:rpmsg-next 4/10] drivers/rpmsg/rpmsg_core.c:561:20:
 error: 'struct rpmsg_endpoint' has no member named 'flow_cb'
Message-ID: <202304191918.mANz73yb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
head:   cc888eb072b6a48642e429a030b065d4da1d594b
commit: cc7c3bc62c6c74c217ea73e30a135fd2c3affb34 [4/10] rpmsg: core: Add signal API support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304191918.mANz73yb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/commit/?id=cc7c3bc62c6c74c217ea73e30a135fd2c3affb34
        git remote add remoteproc git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
        git fetch --no-tags remoteproc rpmsg-next
        git checkout cc7c3bc62c6c74c217ea73e30a135fd2c3affb34
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191918.mANz73yb-lkp@intel.com/

Note: the remoteproc/rpmsg-next HEAD cc888eb072b6a48642e429a030b065d4da1d594b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/rpmsg/rpmsg_core.c:340:5: warning: no previous prototype for 'rpmsg_set_flow_control' [-Wmissing-prototypes]
     340 | int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_core.c: In function 'rpmsg_dev_probe':
>> drivers/rpmsg/rpmsg_core.c:561:20: error: 'struct rpmsg_endpoint' has no member named 'flow_cb'
     561 |                 ept->flow_cb = rpdrv->flowcontrol;
         |                    ^~
>> drivers/rpmsg/rpmsg_core.c:561:37: error: 'struct rpmsg_driver' has no member named 'flowcontrol'
     561 |                 ept->flow_cb = rpdrv->flowcontrol;
         |                                     ^~


vim +561 drivers/rpmsg/rpmsg_core.c

   525	
   526	/*
   527	 * when an rpmsg driver is probed with a channel, we seamlessly create
   528	 * it an endpoint, binding its rx callback to a unique local rpmsg
   529	 * address.
   530	 *
   531	 * if we need to, we also announce about this channel to the remote
   532	 * processor (needed in case the driver is exposing an rpmsg service).
   533	 */
   534	static int rpmsg_dev_probe(struct device *dev)
   535	{
   536		struct rpmsg_device *rpdev = to_rpmsg_device(dev);
   537		struct rpmsg_driver *rpdrv = to_rpmsg_driver(rpdev->dev.driver);
   538		struct rpmsg_channel_info chinfo = {};
   539		struct rpmsg_endpoint *ept = NULL;
   540		int err;
   541	
   542		err = dev_pm_domain_attach(dev, true);
   543		if (err)
   544			goto out;
   545	
   546		if (rpdrv->callback) {
   547			strncpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
   548			chinfo.src = rpdev->src;
   549			chinfo.dst = RPMSG_ADDR_ANY;
   550	
   551			ept = rpmsg_create_ept(rpdev, rpdrv->callback, NULL, chinfo);
   552			if (!ept) {
   553				dev_err(dev, "failed to create endpoint\n");
   554				err = -ENOMEM;
   555				goto out;
   556			}
   557	
   558			rpdev->ept = ept;
   559			rpdev->src = ept->addr;
   560	
 > 561			ept->flow_cb = rpdrv->flowcontrol;
   562		}
   563	
   564		err = rpdrv->probe(rpdev);
   565		if (err) {
   566			dev_err(dev, "%s: failed: %d\n", __func__, err);
   567			goto destroy_ept;
   568		}
   569	
   570		if (ept && rpdev->ops->announce_create) {
   571			err = rpdev->ops->announce_create(rpdev);
   572			if (err) {
   573				dev_err(dev, "failed to announce creation\n");
   574				goto remove_rpdev;
   575			}
   576		}
   577	
   578		return 0;
   579	
   580	remove_rpdev:
   581		if (rpdrv->remove)
   582			rpdrv->remove(rpdev);
   583	destroy_ept:
   584		if (ept)
   585			rpmsg_destroy_ept(ept);
   586	out:
   587		return err;
   588	}
   589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
