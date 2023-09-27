Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3547498
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 13:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695821330; x=1727357330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5gyi8hrw919q7WpgyonI4lpDUM5+BqLQCyygK9Hc2IA=;
  b=Wj6I0wtbayhkPnl7hK3qF0jUUC2LpD2Iqc3vUP79zDjx51nHHt/QrqrZ
   vYct2Io42/8BaaCOtz/BOln8fNRULpnCdQuHl4HsakLN6ODQNmaSzAs38
   gUOlt6PMjV+qgESkXO7+uSpuNlZ4noVRJLk6wgIXckDsT/qV0kr3H3O08
   A2nRVkMiVsZzrC/R2OJHSB5BMD+7Uu0MdUn5SYw0Ce1KYrYOqWI6zcSgv
   NsY1q+xAFVumPn4ZFwbPQPlsK6c9C3xEEKHBNonSj2gThmKfV8VVW0Ck5
   gl/wEpGQM8hoChiSzOxEBXfioFeuA+ZK5i6donuSTuH08m69dC+mC5ttM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="445956850"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="445956850"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="749202138"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="749202138"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 27 Sep 2023 06:28:48 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlUar-0000EH-36;
	Wed, 27 Sep 2023 13:28:45 +0000
Date: Wed, 27 Sep 2023 21:27:59 +0800
From: kernel test robot <lkp@intel.com>
To: Larysa Zaremba <larysa.zaremba@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v2 12/24] xdp: Add checksum hint
Message-ID: <202309272156.T4ffutLJ-lkp@intel.com>
References: <20230927075124.23941-13-larysa.zaremba@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927075124.23941-13-larysa.zaremba@intel.com>

Hi Larysa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Larysa-Zaremba/ice-make-RX-hash-reading-code-more-reusable/20230927-161804
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230927075124.23941-13-larysa.zaremba%40intel.com
patch subject: [RFC bpf-next v2 12/24] xdp: Add checksum hint
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230927/202309272156.T4ffutLJ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309272156.T4ffutLJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309272156.T4ffutLJ-lkp@intel.com/

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
>> net/core/xdp.c:790:17: warning: no previous declaration for 'bpf_xdp_metadata_rx_csum' [-Wmissing-declarations]
    __bpf_kfunc int bpf_xdp_metadata_rx_csum(const struct xdp_md *ctx,
                    ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_xdp_metadata_rx_csum +790 net/core/xdp.c

   698	
   699	__diag_push();
   700	__diag_ignore_all("-Wmissing-prototypes",
   701			  "Global functions as their definitions will be in vmlinux BTF");
   702	
   703	/**
   704	 * bpf_xdp_metadata_rx_timestamp - Read XDP frame RX timestamp.
   705	 * @ctx: XDP context pointer.
   706	 * @timestamp: Return value pointer.
   707	 *
   708	 * Return:
   709	 * * Returns 0 on success or ``-errno`` on error.
   710	 * * ``-EOPNOTSUPP`` : means device driver does not implement kfunc
   711	 * * ``-ENODATA``    : means no RX-timestamp available for this frame
   712	 */
 > 713	__bpf_kfunc int bpf_xdp_metadata_rx_timestamp(const struct xdp_md *ctx, u64 *timestamp)
   714	{
   715		return -EOPNOTSUPP;
   716	}
   717	
   718	/**
   719	 * bpf_xdp_metadata_rx_hash - Read XDP frame RX hash.
   720	 * @ctx: XDP context pointer.
   721	 * @hash: Return value pointer.
   722	 * @rss_type: Return value pointer for RSS type.
   723	 *
   724	 * The RSS hash type (@rss_type) specifies what portion of packet headers NIC
   725	 * hardware used when calculating RSS hash value.  The RSS type can be decoded
   726	 * via &enum xdp_rss_hash_type either matching on individual L3/L4 bits
   727	 * ``XDP_RSS_L*`` or by combined traditional *RSS Hashing Types*
   728	 * ``XDP_RSS_TYPE_L*``.
   729	 *
   730	 * Return:
   731	 * * Returns 0 on success or ``-errno`` on error.
   732	 * * ``-EOPNOTSUPP`` : means device driver doesn't implement kfunc
   733	 * * ``-ENODATA``    : means no RX-hash available for this frame
   734	 */
   735	__bpf_kfunc int bpf_xdp_metadata_rx_hash(const struct xdp_md *ctx, u32 *hash,
   736						 enum xdp_rss_hash_type *rss_type)
   737	{
   738		return -EOPNOTSUPP;
   739	}
   740	
   741	/**
   742	 * bpf_xdp_metadata_rx_vlan_tag - Get XDP packet outermost VLAN tag
   743	 * @ctx: XDP context pointer.
   744	 * @vlan_proto: Destination pointer for VLAN Tag protocol identifier (TPID).
   745	 * @vlan_tci: Destination pointer for VLAN TCI (VID + DEI + PCP)
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
   768	__bpf_kfunc int bpf_xdp_metadata_rx_vlan_tag(const struct xdp_md *ctx,
   769						     __be16 *vlan_proto, u16 *vlan_tci)
   770	{
   771		return -EOPNOTSUPP;
   772	}
   773	
   774	/**
   775	 * bpf_xdp_metadata_rx_csum - Get checksum status with additional info.
   776	 * @ctx: XDP context pointer.
   777	 * @csum_status: Destination for checksum status.
   778	 * @csum: Destination for complete checksum.
   779	 *
   780	 * Status (@csum_status) is a bitfield that informs, what checksum
   781	 * processing was performed. If ``XDP_CHECKSUM_COMPLETE`` in status is set,
   782	 * second argument (@csum) contains a checksum, calculated over the entire
   783	 * packet.
   784	 *
   785	 * Return:
   786	 * * Returns 0 on success or ``-errno`` on error.
   787	 * * ``-EOPNOTSUPP`` : device driver doesn't implement kfunc
   788	 * * ``-ENODATA``    : Checksum status is unknown
   789	 */
 > 790	__bpf_kfunc int bpf_xdp_metadata_rx_csum(const struct xdp_md *ctx,
   791						 enum xdp_csum_status *csum_status,
   792						 __wsum *csum)
   793	{
   794		return -EOPNOTSUPP;
   795	}
   796	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
