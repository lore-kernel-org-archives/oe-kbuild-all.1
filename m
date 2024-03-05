Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244CC10A1B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709632004; cv=none; b=kh6pZeQucMQPFrIUjLfOkC594rQS3PErEU9UCWf3BjnM06aLHMbnXeuoXqH1g4cUr+ghGmN8GN1aYsgSeCggSl/BMCGlr4zGGvrvFuzfW3nx5nvQ7xOSAO9LT+siK+Iwi5iIwmE/Rh0P75sgkfs6Fo9yPsl/gsKRpSk5iH0Gd+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709632004; c=relaxed/simple;
	bh=5Jy/rLDfdSV+vlq67lrXyWJjQoHRD8MrUwSnD1kIEpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MgWhrAomdSdsZz9jly32NaHLYKXx2zqmw9TudcvSEe8al/ziu6udOB+qllCN0B4Ft1s7wVV3Jxlbb/Nob6KxuDaSZamdQkgCDcB4M/4X+ACzTLk31H4vUNVIFM5FKS6lSkuIVVTZuQfzCT8AnSzcomuAypBJb/xNcsIwL9KoZ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnMmLL4y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnMmLL4y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709632002; x=1741168002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Jy/rLDfdSV+vlq67lrXyWJjQoHRD8MrUwSnD1kIEpM=;
  b=fnMmLL4yw/Yu/OQL4Txh0lybdD6jjGJ0R3Zh5KqG7vNYnXqMzKHvEfRd
   cKVFvbc8wMWU3qwT26dP3LDOxouDzNlll/XEtzfLxewt4J1K5TZHJ2ykj
   rfq235E3eT040pAcqB65YM5pK7DFb9/8XxVFamZ1TFjg4G6GwPjUMh564
   0dShvTnKC9toIeJP/17GkAgc1iXnuIQWp67Rn5zA+RPRAjDq4SxWUzBI+
   yqmFHpMh6dsHYYnlzXRgGEChxvZBi/EstzwvH4VUvDu8mk+EQ1uf91iKA
   uYLF8WzzBxeazPEO8axmnT3GxC7gcv+iNpL1ZV4a6spbhdrrhNQP9uw/X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4029865"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4029865"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 01:46:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14000728"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2024 01:46:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhRNd-0003D1-3B;
	Tue, 05 Mar 2024 09:46:37 +0000
Date: Tue, 5 Mar 2024 17:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie-new 69/72]
 drivers/net/ethernet/intel/idpf/idpf_txrx.c:1133: warning: Excess function
 parameter 'mask' description in 'idpf_vector_to_queue_set'
Message-ID: <202403051751.27NEd8DF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   1f708723b6e4b829c73e2c7e6ed90804da296e16
commit: 671bb36b73c82d2c04589c82dc5d47f44e201070 [69/72] idpf: add XSk pool initialization
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240305/202403051751.27NEd8DF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051751.27NEd8DF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051751.27NEd8DF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:1133: warning: Excess function parameter 'mask' description in 'idpf_vector_to_queue_set'


vim +1133 drivers/net/ethernet/intel/idpf/idpf_txrx.c

  1117	
  1118	/**
  1119	 * idpf_vector_to_queue_set - create a queue set associated with a given
  1120	 *			      queue vector.
  1121	 * @qv: queue vector corresponding to the queue pair
  1122	 * @mask: mask of queue types to disable (Rx, Tx, XDP)
  1123	 *
  1124	 * Returns a pointer to a dynamically allocated array of pointers to all
  1125	 * queues associated with a given queue vector (@qv).
  1126	 * Please note that the caller is responsible to free the memory allocated
  1127	 * by this function using kfree().
  1128	 *
  1129	 * Return: &idpf_queue_set on success, %NULL in case of error.
  1130	 */
  1131	static struct idpf_queue_set *
  1132	idpf_vector_to_queue_set(struct idpf_q_vector *qv)
> 1133	{
  1134		struct idpf_queue_set *qs;
  1135		u32 num;
  1136	
  1137		num = qv->num_rxq + qv->num_bufq + qv->num_txq + qv->num_complq;
  1138		if (!num)
  1139			return NULL;
  1140	
  1141		qs = idpf_alloc_queue_set(qv->vport, num);
  1142		if (!qs)
  1143			return NULL;
  1144	
  1145		num = 0;
  1146	
  1147		for (u32 i = 0; i < qv->num_bufq; i++) {
  1148			qs->qs[num].type = VIRTCHNL2_QUEUE_TYPE_RX_BUFFER;
  1149			qs->qs[num++].bufq = qv->bufq[i];
  1150		}
  1151	
  1152		for (u32 i = 0; i < qv->num_rxq; i++) {
  1153			qs->qs[num].type = VIRTCHNL2_QUEUE_TYPE_RX;
  1154			qs->qs[num++].rxq = qv->rx[i];
  1155		}
  1156	
  1157		for (u32 i = 0; i < qv->num_txq; i++) {
  1158			qs->qs[num].type = VIRTCHNL2_QUEUE_TYPE_TX;
  1159			qs->qs[num++].txq = qv->tx[i];
  1160		}
  1161	
  1162		for (u32 i = 0; i < qv->num_complq; i++) {
  1163			qs->qs[num].type = VIRTCHNL2_QUEUE_TYPE_TX_COMPLETION;
  1164			qs->qs[num++].complq = qv->complq[i];
  1165		}
  1166	
  1167		if (num != qs->num) {
  1168			kfree(qs);
  1169			return NULL;
  1170		}
  1171	
  1172		return qs;
  1173	}
  1174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
