Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6075028917
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 18:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692900099; x=1724436099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jGwpeWQsLj66DjWJnPxH2AJWXC7IvXah5A9doEjI5No=;
  b=U9bMBsbQknZVPGoeXbLIFnrgK1xBja6uKsxFNl606CL0tcWNnYgwMbbH
   0Aob19kQeX8APhhwmMUPadkouAiJ5Gqn7GiHnnF7I4W+0xEH1qUhYaptH
   q3rsf7UV8LrxfGdLhm4907D7pWUXJ6ehx6RoA4RkYJlJ/Mn94CjCsU6B1
   Bu9RYMhy5lbPhOakfXYe/NQ2AN1PPO8uHcuvpqvoszo0OXwe/44O5enfB
   xn7yhPFAdq+2V3m9ywY3dLhTQpCPbWaeETFa0zik9TwbplzUgCiuwR+QQ
   uzOXcGTFiL/THhKS3lAApesFrLYCbSyMjyFpxiKQ+lpSFy4hvcO9FErYP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="378300707"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="378300707"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 11:01:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="807215356"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="807215356"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 24 Aug 2023 11:01:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZEeE-0002t6-2w;
	Thu, 24 Aug 2023 18:01:34 +0000
Date: Fri, 25 Aug 2023 02:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Sagi Grimberg <sagi@grimberg.me>
Subject: [hare-nvme:tls.v16 13/20] drivers/nvme/host/tcp.c:1588:22: warning:
 variable 'keyring' set but not used
Message-ID: <202308250115.acVHXy8q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v16
head:   f988c307b2e1f2482e0479f117b644e087894cbc
commit: 74d89f8bb73bd16d8d8be25944964974a860e956 [13/20] nvme-fabrics: parse options 'keyring' and 'tls_key'
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230825/202308250115.acVHXy8q-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250115.acVHXy8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250115.acVHXy8q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/tcp.c: In function 'nvme_tcp_start_tls':
   drivers/nvme/host/tcp.c:1599:58: error: expected ')' before ';' token
    1599 |                 keyring = key_serial(nctrl->opts->keyring;
         |                                     ~                    ^
         |                                                          )
   drivers/nvme/host/tcp.c:1625:20: error: expected ';' before '}' token
    1625 |         return ret;
         |                    ^
         |                    ;
    1626 | }
         | ~                   
>> drivers/nvme/host/tcp.c:1588:22: warning: variable 'keyring' set but not used [-Wunused-but-set-variable]
    1588 |         key_serial_t keyring = nvme_keyring_id();
         |                      ^~~~~~~
>> drivers/nvme/host/tcp.c:1587:23: warning: unused variable 'tmo' [-Wunused-variable]
    1587 |         unsigned long tmo = tls_handshake_timeout * HZ;
         |                       ^~~
>> drivers/nvme/host/tcp.c:1585:13: warning: unused variable 'ret' [-Wunused-variable]
    1585 |         int ret;
         |             ^~~
   drivers/nvme/host/tcp.c:1626:1: error: control reaches end of non-void function [-Werror=return-type]
    1626 | }
         | ^
   cc1: some warnings being treated as errors


vim +/keyring +1588 drivers/nvme/host/tcp.c

