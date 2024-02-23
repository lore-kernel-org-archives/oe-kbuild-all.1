Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6AE5D90A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 21:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708724223; cv=none; b=EHLCcX4UYt1YQFiPvOB3oAhJA3X4oEFsyPmC78LlYyHJKqVXscOxnNFakLwPTQIoMPulcLZcS3XTashWIgnOSw5/Ko/xfmRKgstMZNgc254PjPpbycahHATYGM/1LyfSC8lXC3Psp/ct88sZ5n0ivpF9hjoPfc8/ghOSZiint8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708724223; c=relaxed/simple;
	bh=zOIiack84X+y/IBGm+a3gS4/kkl3M4sDYZiYPULVx0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GxIf29wGdq84NwGLWPoo49pmgGQHlRiY4DaXyEmuPf3KS1uMqKohJb0XTFL/MHBw8WkkdRgIZ+ulNXwUPQaQr5NZ36B9SRVt/8BmxGTzYoMNALQt/lsvtPbHQDYOne2bIyLjFOWtL4SahyUhgShDQlGU7TQJS7u64lTWkWioabE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjNOQUwh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjNOQUwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708724221; x=1740260221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zOIiack84X+y/IBGm+a3gS4/kkl3M4sDYZiYPULVx0s=;
  b=KjNOQUwhU8Ee5uc6RdrBejx20H2PwYpDcGpqb3I1UpVXXFnWxJetaFPC
   kH9O8LBPFjG9ECgrGaT0DGZSSou2g+IMdqeR3hAXt8l5EgQDbr7siMgve
   0nDU4owmcQ119dtQljk2SWqMoUeiZS0nfcZwKk7WbksNScd/PRfDooaVM
   LI5qye/KrG52IE0ar+I5Pw9jOF4ctIuXHKGP8OGQdL3xnna2XlTNZypRp
   f1W9BeTOYK5jmWDkKP+yENQ02oSW58quGc+NJvKmEG6/qLZ58uPKHOl/m
   VmX+ujuti9hPoIuRRrpm3tj1FrqEmbLqC9+14FFURQONLjYwFIvSFLYXe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3576567"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="3576567"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 13:37:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6440952"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Feb 2024 13:37:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rddE1-0007v0-1h;
	Fri, 23 Feb 2024 21:36:57 +0000
Date: Sat, 24 Feb 2024 05:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 13/15] drivers/net/veth.c:1068:34: error: use
 of undeclared identifier 'io_uring_pp_zc_ops'
Message-ID: <202402240549.Pp94kooX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   422e699712a532c85e16c4e6afda9d4d4164bdf3
commit: 82e6260191c8e37a99dec6445e1f1ff1e0394ef3 [13/15] veth: add support for io_uring zc rx
config: um-randconfig-001-20240223 (https://download.01.org/0day-ci/archive/20240224/202402240549.Pp94kooX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240549.Pp94kooX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240549.Pp94kooX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/veth.c:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/net/veth.c:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/veth.c:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/net/veth.c:1068:34: error: use of undeclared identifier 'io_uring_pp_zc_ops'
                           if (rq->page_pool->mp_ops == &io_uring_pp_zc_ops) {
                                                         ^
   drivers/net/veth.c:1145:20: error: use of undeclared identifier 'io_uring_pp_zc_ops'
                   rq->rq.pp_ops = &io_uring_pp_zc_ops;
                                    ^
   drivers/net/veth.c:1223:7: warning: variable 'nr' set but not used [-Wunused-but-set-variable]
                   int nr = 0;
                       ^
   13 warnings and 2 errors generated.


vim +/io_uring_pp_zc_ops +1068 drivers/net/veth.c

  1035	
  1036	static int veth_xdp_rcv(struct veth_rq *rq, int budget,
  1037				struct veth_xdp_tx_bq *bq,
  1038				struct veth_stats *stats)
  1039	{
  1040		int i, done = 0, n_xdpf = 0;
  1041		void *xdpf[VETH_XDP_BATCH];
  1042	
  1043		for (i = 0; i < budget; i++) {
  1044			void *ptr = __ptr_ring_consume(&rq->xdp_ring);
  1045	
  1046			if (!ptr)
  1047				break;
  1048	
  1049			if (veth_is_xdp_frame(ptr)) {
  1050				/* ndo_xdp_xmit */
  1051				struct xdp_frame *frame = veth_ptr_to_xdp(ptr);
  1052	
  1053				stats->xdp_bytes += xdp_get_frame_len(frame);
  1054				frame = veth_xdp_rcv_one(rq, frame, bq, stats);
  1055				if (frame) {
  1056					/* XDP_PASS */
  1057					xdpf[n_xdpf++] = frame;
  1058					if (n_xdpf == VETH_XDP_BATCH) {
  1059						veth_xdp_rcv_bulk_skb(rq, xdpf, n_xdpf,
  1060								      bq, stats);
  1061						n_xdpf = 0;
  1062					}
  1063				}
  1064			} else {
  1065				/* ndo_start_xmit */
  1066				struct sk_buff *skb = ptr;
  1067	
> 1068				if (rq->page_pool->mp_ops == &io_uring_pp_zc_ops) {
  1069					skb = veth_iou_rcv_skb(rq, skb);
  1070				} else {
  1071					stats->xdp_bytes += skb->len;
  1072					skb = veth_xdp_rcv_skb(rq, skb, bq, stats);
  1073				}
  1074	
  1075				if (skb) {
  1076					if (skb_shared(skb) || skb_unclone(skb, GFP_ATOMIC))
  1077						netif_receive_skb(skb);
  1078					else
  1079						napi_gro_receive(&rq->xdp_napi, skb);
  1080				}
  1081			}
  1082			done++;
  1083		}
  1084	
  1085		if (n_xdpf)
  1086			veth_xdp_rcv_bulk_skb(rq, xdpf, n_xdpf, bq, stats);
  1087	
  1088		u64_stats_update_begin(&rq->stats.syncp);
  1089		rq->stats.vs.xdp_redirect += stats->xdp_redirect;
  1090		rq->stats.vs.xdp_bytes += stats->xdp_bytes;
  1091		rq->stats.vs.xdp_drops += stats->xdp_drops;
  1092		rq->stats.vs.rx_drops += stats->rx_drops;
  1093		rq->stats.vs.xdp_packets += done;
  1094		u64_stats_update_end(&rq->stats.syncp);
  1095	
  1096		return done;
  1097	}
  1098	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
