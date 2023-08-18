Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8739F11CA7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 05:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692336054; x=1723872054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pc8skSgqvI0jZyRSGkKNJvsoFZDcMpnbDIPjb0OmGz8=;
  b=Ay1z0oWV4tH1h3arfS8rVgBJtoZO4Vqgg0wPUVZMCqjrlmbOpraf3Tcb
   q4kVDDsE4TlUWOx8YU+sS6sFO+g8XQvsWB3yxNqaaEaVBPuE8H7TD6/XG
   sc0IZ+wx4XLuQtzPQ+1Pgr1TJHPaJVZZVtub95kWFG9i7g40nOe+KjiMc
   L4i8wRbCxIn8O83uRIU8C+zafkf1mxA+QUqcXSsQzI6t8yCvqB0sTEQTQ
   ba09URAG8Kzx14Y4fNpDSuQX4wfgJ2xCSXJyOuwIZc64iUzFsczyboyeU
   7rnWIfrm5RFztZhJ9WY2KR8sn0H2jpe3g0r+n8bUcjRUrrjtFuyl/AYmG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="353320918"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="353320918"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 22:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="711858235"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="711858235"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Aug 2023 22:20:51 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWrt8-00028A-36;
	Fri, 18 Aug 2023 05:19:43 +0000
Date: Fri, 18 Aug 2023 13:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: net/core/xdp.c:725:5: error: no previous declaration for
 'bpf_xdp_metadata_rx_timestamp'
Message-ID: <202308181346.WLEAMI1Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   16931859a6500d360b90aeacab3b505a3560a3ed
commit: 3d76a4d3d4e591af3e789698affaad88a5a8e8ab bpf: XDP metadata RX kfuncs
date:   7 months ago
config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/0day-ci/archive/20230818/202308181346.WLEAMI1Y-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181346.WLEAMI1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181346.WLEAMI1Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/xdp.c:725:5: error: no previous declaration for 'bpf_xdp_metadata_rx_timestamp' [-Werror=missing-declarations]
    int bpf_xdp_metadata_rx_timestamp(const struct xdp_md *ctx, u64 *timestamp)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/xdp.c:737:5: error: no previous declaration for 'bpf_xdp_metadata_rx_hash' [-Werror=missing-declarations]
    int bpf_xdp_metadata_rx_hash(const struct xdp_md *ctx, u32 *hash)
        ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/bpf_xdp_metadata_rx_timestamp +725 net/core/xdp.c

   713	
   714	__diag_push();
   715	__diag_ignore_all("-Wmissing-prototypes",
   716			  "Global functions as their definitions will be in vmlinux BTF");
   717	
   718	/**
   719	 * bpf_xdp_metadata_rx_timestamp - Read XDP frame RX timestamp.
   720	 * @ctx: XDP context pointer.
   721	 * @timestamp: Return value pointer.
   722	 *
   723	 * Returns 0 on success or ``-errno`` on error.
   724	 */
 > 725	int bpf_xdp_metadata_rx_timestamp(const struct xdp_md *ctx, u64 *timestamp)
   726	{
   727		return -EOPNOTSUPP;
   728	}
   729	
   730	/**
   731	 * bpf_xdp_metadata_rx_hash - Read XDP frame RX hash.
   732	 * @ctx: XDP context pointer.
   733	 * @hash: Return value pointer.
   734	 *
   735	 * Returns 0 on success or ``-errno`` on error.
   736	 */
 > 737	int bpf_xdp_metadata_rx_hash(const struct xdp_md *ctx, u32 *hash)
   738	{
   739		return -EOPNOTSUPP;
   740	}
   741	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
