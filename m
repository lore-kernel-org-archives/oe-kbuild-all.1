Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C5F3207
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 06:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692079422; x=1723615422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SOBt2Ldue77VvPNnQkKAA76F6qI6vQDKgfMt3W4u5pM=;
  b=XT4VaN0lqoBEV6Stgomtc4q1wwfMszwWh1RMn19ZR3AoXUeD5ZvTxoG6
   d0RW9iLdCjnuVWx2tLiGSg+7Ka+ZRFPfTixgO18dUrp8xnPPIFyoUHq3Z
   P3gx/9EBBnbS0JpnyYm+35rxPzhxELyNlh1OE1Ro1bqiGNvAMAuwqYhZf
   TsdgEYQrYyNnoljoI1m/Y4F+TKwnmTN+L7iFbFdjCve1D6ha+GFEdJRsr
   8rNhOgaC6kNItCc8Fow0L3ZxOxAu6O+P1vLNMAMCSb1JSc2eH4re5NQF3
   Og+Qo66EpIwyZTS45jI2WP8AOu6YQ8jfOIIvkFq3HZlf1cHkmb5XCijAm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="374980272"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="374980272"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 23:03:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823728117"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="823728117"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2023 23:03:35 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVn9S-0000hd-2N;
	Tue, 15 Aug 2023 06:03:34 +0000
Date: Tue, 15 Aug 2023 14:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:tls.v13 19/19] drivers/nvme/target/tcp.c:1199:16: sparse:
 sparse: restricted __le32 degrades to integer
Message-ID: <202308151354.oakOtuj2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v13
head:   ce525e34ae9d3f5ed12f23caea57c0aa2e8359ee
commit: ce525e34ae9d3f5ed12f23caea57c0aa2e8359ee [19/19] nvmet-tcp: peek icreq before starting TLS
config: i386-randconfig-i061-20230815 (https://download.01.org/0day-ci/archive/20230815/202308151354.oakOtuj2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151354.oakOtuj2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151354.oakOtuj2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/tcp.c:1199:16: sparse: sparse: restricted __le32 degrades to integer

vim +1199 drivers/nvme/target/tcp.c

  1158	
  1159	static int nvmet_tcp_try_peek_pdu(struct nvmet_tcp_queue *queue)
  1160	{
  1161		struct nvme_tcp_hdr *hdr = &queue->pdu.cmd.hdr;
  1162		int len, ret;
  1163		struct kvec iov = {
  1164			.iov_base = (u8 *)&queue->pdu + queue->offset,
  1165			.iov_len = sizeof(struct nvme_tcp_hdr),
  1166		};
  1167		char cbuf[CMSG_LEN(sizeof(char))] = {};
  1168		struct msghdr msg = {
  1169			.msg_control = cbuf,
  1170			.msg_controllen = sizeof(cbuf),
  1171			.msg_flags = MSG_PEEK,
  1172		};
  1173	
  1174		if (nvmet_port_secure_channel_required(queue->port->nport))
  1175			return 0;
  1176	
  1177		len = kernel_recvmsg(queue->sock, &msg, &iov, 1,
  1178				iov.iov_len, msg.msg_flags);
  1179		if (unlikely(len < 0)) {
  1180			pr_debug("queue %d: peek error %d\n",
  1181				 queue->idx, len);
  1182			return len;
  1183		}
  1184	
  1185		ret = nvmet_tcp_tls_record_ok(queue, &msg, cbuf);
  1186		if (ret < 0)
  1187			return ret;
  1188	
  1189		if (len < sizeof(struct nvme_tcp_hdr)) {
  1190			pr_debug("queue %d: short read, %d bytes missing\n",
  1191				 queue->idx, (int)iov.iov_len - len);
  1192			return -EAGAIN;
  1193		}
  1194		pr_debug("queue %d: hdr type %d hlen %d plen %d size %d\n",
  1195			 queue->idx, hdr->type, hdr->hlen, hdr->plen,
  1196			 (int)sizeof(struct nvme_tcp_icreq_pdu));
  1197		if (hdr->type == nvme_tcp_icreq &&
  1198		    hdr->hlen == sizeof(struct nvme_tcp_icreq_pdu) &&
> 1199		    hdr->plen == sizeof(struct nvme_tcp_icreq_pdu)) {
  1200			pr_debug("queue %d: icreq detected\n",
  1201				 queue->idx);
  1202			return len;
  1203		}
  1204		return 0;
  1205	}
  1206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
