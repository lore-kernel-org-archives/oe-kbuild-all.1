Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802924A0A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732361921; cv=none; b=MeLKeZrLlmUtq30wChHrhLWiq1vGwJGWyvU7h4+PHKScIaVM0E+J85h920hX+vo0D4trtvEfSzFIMp1bNKkLdaNxAlJ03qhUFg/TiSP7NPH5haUSmjOLoHtk/3xzZn8/LUWUqE4xQFAijDSn8ORKIP/0D6GQku/Uq0CDjZRtp4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732361921; c=relaxed/simple;
	bh=3CrjLlhTf4toVSSFsq2auUOlfRYxcjX2sm4IwFCuucE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y1IcYF70UafXxsUhwJgKULxQIQssV+kVyC2n9EbHv47angEXYxYtR1H+K7Zg/52yAsBSu7vKFbhXeJ/KhSKN3YTRnxT4Om+Y5OnrJ08CabpS+kB9x2XMkhi5wqYl8awv5a4Rn70fkG+a6qGZmFhvhIRvunOiExtZGkYB1Jd/uVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nonEhu2b; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nonEhu2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732361919; x=1763897919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3CrjLlhTf4toVSSFsq2auUOlfRYxcjX2sm4IwFCuucE=;
  b=nonEhu2bLwdGgdIItNWPosAjFSKB/jxgZ1ScsBaSw+6EsFIB2aZ9CcYa
   Fu2rk3sbo7Il+4X2VX/r0TpCh7A7M+PTadDpGkzYrpNarYB0Msyeqdt6e
   iGwiL+iKS2GEai4F5f1E8RLBNPD398rZP1U0i8EUA/AEBfv1dEaUZIWx2
   JvA02kb1n//1GUyEKBfKVOzJV84KUUhkrVaIhsszqOF9KPumH7lls8tJD
   va/UNiQN6TbD1hoaSLXN6wx6i+/60SRilqpI7F5k5yUlcGrOzZymE8I51
   bLj5bRF1mEvX6eHDreCNH3na4tmAHBCjESTzezKmWb2tKkJJcFZ+dgfAb
   Q==;
X-CSE-ConnectionGUID: VTb+x+dZRKiT5Rw/HggERQ==
X-CSE-MsgGUID: Q9Xbw7m6QIe/fZMqHFSS4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="31876502"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="31876502"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 03:38:39 -0800
X-CSE-ConnectionGUID: A5Yyo4K6QHKbXuV5o6ye1Q==
X-CSE-MsgGUID: 0ak4mwWIQ7SXX/A4/+AC5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="91609076"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Nov 2024 03:38:38 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEoTD-0004bH-2H;
	Sat, 23 Nov 2024 11:38:35 +0000
Date: Sat, 23 Nov 2024 19:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jie Liu <liujie375@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2469/2469]
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:5776:1: warning: unused
 label 'out_dbg_init'
Message-ID: <202411231910.K4RvYzKi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c09bf9815abdd0805b9c0cd61353271d7ecf156f
commit: b0c148879a02ad602d4526521d88b0a274aabe8d [2469/2469] UNIC: The driver loading process is terminated when the guid fails to be obtained.
config: x86_64-buildonly-randconfig-006-20241123 (https://download.01.org/0day-ci/archive/20241123/202411231910.K4RvYzKi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231910.K4RvYzKi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231910.K4RvYzKi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1579:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:5776:1: warning: unused label 'out_dbg_init' [-Wunused-label]
    5776 | out_dbg_init:
         | ^~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:6088:1: warning: unused label 'err_init_guid_fail' [-Wunused-label]
    6088 | err_init_guid_fail:
         | ^~~~~~~~~~~~~~~~~~~
   3 warnings generated.


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
