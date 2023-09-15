Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D3DED2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 02:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694746522; x=1726282522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xVv4wetAPUYbmvdPMU1bPrb4r0mE6a399jmY7vzyoXI=;
  b=RJGoOF4fEUCwS1LzbDNhha7MIWzONfC3WNG8ItLB9Yaf4LHHv3Cg6AZ0
   Ev4MrStsdNi4+gIAi736sVIlc7yhwpYAD1ti9CcwadWcf5kAzQtBQJvi3
   FREgFK9asiskxgd2eoXn7iNa9SXeTT9VDA4DwG1P6cp1jFdn0PpY5ST7T
   IWjRIbKJtqweY9c7LXNKIfOd+PMNHSIhrM4EpqOctKodWWJo9HwnroSBX
   X6nnd5fSFS43Ryp7W3IXKReku77fPGhfw6T8TGdXodP2+Lw7z6oi4DOTW
   k+U9Cy+Zkkhk261NlX4PXSV/VaQeRoaTB2enRoZ9ELVDqzf2TA0RAeIi2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="443202134"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="443202134"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 19:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721513512"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="721513512"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Sep 2023 19:55:12 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgyz7-0002LN-2g;
	Fri, 15 Sep 2023 02:55:09 +0000
Date: Fri, 15 Sep 2023 10:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Sterba <dsterba@suse.com>
Subject: [linux-next:master 5242/5666] ERROR: modpost: "__udivdi3"
 [fs/btrfs/btrfs.ko] undefined!
Message-ID: <202309151035.TmeOSXOd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dfa449a58323de195773cf928d99db4130702bf7
commit: 564654867daa781a21b67d952b3d18353a85c73a [5242/5666] btrfs: add support for inserting raid stripe extents
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230915/202309151035.TmeOSXOd-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151035.TmeOSXOd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309151035.TmeOSXOd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/riscv/kvm/kvm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libsha256.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-de2-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/virt-dma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_dma_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/pcs/pcs_xpcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/dummy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/p8022.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/psnap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/stp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/cls_cgroup.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_conntrack.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_rr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_defrag_ipv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_reject_ipv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/iptable_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_algo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_defrag_ipv6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_reject_ipv6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ip6_udp_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/8021q/8021q.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
>> ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
