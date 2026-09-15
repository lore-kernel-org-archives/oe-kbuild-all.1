Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BE6472096
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 20:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505593; cv=none; b=ZNKRWRNJELL+1bTWgUp8x3PJ+GsNKXB1d6i9RX7t2G0vnLUxlVOCys3O29vsg2sn6xpwrDVfmwzaZqIE0BnrGKhiXs1UHKcoDjNy4pI+bI+l6Oh+aBN2d1EsETFuGdD+8o81WjflpehNUU8ILlC+CHjTOjMa7vGtagGZ/cy18tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505593; c=relaxed/simple;
	bh=+TX0gqQLyZ0LfF4t6VJbDajH7IkZkPvgLIwAuOB6X+c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CE6hN1PCdLt51gKt5g4iWq1SSyOZzY5+KolIuL9CgR76QbROeg/76+5+aYyxLWjOg61Y5EB8RcI7QyY7bp61mOt80bvE6JyrF0uqshUpHUgjAK7t62ZFyfj48EjP25cZMSOE7nv/jPtatrZYky6cOAaKzdEA7XvF+UtkpTVpV+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoEXKt58; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoEXKt58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789505591; x=1821041591;
  h=date:from:to:cc:subject:message-id;
  bh=+TX0gqQLyZ0LfF4t6VJbDajH7IkZkPvgLIwAuOB6X+c=;
  b=BoEXKt58lmvsM7GWKVrNDvp5Y4BAcy86hFhlbXqJL70KqPSB+Vwz384m
   5/XF2TjoG6BC6BWduL+Mm/+WlPZFIIn1KVjpGzmG0BaVrCf5szRc3oGjz
   ZN62AvshotcwpRsBD246SBRAaPE4tjg8nl/BvmBtvPqgchvRSC0OYQcuj
   P5GWK+MVg7ZI7lBNf6A3oF+62Yw4JgW7vcW4EE+Q0UH/xACd2e8GL5Jqn
   uL9NdwHQoL4t419vuTU0DvnlMD6sPgzPmahHm94qP1WjrtMqaaYisigSc
   pBk+4xZSBGlqfQfXQQPUfarihIT3h4v9neqj6lcS7+HnL+0LMQVHunpS3
   Q==;
X-CSE-ConnectionGUID: F9dwBCsXTfmrqXwQUacZXw==
X-CSE-MsgGUID: rmFDR6qaSyaFjIhcaxaBag==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100480486"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100480486"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 13:53:09 -0700
X-CSE-ConnectionGUID: Gb9lMgflTWqcHyP4sxunwA==
X-CSE-MsgGUID: sbmcF34sSZaYyghq8h00eQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2026 13:53:07 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6a9J-0000000053f-0ate;
	Tue, 15 Sep 2026 20:53:05 +0000
Date: Wed, 16 Sep 2026 04:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [frank-li:imx/ele 5/7]
 drivers/firmware/imx/ele_fw_api.c:311:9: error: cleanup argument not a
 function
