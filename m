Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2998330F96
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 21:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694207206; x=1725743206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2ME6j4xqfoifP/DDypeWi4FcNKJSmVZsKFYGzHWRIA=;
  b=Pv7mhgSFuABiY5AbtePfgxIMW+HQF90ZRrImLI8HFtzPUGVHcMUuNbKY
   1d1cbLxH392rk44KCcpW6iYscwJWo8GsIFAjRkfPvVhfgZ+v7ckSYaXhL
   +KoWnf56hscmGwVYMZLJTpoIIK8qRRd2do7bZ9tGgfInJOuGOwaqL3N4a
   u+M3ZoM2i1tpCgeuDEtE0VSy9qqp5POncQNYQkusuDrxAfVC72TuO/nJP
   LF1YbjWPvDPYcgJ4gkEL5T1WwkbCLe7FdWGTDmnAggppCt8+yOhuKqyv+
   5VmVxmKx/pgsrI1YNqBNvd1HWe/HofxBClC1QdcioXAgC5ZwJ9tJz5YF7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377656121"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="377656121"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 14:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="745738344"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="745738344"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Sep 2023 14:06:30 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeigO-0002cY-0d;
	Fri, 08 Sep 2023 21:06:28 +0000
Date: Sat, 9 Sep 2023 05:06:15 +0800
From: kernel test robot <lkp@intel.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: net/core/filter.c:11662:17: error: no previous declaration for
 'bpf_dynptr_from_xdp'
Message-ID: <202309090517.TVogaAQ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ca9c7abf9502e108fae0e34181e01b1a20bc439f
commit: 05421aecd4ed65da0dc17b0c3c13779ef334e9e5 bpf: Add xdp dynptrs
date:   6 months ago
config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/0day-ci/archive/20230909/202309090517.TVogaAQ3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090517.TVogaAQ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090517.TVogaAQ3-lkp@intel.com/

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
