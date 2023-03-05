Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566347E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Mar 2023 07:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678001841; x=1709537841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W82GRzJ63DoiYbLMsSYJPqhbrTE2B6/qdAAeXFIXdS4=;
  b=S6fXkwfuIp4zjCVpUx0i06WwUb7I5/gSg0+YzITp1VNqgIoNGCGLLIjS
   nEi/rIC9Z75zUQwvIpQiyss3PmTcaLKUogqmOc42zVxnvY65W9x2hBnM6
   yCJugbD6wosgRpWQ4brIFs8hodB3IWZsIrD8bfco9KfmFk9H+PW4o94Jg
   KsEexzzfv/lZZ24goHWnAyzSjviW1ZSIkKRhR/NLCT4c2LBJSWSY7sQeh
   BpmW2TASdLcyBi9XoYm+4q3QLPdDi1GFbdpqeAeCVT+BiUbmcfkMVEKzZ
   0NCPJCpSEMFuH5S/15FzcA8gGhYzDVasdQez3Smod9K7dt6TmnYgxIko5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="362963657"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="362963657"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 23:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="764887079"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="764887079"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Mar 2023 23:37:18 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYivm-0002bV-10;
	Sun, 05 Mar 2023 07:37:18 +0000
Date: Sun, 5 Mar 2023 15:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Jiri Kosina <jkosina@suse.cz>,
	Stefan Ghinea <stefan.ghinea@windriver.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.4 1/213]
 drivers/nvme/target/discovery.c:243:9: warning: 'strncpy' output truncated
 before terminating nul copying 8 bytes from a string of the same length
Message-ID: <202303051501.8SjFylDt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   4f33bd88bad2d2ab7d95f1ee6d6970e49483b511
commit: 67a82f457248d7c7d75b239caaceab444578ae06 [1/213] HID: asus: Remove check for same LED brightness on set
config: alpha-randconfig-r022-20230305 (https://download.01.org/0day-ci/archive/20230305/202303051501.8SjFylDt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=67a82f457248d7c7d75b239caaceab444578ae06
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout 67a82f457248d7c7d75b239caaceab444578ae06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/nvme/target/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303051501.8SjFylDt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/target/discovery.c: In function 'nvmet_execute_identify_disc_ctrl':
>> drivers/nvme/target/discovery.c:243:9: warning: 'strncpy' output truncated before terminating nul copying 8 bytes from a string of the same length [-Wstringop-truncation]
     243 |         strncpy((char *)id->fr, UTS_RELEASE, sizeof(id->fr));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +243 drivers/nvme/target/discovery.c

a07b4970f464f1 Christoph Hellwig 2016-06-21  229  
a07b4970f464f1 Christoph Hellwig 2016-06-21  230  static void nvmet_execute_identify_disc_ctrl(struct nvmet_req *req)
a07b4970f464f1 Christoph Hellwig 2016-06-21  231  {
a07b4970f464f1 Christoph Hellwig 2016-06-21  232  	struct nvmet_ctrl *ctrl = req->sq->ctrl;
a07b4970f464f1 Christoph Hellwig 2016-06-21  233  	struct nvme_id_ctrl *id;
a07b4970f464f1 Christoph Hellwig 2016-06-21  234  	u16 status = 0;
a07b4970f464f1 Christoph Hellwig 2016-06-21  235  
a07b4970f464f1 Christoph Hellwig 2016-06-21  236  	id = kzalloc(sizeof(*id), GFP_KERNEL);
a07b4970f464f1 Christoph Hellwig 2016-06-21  237  	if (!id) {
a07b4970f464f1 Christoph Hellwig 2016-06-21  238  		status = NVME_SC_INTERNAL;
a07b4970f464f1 Christoph Hellwig 2016-06-21  239  		goto out;
a07b4970f464f1 Christoph Hellwig 2016-06-21  240  	}
a07b4970f464f1 Christoph Hellwig 2016-06-21  241  
a07b4970f464f1 Christoph Hellwig 2016-06-21  242  	memset(id->fr, ' ', sizeof(id->fr));
a07b4970f464f1 Christoph Hellwig 2016-06-21 @243  	strncpy((char *)id->fr, UTS_RELEASE, sizeof(id->fr));
a07b4970f464f1 Christoph Hellwig 2016-06-21  244  
a07b4970f464f1 Christoph Hellwig 2016-06-21  245  	/* no limit on data transfer sizes for now */
a07b4970f464f1 Christoph Hellwig 2016-06-21  246  	id->mdts = 0;
a07b4970f464f1 Christoph Hellwig 2016-06-21  247  	id->cntlid = cpu_to_le16(ctrl->cntlid);
a07b4970f464f1 Christoph Hellwig 2016-06-21  248  	id->ver = cpu_to_le32(ctrl->subsys->ver);
a07b4970f464f1 Christoph Hellwig 2016-06-21  249  	id->lpa = (1 << 2);
a07b4970f464f1 Christoph Hellwig 2016-06-21  250  
a07b4970f464f1 Christoph Hellwig 2016-06-21  251  	/* no enforcement soft-limit for maxcmd - pick arbitrary high value */
a07b4970f464f1 Christoph Hellwig 2016-06-21  252  	id->maxcmd = cpu_to_le16(NVMET_MAX_CMD);
a07b4970f464f1 Christoph Hellwig 2016-06-21  253  
a07b4970f464f1 Christoph Hellwig 2016-06-21  254  	id->sgls = cpu_to_le32(1 << 0);	/* we always support SGLs */
a07b4970f464f1 Christoph Hellwig 2016-06-21  255  	if (ctrl->ops->has_keyed_sgls)
a07b4970f464f1 Christoph Hellwig 2016-06-21  256  		id->sgls |= cpu_to_le32(1 << 2);
0d5ee2b2ab4f67 Steve Wise        2018-06-20  257  	if (req->port->inline_data_size)
a07b4970f464f1 Christoph Hellwig 2016-06-21  258  		id->sgls |= cpu_to_le32(1 << 20);
a07b4970f464f1 Christoph Hellwig 2016-06-21  259  
b662a078576e7d Jay Sternberg     2018-11-12  260  	id->oaes = cpu_to_le32(NVMET_DISC_AEN_CFG_OPTIONAL);
b662a078576e7d Jay Sternberg     2018-11-12  261  
5eadc9cce17100 Bart Van Assche   2018-10-08  262  	strlcpy(id->subnqn, ctrl->subsys->subsysnqn, sizeof(id->subnqn));
a07b4970f464f1 Christoph Hellwig 2016-06-21  263  
a07b4970f464f1 Christoph Hellwig 2016-06-21  264  	status = nvmet_copy_to_sgl(req, 0, id, sizeof(*id));
a07b4970f464f1 Christoph Hellwig 2016-06-21  265  
a07b4970f464f1 Christoph Hellwig 2016-06-21  266  	kfree(id);
a07b4970f464f1 Christoph Hellwig 2016-06-21  267  out:
a07b4970f464f1 Christoph Hellwig 2016-06-21  268  	nvmet_req_complete(req, status);
a07b4970f464f1 Christoph Hellwig 2016-06-21  269  }
a07b4970f464f1 Christoph Hellwig 2016-06-21  270  

:::::: The code at line 243 was first introduced by commit
:::::: a07b4970f464f13640e28e16dad6cfa33647cc99 nvmet: add a generic NVMe target

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
