Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19183200BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 21:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685482127; x=1717018127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sM9GvjISJ6MPSTxRYD8Se1huEBPToqyxtzCyT4efpUM=;
  b=SHm5tImdTnNUy+LTZvFb5/sKWMG/S4E+P8va/QnD51kI2A++saubx9r4
   lF173HtLkk9uS6EXAsAXLztmyPkH2O307BXMcooMticgfpnVB5hMPasYO
   UA5cq6S37Kl64cc74uJ7KD5myDDOHtTb4QvfQ8lXravqhrWheNMQV6aYI
   sEHnSrk1MEu30FKxkPzjmgiug8I3fVQVAcW+fhqgTKIkN/uiVjoTQecFz
   zJeTsUbDC3qxDIa2ruLjV6Jh5MGtG2hQ/jwbQVUHvDHLzvM5G7S5NuXhA
   yLGJYr85mUDrke1eHl0vgurov9H5uxgR/5Xrb20T5xo6e6gElPAuTuaEI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="344556285"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="344556285"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 14:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="953335083"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="953335083"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 May 2023 14:28:44 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q46tX-0000oR-2s;
	Tue, 30 May 2023 21:28:43 +0000
Date: Wed, 31 May 2023 05:27:59 +0800
From: kernel test robot <lkp@intel.com>
To: Uday Shankar <ushankar@purestorage.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-nvme:nvme-6.4-rc4-pull 5/5] drivers/nvme/host/core.c:1202:51:
 error: 'struct nvme_request' has no member named 'start_time'
Message-ID: <202305310532.V3y3hWXI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.4-rc4-pull
head:   f041d3b83aea7e76e4dfc6591954d6dfe506dbdb
commit: f041d3b83aea7e76e4dfc6591954d6dfe506dbdb [5/5] nvme: improve handling of long keep alives
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230531/202305310532.V3y3hWXI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add linux-nvme git://git.infradead.org/nvme.git
        git fetch --no-tags linux-nvme nvme-6.4-rc4-pull
        git checkout f041d3b83aea7e76e4dfc6591954d6dfe506dbdb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310532.V3y3hWXI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c: In function 'nvme_keep_alive_end_io':
>> drivers/nvme/host/core.c:1202:51: error: 'struct nvme_request' has no member named 'start_time'
    1202 |         unsigned long rtt = jiffies - nvme_req(rq)->start_time;
         |                                                   ^~


vim +1202 drivers/nvme/host/core.c

  1195	
  1196	static enum rq_end_io_ret nvme_keep_alive_end_io(struct request *rq,
  1197							 blk_status_t status)
  1198	{
  1199		struct nvme_ctrl *ctrl = rq->end_io_data;
  1200		unsigned long flags;
  1201		bool startka = false;
> 1202		unsigned long rtt = jiffies - nvme_req(rq)->start_time;
  1203		unsigned long delay = nvme_keep_alive_work_period(ctrl);
  1204	
  1205		/*
  1206		 * Subtract off the keepalive RTT so nvme_keep_alive_work runs
  1207		 * at the desired frequency.
  1208		 */
  1209		if (rtt <= delay) {
  1210			delay -= rtt;
  1211		} else {
  1212			dev_warn(ctrl->device, "long keepalive RTT (%u ms)\n",
  1213				 jiffies_to_msecs(rtt));
  1214			delay = 0;
  1215		}
  1216	
  1217		blk_mq_free_request(rq);
  1218	
  1219		if (status) {
  1220			dev_err(ctrl->device,
  1221				"failed nvme_keep_alive_end_io error=%d\n",
  1222					status);
  1223			return RQ_END_IO_NONE;
  1224		}
  1225	
  1226		ctrl->ka_last_check_time = jiffies;
  1227		ctrl->comp_seen = false;
  1228		spin_lock_irqsave(&ctrl->lock, flags);
  1229		if (ctrl->state == NVME_CTRL_LIVE ||
  1230		    ctrl->state == NVME_CTRL_CONNECTING)
  1231			startka = true;
  1232		spin_unlock_irqrestore(&ctrl->lock, flags);
  1233		if (startka)
  1234			queue_delayed_work(nvme_wq, &ctrl->ka_work, delay);
  1235		return RQ_END_IO_NONE;
  1236	}
  1237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
