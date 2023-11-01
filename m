Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7890414AAE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 20:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfyDSz/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698869875; x=1730405875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wg7UhnIKFEqfPqnbmjMDLHnz3wzQPmRjvVaUZhmPhv0=;
  b=JfyDSz/xyQdJbRlAkjk54lkphG+P9F/G7aVD0XlQe9nTlLKQRsDbdds4
   p9wplAeFTl69g6ND8CnK8uDD1LQ+avG/eRm4afULEhLOZADR6KCDKfi1G
   ukHxXr5tFRcJXg/rSo17StAdnSInFTRxpXodNovZ8I+QDalYwX+v5f2PB
   v2SQ+FfvcQDYc+qw+hHnvLQ0JTWUypyK+NVCtVrAZPw3FrSqGGOVz4dLJ
   7z+itwNtXFKFPFPaJ4Job3gotYK8VtZSNF9KvonRl/iwzq1oKlfDpF+gF
   nfDbv+WiNViGhOtfR07Yg1VvQHPyI6dvqoe/KiqbUGSiMj47rgNjCRNK3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="474814738"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="474814738"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 13:17:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="710914317"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="710914317"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Nov 2023 13:17:53 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyHew-0000w8-2C;
	Wed, 01 Nov 2023 20:17:50 +0000
Date: Thu, 2 Nov 2023 04:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/bbr3 1/1] net/ipv4/tcp_bbr.c:1315:5: warning: no previous
 prototype for 'bbr_ecn_cut'
Message-ID: <202311020459.eJphPAd2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/bbr3
head:   5d8376057790252b220d3a5eea2b628106f69d38
commit: 5d8376057790252b220d3a5eea2b628106f69d38 [1/1] tcp/bbr3: initial import
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231102/202311020459.eJphPAd2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311020459.eJphPAd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311020459.eJphPAd2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_bbr.c:1315:5: warning: no previous prototype for 'bbr_ecn_cut' [-Wmissing-prototypes]
    1315 | u32 bbr_ecn_cut(struct sock *sk)
         |     ^~~~~~~~~~~
>> net/ipv4/tcp_bbr.c:2036:18: warning: no previous prototype for 'bbr_main' [-Wmissing-prototypes]
    2036 | __bpf_kfunc void bbr_main(struct sock *sk, const struct rate_sample *rs)
         |                  ^~~~~~~~
   net/ipv4/tcp_bbr.c: In function 'bbr_main':
>> net/ipv4/tcp_bbr.c:2042:17: warning: variable 'round_delivered' set but not used [-Wunused-but-set-variable]
    2042 |         u32 bw, round_delivered;
         |                 ^~~~~~~~~~~~~~~


vim +/bbr_ecn_cut +1315 net/ipv4/tcp_bbr.c

  1313	
  1314	/* How should we multiplicatively cut bw or inflight limits based on ECN? */
> 1315	u32 bbr_ecn_cut(struct sock *sk)
  1316	{
  1317		struct bbr *bbr = inet_csk_ca(sk);
  1318	
  1319		return BBR_UNIT -
  1320			((bbr->ecn_alpha * bbr_param(sk, ecn_factor)) >> BBR_SCALE);
  1321	}
  1322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