Message-ID: <202609160425.RUMT14Ym-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/ele
head:   211dcfe620fc1038ac5de521d170ea2390c15aea
commit: 7560ad03bbf40f5b89e210bee2dadb4be20efc1f [5/7] firmware: imx: adds miscdev
config: arc-randconfig-001-20260916 (https://download.01.org/0day-ci/archive/20260916/202609160425.RUMT14Ym-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160425.RUMT14Ym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160425.RUMT14Ym-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/firmware/imx/ele_fw_api.c: In function 'se_close_session':
>> drivers/firmware/imx/ele_fw_api.c:311:9: error: cleanup argument not a function
     struct se_api_msg *tx_msg __free(kfree) =
            ^~~~~~~~~~
>> drivers/firmware/imx/ele_fw_api.c:312:3: error: implicit declaration of function 'kzalloc'; did you mean 'xa_alloc'? [-Werror=implicit-function-declaration]
      kzalloc(ELE_SESSION_CLOSE_REQ_SZ, GFP_KERNEL);
      ^~~~~~~
      xa_alloc
>> drivers/firmware/imx/ele_fw_api.c:312:3: warning: initialization of 'struct se_api_msg *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/firmware/imx/ele_fw_api.c:313:9: error: cleanup argument not a function
     struct se_api_msg *rx_msg __free(kfree) =
            ^~~~~~~~~~
   drivers/firmware/imx/ele_fw_api.c:314:3: warning: initialization of 'struct se_api_msg *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      kzalloc(ELE_SESSION_CLOSE_RSP_SZ, GFP_KERNEL);
      ^~~~~~~
   drivers/firmware/imx/ele_fw_api.c: In function 'se_close_storage':
   drivers/firmware/imx/ele_fw_api.c:368:9: error: cleanup argument not a function
     struct se_api_msg *tx_msg __free(kfree) =
            ^~~~~~~~~~
   drivers/firmware/imx/ele_fw_api.c:369:3: warning: initialization of 'struct se_api_msg *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      kzalloc(ELE_STORAGE_CLOSE_REQ_SZ, GFP_KERNEL);
      ^~~~~~~
   drivers/firmware/imx/ele_fw_api.c:370:9: error: cleanup argument not a function
     struct se_api_msg *rx_msg __free(kfree) =
            ^~~~~~~~~~
   drivers/firmware/imx/ele_fw_api.c:371:3: warning: initialization of 'struct se_api_msg *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      kzalloc(ELE_STORAGE_CLOSE_RSP_SZ, GFP_KERNEL);
      ^~~~~~~
   cc1: some warnings being treated as errors


vim +311 drivers/firmware/imx/ele_fw_api.c

   308	
   309	int se_close_session(struct se_if_device_ctx *dev_ctx, u32 session_hdl)
   310	{
 > 311		struct se_api_msg *tx_msg __free(kfree) =
 > 312			kzalloc(ELE_SESSION_CLOSE_REQ_SZ, GFP_KERNEL);
   313		struct se_api_msg *rx_msg __free(kfree) =
   314			kzalloc(ELE_SESSION_CLOSE_RSP_SZ, GFP_KERNEL);
   315		struct se_if_priv *priv;
   316		int ret;
   317	
   318		if (!dev_ctx || !dev_ctx->priv)
   319			return -EINVAL;
   320	
   321		if (!tx_msg || !rx_msg)
   322			return -ENOMEM;
   323	
   324		priv = dev_ctx->priv;
   325	
   326		/*
   327		 * Session close is a FW-API command; pass is_base_api=false so the
   328		 * header carries fw_api_ver.
   329		 */
   330		se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
   331				    ELE_SESSION_CLOSE_REQ, ELE_SESSION_CLOSE_REQ_SZ, false);
   332	
   333		tx_msg->data[0] = session_hdl;
   334	
   335		/*
   336		 * Transmit on the caller's own context. Using dev_ctx (rather than
   337		 * hardcoding priv->priv_dev_ctx) keeps a userspace close() subject to
   338		 * the going_away check in ele_msg_send_rcv(): if unbind has begun and
   339		 * freed priv->tx_chan, the send is rejected with -ENODEV instead of
   340		 * touching the freed mailbox channel.
   341		 *
   342		 * The teardown and fw_busy-recovery paths instead reserve the messaging
   343		 * interface for their own task via se_reserve_msg_if() before calling
   344		 * this. That reservation (msg_excl_owner == current) is what makes
   345		 * ele_msg_send_rcv() let their resync closes through the going_away and
   346		 * fw_busy gates; they also pass priv_dev_ctx so the wait is the
   347		 * uninterruptible internal-context wait.
   348		 */
   349	
   350		ret = ele_msg_send_rcv(dev_ctx,
   351				       tx_msg,
   352				       ELE_SESSION_CLOSE_REQ_SZ,
   353				       rx_msg,
   354				       ELE_SESSION_CLOSE_RSP_SZ, NULL);
   355		if (ret < 0)
   356			return ret;
   357	
   358		ret = se_val_rsp_hdr_n_status(dev_ctx,
   359					      rx_msg,
   360					      ELE_SESSION_CLOSE_REQ,
   361					      ELE_SESSION_CLOSE_RSP_SZ,
   362					      priv->if_defs->fw_api_ver);
   363		return ret;
   364	}
   365	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
