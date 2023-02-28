Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0702583
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 08:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677572206; x=1709108206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jvlbirBCen0JoozO0DRtMtM9lsFMy3zjq3zERzZPv4o=;
  b=eNAYB3d27vfAjpBeLgStlOUgqbz6H/9hd4+kdQuZK+4Aob3BTR1m/Ee/
   gebRXGfAYR6OxJpzKa/B3nzNLdSABzMe/C76BnEdJwNadcCJsjcpg4rom
   pLAlplhBOUjSzs75TL9GXHaKzddxEGZzFky/v0kSMRnRffESGw2AVAfyM
   FChbgtAlk8LZNobDYjo1I+Vfa05Gm4H9gyt/mpkx8FArXSRRF8DMopnh2
   AtaW8SSGLLBdk5uTLQjdUHA3ottH4dVhkTrQodC7mu6Lo2EW95enHyxYa
   6HRLL/TqSqY9hSuZQsNX4AUX8uZ0X7ROO+yGSEWF2dOGPtR09zjUjKRf/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="334122093"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="334122093"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 00:16:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="667359132"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="667359132"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Feb 2023 00:16:23 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWv9q-0005Dl-2y;
	Tue, 28 Feb 2023 08:16:22 +0000
Date: Tue, 28 Feb 2023 16:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Xu <dxu@dxuuu.xyz>, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, dsahern@kernel.org, pabeni@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 5/8] bpf: net: ipv6: Add bpf_ipv6_frag_rcv()
 kfunc
Message-ID: <202302281646.GYE1qnGb-lkp@intel.com>
References: <bce083a4293eefb048a700b5a6086e8d8c957700.1677526810.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bce083a4293eefb048a700b5a6086e8d8c957700.1677526810.git.dxu@dxuuu.xyz>

Hi Daniel,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Xu/ip-frags-Return-actual-error-codes-from-ip_check_defrag/20230228-035449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/bce083a4293eefb048a700b5a6086e8d8c957700.1677526810.git.dxu%40dxuuu.xyz
patch subject: [PATCH bpf-next v2 5/8] bpf: net: ipv6: Add bpf_ipv6_frag_rcv() kfunc
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230228/202302281646.GYE1qnGb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/be4610312351d4a658435bd4649a3a830322396d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Xu/ip-frags-Return-actual-error-codes-from-ip_check_defrag/20230228-035449
        git checkout be4610312351d4a658435bd4649a3a830322396d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302281646.GYE1qnGb-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/ipv6/af_inet6.o: in function `inet6_init':
>> af_inet6.c:(.init.text+0x22a): undefined reference to `register_ipv6_reassembly_bpf'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
