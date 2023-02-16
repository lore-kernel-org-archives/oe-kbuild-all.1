Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9862028E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676544704; x=1708080704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C1uRYTrLnC8qo9sX65OaGRa5i0d//lvhi2nAXlKQX3o=;
  b=T8ctMYuuCJijPUbIvxq6Djr17d4POD3K1qtPgVdNk2rOchuTdAvruJHT
   JTzfn8OY6lS3A48rxr3WE5HlKQHqSxehj27twxwp2ewsciIWCpyGIvcd+
   EXjnyYZYC9d92nxMJn5z/yXqnPbbjkuD2n4jPhI2weoAmCo1HiQULXbOg
   XKujwAwNkgn8DFczUSgA0kGfjDH5AD5Ib7HELvpOXA0Zk9SeN2Gxw8ya7
   Loljmpk+Kbs9jyZm14D1ZFxHYkG2LjzRyBmtKCoI07V27rfYz1swYirVX
   DU1rKwY03ztYYTBUVjSZ0vXpOCp2wZoKoGRKNesDccgdTVjYEaHot6jIN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="417910209"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="417910209"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 02:50:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="793985466"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="793985466"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2023 02:50:24 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSbqK-000ACf-0C;
	Thu, 16 Feb 2023 10:50:24 +0000
Date: Thu, 16 Feb 2023 18:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Nagalla <hnagalla@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-5.10.y-cicd 20735/20749]
 drivers/remoteproc/ti_k3_m4_remoteproc.c:379:46: warning: cast to pointer
 from integer of different size
Message-ID: <202302161848.NvGL2jDs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   76b3e88d569210a51399e8d8c8babd995af29d11
commit: 99cff963c4139e4181d5fc32dbad947f6cd4ed1d [20735/20749] remoteproc: k3-m4: extend stop to send shutdown message to m4 core
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230216/202302161848.NvGL2jDs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout 99cff963c4139e4181d5fc32dbad947f6cd4ed1d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/remoteproc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302161848.NvGL2jDs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/ti_k3_m4_remoteproc.c: In function 'k3_m4_rproc_start':
   drivers/remoteproc/ti_k3_m4_remoteproc.c:333:13: warning: variable 'boot_addr' set but not used [-Wunused-but-set-variable]
     333 |         u32 boot_addr;
         |             ^~~~~~~~~
   drivers/remoteproc/ti_k3_m4_remoteproc.c: In function 'k3_m4_rproc_stop':
>> drivers/remoteproc/ti_k3_m4_remoteproc.c:379:46: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     379 |         ret = mbox_send_message(kproc->mbox, (void *)msg);
         |                                              ^


vim +379 drivers/remoteproc/ti_k3_m4_remoteproc.c

   357	
   358	/*
   359	 * Stop the M4 remote processor.
   360	 *
   361	 * This function puts the M4 processor into reset, and finishes processing
   362	 * of any pending messages.
   363	 */
   364	static int k3_m4_rproc_stop(struct rproc *rproc)
   365	{
   366		unsigned long to = msecs_to_jiffies(3000);
   367		struct k3_m4_rproc *kproc = rproc->priv;
   368		struct device *dev = kproc->dev;
   369		u32 msg = RP_MBOX_SHUTDOWN;
   370		int ret;
   371	
   372		if (kproc->ipc_only) {
   373			dev_err(dev, "%s cannot be invoked in IPC-only mode\n",
   374				__func__);
   375			return -EINVAL;
   376		}
   377	
   378		reinit_completion(&kproc->shut_comp);
 > 379		ret = mbox_send_message(kproc->mbox, (void *)msg);
   380		if (ret < 0) {
   381			dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
   382			return ret;
   383		}
   384	
   385		ret = wait_for_completion_timeout(&kproc->shut_comp, to);
   386		if (ret == 0) {
   387			dev_err(dev, "%s : timed out waiting for rproc completion event \n", __func__);
   388			return -EBUSY;
   389		};
   390	
   391		mbox_free_channel(kproc->mbox);
   392	
   393		/* allow some time for the remote core to enter quiescent state (ex:
   394		 * wfi) after sending SHUTDOWN ack. Typically, remote core is expected
   395		 * to enter 'wfi' right after sending the ack.  1ms is more than
   396		 * sufficient for this purpose
   397		 */
   398		msleep(1);
   399	
   400		k3_m4_rproc_reset(kproc);
   401	
   402		return 0;
   403	}
   404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
