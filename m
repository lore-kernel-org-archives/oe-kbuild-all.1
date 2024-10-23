Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F50D13D537
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 05:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661014; cv=none; b=lZJBBSymxAtKMKrMbIRSeEMOcgJkCG5tFqVGn4eTKetxc8N85X1ugjW+Dr5Goj2DM9wyiRwfcdhuZzih3FfPWvnX7oqJ0TqdNkS/OwZq/tEjsWiTmnkzI3kM5HSje7kV9KpgLBqddVUQ8GBNHRG5lVh4H/Uda9+1dpJhupOph/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661014; c=relaxed/simple;
	bh=4R3R3DpH4UfxdFiqZ81ji4y4bywkJDl4/yG7oYVpIVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WiKboR8t8fGlrzxJg9oMmwruRUC0f+E3/qw0IL94ZTeVharr96qcFmJPMYPGsVkBfwuN4fbkOSq+C/1pF1zIfP4EU9Dh9jHOMnLpSibg5FMyzX2eLGtTo8TbjlzgL5okGoId7cMBwKVCc5kjn0Ejt8kA9/+7dLE/YneobtBQIMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5pO0nG1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5pO0nG1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729661012; x=1761197012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4R3R3DpH4UfxdFiqZ81ji4y4bywkJDl4/yG7oYVpIVo=;
  b=K5pO0nG1+pQQTbST0FzNCzr8d1FptrGEoIsv0cl7pHz0eLfh1jHbZLIq
   STdGUP7wqnEWG3JN1IPwKzc88rT3e2h8LsKRp9SD3aCte/As5JdxcqkbP
   FyuvFCInKobEHzv8n0MvbMhXhZAq6GOxEzjmtRl9/VhCmH1IZ/d4f7IHs
   BlHqWVXH3SoPvEXtjmnABQwXsGq+C5DWt6GUHjceio8E3SqY/HnOxcquO
   15wL/aeeTjhqZAmLDtIotW55oczp/G6oyAoi2svKi6Q16U02I6hfBoMpW
   Rqv68Wn9lAjqkZJtqbJanhJPaQxsu24aVbuiFkQn5rwRwOAP3TeJcZL/p
   w==;
X-CSE-ConnectionGUID: WXPTPGmETQStk95EmdnUMA==
X-CSE-MsgGUID: PmysaFA2RWyNdKTN1Vqi+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39774823"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39774823"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 22:23:28 -0700
X-CSE-ConnectionGUID: BQoDyud1SBKtxVImmjnHOw==
X-CSE-MsgGUID: N38v3rE1SFaTXYeSzChiZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="110882537"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2024 22:23:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Tq7-000UTQ-2r;
	Wed, 23 Oct 2024 05:23:23 +0000
Date: Wed, 23 Oct 2024 13:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [linux-next:pending-fixes 170/265]
 drivers/net/ethernet/marvell/octeon_ep/octep_rx.c:381:2-3: Unneeded
 semicolon
Message-ID: <202410231321.tKRftpdS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   ad023864550daf9a5062e68f7925320146404919
commit: eb592008f79be52ccef88cd9a5249b3fc0367278 [170/265] octeon_ep: Add SKB allocation failures handling in __octep_oq_process_rx()
config: alpha-randconfig-r062-20241023 (https://download.01.org/0day-ci/archive/20241023/202410231321.tKRftpdS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231321.tKRftpdS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/octeon_ep/octep_rx.c:381:2-3: Unneeded semicolon

vim +381 drivers/net/ethernet/marvell/octeon_ep/octep_rx.c

   362	
   363	/**
   364	 * octep_oq_drop_rx() - Free the resources associated with a packet.
   365	 *
   366	 * @oq: Octeon Rx queue data structure.
   367	 * @buff_info: Current packet buffer info.
   368	 * @read_idx: Current packet index in the ring.
   369	 * @desc_used: Current packet descriptor number.
   370	 *
   371	 */
   372	static void octep_oq_drop_rx(struct octep_oq *oq,
   373				     struct octep_rx_buffer *buff_info,
   374				     u32 *read_idx, u32 *desc_used)
   375	{
   376		int data_len = buff_info->len - oq->max_single_buffer_size;
   377	
   378		while (data_len > 0) {
   379			octep_oq_next_pkt(oq, buff_info, read_idx, desc_used);
   380			data_len -= oq->buffer_size;
 > 381		};
   382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
