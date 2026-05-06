Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC1932A3C9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081296; cv=none; b=UUvsUlW0PhPlLlKsUVI+Jw/ms2Lw6Sn0WZrAK0PHo9rnwYbenLKNkiYj+JsqlCgmFefXbusp4DmmCkDt9GHDHHajYU8bwyMhV58BydkkobPv1Sb89hu4O1L0FZDfc06bvn8fj0l0fB9ImTz7HnZzuUIhC0QImGa5HmTLsKtoC14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081296; c=relaxed/simple;
	bh=zSGXBaCfjs7B69dIXh1l7gERe3BwWprQrwikY9w8C9k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ad1BrjnV1KkTRwAQAo4OjP2wyF3MvWxijC5OjSWs+c5dkz0sixEcmFv5B7YM+lxdnG1n2U9nrONLnE5fSFzxxG4LnEE8r9AUopkkw4FCTx9wyInadQdQe1KI0u7V8eN7g0VWB9u+SctGBDFMQg5IjKWsdzJWOFaooTXwXfyjlX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnDn5Jvv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnDn5Jvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778081294; x=1809617294;
  h=date:from:to:cc:subject:message-id;
  bh=zSGXBaCfjs7B69dIXh1l7gERe3BwWprQrwikY9w8C9k=;
  b=XnDn5Jvv/bNgnXkTHNQcJ9cRmLEdx3bJVgbxiZt2WlkfDcA2FWoUcGDd
   q7cr7Y0HWCuK/d6C0JxAJUkUgDa4UdSAhwVlAEwn/2kad9LRDR6ZgwZGe
   /KxI+sajqy/Kvdx04WZ6bssdXlgBOIHqdAvZa9vRgZqyMLVAtMDXAR6Oj
   rJqkKUVxSjLJL7SSrwUyRZHW71d2sLXC+OC1f/1no7Raj0fza+Pv/liGp
   UDzvOzuGyKh5F7u+gWdhdbGXx1jXHhTNA16iCnV0STNLcakffH97lSGF5
   nWOOtKddtW4VUvW3+u0ZBfCQp19Zm9k0FLjTYH0ALTJaEOe6qS8P50ejw
   A==;
X-CSE-ConnectionGUID: d9hkdrLlQqmdGJJin4XbVQ==
X-CSE-MsgGUID: QWV7IfOuRLSuU1x2XjNfIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="66546912"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="66546912"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 08:28:12 -0700
X-CSE-ConnectionGUID: NEbf98dNRJ6mib4+IhWGRA==
X-CSE-MsgGUID: FtG5Qi6oQdmOtjx7xKcArA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="266524111"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 May 2026 08:28:11 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKeAS-00000000119-0THw;
	Wed, 06 May 2026 15:28:08 +0000
Date: Wed, 06 May 2026 23:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [frank-li:for-next 5/53]
 drivers/firmware/imx/se_ctrl.c:535:40: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <202605062306.sx2OL0Ul-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git for-next
head:   2dfb59f50bc1e1600fa1be5a97a21185306f5f78
commit: 4de71839142b5f43846e3593f4eb236e1d733885 [5/53] firmware: drivers: imx: adds miscdev
config: csky-randconfig-r132-20260506 (https://download.01.org/0day-ci/archive/20260506/202605062306.sx2OL0Ul-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605062306.sx2OL0Ul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605062306.sx2OL0Ul-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/imx/se_ctrl.c:535:40: sparse: sparse: cast removes address space '__user' of expression
   drivers/firmware/imx/se_ctrl.c:762:48: sparse: sparse: cast removes address space '__user' of expression

vim +/__user +535 drivers/firmware/imx/se_ctrl.c

   511	
   512	static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
   513						    void __user *uarg)
   514	{
   515		struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
   516		struct se_if_priv *priv = dev_ctx->priv;
   517		int err = 0;
   518	
   519		if (copy_from_user(&cmd_snd_rcv_rsp_info, uarg,
   520				   sizeof(cmd_snd_rcv_rsp_info))) {
   521			dev_err(priv->dev,
   522				"%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
   523				dev_ctx->devname);
   524			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
   525			return -EFAULT;
   526		}
   527	
   528		if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ) {
   529			dev_err(priv->dev, "%s: User buffer too small(%d < %d)",
   530				dev_ctx->devname, cmd_snd_rcv_rsp_info.tx_buf_sz, SE_MU_HDR_SZ);
   531			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
   532			return -ENOSPC;
   533		}
   534	
 > 535		err = se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)cmd_snd_rcv_rsp_info.tx_buf);
   536		if (err) {
   537			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
   538			return err;
   539		}
   540	
   541		struct se_api_msg *rx_msg __free(kfree) =
   542			kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
   543		if (!rx_msg) {
   544			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
   545			return -ENOMEM;
   546		}
   547	
   548		struct se_api_msg *tx_msg __free(kfree) =
   549			memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
   550				    cmd_snd_rcv_rsp_info.tx_buf_sz);
   551		if (IS_ERR(tx_msg)) {
   552			err = PTR_ERR(tx_msg);
   553			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
   554			return err;
   555		}
   556	
   557		if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
   558			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
   559			return -EINVAL;
   560		}
   561	
   562		if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
   563		    get_load_fw_instance(priv)->is_fw_tobe_loaded) {
   564			err = se_load_firmware(priv);
   565			if (err) {
   566				dev_err(priv->dev, "Could not send msg as FW is not loaded.");
   567				se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
   568				return -EPERM;
   569			}
   570		}
   571		set_se_rcv_msg_timeout(priv, SE_RCV_MSG_LONG_TIMEOUT);
   572	
   573		err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
   574				       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
   575		if (err < 0) {
   576			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
   577			return err;
   578		}
   579	
   580		dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
   581			"message received, start transmit to user");
   582	
   583		/* We may need to copy the output data to user before
   584		 * delivering the completion message.
   585		 */
   586		err = se_dev_ctx_cpy_out_data(dev_ctx);
   587		if (err < 0) {
   588			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
   589			return err;
   590		}
   591	
   592		/* Copy data from the buffer */
   593		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
   594				     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
   595	
   596		if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
   597				 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
   598			dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
   599			err = -EFAULT;
   600		}
   601	
   602		err = se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
   603	
   604		return err;
   605	}
   606	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
