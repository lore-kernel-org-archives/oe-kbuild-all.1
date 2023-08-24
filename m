Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1EC8832
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 22:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692914593; x=1724450593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LcPob069O8rIz/dePybTnJRh5NIPmWnoPGnFIL8RC40=;
  b=IRZfzAnoPPDqpXl9EFIR41XViDOd6hWwTNM5YSIjPcsi2HV7/SzLx0SD
   qPWozZcIfXhO8AaPm73xuE4XDTBxYww2RLiBrG6LIpRhiyzyhKG7CZYXq
   8Jt0H8wI/KLzFd3sKi5O12l9TNTYLwWyHrNRYxD1ZSlmsCJV17vh6T9+U
   8SZZu+sRarnnvHbu4v8y9rRNdmV4ciXQYcnh7V7yq0vpop8d+oOLwNVmz
   a981vKsfrwoEyuMnO9VEwwHkLTO4Ci3Mgmf0Hl+BLLDniDSRMT7rbpIvg
   /hSNebVeHlZcRxoelKla4OdnP8ujriQVJRTuT/el2a/htWLsurHakMAfP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354897006"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="354897006"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 15:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="737231527"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="737231527"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 24 Aug 2023 15:03:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZIPu-0002zY-1Y;
	Thu, 24 Aug 2023 22:03:05 +0000
Date: Fri, 25 Aug 2023 06:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: Larysa Zaremba <larysa.zaremba@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 09/23] xdp: Add VLAN tag hint
Message-ID: <202308250535.zDjN5U2y-lkp@intel.com>
References: <20230824192703.712881-10-larysa.zaremba@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824192703.712881-10-larysa.zaremba@intel.com>

Hi Larysa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Larysa-Zaremba/ice-make-RX-hash-reading-code-more-reusable/20230825-034643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230824192703.712881-10-larysa.zaremba%40intel.com
patch subject: [RFC bpf-next 09/23] xdp: Add VLAN tag hint
config: x86_64-randconfig-r013-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250535.zDjN5U2y-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250535.zDjN5U2y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250535.zDjN5U2y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/xdp.c:713:17: warning: no previous declaration for 'bpf_xdp_metadata_rx_timestamp' [-Wmissing-declarations]
    __bpf_kfunc int bpf_xdp_metadata_rx_timestamp(const struct xdp_md *ctx, u64 *timestamp)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/xdp.c:735:17: warning: no previous declaration for 'bpf_xdp_metadata_rx_hash' [-Wmissing-declarations]
    __bpf_kfunc int bpf_xdp_metadata_rx_hash(const struct xdp_md *ctx, u32 *hash,
                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/xdp.c:768:17: warning: no previous declaration for 'bpf_xdp_metadata_rx_vlan_tag' [-Wmissing-declarations]
    __bpf_kfunc int bpf_xdp_metadata_rx_vlan_tag(const struct xdp_md *ctx,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_xdp_metadata_rx_vlan_tag +768 net/core/xdp.c

   740	
   741	/**
   742	 * bpf_xdp_metadata_rx_vlan_tag - Get XDP packet outermost VLAN tag
   743	 * @ctx: XDP context pointer.
   744	 * @vlan_tci: Destination pointer for VLAN TCI (VID + DEI + PCP)
   745	 * @vlan_proto: Destination pointer for VLAN Tag protocol identifier (TPID).
   746	 *
   747	 * In case of success, ``vlan_proto`` contains *Tag protocol identifier (TPID)*,
   748	 * usually ``ETH_P_8021Q`` or ``ETH_P_8021AD``, but some networks can use
   749	 * custom TPIDs. ``vlan_proto`` is stored in **network byte order (BE)**
   750	 * and should be used as follows:
   751	 * ``if (vlan_proto == bpf_htons(ETH_P_8021Q)) do_something();``
   752	 *
   753	 * ``vlan_tci`` contains the remaining 16 bits of a VLAN tag.
   754	 * Driver is expected to provide those in **host byte order (usually LE)**,
   755	 * so the bpf program should not perform byte conversion.
   756	 * According to 802.1Q standard, *VLAN TCI (Tag control information)*
   757	 * is a bit field that contains:
   758	 * *VLAN identifier (VID)* that can be read with ``vlan_tci & 0xfff``,
   759	 * *Drop eligible indicator (DEI)* - 1 bit,
   760	 * *Priority code point (PCP)* - 3 bits.
   761	 * For detailed meaning of DEI and PCP, please refer to other sources.
   762	 *
   763	 * Return:
   764	 * * Returns 0 on success or ``-errno`` on error.
   765	 * * ``-EOPNOTSUPP`` : device driver doesn't implement kfunc
   766	 * * ``-ENODATA``    : VLAN tag was not stripped or is not available
   767	 */
 > 768	__bpf_kfunc int bpf_xdp_metadata_rx_vlan_tag(const struct xdp_md *ctx,
   769						     u16 *vlan_tci,
   770						     __be16 *vlan_proto)
   771	{
   772		return -EOPNOTSUPP;
   773	}
   774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
