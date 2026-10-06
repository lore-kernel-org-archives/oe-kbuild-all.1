Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0BF3B71A2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272561; cv=none; b=AvxA9dKohXv9cf0qKgiqtC8OdYyQSXxGflv0JerrfvaG4QO53HcrIuheAP4ysjzPGhf+d1KqgKWgk6AT704EQJ3twf71qXWaPexTdcR953uiK3o0tPxock9YcyxatMtOpEg6Q7ryqsVVmsXzTr/opmN09+m7CvSgL3WHXsi323g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272561; c=relaxed/simple;
	bh=3UvBZuTVRNjS2B3SR9nSZSh5W5EqKPl4JhgpVrt1cIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HBJrhFDkDzZiCm3WBdasmK/KzZ2MQYeWqtXQ2VTPeKwmGCfu9YZ15eE5bYZaUNHIVs/kUpn+hqy+RSA1KOvRhdQAeioPM87W9XwkW14cuskWoaV4w15O9mTjTz25Ef6cdoMP1BaEM0uYvt6xV4q+pMXEdpIVrxBF9FQ4HbRgO1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwQpPEZ0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwQpPEZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791272560; x=1822808560;
  h=date:from:to:cc:subject:message-id;
  bh=3UvBZuTVRNjS2B3SR9nSZSh5W5EqKPl4JhgpVrt1cIY=;
  b=bwQpPEZ0W5crhDg9oxc+bbdDHDUcJhWdo3Wb7Qg9XmB7M0MQRcq2eA4n
   WPTUGcBUBS6uL2YIDVcsiMlX9+wqwr6+QePXH24C+zx6ESj5y/YvFxYO0
   Q+o64zYogVuukxntZAPcpou6cYrWDIfFluMoflCYisPThFOaq08QSe4mE
   2T5Nms6X8kfAniB2wj/LEuVZZecas52+UUXJ7cT7eLCLrcagYiSYjCkBh
   KXXnJhLJk8TxyUR5G0iiNCA+YkClIpg2OzqnIcI+znyRD20lS6Rzc5Dw+
   VYZ/ybhuRo5mKesHrw46yH9wPsqsPgiSIBnt3OkjQqgy2LdCJzBLEOo3Y
   w==;
X-CSE-ConnectionGUID: +Q8gx9+QSmqlwRAtQTEFHA==
X-CSE-MsgGUID: 57WxFwE+SQGVxCbWASJl/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="108328557"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="108328557"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 00:42:39 -0700
X-CSE-ConnectionGUID: GQaasPnuQl6z75ELleazyg==
X-CSE-MsgGUID: D43ANpyhRxauVVcstTcZgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276604951"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Oct 2026 00:42:38 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDzoq-000000000vT-0wn7;
	Tue, 06 Oct 2026 07:42:36 +0000
Date: Tue, 06 Oct 2026 09:42:03 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 51/53] net/core/bpf_xdp_xmit.c:50:17:
 sparse: sparse: symbol 'bpf_xdp_xmit' was not declared. Should it be static?
