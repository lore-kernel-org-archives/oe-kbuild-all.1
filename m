Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F8C1EEE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 20:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764104301; cv=none; b=D98rlaKpKkxKMZwit97CWjT7R2PoXugUJk1X7aZU573s9zWWRL4YHprE3MgGMhD/ddGKOHKAKwPg4c6an53TWqDn98Z6GbCU9M90JijfhQ52q7pmfOBOojDbeGPkyACncYmVxDxMuGIv+rV6YObT+MUIIEFeQN0AMjfy1oGYIeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764104301; c=relaxed/simple;
	bh=L2pF+jS+BRJC+UyyDYoi8uc4qbbZUIfBZlVxwU+COBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5a3pERp03TsojykWvlKw+CxbKc99u+hy8MJaGS25GigRr46djgJXIpRPfJIJVzVApqNkxSSr87JCKEO3FdJ2Y2da0APJ/BHUNSDQdBBipf5yyPh71nYwGjUrOBrThCw2WoEwAs41VdQg+qocWXQLTYBp6H5EtFzm4K8KA1eS3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcCjbwfM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcCjbwfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764104300; x=1795640300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L2pF+jS+BRJC+UyyDYoi8uc4qbbZUIfBZlVxwU+COBU=;
  b=YcCjbwfMSCO1v3yYYyzRNeo1zWmDTVNnKdTUC487uaXG8bPPmdGHJn8e
   ZOuYyTfU/vLqty5PrJ000T972CBZ3wP9P9q6fVKw7Y0YZTSbI8YQtPAyg
   TKe/3gg/3bofYsMzAHV5wCzXgfET2PNaG3xpqTpC5NGFHVjYVQ2a8ObFE
   sTy1oVCrTn6r1V/kYvvMBmU1vLWZaU08KQMlu49VBQBlKSUXgeUh4OgaO
   15zv0V4uIGxXPLSwosy9l0f8qHreyac6GeF0xKO/Q2a+FKVUfhBgv/m7a
   qiv8C2wJPHK/MAIcOFmlDrMvbzhb9/dh2CnC0tyMZqGNNlobUAY7lRTc3
   g==;
X-CSE-ConnectionGUID: zmB0OeYKREesvIgWWgQQ/w==
X-CSE-MsgGUID: 2nNRz8MQTjm0FD2iB/J0tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83524433"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="83524433"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 12:58:17 -0800
X-CSE-ConnectionGUID: LobwiEWvRdW3MDlWESOMRw==
X-CSE-MsgGUID: WDnDyDZuQAmRhEKs+byv7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="216103516"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2025 12:58:15 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO073-000000002Ft-0vIs;
	Tue, 25 Nov 2025 20:58:13 +0000
Date: Wed, 26 Nov 2025 04:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: mctp: test: move TX packetqueue from dst
 to dev
Message-ID: <202511260426.yF8pjfPX-lkp@intel.com>
References: <20251125-dev-mctp-test-tx-queue-v1-1-3a1daa4e99e1@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-dev-mctp-test-tx-queue-v1-1-3a1daa4e99e1@codeconstruct.com.au>

Hi Jeremy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e05021a829b834fecbd42b173e55382416571b2c]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Kerr/net-mctp-test-move-TX-packetqueue-from-dst-to-dev/20251125-095938
base:   e05021a829b834fecbd42b173e55382416571b2c
patch link:    https://lore.kernel.org/r/20251125-dev-mctp-test-tx-queue-v1-1-3a1daa4e99e1%40codeconstruct.com.au
patch subject: [PATCH net-next] net: mctp: test: move TX packetqueue from dst to dev
config: riscv-randconfig-r072-20251126 (https://download.01.org/0day-ci/archive/20251126/202511260426.yF8pjfPX-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260426.yF8pjfPX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260426.yF8pjfPX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/mctp/test/utils.c:96:27: warning: 'test_pktqueue_magic' defined but not used [-Wunused-const-variable=]
      96 | static const unsigned int test_pktqueue_magic = 0x5f713aef;
         |                           ^~~~~~~~~~~~~~~~~~~


vim +/test_pktqueue_magic +96 net/mctp/test/utils.c

80bcf05e54e0e2 Jeremy Kerr 2025-07-02  95  
80bcf05e54e0e2 Jeremy Kerr 2025-07-02 @96  static const unsigned int test_pktqueue_magic = 0x5f713aef;
80bcf05e54e0e2 Jeremy Kerr 2025-07-02  97  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
