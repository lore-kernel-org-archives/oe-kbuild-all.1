Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE4A35972
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 00:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778547030; cv=none; b=JRocj5sjFNnvobijsEmDauKsvz6QtieV4Nr2xXbnIdlAQl+A+SUSV8jsMcRZAaKAoH2EgYsWpxCdF93hXQY6EDMhixx/la3S7E8XmJNc+ptEje0xVMdfNcEc/rkl3q94s/kNJl7q/3fJ1kOflmMff5B8wN0elz3UIbQ5xwK7a5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778547030; c=relaxed/simple;
	bh=JwqU7Ee39TWRwtwE6qQ2aJ/YD2wFDlDj7uj8bGIqBvg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XCW/11/r65Iw07Zl5wK8dajWnZkPhZ8BMDZhv6k9x+k9DMyiegcuDdqz+iqsZkmRlA0y9nrkv/J3c3shGYivtVg8y9kcrlEQrsBEtzbbdWD0mkspUMqoa7tdzbhcZF7DweR3Mw4ljZgS1gplSmnhHS5LUCV14TJQCYBQ4QS6MBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9j7JPAu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9j7JPAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778547028; x=1810083028;
  h=date:from:to:cc:subject:message-id;
  bh=JwqU7Ee39TWRwtwE6qQ2aJ/YD2wFDlDj7uj8bGIqBvg=;
  b=f9j7JPAus1rJBknG5afg0iElPrGYBKnCpuB+T4u1ObhJOedm56YZZd8m
   dclCM2CcbfDZXkhIq51hQlciuP1E86ipOEFCXjBmYxBC28L8ZaoDDco3/
   HC1g0ytyVaU/NsXIaEVH4cN+/J2wO1VHZkblrwuwvTeIaI+WqPcs+ktj9
   RPto5568h6s8fe5/cIf86aiKMwc8Vh3n92Pv38sPo48Eqdx9vMam3y535
   X0EWLoBB01MqcJFV0ejEbsfRVwDmJJbS1TdeVM9sRW7lbo2Osm2p2Za84
   tsTHvUnatBPycWrO19V74ooXikg5FDcs4TXlBziaElv1DTVJj1TZ/dH7K
   A==;
X-CSE-ConnectionGUID: rlRvV1uVTMSnBZBr9cuANQ==
X-CSE-MsgGUID: K5ZSm1M2RKWksAqWDWOKPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79343979"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79343979"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 17:50:28 -0700
X-CSE-ConnectionGUID: mHeXVDrrQ2S5ClTKNOxNjQ==
X-CSE-MsgGUID: Xqz5gP93SEuGcXT//38T5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242585229"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 May 2026 17:50:26 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMbKJ-000000001NF-1PZ0;
	Tue, 12 May 2026 00:50:23 +0000
Date: Tue, 12 May 2026 08:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: [linux-nvme:nvme-7.1 5/7] drivers/nvme/target/tcp.c:1325:46:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202605120806.84Oz8bWJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/nvme.git nvme-7.1
head:   37953cec775ed34e59cf9a7d7bb9b0610daa3f3e
commit: dbbd07d0a7020b80f6a7028e561908f7b83b3d5a [5/7] nvmet-tcp: Fix potential UAF when ddgst mismatch
config: sparc64-randconfig-r123-20260512 (https://download.01.org/0day-ci/archive/20260512/202605120806.84Oz8bWJ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120806.84Oz8bWJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120806.84Oz8bWJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/tcp.c:1325:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] status @@     got int @@
   drivers/nvme/target/tcp.c:1325:46: sparse:     expected restricted __le16 [usertype] status
   drivers/nvme/target/tcp.c:1325:46: sparse:     got int

vim +1325 drivers/nvme/target/tcp.c

  1288	
  1289	static int nvmet_tcp_try_recv_ddgst(struct nvmet_tcp_queue *queue)
  1290	{
  1291		struct nvmet_tcp_cmd *cmd = queue->cmd;
  1292		int ret, len;
  1293		char cbuf[CMSG_LEN(sizeof(char))] = {};
  1294		struct msghdr msg = { .msg_flags = MSG_DONTWAIT };
  1295		struct kvec iov = {
  1296			.iov_base = (void *)&cmd->recv_ddgst + queue->offset,
  1297			.iov_len = queue->left
  1298		};
  1299	
  1300		if (queue->tls_pskid) {
  1301			msg.msg_control = cbuf;
  1302			msg.msg_controllen = sizeof(cbuf);
  1303		}
  1304		len = kernel_recvmsg(queue->sock, &msg, &iov, 1,
  1305				iov.iov_len, msg.msg_flags);
  1306		if (unlikely(len < 0))
  1307			return len;
  1308		if (queue->tls_pskid) {
  1309			ret = nvmet_tcp_tls_record_ok(queue, &msg, cbuf);
  1310			if (ret < 0)
  1311				return ret;
  1312		}
  1313	
  1314		queue->offset += len;
  1315		queue->left -= len;
  1316		if (queue->left)
  1317			return -EAGAIN;
  1318	
  1319		if (queue->data_digest && cmd->exp_ddgst != cmd->recv_ddgst) {
  1320			pr_err("queue %d: cmd %d pdu (%d) data digest error: recv %#x expected %#x\n",
  1321				queue->idx, cmd->req.cmd->common.command_id,
  1322				queue->pdu.cmd.hdr.type, le32_to_cpu(cmd->recv_ddgst),
  1323				le32_to_cpu(cmd->exp_ddgst));
  1324			if (!(cmd->flags & NVMET_TCP_F_INIT_FAILED)) {
> 1325				cmd->req.cqe->status = NVME_SC_CMD_SEQ_ERROR;
  1326				nvmet_req_uninit(&cmd->req);
  1327			}
  1328			nvmet_tcp_free_cmd_buffers(cmd);
  1329			ret = -EPROTO;
  1330			goto out;
  1331		}
  1332	
  1333		if (cmd->rbytes_done == cmd->req.transfer_len)
  1334			nvmet_tcp_execute_request(cmd);
  1335	
  1336		ret = 0;
  1337	out:
  1338		nvmet_prepare_receive_pdu(queue);
  1339		return ret;
  1340	}
  1341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
