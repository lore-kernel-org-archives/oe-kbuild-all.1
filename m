Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF59C55E63
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705689799; cv=none; b=H3PO+pUgj1CCw02XoAB4iC4jsafjEndFH1tOBwsGtCuraL5yKLP9jqeLPnz2qK8X9RgqElUKbl1+U7Gde9A05A90bIZvSevbJ1tWajBKRZqBEZxHDLXwKOPDcabcscmPudawwi25daZjGFHBCEAP4zJVFWcnIy8oP9b2eWKWCwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705689799; c=relaxed/simple;
	bh=7vFEIfMzFtckqQHs7dHRBWvCtACW0qwHDR9X9G8X2OI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rqrMTNKJQp9jlNApeC4tTanzEDFPe5g7jGwJvTsBNFyWJnDYogEiSucNlIW3xGjxXMH1HjGOLVamFfoua7quugNSNay0PPtkbgfqM0HsLDohHzcCQ3358mTUXd4sw3ey+2uoNDwWRKQvLWtzR7ulgbi3iXPDj+ti8jod5apz9rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lisCNAwS; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lisCNAwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705689794; x=1737225794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7vFEIfMzFtckqQHs7dHRBWvCtACW0qwHDR9X9G8X2OI=;
  b=lisCNAwSzJ2UOq1+dW4PFv5UlRn/LY2FITXue1Zsdum9YhVU1gX4Xgt3
   2RfJwMx1q9WimqpRke7PVIU1AhuWL3uT7zTcuFNorlUQERFm22/VFUSsN
   DMq2kwnwKhvkYkabvuI8YsdwmlpgojogYD4032MvwVxy9UsIozP59o1z1
   PWLz0kEUL+n7C63dNEm27chtjnMQUiLe/11u0COQn3OGWvBg5cPcEMzLi
   Jzb2Wtpg+/pJrmfnQ6qJiOVS9x4BCYEdSGMPR3KnH/f05H93wYErS/yZB
   /mRoQuVcRVXQXDRrPBmvcvE8tf9io6IQxIeEA/rDDjuNE+Qt4RFutIA3c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="391251012"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="391251012"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 10:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="904224142"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="904224142"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2024 10:43:12 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQtpe-0004MA-1n;
	Fri, 19 Jan 2024 18:43:10 +0000
Date: Sat, 20 Jan 2024 02:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:pr/22 1/3]
 drivers/net/ethernet/intel/idpf/idpf_xsk.c:565:1: warning: label
 'xsk_pool_if_up' defined but not used
