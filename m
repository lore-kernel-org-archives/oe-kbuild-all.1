Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEEC1D63DF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733489890; cv=none; b=K05DA9LMCx/WHoTu3svAm130luT2P6e8lYn/9cxoj9+LNbxGDOjGxO9iYf3nRron8qYFB2m7dNOcDmNt/Hhjjihe9rKW2Xq33+E9+EI0Ig7Q8XSNYIb6UCraGJjFYXswRivo8T2eJBrTHrjpgBMVoOeWFDWTYVdQmlYCw1JpsUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733489890; c=relaxed/simple;
	bh=FIVzspjMpgaFIV18myNRUSMi6tpkwOKe5+PPw4pzjgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IBJNPv8GjRU0QwZu/bZHnpfWMnH9XhNwzyCnWhUOq4HKWSjiApNqQXJM0YVvGKHODcdVDlv1bRG2mgZZ/zJLtb+GAJBASEzmJzaHFNI/dAl1kxhhLjUtMSHnLuvm5HW7WwpjzKc7sg28pFhefCgamsfmktZFl/vLFWkqZfjWazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7mBdiGe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7mBdiGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733489889; x=1765025889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FIVzspjMpgaFIV18myNRUSMi6tpkwOKe5+PPw4pzjgM=;
  b=b7mBdiGej3dIRzucwFooR1E8em4Rgu1DqYhjVXV6UqjPsmjnh4yntjmN
   psIQvBz9uh/FlKbb9JQ6JtNQ2l7Tk17EE82+20rUhZDs2GPWYjnNF6HZb
   Jei8rii5jBBrZjb6XTvow3SSAuAAgZ4UlK6W6Ibo2M5tqFosnMvS8HVKH
   kAdcambwf+/p5u67G/xG9AbN26NLkntoHznrKs+DlCsaiJd6QiZxmgipG
   H7EKNNum1jIxFc794CwaIGVKfk/Yh/EHsfeGnS8qZ23+TmCVEPt25xoFW
   pkdfW1DgGoTV0RzBYZMqH9/2FTmtCL7u4bC42Sl3anzgnS6l0DNZLPrSg
   w==;
X-CSE-ConnectionGUID: leKusZrJS+6UZ7kfEsqDNA==
X-CSE-MsgGUID: jR2Kn6iNRYm8gCArB8dE4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="37626183"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="37626183"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 04:58:08 -0800
X-CSE-ConnectionGUID: gD9MHrRLQx6yWYrHlj7LlQ==
X-CSE-MsgGUID: 1FiAXVIuRMG7y5l1DIXsBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="98855020"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Dec 2024 04:58:06 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJXuG-00013t-0R;
	Fri, 06 Dec 2024 12:58:04 +0000
Date: Fri, 6 Dec 2024 20:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jie Liu <liujie375@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2564/2564]
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:5776:1: warning: label
 'out_dbg_init' defined but not used
Message-ID: <202412062047.T2j25jn7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haibin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9cf5f60a8d57b2498fb9f9223825d6933b2d2fd5
commit: b0c148879a02ad602d4526521d88b0a274aabe8d [2564/2564] UNIC: The driver loading process is terminated when the guid fails to be obtained.
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241206/202412062047.T2j25jn7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412062047.T2j25jn7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412062047.T2j25jn7-lkp@intel.com/

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
