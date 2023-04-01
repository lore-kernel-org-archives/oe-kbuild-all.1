Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1458F66
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 20:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680382304; x=1711918304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PhC0D/MVKAqAm8d7dc7D/3KzxIe4Z5ITGL1DVWTuTTw=;
  b=YRWxBLdwdzZfHyYPHyKgYyUuU6le9XOM5qs2ZPJaOT2xup2KsSBTT/Yi
   wPjMXE6DETc/kNFYGu6B96Twzo3wk/7PNnYam8CvML1VAiHesMTqTqTRU
   IL0j7P01fBoGBX2GHZ6L5xS0MJVPYY2t1D7feBYS5ss7p/pgecWdW5oE8
   E/HMJk9QW7wZAtbpc7kQnPUDkgVXa3Toc/gNz94XlGh9ScyF4h+f+OR/V
   BDhDgt/gbka2IVKMHD8mxPn2TiXwRhWQ0pB2bWr+Q7DcRhF6EXm1v5Rel
   duSvRdD6u1zbgZkqriS0iKiOREuXFHB57UqRHYAmE0tX9ThkbZ7greAs7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="369481164"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="369481164"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 13:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="1015229353"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="1015229353"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Apr 2023 13:51:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piiCI-000N2B-1r;
	Sat, 01 Apr 2023 20:51:38 +0000
Date: Sun, 2 Apr 2023 04:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrig <cehrig@cloudflare.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, cehrig@cloudflare.com,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/3] bpf,fou: Add bpf_skb_{set,get}_fou_encap
 kfuncs
Message-ID: <202304020430.KvQEwmII-lkp@intel.com>
References: <65b05e447b28d32fb0e07275dc988989f358da2c.1680379518.git.cehrig@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65b05e447b28d32fb0e07275dc988989f358da2c.1680379518.git.cehrig@cloudflare.com>

Hi Christian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Ehrig/ipip-ip_tunnel-sit-Add-FOU-support-for-externally-controlled-ipip-devices/20230402-033512
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/65b05e447b28d32fb0e07275dc988989f358da2c.1680379518.git.cehrig%40cloudflare.com
patch subject: [PATCH bpf-next 2/3] bpf,fou: Add bpf_skb_{set,get}_fou_encap kfuncs
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20230402/202304020430.KvQEwmII-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/111ef54093a724110ca63e6a6279e60dd669094b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Ehrig/ipip-ip_tunnel-sit-Add-FOU-support-for-externally-controlled-ipip-devices/20230402-033512
        git checkout 111ef54093a724110ca63e6a6279e60dd669094b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304020430.KvQEwmII-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/fou_bpf.c:114:5: warning: no previous prototype for 'register_fou_bpf' [-Wmissing-prototypes]
     114 | int register_fou_bpf(void)
         |     ^~~~~~~~~~~~~~~~


vim +/register_fou_bpf +114 net/ipv4/fou_bpf.c

   113	
 > 114	int register_fou_bpf(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