Message-ID: <202401200217.OsJ9xxyG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pr/22
head:   f53d6f19cb1391df0b3592b74ebe4666bec8f34b
commit: c1d37109c5b20998384649a68f7e461fd59613d9 [1/3] Fix AF_XDP Tx & Rx for multi XSk instances
config: x86_64-buildonly-randconfig-004-20240119 (https://download.01.org/0day-ci/archive/20240120/202401200217.OsJ9xxyG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200217.OsJ9xxyG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200217.OsJ9xxyG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/idpf/idpf_xsk.c: In function 'idpf_xsk_pool_setup':
>> drivers/net/ethernet/intel/idpf/idpf_xsk.c:565:1: warning: label 'xsk_pool_if_up' defined but not used [-Wunused-label]
     565 | xsk_pool_if_up:
         | ^~~~~~~~~~~~~~
--
>> drivers/net/ethernet/intel/idpf/idpf_xdp.c:113: warning: Function parameter or struct member 'arg' not described in '__idpf_xdp_rxq_info_deinit'


vim +/xsk_pool_if_up +565 drivers/net/ethernet/intel/idpf/idpf_xsk.c

4550e7f47e2e0f Michal Kubiak 2023-11-27  520  
4550e7f47e2e0f Michal Kubiak 2023-11-27  521  /**
4550e7f47e2e0f Michal Kubiak 2023-11-27  522   * idpf_xsk_pool_setup - enable/disable a BUFF POOL region
4550e7f47e2e0f Michal Kubiak 2023-11-27  523   * @vport: current vport of interest
4550e7f47e2e0f Michal Kubiak 2023-11-27  524   * @pool: pointer to a requested BUFF POOL region
4550e7f47e2e0f Michal Kubiak 2023-11-27  525   * @qid: queue id
4550e7f47e2e0f Michal Kubiak 2023-11-27  526   *
4550e7f47e2e0f Michal Kubiak 2023-11-27  527   * Returns 0 on success, negative on failure
4550e7f47e2e0f Michal Kubiak 2023-11-27  528   */
4550e7f47e2e0f Michal Kubiak 2023-11-27  529  int idpf_xsk_pool_setup(struct idpf_vport *vport, struct xsk_buff_pool *pool,
4550e7f47e2e0f Michal Kubiak 2023-11-27  530  			u32 qid)
4550e7f47e2e0f Michal Kubiak 2023-11-27  531  {
4550e7f47e2e0f Michal Kubiak 2023-11-27  532  	bool if_running, pool_present = !!pool;
4550e7f47e2e0f Michal Kubiak 2023-11-27  533  	int err = 0, pool_failure = 0, num_qs;
4550e7f47e2e0f Michal Kubiak 2023-11-27  534  	struct idpf_q_vector *q_vector;
4550e7f47e2e0f Michal Kubiak 2023-11-27  535  	struct idpf_queue *rxq, **qs;
4550e7f47e2e0f Michal Kubiak 2023-11-27  536  
4550e7f47e2e0f Michal Kubiak 2023-11-27  537  	if_running = netif_running(vport->netdev) &&
4550e7f47e2e0f Michal Kubiak 2023-11-27  538  		     idpf_xdp_is_prog_ena(vport);
4550e7f47e2e0f Michal Kubiak 2023-11-27  539  
4550e7f47e2e0f Michal Kubiak 2023-11-27  540  	if (if_running) {
4550e7f47e2e0f Michal Kubiak 2023-11-27  541  		rxq = idpf_find_rxq(vport, qid);
4550e7f47e2e0f Michal Kubiak 2023-11-27  542  		q_vector = rxq->q_vector;
4550e7f47e2e0f Michal Kubiak 2023-11-27  543  
4550e7f47e2e0f Michal Kubiak 2023-11-27  544  		qs = idpf_create_queue_list(vport, qid, &num_qs);
4550e7f47e2e0f Michal Kubiak 2023-11-27  545  		if (!qs) {
4550e7f47e2e0f Michal Kubiak 2023-11-27  546  			err = -ENOMEM;
4550e7f47e2e0f Michal Kubiak 2023-11-27  547  			goto xsk_exit;
4550e7f47e2e0f Michal Kubiak 2023-11-27  548  		}
4550e7f47e2e0f Michal Kubiak 2023-11-27  549  
4550e7f47e2e0f Michal Kubiak 2023-11-27  550  		err = idpf_qp_dis(vport, q_vector, qs, num_qs, qid);
4550e7f47e2e0f Michal Kubiak 2023-11-27  551  		if (err) {
4550e7f47e2e0f Michal Kubiak 2023-11-27  552  			netdev_err(vport->netdev, "Cannot disable queues for XSK setup, error = %d\n",
4550e7f47e2e0f Michal Kubiak 2023-11-27  553  				   err);
c1d37109c5b209 Michal Kubiak 2024-01-10  554  			//goto xsk_pool_if_up;
c1d37109c5b209 Michal Kubiak 2024-01-10  555  			//TODO: Fix FW!!!!
4550e7f47e2e0f Michal Kubiak 2023-11-27  556  		}
4550e7f47e2e0f Michal Kubiak 2023-11-27  557  	}
4550e7f47e2e0f Michal Kubiak 2023-11-27  558  
4550e7f47e2e0f Michal Kubiak 2023-11-27  559  	pool_failure = pool_present ? idpf_xsk_pool_enable(vport, qid) :
4550e7f47e2e0f Michal Kubiak 2023-11-27  560  				      idpf_xsk_pool_disable(vport, qid);
4550e7f47e2e0f Michal Kubiak 2023-11-27  561  
4550e7f47e2e0f Michal Kubiak 2023-11-27  562  	if (!idpf_xdp_is_prog_ena(vport))
4550e7f47e2e0f Michal Kubiak 2023-11-27  563  		netdev_warn(vport->netdev, "RSS may schedule pkts to q occupied by AF XDP\n");
4550e7f47e2e0f Michal Kubiak 2023-11-27  564  
4550e7f47e2e0f Michal Kubiak 2023-11-27 @565  xsk_pool_if_up:
4550e7f47e2e0f Michal Kubiak 2023-11-27  566  	if (if_running) {
4550e7f47e2e0f Michal Kubiak 2023-11-27  567  		err = idpf_qp_ena(vport, q_vector, qs, num_qs, qid);
4550e7f47e2e0f Michal Kubiak 2023-11-27  568  		if (!err && pool_present)
4550e7f47e2e0f Michal Kubiak 2023-11-27  569  			napi_schedule(&rxq->q_vector->napi);
4550e7f47e2e0f Michal Kubiak 2023-11-27  570  		else if (err)
4550e7f47e2e0f Michal Kubiak 2023-11-27  571  			netdev_err(vport->netdev,
4550e7f47e2e0f Michal Kubiak 2023-11-27  572  				   "Could not enable queues after XSK setup, error = %d\n",
4550e7f47e2e0f Michal Kubiak 2023-11-27  573  				   err);
4550e7f47e2e0f Michal Kubiak 2023-11-27  574  		kfree(qs);
4550e7f47e2e0f Michal Kubiak 2023-11-27  575  	}
4550e7f47e2e0f Michal Kubiak 2023-11-27  576  
4550e7f47e2e0f Michal Kubiak 2023-11-27  577  	if (pool_failure) {
4550e7f47e2e0f Michal Kubiak 2023-11-27  578  		netdev_err(vport->netdev, "Could not %sable BUFF POOL, error = %d\n",
4550e7f47e2e0f Michal Kubiak 2023-11-27  579  			   pool_present ? "en" : "dis", pool_failure);
4550e7f47e2e0f Michal Kubiak 2023-11-27  580  		err = pool_failure;
4550e7f47e2e0f Michal Kubiak 2023-11-27  581  	}
4550e7f47e2e0f Michal Kubiak 2023-11-27  582  
4550e7f47e2e0f Michal Kubiak 2023-11-27  583  xsk_exit:
4550e7f47e2e0f Michal Kubiak 2023-11-27  584  	return err;
4550e7f47e2e0f Michal Kubiak 2023-11-27  585  }
cf0706903cff86 Michal Kubiak 2023-12-07  586  

:::::: The code at line 565 was first introduced by commit
:::::: 4550e7f47e2e0f3e1beff777eec679467092567d idpf: add XSk pool initialization

:::::: TO: Michal Kubiak <michal.kubiak@intel.com>
:::::: CC: Alexander Lobakin <aleksander.lobakin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
