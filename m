Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA8C7E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 22:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692917828; x=1724453828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bKiAukH3jAKihibI/OP4kePquPnnadR1YBAi97uaVn8=;
  b=VvFMwI5nci0nwClBRephQeen+CvzT+d+hXLMwZVZM0eJHxPnyIZz4BN+
   g47kKbLnPtZHchzioF9V8soyUlPpcRqO/TWXZo/ulFr6rzYaisQ/GTpaJ
   kw73R7C+B0Gv7QbRCgJ29eSQzYwF1ppoOCgJEfvWVmIDHKyJtuNL1Y0qm
   YC2mvRajDpr7Zf8YhJ2Os+PesKygqrWn0URx5c2fhv0Qpn73y6kvhsMSg
   GEdJJEqXilRNbTn6Q2zYhCgbnT3YM0FZhZ1FoQ9u1q7/fQ38btR1+1cA1
   4IDT3iUG8ac3ah0A5IYnH9WIFREQ1aPwDNnKjVsxZcAwTjWugf31876Wn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="373452604"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="373452604"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 15:56:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="983880533"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="983880533"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2023 15:56:49 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZJFx-00031s-0M;
	Thu, 24 Aug 2023 22:56:49 +0000
Date: Fri, 25 Aug 2023 06:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: Larysa Zaremba <larysa.zaremba@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 12/23] xdp: Add checksum hint
Message-ID: <202308250652.iZvvascZ-lkp@intel.com>
References: <20230824192703.712881-13-larysa.zaremba@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824192703.712881-13-larysa.zaremba@intel.com>

Hi Larysa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Larysa-Zaremba/ice-make-RX-hash-reading-code-more-reusable/20230825-034643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230824192703.712881-13-larysa.zaremba%40intel.com
patch subject: [RFC bpf-next 12/23] xdp: Add checksum hint
config: x86_64-randconfig-r013-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250652.iZvvascZ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250652.iZvvascZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250652.iZvvascZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/xdp.c:713:17: warning: no previous declaration for 'bpf_xdp_metadata_rx_timestamp' [-Wmissing-declarations]
    __bpf_kfunc int bpf_xdp_metadata_rx_timestamp(const struct xdp_md *ctx, u64 *timestamp)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/xdp.c:735:17: warning: no previous declaration for 'bpf_xdp_metadata_rx_hash' [-Wmissing-declarations]
    __bpf_kfunc int bpf_xdp_metadata_rx_hash(const struct xdp_md *ctx, u32 *hash,
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   net/core/xdp.c:768:17: warning: no previous declaration for 'bpf_xdp_metadata_rx_vlan_tag' [-Wmissing-declarations]
    __bpf_kfunc int bpf_xdp_metadata_rx_vlan_tag(const struct xdp_md *ctx,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/xdp.c:791:17: warning: no previous declaration for 'bpf_xdp_metadata_rx_csum' [-Wmissing-declarations]
    __bpf_kfunc int bpf_xdp_metadata_rx_csum(const struct xdp_md *ctx,
                    ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_xdp_metadata_rx_csum +791 net/core/xdp.c

   774	
   775	/**
   776	 * bpf_xdp_metadata_rx_csum - Get checksum status with additional info.
   777	 * @ctx: XDP context pointer.
   778	 * @csum_status: Destination for checksum status.
   779	 * @csum: Destination for complete checksum.
   780	 *
   781	 * Status (@csum_status) is a bitfield that informs, what checksum
   782	 * processing was performed. If ``XDP_CHECKSUM_COMPLETE`` in status is set,
   783	 * second argument (@csum) contains a checksum, calculated over the entire
   784	 * packet.
   785	 *
   786	 * Return:
   787	 * * Returns 0 on success or ``-errno`` on error.
   788	 * * ``-EOPNOTSUPP`` : device driver doesn't implement kfunc
   789	 * * ``-ENODATA``    : Checksum status is unknown
   790	 */
 > 791	__bpf_kfunc int bpf_xdp_metadata_rx_csum(const struct xdp_md *ctx,
   792						 enum xdp_csum_status *csum_status,
   793						 __wsum *csum)
   794	{
   795		return -EOPNOTSUPP;
   796	}
   797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
