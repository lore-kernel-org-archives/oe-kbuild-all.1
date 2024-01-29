Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA88F60EFF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 18:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706552891; cv=none; b=pdmx1e0Zese0BmrIlmkgEB3AAXOkrF3hsdIrhJswgNVRYaunq0Yajx8GkAb+VzUL054XxwgQDB1JK9Jthx20X1WF8IkLYqaLWlinFPQQmeHRhAiZ6vGUPb4ItRpLivUA8LDFxePtkVd96loaosJZgpjMpRMF225t3OU0kPjpiqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706552891; c=relaxed/simple;
	bh=NuIFzlt/FWSPAO94RdC8nVlB3CjSlXBR92lZjDxtV9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YIGyS4aW1qRkAVFP5zfCsLWE7EgwPRbKlxzaUA9yi3P099sk4xJ6Lb9K27XdKa/pDjwXv7xibM95GD88Tao6yAneYlGtdzDfRg6dOILL8GreQ5UpusvG/QOimK8YgwSFihWrm5D94LM5z53RK+BQsYb31YAp8LwrONQWJGdRHYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYUSMlXQ; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYUSMlXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706552888; x=1738088888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NuIFzlt/FWSPAO94RdC8nVlB3CjSlXBR92lZjDxtV9U=;
  b=TYUSMlXQfsuwCa8SilGmWuCaYmSsVDNKDKwHBl4sCT9HYSGmvSoXg07V
   jApyCMafoGU6Q2uawL2yTQxWaI0ZNm+5G/EUUfDmWnZZRM4fQRJ2rjhxT
   LcU16Hp/968mv3PB6Pq838mrd8PuHUDQ4W6P5rUM4Q/MawGFs8EH6dL34
   gRaFqMppZDGfLVhU2cdJ8XiMajFrPBGQMqXWyr26rsv/3ZKpoLWPtCP7l
   UPeG3hEmHHoD79RPsUSywW4jigOXctpAAUtkcPDSCNwc+sLMEEddYcPcV
   DpOnvc3T8oegBVPyvXTT/nVVWcT7eAOUB9z98CvZJ1KerXg315G2KiGcb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="467301176"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="467301176"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 10:28:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="858187539"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="858187539"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2024 10:28:07 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUWMW-0004Y4-2r;
	Mon, 29 Jan 2024 18:28:04 +0000
Date: Tue, 30 Jan 2024 02:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 8/8] include/net/libeth/rx.h:87:40:
 warning: comparison between 'enum pkt_hash_types' and 'enum <anonymous>'
Message-ID: <202401300258.elqkXeBw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   128efcafbc4f67b145c3a2b51acc98a0a1113f08
commit: d143197caefb68ca574b13e11b0b9f1df1f0249d [8/8] net: intel: introduce Intel Ethernet common library
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240130/202401300258.elqkXeBw-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300258.elqkXeBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300258.elqkXeBw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from include/net/xdp.h:9,
                    from include/net/libeth/rx.h:7,
                    from include/net/libie/rx.h:7,
                    from drivers/net/ethernet/intel/libie/rx.c:4:
   include/net/libeth/rx.h: In function 'libeth_rx_pt_has_hash':
>> include/net/libeth/rx.h:87:40: warning: comparison between 'enum pkt_hash_types' and 'enum <anonymous>' [-Wenum-compare]
      87 |         return likely(pt.payload_layer > LIBETH_RX_PT_PAYLOAD_NONE &&
         |                                        ^
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^


vim +87 include/net/libeth/rx.h

    83	
    84	static inline bool libeth_rx_pt_has_hash(const struct net_device *dev,
    85						 struct libeth_rx_pt pt)
    86	{
  > 87		return likely(pt.payload_layer > LIBETH_RX_PT_PAYLOAD_NONE &&
    88			      (dev->features & NETIF_F_RXHASH));
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
