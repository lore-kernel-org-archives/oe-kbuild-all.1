Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B44522C35D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 22:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751148921; cv=none; b=ragfTcdlqNpLM6bCSRG9Tdurp+mE3B7s2BkAwvKhFCAsSUWcL3AmefdI7w4A3eQ7+grdaod2Z/filwNIrHbqclDOwXPlLkR3VGJgAlotsSoG1iAbdilhUe08fINeJTcQrfQcAwJU9GKOjo4ql0pSbxhvS/tnoAG+uk5rc5s6+8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751148921; c=relaxed/simple;
	bh=i7+EmW2a/ovIfkqGuD41eAsx98c0Dx6zctfDs0y//2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvWxI/eNmHmdJB5tqm42NRQRLpw9lvln6r4PWu5ZHWUrJC5odk8Cxl5YOJBXsSguc6A10P+aFzM7JdQ+qxfDA7IVPU/o5GdSp7aB+jJ7FjVGDEncfFIgnj0vNGWB/dq01u/ev51Eo59/LPcCOalfDYfAEyxIu6ErMwWw0nV4GdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8fgRNp/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8fgRNp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751148919; x=1782684919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i7+EmW2a/ovIfkqGuD41eAsx98c0Dx6zctfDs0y//2I=;
  b=J8fgRNp/oD+2bQRJm3M2EcgdNJm2N1hy/dsCuCNqScZqRcq3zP/k2I9c
   DRIEagZUX6jzcWEen4ifs5S3oEQzk3q2yCLwji14B/K8Foa9iSzF6DaB7
   gFeZTAQogAoOd5+ryddGYopUH4btuBR+l9xflBuJ3h95dITeKMx/+N16z
   MrR3S0q/xCH5k0BK3XAJCiKc+P4J3ZSA8QlVDPi/lanQC1XTu/cD6nv89
   WtfEUCZPM93em3cf2Bm8fxP9FzthdsTqNjzyp6nr59qtfXybebiTrYnji
   GDdCanuhT5dxBNJyIUBOdA0GAJTQ0ooe3Eog74NP7VIbl+WbMUsKtpVq2
   g==;
X-CSE-ConnectionGUID: BCFY2kj4TaaWRLVePhuxRA==
X-CSE-MsgGUID: KfcllBHMRjes6h6g9Hyxzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="41047640"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="41047640"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 15:15:15 -0700
X-CSE-ConnectionGUID: O24xXQUETYSn4YNSIwQYbg==
X-CSE-MsgGUID: N9vwVKmaTTCpjSDZKQwMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="152835100"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Jun 2025 15:15:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVdpG-000XQs-20;
	Sat, 28 Jun 2025 22:15:10 +0000
Date: Sun, 29 Jun 2025 06:14:28 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
	eric.dumazet@gmail.com, Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next 3/4] tcp: move tcp_memory_allocated into
 net_aligned_data
Message-ID: <202506290837.0mGwXgmy-lkp@intel.com>
References: <20250627200551.348096-4-edumazet@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627200551.348096-4-edumazet@google.com>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-add-struct-net_aligned_data/20250628-040753
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250627200551.348096-4-edumazet%40google.com
patch subject: [PATCH net-next 3/4] tcp: move tcp_memory_allocated into net_aligned_data
config: riscv-randconfig-002-20250629 (https://download.01.org/0day-ci/archive/20250629/202506290837.0mGwXgmy-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290837.0mGwXgmy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290837.0mGwXgmy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/hotdata.c:5:
   include/net/aligned_data.h:12:9: error: unknown type name 'atomic64_t'
      12 |         atomic64_t      net_cookie ____cacheline_aligned_in_smp;
         |         ^~~~~~~~~~
>> include/net/aligned_data.h:14:9: error: unknown type name 'atomic_long_t'
      14 |         atomic_long_t tcp_memory_allocated ____cacheline_aligned_in_smp;
         |         ^~~~~~~~~~~~~


vim +/atomic_long_t +14 include/net/aligned_data.h

     6	
     7	/* Structure holding cacheline aligned fields on SMP builds.
     8	 * Each field or group should have an ____cacheline_aligned_in_smp
     9	 * attribute to ensure no accidental false sharing can happen.
    10	 */
    11	struct net_aligned_data {
    12		atomic64_t	net_cookie ____cacheline_aligned_in_smp;
    13	#if defined(CONFIG_INET)
  > 14		atomic_long_t tcp_memory_allocated ____cacheline_aligned_in_smp;
    15	#endif
    16	};
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
