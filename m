Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0608331A66
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708261261; cv=none; b=jlFtbjMYNzP+Nvdo+DRJIQIzKLTmj40nIrB7BjwnQ/b/UMSIqsjnX/7gW5Apfje3Apk7i846emAL5eZBIT6StdqK4BO6JHoqFtlIryfShqm7y+u6i6gxxMFNW+raJXfWmgpqOnSNAIpcgLhOiVQ54EW/TRQDdUrdiZulAX6woxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708261261; c=relaxed/simple;
	bh=DcHNN+AuFBiEfX/xEyBnl5ukMBIHy6kUijjTyjVynYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sa5/i7DDQca3WGAvabk3zsiEtNg2SbaJ08ariEZgqwk6XrhCrGGC5hc/QUA09Wjpi8ug9kbujLr96XP22swLun9MDn/iYz0nrrhBLP+915fWaXbTqh0SHL6Vh/MclpuuWodHB8D7Jys8lv2PHhb3i9sPt5l0lYe1I1PggtkU7WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zg+9IxZn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zg+9IxZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708261259; x=1739797259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DcHNN+AuFBiEfX/xEyBnl5ukMBIHy6kUijjTyjVynYo=;
  b=Zg+9IxZnp4nsEyTgbcOIDIlPwI+8PJdAhMHSYoDiWo+nYy9Dwi+eFfDB
   vHE9IUCMcpmHTbmLekkM50upv9B7/rzj/cH8ZyR5wIGLfmY8C4koUtqFF
   J6Gi9xgu9wtOvhX2PK2zfIMDLUtpIgTbgT0Uz+AvSVIW8P72UGNZweUKt
   E34RpSi+9B2FRG3XVwPu08Hph3r7tJpX7V8UwC7AHzwpxLb8YzlInvkf8
   TivT5s7994yY7kTMJvYPJfk1L/rEXw1ZlUuOOgKQ7NROQcKrJ4SxxSbNM
   ozC9bWbsYiR3tOxgOQ96gm5SU/wFP+l08h/PLghHJMU9RFK6sOLLY81OV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="27792770"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="27792770"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 05:00:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4304865"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Feb 2024 05:00:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbgmC-00031q-2D;
	Sun, 18 Feb 2024 13:00:27 +0000
Date: Sun, 18 Feb 2024 20:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 10/22]
 drivers/net/ethernet/ti/cpsw-proxy-client.c:1753:29: warning: the comparison
 will always evaluate as 'true' for the address of 'virt_port_tx_chan' will
 never be NULL
Message-ID: <202402182009.OWMy4ndK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   77aa27cbdca359bf0735b36ada464ec65b520943
commit: 5f1b32f6bd1b9f1dd56eb4f062c5080dcd76f5cf [10/22] net: ethernet: ti: cpsw-proxy-client: Switch to ATTACH Request
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240218/202402182009.OWMy4ndK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402182009.OWMy4ndK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402182009.OWMy4ndK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/ti/cpsw-proxy-client.c: In function 'cpsw_proxy_client_cb':
   drivers/net/ethernet/ti/cpsw-proxy-client.c:472:13: warning: variable 'response_status' set but not used [-Wunused-but-set-variable]
     472 |         int response_status, ret = 0;
         |             ^~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/cpsw-proxy-client.c: In function 'cpsw_proxy_client_detach':
