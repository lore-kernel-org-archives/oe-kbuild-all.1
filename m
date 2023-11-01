Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B98333E7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIia/fxT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698874043; x=1730410043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vvc4zxaF2jHdB5ttg4cf4Zt+cw2B1Cg5jwqZeEaviY8=;
  b=gIia/fxTaVqjarfyHh9a/EH4/6V5h9ZXzPHSTtkn2N8LGnMAtQWCpV11
   5jUDrKf+g/X06Y+iDlXyioDWUnOf4Rs74LpqnOf1EQ+fg91qSN6JIiMlv
   Hl7kUFkfmiSsgVjqPnS6MC4mt8gzga/XEK/yDAWuuh8WFRrw+FEnzAqGK
   J8977LPMoWqeMPtrJ39ZEyPobw9Kh1Cdq8quGxZVU0iwFEyMfvQr6kMqv
   8MAqpEYj1bew1U8e+zjR7X+xTyurVf1GMv+Y9gG7DZ0S/N76HujMpHEQd
   hml/mb/vbahKyBimRK8c6nDA6LFFz0Y/YFGvOcS1Pzw0Av530S3j/akug
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1499996"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="1499996"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 14:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="710927215"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="710927215"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Nov 2023 14:27:16 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyIk6-0000xk-0T;
	Wed, 01 Nov 2023 21:27:14 +0000
Date: Thu, 2 Nov 2023 05:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: net/core/filter.c:11662:17: warning: no previous declaration for
 'bpf_dynptr_from_xdp'
Message-ID: <202311020505.2zgymACj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d461b291e65938f15f56fe58da2303b07578a76
commit: 05421aecd4ed65da0dc17b0c3c13779ef334e9e5 bpf: Add xdp dynptrs
date:   8 months ago
config: i386-defconfig (https://download.01.org/0day-ci/archive/20231102/202311020505.2zgymACj-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311020505.2zgymACj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311020505.2zgymACj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/filter.c:11649:17: warning: no previous declaration for 'bpf_dynptr_from_skb' [-Wmissing-declarations]
    __bpf_kfunc int bpf_dynptr_from_skb(struct sk_buff *skb, u64 flags,
                    ^~~~~~~~~~~~~~~~~~~
>> net/core/filter.c:11662:17: warning: no previous declaration for 'bpf_dynptr_from_xdp' [-Wmissing-declarations]
    __bpf_kfunc int bpf_dynptr_from_xdp(struct xdp_buff *xdp, u64 flags,
                    ^~~~~~~~~~~~~~~~~~~


vim +/bpf_dynptr_from_xdp +11662 net/core/filter.c

 11661	
 11662	__bpf_kfunc int bpf_dynptr_from_xdp(struct xdp_buff *xdp, u64 flags,
 11663					    struct bpf_dynptr_kern *ptr__uninit)
 11664	{
 11665		if (flags) {
 11666			bpf_dynptr_set_null(ptr__uninit);
 11667			return -EINVAL;
 11668		}
 11669	
 11670		bpf_dynptr_init(ptr__uninit, xdp, BPF_DYNPTR_TYPE_XDP, 0, xdp_get_buff_len(xdp));
 11671	
 11672		return 0;
 11673	}
 11674	__diag_pop();
 11675	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
