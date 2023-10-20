Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A921C38
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 04:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVIeI3bB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697775589; x=1729311589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+rUsMakuWyR5yPUym+VRFP9bXTFdVA49zMioQX1TRQ=;
  b=AVIeI3bBi9Kzos3F3LdtTKNvcJDpibPXeI5fx82FMnmH2qcHB0itfgiz
   sIvovw0SXkVTFz3xCkQzT+SPKIHbnT2ai7JKZImUmDGXBgsuHRXgBW5e3
   +voP7bctsUlBk53IvSdOSv4rTvFp0S3lVGYfSOtLfkwycErrJa6SB63Bi
   6vWelp+HJ+7aTfDUoh+Twubdbx1nonX1S8lJpa74XHKyp8OMXhXJwUyvZ
   2MNrBlRe0UV9WdoPMZ+938muKovaDiZdfRHZLy3wyZd6Fw4FXadBOIfr1
   H+4HaFdRuCJ3bqqmD3qS2k8wfwx9lkTzEss1Jq3La4f34QCL811DT51fg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386242723"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="386242723"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 21:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="827600337"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="827600337"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Oct 2023 21:19:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtgzB-0002zg-07;
	Fri, 20 Oct 2023 04:19:45 +0000
Date: Fri, 20 Oct 2023 12:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/veth2 14/16] io_uring/zc_rx.c:644:9: warning: format
 '%lu' expects argument of type 'long unsigned int', but argument 4 has type
 'size_t {aka unsigned int}'
Message-ID: <202310201228.dMoBeQiV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth2
head:   731b7375c43d08e971bcafcd9e90c1c0c8250678
commit: 1e65d03befc872b1f243c468fd33761c1a5d253f [14/16] make it work
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20231020/202310201228.dMoBeQiV-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201228.dMoBeQiV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201228.dMoBeQiV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/zc_rx.c: In function 'is_zc_rx_page':
   io_uring/zc_rx.c:62:51: warning: right shift count >= width of type [-Wshift-count-overflow]
     return PagePrivate(page) && ((page_private(page) >> 48) == 0xface);
                                                      ^~
   io_uring/zc_rx.c: At top level:
   io_uring/zc_rx.c:186:5: warning: no previous declaration for 'io_zc_rx_create_pool' [-Wmissing-declarations]
    int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
        ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:30:0,
                    from io_uring/zc_rx.c:2:
   io_uring/zc_rx.c: In function 'zc_rx_recv_skb':
>> io_uring/zc_rx.c:644:9: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t {aka unsigned int}' [-Wformat=]
     printk("----- zc_rx_recv_skb: start=%d, offset=%d, len=%lu, nr_frags=%d\n", start, offset, len, skb_shinfo(skb)->nr_frags);
            ^
   include/linux/printk.h:427:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   io_uring/zc_rx.c:644:2: note: in expansion of macro 'printk'
     printk("----- zc_rx_recv_skb: start=%d, offset=%d, len=%lu, nr_frags=%d\n", start, offset, len, skb_shinfo(skb)->nr_frags);
     ^~~~~~


vim +644 io_uring/zc_rx.c

   623	
   624	static int
   625	zc_rx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
   626		       unsigned int offset, size_t len)
   627	{
   628		struct io_zc_rx_ifq *ifq;
   629		struct sk_buff *frag_iter;
   630		unsigned start, start_off;
   631		int i, copy, end, off;
   632		int ret = 0;
   633	
   634		ifq = io_zc_rx_ifq_skb(skb);
   635		if (!ifq) {
   636			pr_debug("non zerocopy pages are not supported\n");
   637			return -EFAULT;
   638		}
   639		start = skb_headlen(skb);
   640		start_off = offset;
   641	
   642		// TODO: copy payload in skb linear data */
   643		WARN_ON(offset < start);
 > 644		printk("----- zc_rx_recv_skb: start=%d, offset=%d, len=%lu, nr_frags=%d\n", start, offset, len, skb_shinfo(skb)->nr_frags);
   645	
   646		// TODO: make sure theres at least nr_frags entries in cq ring
   647		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
   648			const skb_frag_t *frag;
   649	
   650			WARN_ON(start > offset + len);
   651	
   652			frag = &skb_shinfo(skb)->frags[i];
   653			end = start + skb_frag_size(frag);
   654			printk("----- zc_rx_recv_skb: skb frag size=%d, end=%d\n", skb_frag_size(frag), end);
   655	
   656			if (offset < end) {
   657				copy = end - offset;
   658				if (copy > len)
   659					copy = len;
   660	
   661				off = offset - start;
   662				ret = zc_rx_recv_frag(ifq, frag, off, copy);
   663				if (ret < 0) {
   664					printk("----- zc_rx_recv_skb: recv_frag err=%d\n", ret);
   665					goto out;
   666				}
   667	
   668				offset += ret;
   669				len -= ret;
   670				if (len == 0 || ret != copy)
   671					goto out;
   672			}
   673			start = end;
   674		}
   675	
   676		skb_walk_frags(skb, frag_iter) {
   677			WARN_ON(start > offset + len);
   678	
   679			end = start + frag_iter->len;
   680			if (offset < end) {
   681				copy = end - offset;
   682				if (copy > len)
   683					copy = len;
   684	
   685				off = offset - start;
   686				ret = zc_rx_recv_skb(desc, frag_iter, off, copy);
   687				if (ret < 0)
   688					goto out;
   689	
   690				offset += ret;
   691				len -= ret;
   692				if (len == 0 || ret != copy)
   693					goto out;
   694			}
   695			start = end;
   696		}
   697	
   698	out:
   699		printk("----- zc_rx_recv_skb: updating tail, tail=%u, cached_tail=%u\n", ifq->ring->cq.tail, ifq->cached_cq_tail);
   700		smp_store_release(&ifq->ring->cq.tail, ifq->cached_cq_tail);
   701		if (offset == start_off)
   702			return ret;
   703		printk("----- zc_rx_recv_skb: out, offset=%d, start_off=%d\n", offset, start_off);
   704		return offset - start_off;
   705	}
   706	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
