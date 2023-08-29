Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492DE366
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693270235; x=1724806235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cKfUSVF6XCgjGyVKW/Yh85oDuRd/ovfcNntJohJC/SA=;
  b=g41FPg320CPdQw8uwU2qcADndHkDnYr5eFBn7fEs8IY0DvAxcgvEXi6x
   Z7gZnckP7hjM4k6PyNFg5D2Jnlh1UFnjzrQ4UssFrZpG6tDkQdInb+b5z
   00ybGcugFAvEqS8wt5C6OhXmUKXsUjOcfofg8PyCKIS0WAyaikzueggaU
   BWGpZAd8HVU0zp90PMqTvEPOscBftVTnmzCovIOz6e57xUTn7GclONwDx
   POJkkKeq5/fjeWeob+V7BbfFvNepCGh2qc2kcYJOG8qRX01/FxApCi6Rz
   0lAqgpCeSdYYFHqtic86LY+s8Srph7rxm//b80FM6+jqPZAym5vQf+cN2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="441591684"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="441591684"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 17:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="715337773"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="715337773"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Aug 2023 17:50:32 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qamwC-0008F1-0b;
	Tue, 29 Aug 2023 00:50:32 +0000
Date: Tue, 29 Aug 2023 08:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.5/bbr3 1/1] net/ipv4/tcp_bbr.c:1315:5: warning: no previous
 prototype for 'bbr_ecn_cut'
Message-ID: <202308290834.BxWjxgec-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.5/bbr3
head:   bcb27e4adacda606c76349bfba3305db6ea83887
commit: bcb27e4adacda606c76349bfba3305db6ea83887 [1/1] bbr3-6.5: initial import
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230829/202308290834.BxWjxgec-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290834.BxWjxgec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290834.BxWjxgec-lkp@intel.com/

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
