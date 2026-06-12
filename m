Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E46366061
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781273759; cv=none; b=RsJBSG+tj7HsOkKXgfbnWup0SOFdKzUD/aHjnhaSMGp/7mvtt+gnR7KDBr08Z6Klq5yaUBC02BGKLlO3Ld2PWvvTQG+orc/fHPR9OB80jE9UCMx+NlYoES/9eqnAE7j2G45oSc8iMXSUUOgl3QmCES1oLjUMcqXC5li5qUiiUtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781273759; c=relaxed/simple;
	bh=7kbB4nC73fiHRmCjChaE0xkJW3wZJA6BNJ33b1Cq6Jg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u/7RnRiiGNmMc0w8AcC8GMHGavj5RKdE8fN3GAnClmPCauNaFA0eMhd93rBxa85xZ080Nk9hm+Pu6Y4CSva12b0AUzPgf2VifEYt3woqwxj5RKA2wHeuJM0iFptdULmN8UD6KtYd2+BHCLV13pPRtyZ+Wy21J8BVxR3YeJwPgs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYJRW1Fy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYJRW1Fy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781273755; x=1812809755;
  h=date:from:to:cc:subject:message-id;
  bh=7kbB4nC73fiHRmCjChaE0xkJW3wZJA6BNJ33b1Cq6Jg=;
  b=RYJRW1FyvwLjMTbd6rMD2aMBzk72KpClLAlCZB68eQ+J8WEuBgIy1UYM
   pV6pfVsSTMqtnbVYbwsLVYFApnC6yvctDVXez1QBU4RDZ5/JMgJLdd7vv
   wsG2P2rdQToepcZ4DXt7WbOUDtJodozHWyFB2ZfxfNDP7njzuDCKrZh8q
   7S1mpJThVsELUYfzEQYG0xUu/BFFFIDg7hW6FKryUpSQBsWtBuTbH2KJI
   s6trtpQm4t1CsWP0mVCtyTi+m7NH8btTlI+0mv554MG89GpVwizgFMjQ1
   wlJoBp/64T3olbw253BVtwX46w69gZpCiKianOFdOf4EWdXdImV3dPEBn
   g==;
X-CSE-ConnectionGUID: alz/YSNNRQG+m6yEurjfkg==
X-CSE-MsgGUID: k3gKvo/BQnqI9WGcckTQlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107537502"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="107537502"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 07:15:49 -0700
X-CSE-ConnectionGUID: DnowN5djTNKgCaCR6ZCEhQ==
X-CSE-MsgGUID: ZHfQjdTmRX2MDKnde7fDOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="244408815"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jun 2026 07:15:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY2fg-00000000Oqv-3MNq;
	Fri, 12 Jun 2026 14:15:44 +0000
Date: Fri, 12 Jun 2026 22:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: drivers/nvme/target/tcp.c:1325:46: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202606122214.l63U4QS2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: dbbd07d0a7020b80f6a7028e561908f7b83b3d5a nvmet-tcp: Fix potential UAF when ddgst mismatch
date:   5 weeks ago
config: sh-randconfig-r123-20260612 (https://download.01.org/0day-ci/archive/20260612/202606122214.l63U4QS2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122214.l63U4QS2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dbbd07d0a702 ("nvmet-tcp: Fix potential UAF when ddgst mismatch")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606122214.l63U4QS2-lkp@intel.com/

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
