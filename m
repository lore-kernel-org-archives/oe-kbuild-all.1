Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BB0383
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 00:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695430203; x=1726966203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dPZhmhrntnH7zUyXfTPUXy+JptzUIWjCZzhh+f7B0Fw=;
  b=HuvtO0iFtbRa+YPd1TtvaxE2theUN+lhxIn0F0Lbc7hRe32qWFXAKYO/
   BjCSjC5swY1REccmqVC4ol9EKf70tNt2v092IASoWz0B2prkt4HS2MfSe
   3xlu5+hE9Ve9DT9MP1Rpf5wiMIvSQbWnF2/ZslXkR5VnhtvlElfnaElgb
   OzZiIfQfKx44zPF/L3MQquDfF691u8WFbwkaQzG7fDpYPTvoaLONs3PLj
   cTw2Jl9sdCRWiH0DtJdtXcp3Won75K+v9BSwLL6t4JAVG0YgSyAHc3Yth
   3HZ5bkt4QGnGcBm/PDs+N2RuM93GwKEvaAh5Fi7QsfZ31OjXEwMljWFLO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="384810239"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="384810239"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 17:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="921365917"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="921365917"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Sep 2023 17:49:55 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjqqG-0001X7-2I;
	Sat, 23 Sep 2023 00:49:53 +0000
Date: Sat, 23 Sep 2023 08:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: net/core/filter.c:11662:17: error: no previous declaration for
 'bpf_dynptr_from_xdp'
Message-ID: <202309230815.jkPv5f5j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joanne,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d90b0276af8f25a0b8ae081a30d1b2a61263393b
commit: 05421aecd4ed65da0dc17b0c3c13779ef334e9e5 bpf: Add xdp dynptrs
date:   7 months ago
config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/0day-ci/archive/20230923/202309230815.jkPv5f5j-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309230815.jkPv5f5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309230815.jkPv5f5j-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/filter.c:11649:17: error: no previous declaration for 'bpf_dynptr_from_skb' [-Werror=missing-declarations]
    __bpf_kfunc int bpf_dynptr_from_skb(struct sk_buff *skb, u64 flags,
                    ^~~~~~~~~~~~~~~~~~~
>> net/core/filter.c:11662:17: error: no previous declaration for 'bpf_dynptr_from_xdp' [-Werror=missing-declarations]
    __bpf_kfunc int bpf_dynptr_from_xdp(struct xdp_buff *xdp, u64 flags,
                    ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/bpf_dynptr_from_xdp +11662 net/core/filter.c

 11645	
 11646	__diag_push();
 11647	__diag_ignore_all("-Wmissing-prototypes",
 11648			  "Global functions as their definitions will be in vmlinux BTF");
 11649	__bpf_kfunc int bpf_dynptr_from_skb(struct sk_buff *skb, u64 flags,
 11650					    struct bpf_dynptr_kern *ptr__uninit)
 11651	{
 11652		if (flags) {
 11653			bpf_dynptr_set_null(ptr__uninit);
 11654			return -EINVAL;
 11655		}
 11656	
 11657		bpf_dynptr_init(ptr__uninit, skb, BPF_DYNPTR_TYPE_SKB, 0, skb->len);
 11658	
 11659		return 0;
 11660	}
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
