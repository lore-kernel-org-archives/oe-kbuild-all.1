Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FA784FAD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 18:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708538673; cv=none; b=ndm0ILd6pd4lnjAKJbUYT2SgXhtG0Yy2/Co2P1QcqhELtnz/cyFePervJ/RtqDyB0FoC4ZTNMpBMUaO/BVQJjRnBXpK8BiEIa64glx2UT/I0eBLXhmWR2zUKGpTk8Y9donoMzfWJodgv0uI5et4/AIXly/jajUUcLvNSXlQ/7HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708538673; c=relaxed/simple;
	bh=MZwScxEds7KTnV15Ks6h1rvU4dcAWzuwDdQwycVWvU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BqnUx795GFHkgRE2w+HrvROiv6vKYjYGl+w6qdPIq+4nWsRysGhQp5lsxAhFvCjE2jw3W1vLfMYI7Qv2uxMNUnG3VO0HJVCVfahQDpE8nd5t3k/ZXLWZL8DWAOVYEYrcmu59FIwKvJNwgBD54R/X5kTYZcT8DeIW15Ce4k9l2b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ihrdg7u5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ihrdg7u5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708538671; x=1740074671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZwScxEds7KTnV15Ks6h1rvU4dcAWzuwDdQwycVWvU8=;
  b=Ihrdg7u5IfXFsAnNRmIZ/O8La3Ve6GF1rSEevqC/HHCUDi3eWeouwMDk
   uyaw6L64ygvqfqxoCH70/ZQUqAqxnzGDg2kEAvpuCfUc2bLh1K1mwbXPo
   i/RN2TFjb/EAc9i6aRc+mYUZ2PQh8s2MBHNosUSLpn4NeQMDrBTmAKooj
   MZVcSCR4LNRavDFWx86zGGgkHjpe+MO8xNU//ZF1qhPiZuWdee9tRIZKT
   AlfrbvcDuHWhP4s06iPWfngFdC0XRfaqz+YJ7PLkBdieKx+4x+TYhG0hN
   NezysJssN/Jzom+yyC6n2iBufEYs/GkODyrZ+CvTh/s3XidyzWXLbYeT2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2628972"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2628972"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 10:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="35998466"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Feb 2024 10:04:29 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcqxH-0005Ze-0x;
	Wed, 21 Feb 2024 18:04:27 +0000
Date: Thu, 22 Feb 2024 02:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie-new 68/68]
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1748: warning: Function
 parameter or struct member 'qs' not described in
 'idpf_send_config_rx_queue_set_msg'
Message-ID: <202402220235.5ZvqJ7dQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   e058b964b74edf5cc9f7d67fd001d30bcfa00508
commit: 1f9963b67f75c3f6bb19d0185f99df47e6878cef [68/68] idpf: add vc functions to manage selected queues
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240222/202402220235.5ZvqJ7dQ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220235.5ZvqJ7dQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220235.5ZvqJ7dQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1748: warning: Function parameter or struct member 'qs' not described in 'idpf_send_config_rx_queue_set_msg'
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1748: warning: Excess function parameter 'qp' description in 'idpf_send_config_rx_queue_set_msg'


vim +1748 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c

  1736	
  1737	/**
  1738	 * idpf_send_config_rx_queue_set_msg - Send virtchnl config rx queues
  1739	 * message for selected rx queues only.
  1740	 * @qp: params of the Rx queues
  1741	 *
  1742	 * Send config queues virtchnl message for queues contained in 'qs' array.
  1743	 * The 'qs' array can contain Rx queues (or buffer queues) only.
  1744	 *
  1745	 * Return: 0 on success, -errno on failure.
  1746	 */
  1747	static int idpf_send_config_rx_queue_set_msg(const struct idpf_queue_set *qs)
> 1748	{
  1749		struct virtchnl2_rxq_info *qi __free(kfree) = NULL;
  1750		struct idpf_chunked_msg_params params = {
  1751			.vc_op		= VIRTCHNL2_OP_CONFIG_RX_QUEUES,
  1752			.prepare_msg	= idpf_prepare_cfg_rxqs_msg,
  1753			.config_sz	= sizeof(struct virtchnl2_config_rx_queues),
  1754			.chunk_sz	= sizeof(*qi),
  1755		};
  1756	
  1757		qi = kcalloc(qs->num, sizeof(*qi), GFP_KERNEL);
  1758		if (!qi)
  1759			return -ENOMEM;
  1760	
  1761		params.chunks = qi;
  1762	
  1763		for (u32 i = 0; i < qs->num; i++) {
  1764			if (qs->qs[i].type == VIRTCHNL2_QUEUE_TYPE_RX)
  1765				idpf_fill_rxq_config_chunk(qs->vport, qs->qs[i].rxq,
  1766							   &qi[params.num_chunks++]);
  1767			else if (qs->qs[i].type == VIRTCHNL2_QUEUE_TYPE_RX_BUFFER)
  1768				idpf_fill_bufq_config_chunk(qs->vport, qs->qs[i].bufq,
  1769							    &qi[params.num_chunks++]);
  1770		}
  1771	
  1772		return idpf_send_chunked_msg(qs->vport, &params);
  1773	}
  1774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
