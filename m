Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C10E57C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 12:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695816937; x=1727352937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sox7JQDUklOdpkG3KqUrz+WssSuqipX0YPeI7dDUvRw=;
  b=APFABF376zIg5gBJq8t9YHLDmoDkHJYB/LsfvVrGTKviQnWejHxj6j1p
   91gJ4OFL4c1IG1zugn1dxufuWhf5PXS5M98Ss3ctA2YfZHUxcedvP1LUj
   HHabuKzlPEFfUM6vBZ9BLcYS5LUn8fOFPVEwMGTY/giZp1juyHbYq/yI2
   VQdCCESYzg7i8Cb8QCUAUeTTnPN5cINHPkBXBmcc3PwsuIiAdg3bHFNpe
   9/EOrrTskYKujdWbj+oUa3tERpc06OoWb12TWXVyIUP+zzSIxpOxWmGBK
   DK+4DXr7Q+dFFTfeCDSQEQM/SxhshCbZUJ4avV1Vl3ezRUG6AW4jlDnWe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385665292"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="385665292"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 05:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="784301584"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="784301584"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 27 Sep 2023 05:15:36 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlTS1-0000An-2V;
	Wed, 27 Sep 2023 12:15:33 +0000
Date: Wed, 27 Sep 2023 20:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Larysa Zaremba <larysa.zaremba@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v2 09/24] xdp: Add VLAN tag hint
Message-ID: <202309271918.XO2LetMR-lkp@intel.com>
References: <20230927075124.23941-10-larysa.zaremba@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927075124.23941-10-larysa.zaremba@intel.com>

Hi Larysa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Larysa-Zaremba/ice-make-RX-hash-reading-code-more-reusable/20230927-161804
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230927075124.23941-10-larysa.zaremba%40intel.com
patch subject: [RFC bpf-next v2 09/24] xdp: Add VLAN tag hint
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230927/202309271918.XO2LetMR-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309271918.XO2LetMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309271918.XO2LetMR-lkp@intel.com/

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
 > 768	__bpf_kfunc int bpf_xdp_metadata_rx_vlan_tag(const struct xdp_md *ctx,
   769						     __be16 *vlan_proto, u16 *vlan_tci)
   770	{
   771		return -EOPNOTSUPP;
   772	}
   773	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