>> drivers/net/ethernet/ti/cpsw-proxy-client.c:1753:29: warning: the comparison will always evaluate as 'true' for the address of 'virt_port_tx_chan' will never be NULL [-Waddress]
    1753 |                         if (&virt_port->virt_port_tx_chan &&
         |                             ^
   drivers/net/ethernet/ti/cpsw-proxy-client.c:86:41: note: 'virt_port_tx_chan' declared here
      86 |         struct cpsw_proxy_tx_chan       virt_port_tx_chan[CPSW_PROXY_CLIENT_MAX_TX_QUEUES];
         |                                         ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/cpsw-proxy-client.c:1753:59: warning: the comparison will always evaluate as 'true' for the address of 'is_valid' will never be NULL [-Waddress]
    1753 |                         if (&virt_port->virt_port_tx_chan &&
         |                                                           ^~
   drivers/net/ethernet/ti/cpsw-proxy-client.c:60:41: note: 'is_valid' declared here
      60 |         bool                            is_valid;
         |                                         ^~~~~~~~
>> drivers/net/ethernet/ti/cpsw-proxy-client.c:1770:29: warning: the comparison will always evaluate as 'true' for the address of 'virt_port_rx_chan' will never be NULL [-Waddress]
    1770 |                         if (&virt_port->virt_port_rx_chan &&
         |                             ^
   drivers/net/ethernet/ti/cpsw-proxy-client.c:87:41: note: 'virt_port_rx_chan' declared here
      87 |         struct cpsw_proxy_rx_chan       virt_port_rx_chan[CPSW_PROXY_CLIENT_MAX_RX_QUEUES];
         |                                         ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/cpsw-proxy-client.c:1770:59: warning: the comparison will always evaluate as 'true' for the address of 'is_valid' will never be NULL [-Waddress]
    1770 |                         if (&virt_port->virt_port_rx_chan &&
         |                                                           ^~
   drivers/net/ethernet/ti/cpsw-proxy-client.c:79:41: note: 'is_valid' declared here
      79 |         bool                            is_valid;
         |                                         ^~~~~~~~


vim +1753 drivers/net/ethernet/ti/cpsw-proxy-client.c

  1727	
  1728	static void cpsw_proxy_client_detach(struct cpsw_proxy_common *common)
  1729	{
  1730		struct cpsw_virt_port *virt_port;
  1731		struct message response;
  1732		u32 port_id;
  1733		int ret, i, j;
  1734	
  1735		for (i = 0; i < common->num_virt_ports; i++) {
  1736			virt_port = &common->virt_ports[i];
  1737			port_id = virt_port->virt_port_id;
  1738	
  1739			/* Free MAC Request */
  1740			if (virt_port->mac_is_valid) {
  1741				ret = cpsw_proxy_client_send_request(common, virt_port,
  1742								     virt_port->virt_port_token,
  1743								     ETHREMOTECFG_FREE_MAC, &response);
  1744				if (ret) {
  1745					dev_err(common->dev, "failed to detach port %u err: %d\n",
  1746						port_id, ret);
  1747					return;
  1748				}
  1749			}
  1750	
  1751			/* Free TX DMA Channel */
  1752			for (j = 0; j < virt_port->num_tx_chan; j++) {
> 1753				if (&virt_port->virt_port_tx_chan &&
  1754				    &virt_port->virt_port_tx_chan->is_valid) {
  1755					virt_port->curr_tx_chan_idx = j;
  1756					ret = cpsw_proxy_client_send_request(common, virt_port,
  1757									     virt_port->virt_port_token,
  1758									     ETHREMOTECFG_FREE_TX,
  1759									     &response);
  1760					if (ret) {
  1761						dev_err(common->dev, "failed to detach port %u err: %d\n",
  1762							port_id, ret);
  1763						return;
  1764					}
  1765				}
  1766			}
  1767	
  1768			/* Free RX DMA Flow */
  1769			for (j = 0; j < virt_port->num_rx_chan; j++) {
> 1770				if (&virt_port->virt_port_rx_chan &&
  1771				    &virt_port->virt_port_rx_chan->is_valid) {
  1772					virt_port->curr_rx_chan_idx = j;
  1773					ret = cpsw_proxy_client_send_request(common, virt_port,
  1774									     virt_port->virt_port_token,
  1775									     ETHREMOTECFG_FREE_RX,
  1776									     &response);
  1777					if (ret) {
  1778						dev_err(common->dev, "failed to detach port %u err: %d\n",
  1779							port_id, ret);
  1780						return;
  1781					}
  1782				}
  1783			}
  1784	
  1785			/* Send Detach Request */
  1786			ret = cpsw_proxy_client_send_request(common, virt_port,
  1787							     virt_port->virt_port_token,
  1788							     ETHREMOTECFG_DETACH, &response);
  1789			if (ret) {
  1790				dev_err(common->dev, "failed to detach port %u err: %d\n", port_id, ret);
  1791				return;
  1792			}
  1793		}
  1794	}
  1795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
