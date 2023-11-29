Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF96A39D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 02:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mP6WIF5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701225712; x=1732761712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2bYCJciScNEPbncnlv6k0be1UDv4lq1fpYG4fNzZjQ=;
  b=mP6WIF5qznBvS106kLkCyfoSFpzOrrYds8XX3Zdj0eAcMasf8Ouen5qa
   ktwM4SG+uauIq7SyaFyKTSDCi4+REWvI2c3qTZ8vrNPYEwle6UPFv/GoK
   o2QZZ8Lu/UtSNtC4qa0XiuPhZNXBHEBVSEwewDZrpBCIwfllzj6K8QXS1
   oPSdGhY9SFcf1A5seWILH2Uqcc8uNrKWiE9sHxBer8Vr7lMamosnmJwIa
   1aMXZ5pbUjBMMF0x1DuEf3SEMQxQH10PIG4mSO8EbGxmhOO963dkBvNrT
   sDCxrH2AETUpyEg4xRMmlkL5+TfqCwtlVnowz5HE7/5xQ6Davy1sdA9RG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="395897434"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="395897434"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 18:41:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="768749609"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="768749609"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Nov 2023 18:41:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8AWJ-0008SB-2h;
	Wed, 29 Nov 2023 02:41:47 +0000
Date: Wed, 29 Nov 2023 10:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Sagi Grimberg <sagi@grimberg.me>
Subject: [linux-nvme:nvme-6.7 5/6] drivers/nvme/host/rdma.c:987:47: error:
 passing argument 1 of 'nvme_ctrl_state' from incompatible pointer type
Message-ID: <202311290724.uhn9SbbS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.7
head:   b6cbe703db447a22f70caa0ee9cf616ac26cdc37
commit: 822d50c036c6af2e6a42b45b2e63cb02d6233c2b [5/6] nvme: ensure reset state check ordering
config: i386-buildonly-randconfig-002-20231129 (https://download.01.org/0day-ci/archive/20231129/202311290724.uhn9SbbS-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311290724.uhn9SbbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311290724.uhn9SbbS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/rdma.c: In function 'nvme_rdma_reconnect_or_remove':
>> drivers/nvme/host/rdma.c:987:47: error: passing argument 1 of 'nvme_ctrl_state' from incompatible pointer type [-Werror=incompatible-pointer-types]
     enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
                                                  ^~~~
   In file included from drivers/nvme/host/rdma.c:27:0:
   drivers/nvme/host/nvme.h:390:36: note: expected 'struct nvme_ctrl *' but argument is of type 'struct nvme_rdma_ctrl *'
    static inline enum nvme_ctrl_state nvme_ctrl_state(struct nvme_ctrl *ctrl)
                                       ^~~~~~~~~~~~~~~
   drivers/nvme/host/rdma.c: In function 'nvme_rdma_setup_ctrl':
   drivers/nvme/host/rdma.c:1063:48: error: passing argument 1 of 'nvme_ctrl_state' from incompatible pointer type [-Werror=incompatible-pointer-types]
      enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
                                                   ^~~~
   In file included from drivers/nvme/host/rdma.c:27:0:
   drivers/nvme/host/nvme.h:390:36: note: expected 'struct nvme_ctrl *' but argument is of type 'struct nvme_rdma_ctrl *'
    static inline enum nvme_ctrl_state nvme_ctrl_state(struct nvme_ctrl *ctrl)
                                       ^~~~~~~~~~~~~~~
   drivers/nvme/host/rdma.c: In function 'nvme_rdma_error_recovery_work':
   drivers/nvme/host/rdma.c:1135:48: error: passing argument 1 of 'nvme_ctrl_state' from incompatible pointer type [-Werror=incompatible-pointer-types]
      enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
                                                   ^~~~
   In file included from drivers/nvme/host/rdma.c:27:0:
   drivers/nvme/host/nvme.h:390:36: note: expected 'struct nvme_ctrl *' but argument is of type 'struct nvme_rdma_ctrl *'
    static inline enum nvme_ctrl_state nvme_ctrl_state(struct nvme_ctrl *ctrl)
                                       ^~~~~~~~~~~~~~~
   drivers/nvme/host/rdma.c: In function 'nvme_rdma_wr_error':
   drivers/nvme/host/rdma.c:1170:22: error: passing argument 1 of 'nvme_ctrl_state' from incompatible pointer type [-Werror=incompatible-pointer-types]
     if (nvme_ctrl_state(ctrl) == NVME_CTRL_LIVE)
                         ^~~~
   In file included from drivers/nvme/host/rdma.c:27:0:
   drivers/nvme/host/nvme.h:390:36: note: expected 'struct nvme_ctrl *' but argument is of type 'struct nvme_rdma_ctrl *'
    static inline enum nvme_ctrl_state nvme_ctrl_state(struct nvme_ctrl *ctrl)
                                       ^~~~~~~~~~~~~~~
   drivers/nvme/host/rdma.c: In function 'nvme_rdma_timeout':
   drivers/nvme/host/rdma.c:1953:22: error: passing argument 1 of 'nvme_ctrl_state' from incompatible pointer type [-Werror=incompatible-pointer-types]
     if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE) {
                         ^~~~
   In file included from drivers/nvme/host/rdma.c:27:0:
   drivers/nvme/host/nvme.h:390:36: note: expected 'struct nvme_ctrl *' but argument is of type 'struct nvme_rdma_ctrl *'
    static inline enum nvme_ctrl_state nvme_ctrl_state(struct nvme_ctrl *ctrl)
                                       ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/nvme_ctrl_state +987 drivers/nvme/host/rdma.c

   984	
   985	static void nvme_rdma_reconnect_or_remove(struct nvme_rdma_ctrl *ctrl)
   986	{
 > 987		enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
   988	
   989		/* If we are resetting/deleting then do nothing */
   990		if (state != NVME_CTRL_CONNECTING) {
   991			WARN_ON_ONCE(state == NVME_CTRL_NEW || state == NVME_CTRL_LIVE);
   992			return;
   993		}
   994	
   995		if (nvmf_should_reconnect(&ctrl->ctrl)) {
   996			dev_info(ctrl->ctrl.device, "Reconnecting in %d seconds...\n",
   997				ctrl->ctrl.opts->reconnect_delay);
   998			queue_delayed_work(nvme_wq, &ctrl->reconnect_work,
   999					ctrl->ctrl.opts->reconnect_delay * HZ);
  1000		} else {
  1001			nvme_delete_ctrl(&ctrl->ctrl);
  1002		}
  1003	}
  1004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
