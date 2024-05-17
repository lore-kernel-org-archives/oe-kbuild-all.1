Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1804C6A33F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957186; cv=none; b=Jcsb7fcOITNedPYOGzCPxiRag9zsq67d0K6pvEW1Tuj85ZvBU6sbExAjNq+fd2QnlNF5o9tKGdPe6ZaIH/rojTq3ypFaNj3QjfL0tm8aW44X+w2grvStgSOgCaEEYZlr6ER3/0Agumtfw8xuJEOBtUSzgJGt3iuleHwIktJhh64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957186; c=relaxed/simple;
	bh=n/e7ia9lhG03OyAfUKJeSnf2bMBrQj2i20xYlcc7rfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AU4Zkmkp9U9zgV8OyF+ALfvE+MEVEpgPKhVbHGrX2nKrMC7kCTBzlHApn92y9lPMKJSLWmy++BO/Kx3q78OovfPbQCMTekFNEOAkj+yPW22Mz4frqdzwYFNeO/HbyKnzIdNoI3bOwcHOjx7N3lp+UtAeJIovs5CmflHhprbdmAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEJXQKru; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEJXQKru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715957184; x=1747493184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n/e7ia9lhG03OyAfUKJeSnf2bMBrQj2i20xYlcc7rfM=;
  b=oEJXQKru5xWrhdCe7TY6FOnQPQqjS1FBRHl1Fe5HeRiWvuv8PUzGQ00h
   qhLK9sLn+L23js4+ORCAEQWfxtKvwUQzVhsiKqrRuIVAdZnmUn9XganOe
   SAJv6B5H7TdrGhiAqKaPIDJnRk6YtWrK9xlGNyUPGZS6DS1mm9kxru6WB
   yJ2gjBks0Z4vONmPnS+IKgne2uRKket5yYviGls246wo+UZuGJtjEIe/K
   MA4qYVzyjeT01W2BXG8fsvS+EMctzpLvqTclaFmrXdrt7uy0NTsKfYNIB
   bm3h+MQnL8FufZzrWbrKfbNrWyPoHixfeYRVr3rHzDzAVzGUSoywB6uBY
   g==;
X-CSE-ConnectionGUID: pR6F9xvMQ+uAGMBdR8v4lg==
X-CSE-MsgGUID: wrh2axQVTs6bK6jIc810oA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="11575473"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="11575473"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 07:46:23 -0700
X-CSE-ConnectionGUID: juUpZB4GRjanWlTwPHWSKg==
X-CSE-MsgGUID: p2IDuzODSd+7nkdC1tBvUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="36384666"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 17 May 2024 07:46:22 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7yqA-0000o8-1A;
	Fri, 17 May 2024 14:46:02 +0000
Date: Fri, 17 May 2024 22:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 42/71]
 drivers/net/ethernet/intel/idpf/idpf_ethtool.c:500:35: warning: passing
 argument 1 of '__swab64s' makes pointer from integer without a cast
Message-ID: <202405172202.UrOSjOpB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   523e67b94c99436ec103c3e5e89b4eb40aa6cd0b
commit: a4b42825e6702cddffb33e18051f245767dc059b [42/71] idpf: switch do libeth generic statistics
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240517/202405172202.UrOSjOpB-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405172202.UrOSjOpB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405172202.UrOSjOpB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/arc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arc/include/asm/bitops.h:192,
                    from include/linux/bitops.h:70,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/jiffies.h:7,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:12,
                    from drivers/net/ethernet/intel/idpf/idpf_ethtool.c:6:
   drivers/net/ethernet/intel/idpf/idpf_ethtool.c: In function 'idpf_add_port_stats':
>> drivers/net/ethernet/intel/idpf/idpf_ethtool.c:500:35: warning: passing argument 1 of '__swab64s' makes pointer from integer without a cast [-Wint-conversion]
     500 |                 le64_to_cpus(stats[i]);
   include/uapi/linux/byteorder/big_endian.h:94:38: note: in definition of macro '__le64_to_cpus'
      94 | #define __le64_to_cpus(x) __swab64s((x))
         |                                      ^
   drivers/net/ethernet/intel/idpf/idpf_ethtool.c:500:17: note: in expansion of macro 'le64_to_cpus'
     500 |                 le64_to_cpus(stats[i]);
         |                 ^~~~~~~~~~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14:
   include/uapi/linux/swab.h:265:46: note: expected '__u64 *' {aka 'long long unsigned int *'} but argument is of type 'u64' {aka 'long long unsigned int'}
     265 | static __always_inline void __swab64s(__u64 *p)
         |                                       ~~~~~~~^


vim +/__swab64s +500 drivers/net/ethernet/intel/idpf/idpf_ethtool.c

   486	
   487	/**
   488	 * idpf_add_port_stats - Copy port stats into ethtool buffer
   489	 * @vport: virtual port struct
   490	 * @data: ethtool buffer to copy into
   491	 */
   492	static void idpf_add_port_stats(struct idpf_vport *vport, u64 **data)
   493	{
   494		u64 *stats = *data;
   495	
   496		memcpy(stats, &vport->vport_stats.counters,
   497		       sizeof(vport->vport_stats.counters));
   498	
   499		for (u32 i = 0; i < IDPF_PORT_STATS_LEN; i++)
 > 500			le64_to_cpus(stats[i]);
   501	
   502		*data += IDPF_PORT_STATS_LEN;
   503	}
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
