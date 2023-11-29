Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0998C5D4AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 21:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="av0DIJwH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701293817; x=1732829817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UpNsvUCGLD73ME02jn33M2CFxP0egA1U319rLmRiftM=;
  b=av0DIJwH7gXeviIsgUzzOPKeSZG+rLb/EWMF6rjns4UFmZsOPnhFmBrZ
   VnXmFU2XMA0ns68jY9j0iodIxlGOZ2SpwDe2NMgccGsJHalMM/2KZz/tb
   P1nqPwEtimsDC1TSeTCiOIzjRSXi2aXclUtzpSTMkEchfVCVV5ACUkX0Y
   3+3hQ1RtN13o0VS7tGOEbAPN0HyUGj76lHD31CxkXZwGPVKRmBWr9sivz
   FJtnJEIcT9YwUm+2FfMCum3Thp1/KNPVvyUQTuOPp23mmWw1EGB6HufIZ
   BKA8D6JekTw5AQSdO0Hhe9hd8xKdqZKMVHJTLW1m1AXWm/ow/ySzXRJeV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11930814"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="11930814"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 13:36:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772820649"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="772820649"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2023 13:36:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8SEn-0000r1-0E;
	Wed, 29 Nov 2023 21:36:53 +0000
Date: Thu, 30 Nov 2023 05:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie 9/18] drivers/net/ethernet/intel/libie/rx.c:18:
 warning: Function parameter or member 'pp' not described in
 'libie_rx_hw_len'
Message-ID: <202311300213.f55howeK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   06e16df156eea0862b47e50485e17c70c3d8ea8f
commit: 58f0ab910da24eae9c4021b2ebac59d8cc8cc905 [9/18] libie: add Rx buffer management (via Page Pool)
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20231130/202311300213.f55howeK-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300213.f55howeK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300213.f55howeK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/libie/rx.c:18: warning: Function parameter or member 'pp' not described in 'libie_rx_hw_len'
>> drivers/net/ethernet/intel/libie/rx.c:18: warning: Excess function parameter 'dev' description in 'libie_rx_hw_len'
>> drivers/net/ethernet/intel/libie/rx.c:18: warning: Excess function parameter 'max_len' description in 'libie_rx_hw_len'


vim +18 drivers/net/ethernet/intel/libie/rx.c

     7	
     8	/**
     9	 * libie_rx_hw_len - get the actual buffer size to be passed to HW
    10	 * @dev: &net_device to calculate the size for
    11	 * @max_len: maximum length for the given page size
    12	 *
    13	 * Return: HW-writeable length per one buffer to pass it to the HW accounting:
    14	 * MTU the @dev has, HW required alignment, minimum and maximum allowed values,
    15	 * and system's page size.
    16	 */
    17	static u32 libie_rx_hw_len(const struct page_pool_params *pp)
  > 18	{
    19		u32 len;
    20	
    21		len = READ_ONCE(pp->netdev->mtu) + LIBIE_RX_LL_LEN;
    22		len = ALIGN(len, LIBIE_RX_BUF_LEN_ALIGN);
    23		len = clamp(len, LIBIE_MIN_RX_BUF_LEN, pp->max_len);
    24	
    25		return len;
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