Message-ID: <202610060937.Tdp8i48Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   00ca9ce5685ac6da21cec48b9b0a8a0d6c11af32
commit: 1b42184dd7689f6237a0f659b39ea8d56198fd35 [51/53] bpf: Add bpf_xdp_xmit() to transmit arena bytes as an XDP frame
config: openrisc-randconfig-r2301-20261006 (https://download.01.org/0day-ci/archive/20261006/202610060937.Tdp8i48Q-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610060937.Tdp8i48Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610060937.Tdp8i48Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/bpf_xdp_xmit.c:50:17: sparse: sparse: symbol 'bpf_xdp_xmit' was not declared. Should it be static?
>> net/core/bpf_xdp_xmit.c:110:17: sparse: sparse: symbol 'bpf_xdp_xmit_flush' was not declared. Should it be static?

vim +/bpf_xdp_xmit +50 net/core/bpf_xdp_xmit.c

    38	
    39	/**
    40	 * bpf_xdp_xmit - transmit bytes from arena memory as an XDP frame
    41	 * @ifindex: the device, in the initial network namespace
    42	 * @buf__arena: the frame, from its Ethernet header on, in arena memory
    43	 * @len: its length in bytes, at most BPF_XDP_XMIT_MAX
    44	 * @flags: BPF_XDP_XMIT_F_NO_FLUSH to queue without ringing the doorbell
    45	 * @aux: the calling program (implicit)
    46	 *
    47	 * Returns 0 once the frame is queued on the device, -ENOSPC when the
    48	 * device's queue is full, or another -errno.
    49	 */
  > 50	__bpf_kfunc int bpf_xdp_xmit(u32 ifindex, void *buf__arena, u32 len, u64 flags,
    51				     struct bpf_prog_aux *aux)
    52	{
    53		u64 start = bpf_arena_get_kern_vm_start(aux->arena), addr = (u64)(long)buf__arena;
    54		unsigned int size = SKB_DATA_ALIGN(sizeof(struct xdp_frame) + BPF_XDP_XMIT_HEADROOM + len) +
    55				    SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
    56		struct net_device *dev;
    57		struct xdp_frame *xdpf;
    58		void *p, *data;
    59		int ret;
    60	
    61		if (flags & ~BPF_XDP_XMIT_F_NO_FLUSH)
    62			return -EINVAL;
    63		if (len < ETH_HLEN || len > BPF_XDP_XMIT_MAX)
    64			return -EINVAL;
    65		if (!aux->arena || addr < start || addr + len > start + SZ_4G)
    66			return -EFAULT;
    67		for (p = buf__arena; p < buf__arena + len; p += PAGE_SIZE - offset_in_page(p))
    68			if (!vmalloc_to_page(p))
    69				return -EFAULT;
    70	
    71		local_bh_disable();
    72		rcu_read_lock();
    73		dev = dev_get_by_index_rcu(&init_net, ifindex);
    74		if (!dev || !dev->netdev_ops->ndo_xdp_xmit) {
    75			ret = -ENODEV;
    76			goto out;
    77		}
    78		xdpf = netdev_alloc_frag(size);
    79		if (!xdpf) {
    80			ret = -ENOMEM;
    81			goto out;
    82		}
    83		memset(xdpf, 0, sizeof(*xdpf));
    84		data = (void *)xdpf + sizeof(*xdpf) + BPF_XDP_XMIT_HEADROOM;
    85		memcpy(data, buf__arena, len);
    86		xdpf->data = data;
    87		xdpf->len = len;
    88		xdpf->headroom = BPF_XDP_XMIT_HEADROOM;
    89		xdpf->frame_sz = size;
    90		xdpf->mem_type = MEM_TYPE_PAGE_SHARED;
    91		ret = dev->netdev_ops->ndo_xdp_xmit(dev, 1, &xdpf,
    92						    flags & BPF_XDP_XMIT_F_NO_FLUSH ? 0 : XDP_XMIT_FLUSH);
    93		if (ret == 1) {
    94			ret = 0;
    95		} else {
    96			xdp_return_frame(xdpf);
    97			if (ret >= 0)
    98				ret = -ENOSPC;
    99		}
   100	out:
   101		rcu_read_unlock();
   102		local_bh_enable();
   103		return ret;
   104	}
   105	
   106	/**
   107	 * bpf_xdp_xmit_flush - ring the doorbell for frames queued without a flush
   108	 * @ifindex: the device, in the initial network namespace
   109	 */
 > 110	__bpf_kfunc int bpf_xdp_xmit_flush(u32 ifindex)
   111	{
   112		struct net_device *dev;
   113		int ret;
   114	
   115		local_bh_disable();
   116		rcu_read_lock();
   117		dev = dev_get_by_index_rcu(&init_net, ifindex);
   118		if (!dev || !dev->netdev_ops->ndo_xdp_xmit) {
   119			ret = -ENODEV;
   120			goto out;
   121		}
   122		ret = dev->netdev_ops->ndo_xdp_xmit(dev, 0, NULL, XDP_XMIT_FLUSH);
   123		if (ret > 0)
   124			ret = 0;
   125	out:
   126		rcu_read_unlock();
   127		local_bh_enable();
   128		return ret;
   129	}
   130	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
