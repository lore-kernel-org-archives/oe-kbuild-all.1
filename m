Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ED2194A76
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765632947; cv=none; b=SeclmE2EH5ZByvt/SfM5Q1JLTbyxEJIjarNqMLsctWgYDKoGJ04nmXvBECI9A+bIWm2evqlmUmNCpBtHwvQuKTySp/jd03iIOoiwNwagN9aZ0eIN8nuk2gxZnw0I+s2jLLSEi7vYY9CsHK8WUIsrESCrJUHsnaf7ERQYjS6T0Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765632947; c=relaxed/simple;
	bh=Kzob/y8jbyAiEQAFwZf+lFI0+O3NkDQoPORy3e8fZK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=niwoZMPi9TFraFqMwM+B+xmpdmubTT8ypEjYNDGL98EhLb0cpeTaX4kIGlj8ET0MiiQsjWHRelTizkr3tVCMeeeRFAFHSbv4VkXTm1l/cxV+7Dcgl4AblqlPmS+Hur/3DBC9kPv5f1PZw2GK4U7HGwsN7SuaawVrRia9jGZ06F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNbYVWTQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNbYVWTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765632946; x=1797168946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kzob/y8jbyAiEQAFwZf+lFI0+O3NkDQoPORy3e8fZK8=;
  b=CNbYVWTQYc5YQiEX9U/knwG0TdRoUZHwcbbAMO5OHJgWUxsUJ1hBR6Ed
   Ir9MHCZHla5JFC7bI6R06zaNtDbsZNBudzxzHJGrYmyKOUHTMgErRJqvn
   dOFaJjtiW2DHzxqCa3v0FFiczk2ma9feBXP/42eQAbbk0mJDFKLTwzRx/
   iNPrb5U7t0cpSZlMGyk1Ed6rTjEeQoPVLkkczlx46AhkO/96cyDv7E11t
   Uy6QhvbYc7c00K0WtcboXm2jnTacOGgVG7wQAHj7ZB5+QTXzckub281Gf
   344NyxqnzBS33Vn9wMrzCDuoCK62ZsCsuVkfotFOEV+Xs/iAaIFkQz37F
   w==;
X-CSE-ConnectionGUID: 6iIAtloHTbqYD7aQSu8rrA==
X-CSE-MsgGUID: Q+DZIN85SsC55fSpg0Axtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71467485"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71467485"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:35:45 -0800
X-CSE-ConnectionGUID: pd0BHDO/SiyhIqGesFgU5Q==
X-CSE-MsgGUID: S3YoqPZvS3eg8hz+mam/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197211260"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 05:35:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUPmf-000000007gR-1zcs;
	Sat, 13 Dec 2025 13:35:41 +0000
Date: Sat, 13 Dec 2025 21:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 42/42]
 drivers/virt/gunyah/rsc_mgr.c:636: warning: Function parameter or member
 '_rm' not described in 'gh_rm_call'
Message-ID: <202512132129.BWg8DfMg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Elliot,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: 04ea3d3ace245fe91db8b443477be0adfbf56a5b [42/42] ANDROID: virt: gunyah: Force struct gh_rm as opaque
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512132129.BWg8DfMg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132129.BWg8DfMg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132129.BWg8DfMg-lkp@intel.com/

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