20553726487e99 Hannes Reinecke 2023-02-14  1579  
20553726487e99 Hannes Reinecke 2023-02-14  1580  static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
20553726487e99 Hannes Reinecke 2023-02-14  1581  			      struct nvme_tcp_queue *queue,
20553726487e99 Hannes Reinecke 2023-02-14  1582  			      key_serial_t pskid)
20553726487e99 Hannes Reinecke 2023-02-14  1583  {
20553726487e99 Hannes Reinecke 2023-02-14  1584  	int qid = nvme_tcp_queue_id(queue);
20553726487e99 Hannes Reinecke 2023-02-14 @1585  	int ret;
20553726487e99 Hannes Reinecke 2023-02-14  1586  	struct tls_handshake_args args;
20553726487e99 Hannes Reinecke 2023-02-14 @1587  	unsigned long tmo = tls_handshake_timeout * HZ;
20553726487e99 Hannes Reinecke 2023-02-14 @1588  	key_serial_t keyring = nvme_keyring_id();
20553726487e99 Hannes Reinecke 2023-02-14  1589  
20553726487e99 Hannes Reinecke 2023-02-14  1590  	dev_dbg(nctrl->device, "queue %d: start TLS with key %x\n",
20553726487e99 Hannes Reinecke 2023-02-14  1591  		qid, pskid);
20553726487e99 Hannes Reinecke 2023-02-14  1592  	memset(&args, 0, sizeof(args));
20553726487e99 Hannes Reinecke 2023-02-14  1593  	args.ta_sock = queue->sock;
20553726487e99 Hannes Reinecke 2023-02-14  1594  	args.ta_done = nvme_tcp_tls_done;
20553726487e99 Hannes Reinecke 2023-02-14  1595  	args.ta_data = queue;
20553726487e99 Hannes Reinecke 2023-02-14  1596  	args.ta_my_peerids[0] = pskid;
20553726487e99 Hannes Reinecke 2023-02-14  1597  	args.ta_num_peerids = 1;
74d89f8bb73bd1 Hannes Reinecke 2023-03-23  1598  	if (nctrl->opts->keyring)
74d89f8bb73bd1 Hannes Reinecke 2023-03-23  1599  		keyring = key_serial(nctrl->opts->keyring;
20553726487e99 Hannes Reinecke 2023-02-14  1600  	args.ta_keyring = keyring;
20553726487e99 Hannes Reinecke 2023-02-14  1601  	args.ta_timeout_ms = tls_handshake_timeout * 1000;
20553726487e99 Hannes Reinecke 2023-02-14  1602  	queue->tls_err = -EOPNOTSUPP;
20553726487e99 Hannes Reinecke 2023-02-14  1603  	init_completion(&queue->tls_complete);
20553726487e99 Hannes Reinecke 2023-02-14  1604  	ret = tls_client_hello_psk(&args, GFP_KERNEL);
20553726487e99 Hannes Reinecke 2023-02-14  1605  	if (ret) {
20553726487e99 Hannes Reinecke 2023-02-14  1606  		dev_err(nctrl->device, "queue %d: failed to start TLS: %d\n",
20553726487e99 Hannes Reinecke 2023-02-14  1607  			qid, ret);
20553726487e99 Hannes Reinecke 2023-02-14  1608  		return ret;
20553726487e99 Hannes Reinecke 2023-02-14  1609  	}
20553726487e99 Hannes Reinecke 2023-02-14  1610  	ret = wait_for_completion_interruptible_timeout(&queue->tls_complete, tmo);
20553726487e99 Hannes Reinecke 2023-02-14  1611  	if (ret <= 0) {
20553726487e99 Hannes Reinecke 2023-02-14  1612  		if (ret == 0)
20553726487e99 Hannes Reinecke 2023-02-14  1613  			ret = -ETIMEDOUT;
20553726487e99 Hannes Reinecke 2023-02-14  1614  
20553726487e99 Hannes Reinecke 2023-02-14  1615  		dev_err(nctrl->device,
20553726487e99 Hannes Reinecke 2023-02-14  1616  			"queue %d: TLS handshake failed, error %d\n",
20553726487e99 Hannes Reinecke 2023-02-14  1617  			qid, ret);
20553726487e99 Hannes Reinecke 2023-02-14  1618  		tls_handshake_cancel(queue->sock->sk);
20553726487e99 Hannes Reinecke 2023-02-14  1619  	} else {
20553726487e99 Hannes Reinecke 2023-02-14  1620  		dev_dbg(nctrl->device,
20553726487e99 Hannes Reinecke 2023-02-14  1621  			"queue %d: TLS handshake complete, error %d\n",
20553726487e99 Hannes Reinecke 2023-02-14  1622  			qid, queue->tls_err);
20553726487e99 Hannes Reinecke 2023-02-14  1623  		ret = queue->tls_err;
20553726487e99 Hannes Reinecke 2023-02-14  1624  	}
20553726487e99 Hannes Reinecke 2023-02-14  1625  	return ret;
20553726487e99 Hannes Reinecke 2023-02-14  1626  }
20553726487e99 Hannes Reinecke 2023-02-14  1627  #else
20553726487e99 Hannes Reinecke 2023-02-14  1628  static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
20553726487e99 Hannes Reinecke 2023-02-14  1629  			      struct nvme_tcp_queue *queue,
20553726487e99 Hannes Reinecke 2023-02-14  1630  			      key_serial_t pskid)
20553726487e99 Hannes Reinecke 2023-02-14  1631  {
20553726487e99 Hannes Reinecke 2023-02-14  1632  	return -EPROTONOSUPPORT;
20553726487e99 Hannes Reinecke 2023-02-14  1633  }
20553726487e99 Hannes Reinecke 2023-02-14  1634  #endif
20553726487e99 Hannes Reinecke 2023-02-14  1635  

:::::: The code at line 1588 was first introduced by commit
:::::: 20553726487e99408e4a971560c8528965731a6b nvme-tcp: enable TLS handshake upcall

:::::: TO: Hannes Reinecke <hare@suse.de>
:::::: CC: Hannes Reinecke <hare@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
