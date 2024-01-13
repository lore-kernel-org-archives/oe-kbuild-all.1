Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D9CF4F5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 05:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m7bvMoNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705122989; x=1736658989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L9kXqk8hmGu5ySjzQE9i54a+aP4Xxk9AnDR2cE5478U=;
  b=m7bvMoNbsxLnInFS0VEW8F4V6k384VCMqqlNL9Y28svAZ98qL7IPC5vB
   4PzdETh/cTXOiD+b0ffiL2MCwiO4quG7AT4dE0HYKOjibg0kBqRnr/gUQ
   0LQf3hGkAsGhDzK1b8kVAIcVgjBgyVwG96UvlsjCoNNtp+9/nFinGB9fG
   8VQ72t5Qdkss3YTJ7zh51OrkiUHGj37joEohuqoaio0UbrJRwDq9ZmTee
   EhEpBm4I80k5RUIzD+A4NHxGhWLdcGMJGTDZnBTcJ3hB3FPVXG5nGVz+I
   WrMQ4dDhMfiJUzcbzdOcWoTC/rQOfUW0SO5ISZRvfHeef64vfJ18+iivG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="398219480"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="398219480"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 21:16:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="906517261"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="906517261"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Jan 2024 21:16:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOWNa-000A7M-2n;
	Sat, 13 Jan 2024 05:16:23 +0000
Date: Sat, 13 Jan 2024 13:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14484/21544] net/qrtr/qrtr.c:206:9:
 warning: ignoring return value of 'skb_put_padto' declared with attribute
 'warn_unused_result'
Message-ID: <202401131353.4e6VfeqZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: c540646958cc63a5e800b9e936fab6fb93138a08 [14484/21544] net: add __must_check to skb_put_padto()
config: arm64-randconfig-004-20240112 (https://download.01.org/0day-ci/archive/20240113/202401131353.4e6VfeqZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131353.4e6VfeqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131353.4e6VfeqZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/qrtr/qrtr.c: In function 'qrtr_node_enqueue':
>> net/qrtr/qrtr.c:206:9: warning: ignoring return value of 'skb_put_padto' declared with attribute 'warn_unused_result' [-Wunused-result]
     206 |         skb_put_padto(skb, ALIGN(len, 4));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +206 net/qrtr/qrtr.c

bdabad3e363d82 Courtney Cavin         2016-05-06  180  
bdabad3e363d82 Courtney Cavin         2016-05-06  181  /* Pass an outgoing packet socket buffer to the endpoint driver. */
e7044482c8ac50 Bjorn Andersson        2017-10-10  182  static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
e7044482c8ac50 Bjorn Andersson        2017-10-10  183  			     int type, struct sockaddr_qrtr *from,
e7044482c8ac50 Bjorn Andersson        2017-10-10  184  			     struct sockaddr_qrtr *to)
bdabad3e363d82 Courtney Cavin         2016-05-06  185  {
194ccc88297ae7 Bjorn Andersson        2017-10-10  186  	struct qrtr_hdr_v1 *hdr;
e7044482c8ac50 Bjorn Andersson        2017-10-10  187  	size_t len = skb->len;
bdabad3e363d82 Courtney Cavin         2016-05-06  188  	int rc = -ENODEV;
bdabad3e363d82 Courtney Cavin         2016-05-06  189  
194ccc88297ae7 Bjorn Andersson        2017-10-10  190  	hdr = skb_push(skb, sizeof(*hdr));
194ccc88297ae7 Bjorn Andersson        2017-10-10  191  	hdr->version = cpu_to_le32(QRTR_PROTO_VER_1);
e7044482c8ac50 Bjorn Andersson        2017-10-10  192  	hdr->type = cpu_to_le32(type);
e7044482c8ac50 Bjorn Andersson        2017-10-10  193  	hdr->src_node_id = cpu_to_le32(from->sq_node);
e7044482c8ac50 Bjorn Andersson        2017-10-10  194  	hdr->src_port_id = cpu_to_le32(from->sq_port);
d27e77a3de2866 Arun Kumar Neelakantam 2018-07-04  195  	if (to->sq_port == QRTR_PORT_CTRL) {
d27e77a3de2866 Arun Kumar Neelakantam 2018-07-04  196  		hdr->dst_node_id = cpu_to_le32(node->nid);
d27e77a3de2866 Arun Kumar Neelakantam 2018-07-04  197  		hdr->dst_port_id = cpu_to_le32(QRTR_NODE_BCAST);
d27e77a3de2866 Arun Kumar Neelakantam 2018-07-04  198  	} else {
e7044482c8ac50 Bjorn Andersson        2017-10-10  199  		hdr->dst_node_id = cpu_to_le32(to->sq_node);
e7044482c8ac50 Bjorn Andersson        2017-10-10  200  		hdr->dst_port_id = cpu_to_le32(to->sq_port);
d27e77a3de2866 Arun Kumar Neelakantam 2018-07-04  201  	}
e7044482c8ac50 Bjorn Andersson        2017-10-10  202  
e7044482c8ac50 Bjorn Andersson        2017-10-10  203  	hdr->size = cpu_to_le32(len);
e7044482c8ac50 Bjorn Andersson        2017-10-10  204  	hdr->confirm_rx = 0;
e7044482c8ac50 Bjorn Andersson        2017-10-10  205  
e7044482c8ac50 Bjorn Andersson        2017-10-10 @206  	skb_put_padto(skb, ALIGN(len, 4));
e7044482c8ac50 Bjorn Andersson        2017-10-10  207  
bdabad3e363d82 Courtney Cavin         2016-05-06  208  	mutex_lock(&node->ep_lock);
bdabad3e363d82 Courtney Cavin         2016-05-06  209  	if (node->ep)
bdabad3e363d82 Courtney Cavin         2016-05-06  210  		rc = node->ep->xmit(node->ep, skb);
bdabad3e363d82 Courtney Cavin         2016-05-06  211  	else
bdabad3e363d82 Courtney Cavin         2016-05-06  212  		kfree_skb(skb);
bdabad3e363d82 Courtney Cavin         2016-05-06  213  	mutex_unlock(&node->ep_lock);
bdabad3e363d82 Courtney Cavin         2016-05-06  214  
bdabad3e363d82 Courtney Cavin         2016-05-06  215  	return rc;
bdabad3e363d82 Courtney Cavin         2016-05-06  216  }
bdabad3e363d82 Courtney Cavin         2016-05-06  217  

:::::: The code at line 206 was first introduced by commit
:::::: e7044482c8ac5081f4775063995647787d5082a4 net: qrtr: Pass source and destination to enqueue functions

:::::: TO: Bjorn Andersson <bjorn.andersson@linaro.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
