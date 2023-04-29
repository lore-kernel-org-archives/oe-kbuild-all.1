Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6328A20F4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 04:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682743975; x=1714279975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cyW8R50dJeibDclffcOiXIzKXijHN6O10td6h53/lLA=;
  b=icMhdA9c7ap5pI496uFdRAt09kYIh1xtBSwFkKCIz1HGXRwKrqFisRsc
   RqXnldb1R6WyGXR3gz8v9N9ZIkQ9QMnBPA7X0E14ihlfCUMyvvKv/ba5+
   KgEAxvhQrm8NyHEASkQ6VrTUkZnwksRdnVLEizTsXDScgRg4hqh0gEH5G
   nY6LLtKzmoXiJvOEJBJIjx0c4YwtYJkNTjbYJPnWiJ5HNYYCCRwxp5jCW
   24VsxvHNkQbNI7c2hmd/OK16WFrov/gJN7182eNvoRZdBTIyfx3Xnv+4L
   1S3feOKLVJ0tAX/g9q5RpxSeg4hf+KIyd30ez80iMUtcNnRaTFEFFGFBJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="332235598"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="332235598"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 21:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="869469023"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="869469023"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Apr 2023 21:52:53 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pscZo-0000th-2o;
	Sat, 29 Apr 2023 04:52:52 +0000
Date: Sat, 29 Apr 2023 12:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.3/bbr2 14/28] net/ipv4/tcp_bbr2.c:1786:17: error: implicit
 declaration of function 'prandom_u32_max'; did you mean 'prandom_u32_state'?
Message-ID: <202304291216.hlo4PGRK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.3/bbr2
head:   1141e6d75dcad649f1a41bd45d4a0415b0a0ecac
commit: be75fd4f4667528d3ca40bfda85b5fa5026fbd2e [14/28] net-tcp_bbr: v2: BBRv2 ("bbr2") congestion control for Linux TCP
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230429/202304291216.hlo4PGRK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/be75fd4f4667528d3ca40bfda85b5fa5026fbd2e
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.3/bbr2
        git checkout be75fd4f4667528d3ca40bfda85b5fa5026fbd2e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291216.hlo4PGRK-lkp@intel.com/

Note: the zen/6.3/bbr2 HEAD 1141e6d75dcad649f1a41bd45d4a0415b0a0ecac builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   net/ipv4/tcp_bbr2.c: In function 'bbr2_pick_probe_wait':
>> net/ipv4/tcp_bbr2.c:1786:17: error: implicit declaration of function 'prandom_u32_max'; did you mean 'prandom_u32_state'? [-Werror=implicit-function-declaration]
    1786 |                 prandom_u32_max(bbr->params.bw_probe_rand_rounds);
         |                 ^~~~~~~~~~~~~~~
         |                 prandom_u32_state
   cc1: some warnings being treated as errors


vim +1786 net/ipv4/tcp_bbr2.c

  1762	
  1763	/* How long do we want to wait before probing for bandwidth (and risking
  1764	 * loss)? We randomize the wait, for better mixing and fairness convergence.
  1765	 *
  1766	 * We bound the Reno-coexistence inter-bw-probe time to be 62-63 round trips.
  1767	 * This is calculated to allow fairness with a 25Mbps, 30ms Reno flow,
  1768	 * (eg 4K video to a broadband user):
  1769	 *   BDP = 25Mbps * .030sec /(1514bytes) = 61.9 packets
  1770	 *
  1771	 * We bound the BBR-native inter-bw-probe wall clock time to be:
  1772	 *  (a) higher than 2 sec: to try to avoid causing loss for a long enough time
  1773	 *      to allow Reno at 30ms to get 4K video bw, the inter-bw-probe time must
  1774	 *      be at least: 25Mbps * .030sec / (1514bytes) * 0.030sec = 1.9secs
  1775	 *  (b) lower than 3 sec: to ensure flows can start probing in a reasonable
  1776	 *      amount of time to discover unutilized bw on human-scale interactive
  1777	 *      time-scales (e.g. perhaps traffic from a web page download that we
  1778	 *      were competing with is now complete).
  1779	 */
  1780	static void bbr2_pick_probe_wait(struct sock *sk)
  1781	{
  1782		struct bbr *bbr = inet_csk_ca(sk);
  1783	
  1784		/* Decide the random round-trip bound for wait until probe: */
  1785		bbr->rounds_since_probe =
> 1786			prandom_u32_max(bbr->params.bw_probe_rand_rounds);
  1787		/* Decide the random wall clock bound for wait until probe: */
  1788		bbr->probe_wait_us = bbr->params.bw_probe_base_us +
  1789				     prandom_u32_max(bbr->params.bw_probe_rand_us);
  1790	}
  1791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
