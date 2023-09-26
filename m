Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A2526E34
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695735913; x=1727271913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rRb5GdRF22+cBAPnkofiQcCHDopO50kDi7q6BguLTFY=;
  b=JEhkE7mugnChfxbfLFLoHHZ1ItVDBNgW6lxid+eyLpkx0aahhLyfvrwi
   0nktfokRbS9J+YiWMzd4HlyG2fkaHzsaosUqM+mMZhHkRsRd91z1y3Gn1
   LIeIIFTpdXxJMLzjawto/8kYE/9FWXqoKXtakG4wGfFDdU6iL8OU1Hvnx
   7t9OyVYApmAwXQ6Wd3nv5lPTuC4/GsjonK7njDvxhZBT9ZRK4wimwKS+l
   tKSCNHb26NFytUTEmbFyaiW4SN1tKrwoq+S8fynZ0FGiYFlWE52l0cNZX
   F1BQWeRDxTLmRA5pqGH00sQDLawknUfJZrLJOlOVoeoGoOH/Q71/GRtMV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="371900000"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="371900000"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 06:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864408688"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="864408688"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2023 06:45:10 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ql8NA-0002rb-05;
	Tue, 26 Sep 2023 13:45:08 +0000
Date: Tue, 26 Sep 2023 21:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 9/12]
 drivers/virt/gunyah/rsc_mgr.c:636: warning: Function parameter or member
 '_rm' not described in 'gh_rm_call'
Message-ID: <202309262111.6HMz2y7Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b548c046c7de4c427ac5a0d5008a995d5e304f9b
commit: 04ea3d3ace245fe91db8b443477be0adfbf56a5b [9/12] ANDROID: virt: gunyah: Force struct gh_rm as opaque
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230926/202309262111.6HMz2y7Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309262111.6HMz2y7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309262111.6HMz2y7Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/gunyah/rsc_mgr.c:160: warning: Function parameter or member 'adev' not described in 'gh_rm'
>> drivers/virt/gunyah/rsc_mgr.c:636: warning: Function parameter or member '_rm' not described in 'gh_rm_call'
>> drivers/virt/gunyah/rsc_mgr.c:636: warning: Excess function parameter 'rm' description in 'gh_rm_call'


vim +636 drivers/virt/gunyah/rsc_mgr.c

