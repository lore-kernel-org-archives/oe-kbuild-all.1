Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2074E01E1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 22:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792361200; cv=none; b=ozKQ+h4MWkP3+6FEyW8F7zJFF3zU5aqNOdl/GZm6fK4YJ8WeA7w87q83axGP45deMUmEemggOmCV7vzllRwwDRZrTXqrG/HBmFj6pWuT1eedGoh5wNBFNVk7Xdd7aiN4WnwQZ4ZGkcaJJWIYn/i1Vg3/qVvupeuBmhjHt2gowWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792361200; c=relaxed/simple;
	bh=TxYl4V1Gv/pHFkWDqj/QSsF+mwfb/F0DUcydj2JEuEs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ii/w6wnPlTE+VBfyJovB3VnynD4LbL++NedwFZoN1iIXu/IpRCIHMY8paLbbZguR1ue9od7AaFEcKsH2BlTiQXKVxe14CL0YZvzBLqOBdFkxKdFCw9eabzQy+6570qeXzmqoedVxyHnBPOB0kkUQoSWFqt/Im+GmgqhMVsXNVFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a42dwJn+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a42dwJn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792361197; x=1823897197;
  h=date:from:to:cc:subject:message-id;
  bh=TxYl4V1Gv/pHFkWDqj/QSsF+mwfb/F0DUcydj2JEuEs=;
  b=a42dwJn+KSVgImqs9iaVaBS7C8XEO2b6NK5jpnm82aYgTGt37dWn2xCf
   VaO5ezaKjHlPyvPA9WoqP0qf117s1T5aZ1UCw+jCssblUCRMmZ9xuvWEw
   prhmBeY+PEcKNyM3JChE1cBBTREKK7yfYnzsohUMP1iDcyALZmykEPJMm
   yaak+Nuj4tJqodYbsVVFnmfF8oQgWjWjuOBLcxyC8ELyKFYF4coLUKasG
   To09fi2eyrJSmKg1a9UGf1BGdxrF70iU5r9W7n6PzBDhrPBCfOY6V8A+c
   YGCTY41ua+4z3sxl5ikYNKIV7HrUmEiEBzqFIZ3nKE4z3im5z7m2R47r7
   A==;
X-CSE-ConnectionGUID: yeaUZELzSP2VZg5mlvJJ/g==
X-CSE-MsgGUID: fHpnhD+STVSL6Pw/+YLUHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="934187"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="934187"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 15:06:36 -0700
X-CSE-ConnectionGUID: y6kutr9DRQ2oirZRlZuQNg==
X-CSE-MsgGUID: +TjEgQgIRaa7x/CBun17ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2374225"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2026 15:06:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIZ1U-000000005It-3Fu5;
	Sun, 18 Oct 2026 22:06:32 +0000
Date: Mon, 19 Oct 2026 00:05:42 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 336/336]
 drivers/virt/gunyah/rsc_mgr.c:636: warning: Function parameter or member
 '_rm' not described in 'gh_rm_call'
Message-ID: <202610182313.aWjW6sH0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Elliot,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   85239205a20932568f405bb06f7dc3187e755674
commit: 04ea3d3ace245fe91db8b443477be0adfbf56a5b [336/336] ANDROID: virt: gunyah: Force struct gh_rm as opaque
config: arm64-randconfig-r2202-20261018 (https://download.01.org/0day-ci/archive/20261018/202610182313.aWjW6sH0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 337446dacd2a713010f1c9856c21eb8d899b5613)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610182313.aWjW6sH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610182313.aWjW6sH0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/gunyah/rsc_mgr.c:160: warning: Function parameter or member 'adev' not described in 'gh_rm'
>> drivers/virt/gunyah/rsc_mgr.c:636: warning: Function parameter or member '_rm' not described in 'gh_rm_call'
>> drivers/virt/gunyah/rsc_mgr.c:636: warning: Excess function parameter 'rm' description in 'gh_rm_call'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


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
