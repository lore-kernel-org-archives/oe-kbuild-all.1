Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3C710789
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 22:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679436540; x=1710972540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g5qb5OG/wKcm01DkGWptKvrfwqjjN64c9rxw+k3TZbk=;
  b=G4t/7pd9tNVPkdGY6d9PLrYmFimGUKiox89k/DJT1wmEhs0fxDdExH1C
   bH3HSOuQNvHcSDw8EmHKqpg6alZZLAfc7Tz0Q08oyOMEPGAkNkty9MK0C
   eC0zkw+nQtkm3ySaprWICPHCe7lrGB8yQBdGY89H+UtZvp7QKjoljgpX2
   6xPyyK6wDP65d9AqafCohKPNNK20l4HzWiiQzPtL0edKqPEbhqqXC8bRf
   wFYDXg82Tw23Kcis/OXc341Vbr1nbUWl9BXRC86iF8x7rpsLWHbvwOz+d
   /XM42+mVaSq3v/rGNAOLyUYqJMdfH2D3bAetb7Sas48JUJOyQ3AnYoSsc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="336575529"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="336575529"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 15:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="675027434"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="675027434"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Mar 2023 15:08:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pekA3-000CTC-25;
	Tue, 21 Mar 2023 22:08:55 +0000
Date: Wed, 22 Mar 2023 06:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v7 17/20]
 drivers/nvme/target/tcp.c:1729: undefined reference to `nvme_keyring_id'
Message-ID: <202303220637.fkIobSiO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v7
head:   5c13b43fa2c503188a6d668b0dec6a22078329a2
commit: 7754017009ada8fe29201a4add622e6406ea16b0 [17/20] nvmet-tcp: enable TLS handshake upcall
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230322/202303220637.fkIobSiO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=7754017009ada8fe29201a4add622e6406ea16b0
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v7
        git checkout 7754017009ada8fe29201a4add622e6406ea16b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220637.fkIobSiO-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `nvmet_tcp_tls_handshake':
>> drivers/nvme/target/tcp.c:1729: undefined reference to `nvme_keyring_id'
   ld: vmlinux.o: in function `nvme_core_init':
   drivers/nvme/host/core.c:5419: undefined reference to `nvme_keyring_init'
   ld: vmlinux.o: in function `nvme_core_exit':
   drivers/nvme/host/core.c:5453: undefined reference to `nvme_keyring_exit'


vim +1729 drivers/nvme/target/tcp.c

  1714	
  1715	static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue)
  1716	{
  1717		int ret = -EOPNOTSUPP;
  1718		struct tls_handshake_args args;
  1719	
  1720		if (queue->state != NVMET_TCP_Q_TLS_HANDSHAKE) {
  1721			pr_warn("cannot start TLS in state %d\n", queue->state);
  1722			return -EINVAL;
  1723		}
  1724	
  1725		pr_debug("queue %d: TLS ServerHello\n", queue->idx);
  1726		args.ta_sock = queue->sock;
  1727		args.ta_done = nvmet_tcp_tls_handshake_done;
  1728		args.ta_data = queue;
> 1729		args.ta_keyring = nvme_keyring_id();
  1730		args.ta_timeout_ms = tls_handshake_timeout * 2 * 1024;
  1731	
  1732		ret = tls_server_hello_psk(&args, GFP_KERNEL);
  1733		if (ret) {
  1734			pr_err("failed to start TLS, err=%d\n", ret);
  1735		} else {
  1736			pr_debug("queue %d wakeup userspace\n", queue->idx);
  1737			nvmet_tcp_tls_data_ready(queue->sock->sk);
  1738			queue_delayed_work(nvmet_wq, &queue->tls_handshake_work,
  1739					   tls_handshake_timeout * HZ);
  1740		}
  1741		return ret;
  1742	}
  1743	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
