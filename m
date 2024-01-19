Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0F13C6A6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705658399; cv=none; b=rfYpZIhhvIAnnANzwWR0Jh4ly1BvzmkwO/HoTo6EH1h5Jsmp65QKt8lOZnjeZo8WgsJ4RvVqLg93CECfdVDxIvvI1HTIYihWa0slOtXRvqZQdZ0al23CScSrWxZz+G8wGAxzzVhiALeOielctbZn9pJbdnGmIJz2BxzV/IS23dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705658399; c=relaxed/simple;
	bh=ceS1OQpfknSObP+xJGoQdEam3OBkMU+ho+OaOWYPECE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oYZtiY4TOCoMag2wMWZMCzY4SPd8PrdjIJOrpBE3jr/ECQCMxeo+ESAUqU4zgDSkbFhNEG6hVWjKCGFODJ4oaG3ErLE+h8vJGkCZG0r/mdq5nlOWmSqiLFvVppDBoj7NZav0l3Fj369neltsKDR/GtjDdTB7TRfBnkGdgQodXXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpWVHalG; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpWVHalG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705658397; x=1737194397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ceS1OQpfknSObP+xJGoQdEam3OBkMU+ho+OaOWYPECE=;
  b=bpWVHalGN0o8Z2vNzEkSom6LNv0ckoMTVaLxjrBJVSJfLNni7uogjtZR
   yGDgh+VoKSWimcjuIeQZIHtHU2nsDnCK9pey36wpqwDQ25BSCcEhPjVVe
   nHEjY1Oa1Wz1XVMaRWeO5hru0Bq4QZG8r2K0ifq8jqaIe5kshicfBTvMd
   f/ehyHJKYqhpGJVY+4f7uDOHrUpIapGJYFta35wj33dR8+GtoJmFswvxs
   hc66HfFyCdzFJNOvKcBmh0G0cMYMbm66CwSZq5Y51vclfDcaI7JssgcK+
   EtCjSBCd5JAqRzz41oTEomoNQF9t8xb7xmOsYf7ASAXx1qzCvaIe+wuah
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="467083175"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="467083175"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 01:59:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="875332376"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="875332376"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2024 01:59:54 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQlfD-0003tA-2J;
	Fri, 19 Jan 2024 09:59:51 +0000
Date: Fri, 19 Jan 2024 17:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie 46/51]
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Function
 parameter or struct member 'params' not described in 'idpf_send_chunked_msg'
Message-ID: <202401191713.9Uzbk7t9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   29cca1ea6c555a8b97694e38f18926da7969dcfe
commit: 71ad20b6fa09908fc43a332e3894eace412acf58 [46/51] idpf: add vc functions to manage selected queues
config: x86_64-buildonly-randconfig-004-20240119 (https://download.01.org/0day-ci/archive/20240119/202401191713.9Uzbk7t9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401191713.9Uzbk7t9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401191713.9Uzbk7t9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Function parameter or struct member 'params' not described in 'idpf_send_chunked_msg'
   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Excess function parameter 'xn_params' description in 'idpf_send_chunked_msg'
   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Excess function parameter 'prep_msg' description in 'idpf_send_chunked_msg'
   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Excess function parameter 'config_data_size' description in 'idpf_send_chunked_msg'
   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Excess function parameter 'num_chunks' description in 'idpf_send_chunked_msg'
   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Excess function parameter 'chunk_size' description in 'idpf_send_chunked_msg'
   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Excess function parameter 'chunks' description in 'idpf_send_chunked_msg'
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1710: warning: Function parameter or struct member 'q' not described in 'idpf_fill_rxbufq_config_chunk'
   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1710: warning: expecting prototype for idpf_fill_bufq_config_chunk(). Prototype was for idpf_fill_rxbufq_config_chunk() instead
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1935: warning: Function parameter or struct member 'vc_op' not described in 'idpf_send_ena_dis_selected_qs_msg'
   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1935: warning: Excess function parameter 'ena' description in 'idpf_send_ena_dis_selected_qs_msg'


vim +1499 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c

  1482	
  1483	/**
  1484	 * idpf_send_chunked_msg - Send a VC message consisting of chunks.
  1485	 * @vport: virtual port data structure
  1486	 * @xn_params: parameters for this particular transaction including
  1487	 * @prep_msg: pointer to the helper function for preparing the VC message
  1488	 * @config_data_size: size of the message config data
  1489	 * @num_chunks: number of chunks in the message
  1490	 * @chunk_size: size of single message chunk
  1491	 * @chunks: pointer to a buffer containig chunks of the message
  1492	 *
  1493	 * Helper function for preparing the message describing queues to be enabled
  1494	 * or disabled.
  1495	 * Returns the total size of the prepared message.
  1496	 */
  1497	static int idpf_send_chunked_msg(struct idpf_vport *vport,
  1498					 struct idpf_chunked_msg_params *params)
> 1499	{
  1500		u32 num_msgs, max_chunks, left_chunks, max_buf_sz;
  1501		u32 num_chunks = params->num_chunks;
  1502		int err = 0, i;
  1503		u8 *msg_buf;
  1504	
  1505		max_chunks = min_t(u32, IDPF_NUM_CHUNKS_PER_MSG(params->config_sz,
  1506								params->chunk_sz),
  1507								params->num_chunks);
  1508		max_buf_sz = params->config_sz + max_chunks * params->chunk_sz;
  1509		num_msgs = DIV_ROUND_UP(params->num_chunks, max_chunks);
  1510	
  1511		msg_buf = kzalloc(max_buf_sz, GFP_KERNEL);
  1512		if (!msg_buf) {
  1513			err = -ENOMEM;
  1514			goto error;
  1515		}
  1516	
  1517		mutex_lock(&vport->vc_buf_lock);
  1518	
  1519		left_chunks = num_chunks;
  1520		for (i = 0; i < num_msgs; i++) {
  1521			u8 *chunks = params->chunks;
  1522			int buf_sz, msg_size;
  1523			u8 *first_chunk;
  1524	
  1525			num_chunks = min(max_chunks, left_chunks);
  1526			first_chunk = chunks + (i * params->chunk_sz * max_chunks);
  1527			msg_size = params->chunk_sz * num_chunks + params->config_sz;
  1528	
  1529			buf_sz = params->prepare_msg(vport, msg_buf, first_chunk,
  1530						     num_chunks);
  1531			if (buf_sz != msg_size) {
  1532				err = -EINVAL;
  1533				goto msg_error;
  1534			}
  1535	
  1536			err = idpf_send_mb_msg(vport->adapter, params->op,
  1537					       buf_sz, msg_buf);
  1538			if (err)
  1539				goto msg_error;
  1540	
  1541			err = __idpf_wait_for_event(vport->adapter, vport,
  1542						    params->state, params->err_check,
  1543						    params->timeout);
  1544			if (err)
  1545				goto msg_error;
  1546	
  1547			left_chunks -= num_chunks;
  1548		}
  1549	
  1550		if (left_chunks != 0)
  1551			err = -EINVAL;
  1552	msg_error:
  1553		mutex_unlock(&vport->vc_buf_lock);
  1554		kfree(msg_buf);
  1555	error:
  1556		return err;
  1557	}
  1558	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
