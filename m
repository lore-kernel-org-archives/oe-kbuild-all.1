Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573BD7E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 02:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679452520; x=1710988520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/r5l2P/L8kDu/LnqtuRNRNjP3VXOGbxeq3EVVXCdTos=;
  b=hlMdsw3qWuJ8/u8Y0MOQpcYXbeAB6aB3GWObZcHmvD3csdijON5MMXwr
   RlyQbEo8eTOMnBJbGxcqimGWt/0py9v4HOUW75ZtNSIU0fJwCrc5P+DZ6
   DG9ZdJky7dpkwrdDoLMDCxyg+5omY2dCSiocxNLUvQAJDZjq1fCxYOuys
   uemCTkhZ88v2sYs7y2zGE9RVjVZjg5ScTMx0Zl/+hoKqJQI5jbRlV10gU
   cpbOhIjLAuhZy+Bl63pUWWd7FadWLMzwiz/mUrPMKOK36d/VATyU6NFXk
   4Wj21JE/2EzXUwo1GQW0RN5142THZRDExivpb0dxIkRepUyv7scA3PQpr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401680365"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="401680365"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 19:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750874403"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="750874403"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2023 19:35:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peoJh-000Cjm-2B;
	Wed, 22 Mar 2023 02:35:09 +0000
Date: Wed, 22 Mar 2023 10:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v7 10/20] drivers/nvme/host/tcp.c:1590:
 undefined reference to `nvme_keyring_id'
Message-ID: <202303221007.NXeybi1O-lkp@intel.com>
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
commit: 31b3d10dcf4a28f931001df8b4e539716bcbd5d3 [10/20] nvme-tcp: enable TLS handshake upcall
config: i386-randconfig-a011-20230320 (https://download.01.org/0day-ci/archive/20230322/202303221007.NXeybi1O-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=31b3d10dcf4a28f931001df8b4e539716bcbd5d3
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v7
        git checkout 31b3d10dcf4a28f931001df8b4e539716bcbd5d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221007.NXeybi1O-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/nvme/host/core.o: in function `nvme_core_exit':
   drivers/nvme/host/core.c:5453: undefined reference to `nvme_keyring_exit'
   ld: drivers/nvme/host/core.o: in function `nvme_core_init':
   drivers/nvme/host/core.c:5419: undefined reference to `nvme_keyring_init'
   ld: drivers/nvme/host/tcp.o: in function `nvme_tcp_start_tls':
>> drivers/nvme/host/tcp.c:1590: undefined reference to `nvme_keyring_id'
   ld: drivers/nvme/host/tcp.o: in function `nvme_tcp_lookup_psks':
>> drivers/nvme/host/tcp.c:1537: undefined reference to `nvme_tls_psk_lookup'


vim +1590 drivers/nvme/host/tcp.c

  1522	
  1523	/*
  1524	 * nvme_tcp_lookup_psk - Look up PSKs to use for TLS
  1525	 *
  1526	 */
  1527	static int nvme_tcp_lookup_psks(struct nvme_ctrl *nctrl,
  1528				       key_serial_t *keylist, int num_keys)
  1529	{
  1530		enum nvme_tcp_tls_cipher cipher = NVME_TCP_TLS_CIPHER_SHA384;
  1531		struct key *tls_key;
  1532		int num = 0;
  1533		bool generated = false;
  1534	
  1535		/* Check for pre-provisioned keys; retained keys first */
  1536		do {
> 1537			tls_key = nvme_tls_psk_lookup(NULL, nctrl->opts->host->nqn,
  1538						      nctrl->opts->subsysnqn,
  1539						      cipher, generated);
  1540			if (!IS_ERR(tls_key)) {
  1541				keylist[num] = tls_key->serial;
  1542				num++;
  1543				key_put(tls_key);
  1544			}
  1545			if (cipher == NVME_TCP_TLS_CIPHER_SHA384)
  1546				cipher = NVME_TCP_TLS_CIPHER_SHA256;
  1547			else {
  1548				if (generated)
  1549					cipher = NVME_TCP_TLS_CIPHER_INVALID;
  1550				else {
  1551					cipher = NVME_TCP_TLS_CIPHER_SHA384;
  1552					generated = true;
  1553				}
  1554			}
  1555		} while(cipher != NVME_TCP_TLS_CIPHER_INVALID);
  1556		return num;
  1557	}
  1558	
  1559	static void nvme_tcp_tls_done(void *data, int status, key_serial_t peerid)
  1560	{
  1561		struct nvme_tcp_queue *queue = data;
  1562		struct nvme_tcp_ctrl *ctrl = queue->ctrl;
  1563		int qid = nvme_tcp_queue_id(queue);
  1564	
  1565		dev_dbg(ctrl->ctrl.device, "queue %d: TLS handshake done, key %x, status %d\n",
  1566			qid, peerid, status);
  1567	
  1568		queue->tls_err = -status;
  1569		if (queue->tls_complete)
  1570			complete(queue->tls_complete);
  1571	}
  1572	
  1573	static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
  1574				      struct nvme_tcp_queue *queue,
  1575				      key_serial_t peerid)
  1576	{
  1577		int qid = nvme_tcp_queue_id(queue);
  1578		int ret;
  1579		struct tls_handshake_args args;
  1580		unsigned long tmo = tls_handshake_timeout * HZ;
  1581		DECLARE_COMPLETION_ONSTACK(tls_complete);
  1582	
  1583		dev_dbg(nctrl->device, "queue %d: start TLS with key %x\n",
  1584			qid, peerid);
  1585		args.ta_sock = queue->sock;
  1586		args.ta_done = nvme_tcp_tls_done;
  1587		args.ta_data = queue;
  1588		args.ta_my_peerids[0] = peerid;
  1589		args.ta_num_peerids = 1;
> 1590		args.ta_keyring = nvme_keyring_id();
  1591		args.ta_timeout_ms = tls_handshake_timeout * 2 * 1000;
  1592		queue->tls_err = -EOPNOTSUPP;
  1593		queue->tls_complete = &tls_complete;
  1594		ret = tls_client_hello_psk(&args, GFP_KERNEL);
  1595		if (ret) {
  1596			dev_dbg(nctrl->device, "queue %d: failed to start TLS: %d\n",
  1597				qid, ret);
  1598			return ret;
  1599		}
  1600		if (wait_for_completion_timeout(queue->tls_complete, tmo) == 0) {
  1601			dev_dbg(nctrl->device,
  1602				"queue %d: TLS handshake timeout\n", qid);
  1603			queue->tls_complete = NULL;
  1604			ret = -ETIMEDOUT;
  1605		} else {
  1606			dev_dbg(nctrl->device,
  1607				"queue %d: TLS handshake complete, error %d\n",
  1608				qid, queue->tls_err);
  1609			ret = queue->tls_err;
  1610		}
  1611		queue->tls_complete = NULL;
  1612		if (!ret)
  1613			set_bit(NVME_TCP_Q_TLS, &queue->flags);
  1614		return ret;
  1615	}
  1616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
