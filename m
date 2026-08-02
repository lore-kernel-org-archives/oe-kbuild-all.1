Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF54C18AE3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Aug 2026 00:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785631529; cv=none; b=QjKHnrrcQ6TbZsW6DllXsh2zCz/wQ0/pu6ImAg+MFx9mjcmlWZlDN1BBW4qdUPQAmtXbVKPBXkPH7mCqWz1xfs/5zelTRdD4SgG2B4vkQKhsof+/TG6UFsjucYwHGlpv2mBDInX+zKzYVw9wYJ/rdR+jXd015M8JvhIDr0aP4ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785631529; c=relaxed/simple;
	bh=6bYKGGFCkDDxVKsDs9IuJcZsAbbUssAXFxMJdM6XwXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ihk69r3OJXwOClTMYbX49VjT7Kvn913nUIDry1UvPD0o1jra9Ex4UbN3pDRnVmlpWETegCU9FgGmSmNTCg2mkyYjDDJiywT72R54uTN+kdF9HoZTwSr7Gb0x/Esl0NgxTxfn/IlXMmbIqDJRmNclAaJfHkCG1ExLjkDZeBmcvH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjEImViM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjEImViM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785631527; x=1817167527;
  h=date:from:to:cc:subject:message-id;
  bh=6bYKGGFCkDDxVKsDs9IuJcZsAbbUssAXFxMJdM6XwXg=;
  b=cjEImViMiW0WlFoUr82EQGcgGnJSxYX03mWRtADEXVlJTqOwOtu3/RGb
   oIHhrp3B5ts47cEONYPS1WqwmwEpMHtpbmVhnS5xesuHFO3ATH+uwDBfS
   PZ6I0Ez/xiq0q/lGMC8qXQknWiODTtxVB8zSUZDSQde9e5QrPxw/FSY5f
   XweDCNHd8y9GSdPNwJgBzer7D09X+V3EL8oQuP/uoRld81hk7+JHVLkWA
   YBQP1b0bmvZm6hI1mVBk19T4XNdlHRkBch5fOvJFNtQnu0qCUhqCvJJSX
   9ss550u38MKNp16fCD+EvEvmHyrlYH/QelcLcCvn8Z1MMbuj+GfGhZVYc
   w==;
X-CSE-ConnectionGUID: 19FE+OZ6RPW2REygPJbG+A==
X-CSE-MsgGUID: oM8miOi5TJ2JkOkaBHYMzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86297938"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="86297938"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 17:45:26 -0700
X-CSE-ConnectionGUID: ivI/+2dASB+vIftjuDCLxQ==
X-CSE-MsgGUID: cC0Rbd6mSseE4SD5xNNp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="260323586"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Aug 2026 17:45:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqKKQ-000000004AD-3gJY;
	Sun, 02 Aug 2026 00:45:22 +0000
Date: Sun, 02 Aug 2026 08:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4988/11507]
 drivers/net/wireless/nxp/nxpwifi/uap_txrx.c:249
 nxpwifi_handle_uap_rx_forward() warn: inconsistent indenting
Message-ID: <202608020855.QwN5n7i5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   415606a7be939835db9b0d6b711887586646346d
commit: 73b01e57ed3e3d6102c0cbcb21f62086c5429437 [4988/11507] wifi: nxp: add nxpwifi driver for IW61x
config: openrisc-randconfig-r071-20260802 (https://download.01.org/0day-ci/archive/20260802/202608020855.QwN5n7i5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020855.QwN5n7i5-lkp@intel.com/

smatch warnings:
drivers/net/wireless/nxp/nxpwifi/uap_txrx.c:249 nxpwifi_handle_uap_rx_forward() warn: inconsistent indenting
drivers/net/wireless/nxp/nxpwifi/11n.c:454 nxpwifi_11n_delete_tx_ba_stream_tbl_entry() error: we previously assumed 'tbl' could be null (see line 454)
drivers/net/wireless/nxp/nxpwifi/11n.c:705 nxpwifi_del_tx_ba_stream_tbl_by_ra() error: dereferencing freed memory 'tbl' (line 707)
drivers/net/wireless/nxp/nxpwifi/main.h:1185 nxpwifi_get_unused_bss_num() warn: signedness bug returning '(-2)'
drivers/net/wireless/nxp/nxpwifi/util.c:802 nxpwifi_recv_packet_to_monif() warn: always true condition '(ext.timestamp.position <= 15) => (0-15 <= 15)'
drivers/net/wireless/nxp/nxpwifi/sdio.c:1350 nxpwifi_process_int_status() warn: missing unwind goto?
drivers/net/wireless/nxp/nxpwifi/main.c:207 nxpwifi_drain_tx() warn: inconsistent indenting
drivers/net/wireless/nxp/nxpwifi/11ax.c:422 nxpwifi_is_11ax_twt_supported() error: we previously assumed 'bss_desc' could be null (see line 416)

vim +249 drivers/net/wireless/nxp/nxpwifi/uap_txrx.c

   217	
   218	/* AP fwd: mcast/bcast -> up + bridge; unicast -> bridge if RA assoc, else up. */
   219	int nxpwifi_handle_uap_rx_forward(struct nxpwifi_private *priv,
   220					  struct sk_buff *skb)
   221	{
   222		struct nxpwifi_adapter *adapter = priv->adapter;
   223		struct uap_rxpd *uap_rx_pd;
   224		struct rx_packet_hdr *rx_pkt_hdr;
   225		u8 ra[ETH_ALEN];
   226		struct sk_buff *skb_uap;
   227		struct nxpwifi_sta_node *node;
   228	
   229		uap_rx_pd = (struct uap_rxpd *)(skb->data);
   230		rx_pkt_hdr = (void *)uap_rx_pd + le16_to_cpu(uap_rx_pd->rx_pkt_offset);
   231	
   232		/* don't do packet forwarding in disconnected state */
   233		if (!priv->media_connected) {
   234			nxpwifi_dbg(adapter, ERROR,
   235				    "drop packet in disconnected state.\n");
   236			dev_kfree_skb_any(skb);
   237			return 0;
   238		}
   239	
   240		memcpy(ra, rx_pkt_hdr->eth803_hdr.h_dest, ETH_ALEN);
   241	
   242		if (is_multicast_ether_addr(ra)) {
   243			skb_uap = skb_copy(skb, GFP_ATOMIC);
   244			if (likely(skb_uap)) {
   245				nxpwifi_uap_queue_bridged_pkt(priv, skb_uap);
   246			} else {
   247				nxpwifi_dbg(adapter, ERROR,
   248					    "failed to copy skb for uAP\n");
 > 249					    priv->stats.rx_dropped++;
   250					    dev_kfree_skb_any(skb);
   251				return -ENOMEM;
   252			}
   253		} else {
   254			node = nxpwifi_get_sta_entry_rcu(priv, ra);
   255			if (node) {
   256				/* Requeue Intra-BSS packet */
   257				nxpwifi_uap_queue_bridged_pkt(priv, skb);
   258				return 0;
   259			}
   260		}
   261	
   262		/* Forward unicat/Inter-BSS packets to kernel. */
   263		return nxpwifi_process_rx_packet(priv, skb);
   264	}
   265	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
