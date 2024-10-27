Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2D416631C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 18:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730053284; cv=none; b=COhxW/WRmR8juQOFVmvNIq4Y+JP1iH3Czs4Yib1D7HumMtPan+6SB/lYXvQBTFKRkEzIcXxsB456aOwDXKvJ+tgADgc8LNlnpIQYX8Dyx/25sUiws1D1Zsuloy0Wni1/75v/tDF4tu6Nf9uK+Lx8YFLt2D0OOu/v8HyfcK0hRPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730053284; c=relaxed/simple;
	bh=FENXjT/KwbbSPlceT+NkqH1mVD8m9NCxXC1EuZnWyG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYm26TeyC1XljWbIUpl9Xy5ZwNhsrVzHJwnj2Y5ziFLebRI1wpIdvszxFW0p0cXZdb7CXgSfdWcHviVjXrVe5GN7UxaS35j+lPlKUD/G5ilm2dBd6mwk4pwyqxnL7VLs7xlKX/xTRDaf77dQXVROgi5oe7oryqLR81XCcMH26Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFC1fPg+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFC1fPg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730053282; x=1761589282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FENXjT/KwbbSPlceT+NkqH1mVD8m9NCxXC1EuZnWyG8=;
  b=nFC1fPg+EZQ9+gOyEqS4VKaTE/5IbkNabSTRWzRE63sFEOG7tdgoXJxQ
   R/af9nlTaH8Lo6+i9Bmhm6FxbHDLo5UwzrwNR6YCKOVc3AltdisS8GR0F
   J8CNpYvniPZstbRaiLa29cXfX+KhsHyjgJPfKQt7B8Y2R1HNPyChQdqX7
   8i7uGRWi/+3X/+9om2adOcniyQTIKs1qgEvZzEZ6x92n1tVaVmujKZHvk
   FYSRBkcOh31doCQRWIpW+X3hkxt8nIvtmlAf4cQe/CJcAq6KIewH+OnvB
   M1rpba53ut4fbh3kS2J8fb+6mbG3LmUQTxZTxDfFAAXaZr77tSXMyEuWk
   g==;
X-CSE-ConnectionGUID: uM2qU1v7RnSWdQriDt8OXw==
X-CSE-MsgGUID: 4sW1xjBUQj+eFIDEOVLvJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="40234055"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="40234055"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 11:21:21 -0700
X-CSE-ConnectionGUID: hi0LpLfaT5mR3ZdVmwti+Q==
X-CSE-MsgGUID: YtZsk+3/ToivdSwNs+JYfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="82229921"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Oct 2024 11:21:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t57t7-000au9-30;
	Sun, 27 Oct 2024 18:21:17 +0000
Date: Mon, 28 Oct 2024 02:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jie Liu <liujie375@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 20674/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:5776:1: warning: label
 'out_dbg_init' defined but not used
Message-ID: <202410280241.RknzQo9w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: b0c148879a02ad602d4526521d88b0a274aabe8d [20674/30000] UNIC: The driver loading process is terminated when the guid fails to be obtained.
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241028/202410280241.RknzQo9w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280241.RknzQo9w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280241.RknzQo9w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c: In function 'hns3_client_init':
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:5776:1: warning: label 'out_dbg_init' defined but not used [-Wunused-label]
    5776 | out_dbg_init:
         | ^~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c: In function 'hns3_reset_notify_init_enet':
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:6088:1: warning: label 'err_init_guid_fail' defined but not used [-Wunused-label]
    6088 | err_init_guid_fail:
         | ^~~~~~~~~~~~~~~~~~


vim +/out_dbg_init +5776 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c

  5757	
  5758		hns3_state_init(handle);
  5759	
  5760		if (test_bit(HNAE3_DEV_SUPPORT_QB_B, ae_dev->caps))
  5761			set_bit(HNAE3_PFLAG_FD_QB_ENABLE, &handle->supported_pflags);
  5762	
  5763		ret = register_netdev(netdev);
  5764		if (ret) {
  5765			dev_err(priv->dev, "probe register netdev fail!\n");
  5766			goto out_reg_netdev_fail;
  5767		}
  5768	
  5769		if (netif_msg_drv(handle))
  5770			hns3_info_show(priv);
  5771	
  5772		return ret;
  5773	
  5774	out_reg_netdev_fail:
  5775		hns3_state_uninit(handle);
> 5776	out_dbg_init:
  5777		hns3_dbg_uninit(handle);
  5778		hns3_client_stop(handle);
  5779	out_client_start:
  5780		hns3_free_rx_cpu_rmap(netdev);
  5781		hns3_nic_uninit_irq(priv);
  5782	out_init_irq_fail:
  5783		hns3_uninit_phy(netdev);
  5784	out_init_phy:
  5785		hns3_uninit_all_ring(priv);
  5786	out_init_ring:
  5787		hns3_nic_uninit_vector_data(priv);
  5788	out_init_vector_data:
  5789		hns3_nic_dealloc_vector_data(priv);
  5790	out_alloc_vector_data:
  5791		priv->ring = NULL;
  5792	out_get_ring_cfg:
  5793		priv->ae_handle = NULL;
  5794		free_netdev(netdev);
  5795		return ret;
  5796	}
  5797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