d5e8df2cc4a170 Elliot Berman           2022-08-10  613  
d5e8df2cc4a170 Elliot Berman           2022-08-10  614  /**
d5e8df2cc4a170 Elliot Berman           2022-08-10  615   * gh_rm_call: Achieve request-response type communication with RPC
d5e8df2cc4a170 Elliot Berman           2022-08-10  616   * @rm: Pointer to Gunyah resource manager internal data
d5e8df2cc4a170 Elliot Berman           2022-08-10  617   * @message_id: The RM RPC message-id
fea63fe1f113e3 Elliot Berman           2023-04-14  618   * @req_buf: Request buffer that contains the payload
d5e8df2cc4a170 Elliot Berman           2022-08-10  619   * @req_buf_size: Total size of the payload
d5e8df2cc4a170 Elliot Berman           2022-08-10  620   * @resp_buf: Pointer to a response buffer
d5e8df2cc4a170 Elliot Berman           2022-08-10  621   * @resp_buf_size: Size of the response buffer
d5e8df2cc4a170 Elliot Berman           2022-08-10  622   *
fea63fe1f113e3 Elliot Berman           2023-04-14  623   * Make a request to the Resource Manager and wait for reply back. For a successful
d5e8df2cc4a170 Elliot Berman           2022-08-10  624   * response, the function returns the payload. The size of the payload is set in
fea63fe1f113e3 Elliot Berman           2023-04-14  625   * resp_buf_size. The resp_buf must be freed by the caller when 0 is returned
d5e8df2cc4a170 Elliot Berman           2022-08-10  626   * and resp_buf_size != 0.
d5e8df2cc4a170 Elliot Berman           2022-08-10  627   *
fea63fe1f113e3 Elliot Berman           2023-04-14  628   * req_buf should be not NULL for req_buf_size >0. If req_buf_size == 0,
fea63fe1f113e3 Elliot Berman           2023-04-14  629   * req_buf *can* be NULL and no additional payload is sent.
d5e8df2cc4a170 Elliot Berman           2022-08-10  630   *
d5e8df2cc4a170 Elliot Berman           2022-08-10  631   * Context: Process context. Will sleep waiting for reply.
d5e8df2cc4a170 Elliot Berman           2022-08-10  632   * Return: 0 on success. <0 if error.
d5e8df2cc4a170 Elliot Berman           2022-08-10  633   */
04ea3d3ace245f Elliot Berman           2023-05-13  634  int gh_rm_call(void *_rm, u32 message_id, void *req_buf, size_t req_buf_size,
d5e8df2cc4a170 Elliot Berman           2022-08-10  635  		void **resp_buf, size_t *resp_buf_size)
d5e8df2cc4a170 Elliot Berman           2022-08-10 @636  {
04ea3d3ace245f Elliot Berman           2023-05-13  637  	struct gh_rm *rm = _rm;
d5e8df2cc4a170 Elliot Berman           2022-08-10  638  	struct gh_rm_connection *connection;
d5e8df2cc4a170 Elliot Berman           2022-08-10  639  	u32 seq_id;
d5e8df2cc4a170 Elliot Berman           2022-08-10  640  	int ret;
d5e8df2cc4a170 Elliot Berman           2022-08-10  641  
d5e8df2cc4a170 Elliot Berman           2022-08-10  642  	/* message_id 0 is reserved. req_buf_size implies req_buf is not NULL */
fea63fe1f113e3 Elliot Berman           2023-04-14  643  	if (!rm || !message_id || (!req_buf && req_buf_size))
d5e8df2cc4a170 Elliot Berman           2022-08-10  644  		return -EINVAL;
d5e8df2cc4a170 Elliot Berman           2022-08-10  645  
d5e8df2cc4a170 Elliot Berman           2022-08-10  646  
d5e8df2cc4a170 Elliot Berman           2022-08-10  647  	connection = kzalloc(sizeof(*connection), GFP_KERNEL);
d5e8df2cc4a170 Elliot Berman           2022-08-10  648  	if (!connection)
d5e8df2cc4a170 Elliot Berman           2022-08-10  649  		return -ENOMEM;
d5e8df2cc4a170 Elliot Berman           2022-08-10  650  
d5e8df2cc4a170 Elliot Berman           2022-08-10  651  	connection->type = RM_RPC_TYPE_REPLY;
d5e8df2cc4a170 Elliot Berman           2022-08-10  652  	connection->msg_id = cpu_to_le32(message_id);
d5e8df2cc4a170 Elliot Berman           2022-08-10  653  
d5e8df2cc4a170 Elliot Berman           2022-08-10  654  	init_completion(&connection->reply.seq_done);
d5e8df2cc4a170 Elliot Berman           2022-08-10  655  
d5e8df2cc4a170 Elliot Berman           2022-08-10  656  	/* Allocate a new seq number for this connection */
d5e8df2cc4a170 Elliot Berman           2022-08-10  657  	ret = xa_alloc_cyclic(&rm->call_xarray, &seq_id, connection, xa_limit_16b, &rm->next_seq,
d5e8df2cc4a170 Elliot Berman           2022-08-10  658  				GFP_KERNEL);
d5e8df2cc4a170 Elliot Berman           2022-08-10  659  	if (ret < 0)
d5e8df2cc4a170 Elliot Berman           2022-08-10  660  		goto free;
d5e8df2cc4a170 Elliot Berman           2022-08-10  661  	connection->reply.seq = lower_16_bits(seq_id);
d5e8df2cc4a170 Elliot Berman           2022-08-10  662  
d5e8df2cc4a170 Elliot Berman           2022-08-10  663  	/* Send the request to the Resource Manager */
fea63fe1f113e3 Elliot Berman           2023-04-14  664  	ret = gh_rm_send_request(rm, message_id, req_buf, req_buf_size, connection);
d5e8df2cc4a170 Elliot Berman           2022-08-10  665  	if (ret < 0)
d5e8df2cc4a170 Elliot Berman           2022-08-10  666  		goto out;
d5e8df2cc4a170 Elliot Berman           2022-08-10  667  
d5e8df2cc4a170 Elliot Berman           2022-08-10  668  	/* Wait for response */
d5e8df2cc4a170 Elliot Berman           2022-08-10  669  	ret = wait_for_completion_interruptible(&connection->reply.seq_done);
d5e8df2cc4a170 Elliot Berman           2022-08-10  670  	if (ret)
d5e8df2cc4a170 Elliot Berman           2022-08-10  671  		goto out;
d5e8df2cc4a170 Elliot Berman           2022-08-10  672  
d5e8df2cc4a170 Elliot Berman           2022-08-10  673  	/* Check for internal (kernel) error waiting for the response */
d5e8df2cc4a170 Elliot Berman           2022-08-10  674  	if (connection->reply.ret) {
d5e8df2cc4a170 Elliot Berman           2022-08-10  675  		ret = connection->reply.ret;
d5e8df2cc4a170 Elliot Berman           2022-08-10  676  		if (ret != -ENOMEM)
d5e8df2cc4a170 Elliot Berman           2022-08-10  677  			kfree(connection->payload);
d5e8df2cc4a170 Elliot Berman           2022-08-10  678  		goto out;
d5e8df2cc4a170 Elliot Berman           2022-08-10  679  	}
d5e8df2cc4a170 Elliot Berman           2022-08-10  680  
d5e8df2cc4a170 Elliot Berman           2022-08-10  681  	/* Got a response, did resource manager give us an error? */
d5e8df2cc4a170 Elliot Berman           2022-08-10  682  	if (connection->reply.rm_error != GH_RM_ERROR_OK) {
d5e8df2cc4a170 Elliot Berman           2022-08-10  683  		dev_warn(rm->dev, "RM rejected message %08x. Error: %d\n", message_id,
d5e8df2cc4a170 Elliot Berman           2022-08-10  684  			connection->reply.rm_error);
d5e8df2cc4a170 Elliot Berman           2022-08-10  685  		dump_stack();
d5e8df2cc4a170 Elliot Berman           2022-08-10  686  		ret = gh_rm_remap_error(connection->reply.rm_error);
d5e8df2cc4a170 Elliot Berman           2022-08-10  687  		kfree(connection->payload);
d5e8df2cc4a170 Elliot Berman           2022-08-10  688  		goto out;
d5e8df2cc4a170 Elliot Berman           2022-08-10  689  	}
d5e8df2cc4a170 Elliot Berman           2022-08-10  690  
d5e8df2cc4a170 Elliot Berman           2022-08-10  691  	/* Everything looks good, return the payload */
d5e8df2cc4a170 Elliot Berman           2022-08-10  692  	if (resp_buf_size)
d5e8df2cc4a170 Elliot Berman           2022-08-10  693  		*resp_buf_size = connection->size;
d5e8df2cc4a170 Elliot Berman           2022-08-10  694  	if (connection->size && resp_buf)
d5e8df2cc4a170 Elliot Berman           2022-08-10  695  		*resp_buf = connection->payload;
d5e8df2cc4a170 Elliot Berman           2022-08-10  696  	else {
d5e8df2cc4a170 Elliot Berman           2022-08-10  697  		/* kfree in case RM sent us multiple fragments but never any data in
d5e8df2cc4a170 Elliot Berman           2022-08-10  698  		 * those fragments. We would've allocated memory for it, but connection->size == 0
d5e8df2cc4a170 Elliot Berman           2022-08-10  699  		 */
d5e8df2cc4a170 Elliot Berman           2022-08-10  700  		kfree(connection->payload);
d5e8df2cc4a170 Elliot Berman           2022-08-10  701  	}
d5e8df2cc4a170 Elliot Berman           2022-08-10  702  
d5e8df2cc4a170 Elliot Berman           2022-08-10  703  out:
d5e8df2cc4a170 Elliot Berman           2022-08-10  704  	xa_erase(&rm->call_xarray, connection->reply.seq);
d5e8df2cc4a170 Elliot Berman           2022-08-10  705  free:
d5e8df2cc4a170 Elliot Berman           2022-08-10  706  	kfree(connection);
d5e8df2cc4a170 Elliot Berman           2022-08-10  707  	return ret;
d5e8df2cc4a170 Elliot Berman           2022-08-10  708  }
1dce9d7d4deea1 Prakruthi Deepak Heragu 2023-02-27  709  EXPORT_SYMBOL_GPL(gh_rm_call);
d5e8df2cc4a170 Elliot Berman           2022-08-10  710  
d5e8df2cc4a170 Elliot Berman           2022-08-10  711  

:::::: The code at line 636 was first introduced by commit
:::::: d5e8df2cc4a17063dcebc67a939356ad49a665bd FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core

:::::: TO: Elliot Berman <quic_eberman@quicinc.com>
:::::: CC: Aleksei Vetrov <vvvvvv@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
