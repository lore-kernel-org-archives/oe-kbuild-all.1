Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23144624
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 00:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714350550; cv=none; b=rDrv23oirMuOqCvwIvXm+6biq7CvYmMKKdjZ1rJPiFgmZCEbbDcih50zId+YGUlVlv22VDwAxgjrifrwWREyOMlfOY2D7cY31nM4mN47JEtGqgiQZ5LXd5vA85EUiqpqd045Sma4bFRfmcL3WlwKLRZgv2+st5TLmamYb7h2J9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714350550; c=relaxed/simple;
	bh=/szv4r3QlkgDevESdCzTVuptTK+b9HCq6AHCCGSDWuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UA72xI7nrbcENsW/7nTYunAXN6I9KV32rgeKZwuDy6FFwb0/B8Uy6socTdS5f3cRgVfQv1oXsgwMDYtWJOY1ArtmoJMyTkumguKjoN0WIVIGiA0GQHnygAjZj9zlgRUrWxxjDkriF3+0OMHehhWixitMKC4b4bf95VEzv3b8PbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jdr121WO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jdr121WO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714350550; x=1745886550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/szv4r3QlkgDevESdCzTVuptTK+b9HCq6AHCCGSDWuE=;
  b=Jdr121WO86JLh2DmYCdOo2J+eM/bczQv7Ktg4w1yZcTcMiGRBVkric5G
   8AB7skY2fkO37rsAioPkc4oUc+puZiXoievghGHHnxEhVJvS8cWCOAjI+
   Et5iWKreu5Xv6zbgUCkVslqpmw1+6EXulto2sOl0q94UDf3Y6r/zgOz+5
   NGvfvYLSKS/Ej8LDfpVtvpOJ/T1AwNRMIiMkTUOhKnAuHUbz85zzhE2XP
   7pDNFfVtz5JP6pVc/T//tMB3UUT6lF/GQiw94L8wyCLVo2llZR4rudsCG
   M63ChCyuHHjEegElWtlM86KxMXmJ3K97x8srAAXRNpFrTb6j7y72BPo1o
   Q==;
X-CSE-ConnectionGUID: 5AqDn/cHRMi2jsAnJ1Jvag==
X-CSE-MsgGUID: yjskD5sqTUqOBF1sQDCj4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="32502894"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="32502894"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 17:29:09 -0700
X-CSE-ConnectionGUID: vvJzQqxxQoaSWXyjUEplog==
X-CSE-MsgGUID: cQiKhfrXSkOR0SjJR+geHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="25968857"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Apr 2024 17:29:07 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1EtF-0006pO-1G;
	Mon, 29 Apr 2024 00:29:05 +0000
Date: Mon, 29 Apr 2024 08:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3_0428 14/14]
 drivers/net/tun.c:1679:48: sparse: sparse: incorrect type in argument 3
 (different base types)
Message-ID: <202404290806.ggBPLkkq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3_0428
head:   d4839424731dee0af1ba520ac3b177893e765399
commit: d4839424731dee0af1ba520ac3b177893e765399 [14/14] net: replace page_frag with page_frag_cache
config: hexagon-randconfig-r122-20240429 (https://download.01.org/0day-ci/archive/20240429/202404290806.ggBPLkkq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce: (https://download.01.org/0day-ci/archive/20240429/202404290806.ggBPLkkq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290806.ggBPLkkq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/tun.c:1679:48: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got int @@
   drivers/net/tun.c:1679:48: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/net/tun.c:1679:48: sparse:     got int
>> drivers/net/tun.c:1679:65: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int align @@     got restricted gfp_t @@
   drivers/net/tun.c:1679:65: sparse:     expected unsigned int align
   drivers/net/tun.c:1679:65: sparse:     got restricted gfp_t
   drivers/net/tun.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1679 drivers/net/tun.c

  1654	
  1655	static struct sk_buff *tun_build_skb(struct tun_struct *tun,
  1656					     struct tun_file *tfile,
  1657					     struct iov_iter *from,
  1658					     struct virtio_net_hdr *hdr,
  1659					     int len, int *skb_xdp)
  1660	{
  1661		struct page_frag_cache *alloc_frag = &current->task_frag;
  1662		struct bpf_prog *xdp_prog;
  1663		int buflen = SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
  1664		unsigned int size;
  1665		char *buf;
  1666		size_t copied;
  1667		int pad = TUN_RX_PAD;
  1668		int err = 0;
  1669	
  1670		rcu_read_lock();
  1671		xdp_prog = rcu_dereference(tun->xdp_prog);
  1672		if (xdp_prog)
  1673			pad += XDP_PACKET_HEADROOM;
  1674		buflen += SKB_DATA_ALIGN(len + pad);
  1675		rcu_read_unlock();
  1676	
  1677		size = buflen;
  1678		buf = page_frag_alloc_va_prepare_align(alloc_frag, &size,
> 1679						       SMP_CACHE_BYTES, GFP_KERNEL);
  1680		if (unlikely(!buf))
  1681			return ERR_PTR(-ENOMEM);
  1682	
  1683		copied = copy_from_iter(buf + pad, len, from);
  1684		if (copied != len)
  1685			return ERR_PTR(-EFAULT);
  1686	
  1687		/* There's a small window that XDP may be set after the check
  1688		 * of xdp_prog above, this should be rare and for simplicity
  1689		 * we do XDP on skb in case the headroom is not enough.
  1690		 */
  1691		if (hdr->gso_type || !xdp_prog) {
  1692			*skb_xdp = 1;
  1693			return __tun_build_skb(tfile, alloc_frag, buf, buflen, len,
  1694					       pad);
  1695		}
  1696	
  1697		*skb_xdp = 0;
  1698	
  1699		local_bh_disable();
  1700		rcu_read_lock();
  1701		xdp_prog = rcu_dereference(tun->xdp_prog);
  1702		if (xdp_prog) {
  1703			struct xdp_buff xdp;
  1704			u32 act;
  1705	
  1706			xdp_init_buff(&xdp, buflen, &tfile->xdp_rxq);
  1707			xdp_prepare_buff(&xdp, buf, pad, len, false);
  1708	
  1709			act = bpf_prog_run_xdp(xdp_prog, &xdp);
  1710			if (act == XDP_REDIRECT || act == XDP_TX) {
  1711				page_frag_alloc_commit(alloc_frag, buflen);
  1712			}
  1713			err = tun_xdp_act(tun, xdp_prog, &xdp, act);
  1714			if (err < 0) {
  1715				if (act == XDP_REDIRECT || act == XDP_TX)
  1716					page_frag_free_va(buf);
  1717				goto out;
  1718			}
  1719	
  1720			if (err == XDP_REDIRECT)
  1721				xdp_do_flush();
  1722			if (err != XDP_PASS)
  1723				goto out;
  1724	
  1725			pad = xdp.data - xdp.data_hard_start;
  1726			len = xdp.data_end - xdp.data;
  1727		}
  1728		rcu_read_unlock();
  1729		local_bh_enable();
  1730	
  1731		return __tun_build_skb(tfile, alloc_frag, buf, buflen, len, pad);
  1732	out:
  1733		rcu_read_unlock();
  1734		local_bh_enable();
  1735		return NULL;
  1736	}
  1737	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
