Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E5CC8DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688125770; x=1719661770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2WM2+27cv3n+N2YCpJgyfzsj0JvPoV8vgXqPL9WKYD4=;
  b=ihhw+20koF4MWuVclvHnNb+uCuQT5eGHyUBGff+cVDRJXLSWi/FYAeCS
   mWtqZ1ezn1Ohm+h/snNWppBiUE6nvda7Ut5Y6jmsK5Xgu6I/j1vjiIhvn
   l3ZTIE5Wrmeckj3D1ijApMnjWgDtVUx45/D5rSdpYHN9F/1KPFzpX+HLT
   Rry0PRjIkogSx3sXC1ngV50BKqUzMzWzqu0tjGvYv/kVIBedqec1wlL54
   cxevKkfNWy/6mQkLv1ntI9EGID88A0X3GAYvxX/cVlACeTUwjQ5pg8pKU
   mDVK4bvk1Sipatex16OQK5OsVddO0ujAj60m7teIDpHQW3NjOgKzKeRwQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="342714963"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="342714963"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 04:49:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="891733808"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="891733808"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Jun 2023 04:49:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFCcu-000Evv-0a;
	Fri, 30 Jun 2023 11:49:24 +0000
Date: Fri, 30 Jun 2023 19:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-extract 18/20]
 drivers/net/ethernet/fungible/funeth/funeth_rx.c:326:17: error: too few
 arguments to function 'skb_frag_fill_page_desc'
Message-ID: <202306301935.Bwwc1PrZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-extract
head:   19ee2529bb48ab3bba1d2cfc7a0811ae08a22505
commit: b466221531e2d73043d4b1abe1bbea1dfc38cde8 [18/20] net: [WIP] Mark each skb_frags as to how they should be cleaned up
config: openrisc-randconfig-r001-20230630 (https://download.01.org/0day-ci/archive/20230630/202306301935.Bwwc1PrZ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301935.Bwwc1PrZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301935.Bwwc1PrZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from include/trace/events/xdp.h:8,
                    from include/linux/bpf_trace.h:5,
                    from drivers/net/ethernet/fungible/funeth/funeth_rx.c:3:
   include/linux/skbuff.h: In function '__skb_frag_set_page':
   include/linux/skbuff.h:405:36: error: 'FOLL_PIN' undeclared (first use in this function); did you mean 'POLL_IN'?
     405 |         cleanup_mode &= FOLL_GET | FOLL_PIN;
         |                                    ^~~~~~~~
         |                                    POLL_IN
   include/linux/skbuff.h:405:36: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_frag_fill_page_desc':
   include/linux/skbuff.h:2475:15: error: 'skb_frag_t' {aka 'struct skb_frag'} has no member named 'bv_offset'; did you mean 'offset'?
    2475 |         frag->bv_offset = off;
         |               ^~~~~~~~~
         |               offset
   include/linux/skbuff.h: In function '__skb_frag_ref':
   include/linux/skbuff.h:3454:9: error: implicit declaration of function 'try_grab_page'; did you mean 'try_get_page'? [-Werror=implicit-function-declaration]
    3454 |         try_grab_page(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~
         |         try_get_page
   include/linux/skbuff.h: In function 'napi_frag_unref':
   include/linux/skbuff.h:3478:9: error: implicit declaration of function 'page_put_unpin'; did you mean 'page_put_link'? [-Werror=implicit-function-declaration]
    3478 |         page_put_unpin(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~~
         |         page_put_link
   drivers/net/ethernet/fungible/funeth/funeth_rx.c: In function 'fun_gather_pkt':
>> drivers/net/ethernet/fungible/funeth/funeth_rx.c:326:17: error: too few arguments to function 'skb_frag_fill_page_desc'
     326 |                 skb_frag_fill_page_desc(frags++, buf->page, q->buf_offset,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2469:20: note: declared here
    2469 | static inline void skb_frag_fill_page_desc(skb_frag_t *frag,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/tcp.h:17,
                    from drivers/net/ethernet/myricom/myri10ge/myri10ge.c:43:
   include/linux/skbuff.h: In function '__skb_frag_set_page':
   include/linux/skbuff.h:405:36: error: 'FOLL_PIN' undeclared (first use in this function); did you mean 'POLL_IN'?
     405 |         cleanup_mode &= FOLL_GET | FOLL_PIN;
         |                                    ^~~~~~~~
         |                                    POLL_IN
   include/linux/skbuff.h:405:36: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_frag_fill_page_desc':
   include/linux/skbuff.h:2475:15: error: 'skb_frag_t' {aka 'struct skb_frag'} has no member named 'bv_offset'; did you mean 'offset'?
    2475 |         frag->bv_offset = off;
         |               ^~~~~~~~~
         |               offset
   include/linux/skbuff.h: In function '__skb_frag_ref':
   include/linux/skbuff.h:3454:9: error: implicit declaration of function 'try_grab_page'; did you mean 'try_get_page'? [-Werror=implicit-function-declaration]
    3454 |         try_grab_page(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~
         |         try_get_page
   include/linux/skbuff.h: In function 'napi_frag_unref':
   include/linux/skbuff.h:3478:9: error: implicit declaration of function 'page_put_unpin'; did you mean 'page_put_link'? [-Werror=implicit-function-declaration]
    3478 |         page_put_unpin(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~~
         |         page_put_link
   drivers/net/ethernet/myricom/myri10ge/myri10ge.c: In function 'myri10ge_rx_done':
>> drivers/net/ethernet/myricom/myri10ge/myri10ge.c:1347:17: error: too few arguments to function 'skb_fill_page_desc'
    1347 |                 skb_fill_page_desc(skb, i, rx->info[idx].page,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2546:20: note: declared here
    2546 | static inline void skb_fill_page_desc(struct sk_buff *skb, int i,
         |                    ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/qlogic/qede/qede_fp.c:7:
   include/linux/skbuff.h: In function '__skb_frag_set_page':
   include/linux/skbuff.h:405:36: error: 'FOLL_PIN' undeclared (first use in this function); did you mean 'POLL_IN'?
     405 |         cleanup_mode &= FOLL_GET | FOLL_PIN;
         |                                    ^~~~~~~~
         |                                    POLL_IN
   include/linux/skbuff.h:405:36: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_frag_fill_page_desc':
   include/linux/skbuff.h:2475:15: error: 'skb_frag_t' {aka 'struct skb_frag'} has no member named 'bv_offset'; did you mean 'offset'?
    2475 |         frag->bv_offset = off;
         |               ^~~~~~~~~
         |               offset
   include/linux/skbuff.h: In function '__skb_frag_ref':
   include/linux/skbuff.h:3454:9: error: implicit declaration of function 'try_grab_page'; did you mean 'try_get_page'? [-Werror=implicit-function-declaration]
    3454 |         try_grab_page(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~
         |         try_get_page
   include/linux/skbuff.h: In function 'napi_frag_unref':
   include/linux/skbuff.h:3478:9: error: implicit declaration of function 'page_put_unpin'; did you mean 'page_put_link'? [-Werror=implicit-function-declaration]
    3478 |         page_put_unpin(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~~
         |         page_put_link
   drivers/net/ethernet/qlogic/qede/qede_fp.c: In function 'qede_fill_frag_skb':
>> drivers/net/ethernet/qlogic/qede/qede_fp.c:677:9: error: too few arguments to function 'skb_fill_page_desc'
     677 |         skb_fill_page_desc(skb, tpa_info->frag_id++,
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2546:20: note: declared here
    2546 | static inline void skb_fill_page_desc(struct sk_buff *skb, int i,
         |                    ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/chelsio/cxgb3/sge.c:32:
   include/linux/skbuff.h: In function '__skb_frag_set_page':
   include/linux/skbuff.h:405:36: error: 'FOLL_PIN' undeclared (first use in this function); did you mean 'POLL_IN'?
     405 |         cleanup_mode &= FOLL_GET | FOLL_PIN;
         |                                    ^~~~~~~~
         |                                    POLL_IN
   include/linux/skbuff.h:405:36: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_frag_fill_page_desc':
   include/linux/skbuff.h:2475:15: error: 'skb_frag_t' {aka 'struct skb_frag'} has no member named 'bv_offset'; did you mean 'offset'?
    2475 |         frag->bv_offset = off;
         |               ^~~~~~~~~
         |               offset
   include/linux/skbuff.h: In function '__skb_frag_ref':
   include/linux/skbuff.h:3454:9: error: implicit declaration of function 'try_grab_page'; did you mean 'try_get_page'? [-Werror=implicit-function-declaration]
    3454 |         try_grab_page(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~
         |         try_get_page
   include/linux/skbuff.h: In function 'napi_frag_unref':
   include/linux/skbuff.h:3478:9: error: implicit declaration of function 'page_put_unpin'; did you mean 'page_put_link'? [-Werror=implicit-function-declaration]
    3478 |         page_put_unpin(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~~
         |         page_put_link
   drivers/net/ethernet/chelsio/cxgb3/sge.c: In function 'get_packet_pg':
>> drivers/net/ethernet/chelsio/cxgb3/sge.c:890:17: error: too few arguments to function 'skb_fill_page_desc'
     890 |                 skb_fill_page_desc(newskb, 0, sd->pg_chunk.page,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2546:20: note: declared here
    2546 | static inline void skb_fill_page_desc(struct sk_buff *skb, int i,
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb3/sge.c:897:17: error: too few arguments to function 'skb_fill_page_desc'
     897 |                 skb_fill_page_desc(newskb, skb_shinfo(newskb)->nr_frags,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2546:20: note: declared here
    2546 | static inline void skb_fill_page_desc(struct sk_buff *skb, int i,
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb3/sge.c: In function 'lro_add_page':
>> drivers/net/ethernet/chelsio/cxgb3/sge.c:2187:9: error: too few arguments to function 'skb_frag_fill_page_desc'
    2187 |         skb_frag_fill_page_desc(rx_frag, sd->pg_chunk.page,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2469:20: note: declared here
    2469 | static inline void skb_frag_fill_page_desc(skb_frag_t *frag,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/scsi/cxgbi/libcxgbi.c:16:
   include/linux/skbuff.h: In function '__skb_frag_set_page':
   include/linux/skbuff.h:405:36: error: 'FOLL_PIN' undeclared (first use in this function); did you mean 'POLL_IN'?
     405 |         cleanup_mode &= FOLL_GET | FOLL_PIN;
         |                                    ^~~~~~~~
         |                                    POLL_IN
   include/linux/skbuff.h:405:36: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_frag_fill_page_desc':
   include/linux/skbuff.h:2475:15: error: 'skb_frag_t' {aka 'struct skb_frag'} has no member named 'bv_offset'; did you mean 'offset'?
    2475 |         frag->bv_offset = off;
         |               ^~~~~~~~~
         |               offset
   include/linux/skbuff.h: In function '__skb_frag_ref':
   include/linux/skbuff.h:3454:9: error: implicit declaration of function 'try_grab_page'; did you mean 'try_get_page'? [-Werror=implicit-function-declaration]
    3454 |         try_grab_page(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~
         |         try_get_page
   include/linux/skbuff.h: In function 'napi_frag_unref':
   include/linux/skbuff.h:3478:9: error: implicit declaration of function 'page_put_unpin'; did you mean 'page_put_link'? [-Werror=implicit-function-declaration]
    3478 |         page_put_unpin(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~~
         |         page_put_link
   drivers/scsi/cxgbi/libcxgbi.c: In function 'cxgbi_conn_init_pdu':
>> drivers/scsi/cxgbi/libcxgbi.c:2235:33: error: too few arguments to function 'skb_fill_page_desc'
    2235 |                                 skb_fill_page_desc(skb, i, frag->page,
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2546:20: note: declared here
    2546 | static inline void skb_fill_page_desc(struct sk_buff *skb, int i,
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/scsi/cxgbi/libcxgbi.c:2246:17: error: too few arguments to function 'skb_fill_page_desc'
    2246 |                 skb_fill_page_desc(skb, 0, pg,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2546:20: note: declared here
    2546 | static inline void skb_fill_page_desc(struct sk_buff *skb, int i,
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/scsi/cxgbi/libcxgbi.c:2256:17: error: too few arguments to function 'skb_fill_page_desc'
    2256 |                 skb_fill_page_desc(skb, skb_shinfo(skb)->nr_frags,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2546:20: note: declared here
    2546 | static inline void skb_fill_page_desc(struct sk_buff *skb, int i,
         |                    ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/tcp.h:17,
                    from include/net/tcp.h:20,
                    from drivers/target/iscsi/cxgbit/cxgbit_target.c:11:
   include/linux/skbuff.h: In function '__skb_frag_set_page':
   include/linux/skbuff.h:405:36: error: 'FOLL_PIN' undeclared (first use in this function); did you mean 'POLL_IN'?
     405 |         cleanup_mode &= FOLL_GET | FOLL_PIN;
         |                                    ^~~~~~~~
         |                                    POLL_IN
   include/linux/skbuff.h:405:36: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_frag_fill_page_desc':
   include/linux/skbuff.h:2475:15: error: 'skb_frag_t' {aka 'struct skb_frag'} has no member named 'bv_offset'; did you mean 'offset'?
    2475 |         frag->bv_offset = off;
         |               ^~~~~~~~~
         |               offset
   include/linux/skbuff.h: In function '__skb_frag_ref':
   include/linux/skbuff.h:3454:9: error: implicit declaration of function 'try_grab_page'; did you mean 'try_get_page'? [-Werror=implicit-function-declaration]
    3454 |         try_grab_page(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~
         |         try_get_page
   include/linux/skbuff.h: In function 'napi_frag_unref':
   include/linux/skbuff.h:3478:9: error: implicit declaration of function 'page_put_unpin'; did you mean 'page_put_link'? [-Werror=implicit-function-declaration]
    3478 |         page_put_unpin(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~~
         |         page_put_link
   drivers/target/iscsi/cxgbit/cxgbit_target.c: In function 'cxgbit_map_skb':
>> drivers/target/iscsi/cxgbit/cxgbit_target.c:364:17: error: too few arguments to function 'skb_fill_page_desc'
     364 |                 skb_fill_page_desc(skb, i, page, sg->offset + page_off,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2546:20: note: declared here
    2546 | static inline void skb_fill_page_desc(struct sk_buff *skb, int i,
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/cxgbit/cxgbit_target.c:383:17: error: too few arguments to function 'skb_fill_page_desc'
     383 |                 skb_fill_page_desc(skb, i, page, 0, padding);
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2546:20: note: declared here
    2546 | static inline void skb_fill_page_desc(struct sk_buff *skb, int i,
         |                    ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/target/iscsi/cxgbit/cxgbit.h:14,
                    from drivers/target/iscsi/cxgbit/cxgbit_main.c:10:
   include/linux/skbuff.h: In function '__skb_frag_set_page':
   include/linux/skbuff.h:405:36: error: 'FOLL_PIN' undeclared (first use in this function); did you mean 'POLL_IN'?
     405 |         cleanup_mode &= FOLL_GET | FOLL_PIN;
         |                                    ^~~~~~~~
         |                                    POLL_IN
   include/linux/skbuff.h:405:36: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_frag_fill_page_desc':
   include/linux/skbuff.h:2475:15: error: 'skb_frag_t' {aka 'struct skb_frag'} has no member named 'bv_offset'; did you mean 'offset'?
    2475 |         frag->bv_offset = off;
         |               ^~~~~~~~~
         |               offset
   include/linux/skbuff.h: In function '__skb_frag_ref':
   include/linux/skbuff.h:3454:9: error: implicit declaration of function 'try_grab_page'; did you mean 'try_get_page'? [-Werror=implicit-function-declaration]
    3454 |         try_grab_page(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~
         |         try_get_page
   include/linux/skbuff.h: In function 'napi_frag_unref':
   include/linux/skbuff.h:3478:9: error: implicit declaration of function 'page_put_unpin'; did you mean 'page_put_link'? [-Werror=implicit-function-declaration]
    3478 |         page_put_unpin(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~~
         |         page_put_link
   drivers/target/iscsi/cxgbit/cxgbit_main.c: In function 'cxgbit_copy_frags':
>> drivers/target/iscsi/cxgbit/cxgbit_main.c:226:9: error: too few arguments to function '__skb_fill_page_desc'
     226 |         __skb_fill_page_desc(skb, skb_frag_idx, gl->frags[0].page,
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2515:20: note: declared here
    2515 | static inline void __skb_fill_page_desc(struct sk_buff *skb, int i,
         |                    ^~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/cxgbit/cxgbit_main.c:230:17: error: too few arguments to function '__skb_fill_page_desc'
     230 |                 __skb_fill_page_desc(skb, skb_frag_idx + i,
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2515:20: note: declared here
    2515 | static inline void __skb_fill_page_desc(struct sk_buff *skb, int i,
         |                    ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/ip.h:16,
                    from include/net/ip.h:22,
                    from include/net/ip6_checksum.h:27,
                    from drivers/net/vmxnet3/vmxnet3_drv.c:28:
   include/linux/skbuff.h: In function '__skb_frag_set_page':
   include/linux/skbuff.h:405:36: error: 'FOLL_PIN' undeclared (first use in this function); did you mean 'POLL_IN'?
     405 |         cleanup_mode &= FOLL_GET | FOLL_PIN;
         |                                    ^~~~~~~~
         |                                    POLL_IN
   include/linux/skbuff.h:405:36: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_frag_fill_page_desc':
   include/linux/skbuff.h:2475:15: error: 'skb_frag_t' {aka 'struct skb_frag'} has no member named 'bv_offset'; did you mean 'offset'?
    2475 |         frag->bv_offset = off;
         |               ^~~~~~~~~
         |               offset
   include/linux/skbuff.h: In function '__skb_frag_ref':
   include/linux/skbuff.h:3454:9: error: implicit declaration of function 'try_grab_page'; did you mean 'try_get_page'? [-Werror=implicit-function-declaration]
    3454 |         try_grab_page(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~
         |         try_get_page
   include/linux/skbuff.h: In function 'napi_frag_unref':
   include/linux/skbuff.h:3478:9: error: implicit declaration of function 'page_put_unpin'; did you mean 'page_put_link'? [-Werror=implicit-function-declaration]
    3478 |         page_put_unpin(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~~
         |         page_put_link
   drivers/net/vmxnet3/vmxnet3_drv.c: In function 'vmxnet3_append_frag':
>> drivers/net/vmxnet3/vmxnet3_drv.c:689:9: error: too few arguments to function 'skb_frag_fill_page_desc'
     689 |         skb_frag_fill_page_desc(frag, rbi->page, 0, rcd->len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2469:20: note: declared here
    2469 | static inline void skb_frag_fill_page_desc(skb_frag_t *frag,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/broadcom/bnx2.c:27:
   include/linux/skbuff.h: In function '__skb_frag_set_page':
   include/linux/skbuff.h:405:36: error: 'FOLL_PIN' undeclared (first use in this function); did you mean 'POLL_IN'?
     405 |         cleanup_mode &= FOLL_GET | FOLL_PIN;
         |                                    ^~~~~~~~
         |                                    POLL_IN
   include/linux/skbuff.h:405:36: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_frag_fill_page_desc':
   include/linux/skbuff.h:2475:15: error: 'skb_frag_t' {aka 'struct skb_frag'} has no member named 'bv_offset'; did you mean 'offset'?
    2475 |         frag->bv_offset = off;
         |               ^~~~~~~~~
         |               offset
   include/linux/skbuff.h: In function '__skb_frag_ref':
   include/linux/skbuff.h:3454:9: error: implicit declaration of function 'try_grab_page'; did you mean 'try_get_page'? [-Werror=implicit-function-declaration]
    3454 |         try_grab_page(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~
         |         try_get_page
   include/linux/skbuff.h: In function 'napi_frag_unref':
   include/linux/skbuff.h:3478:9: error: implicit declaration of function 'page_put_unpin'; did you mean 'page_put_link'? [-Werror=implicit-function-declaration]
    3478 |         page_put_unpin(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~~
         |         page_put_link
   drivers/net/ethernet/broadcom/bnx2.c: In function 'bnx2_rx_skb':
>> drivers/net/ethernet/broadcom/bnx2.c:3096:25: error: too few arguments to function 'skb_fill_page_desc'
    3096 |                         skb_fill_page_desc(skb, i, rx_pg->page, 0, frag_len);
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2546:20: note: declared here
    2546 | static inline void skb_fill_page_desc(struct sk_buff *skb, int i,
         |                    ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +/skb_frag_fill_page_desc +326 drivers/net/ethernet/fungible/funeth/funeth_rx.c

db37bc177dae89 Dimitris Michailidis 2022-02-24  283  
db37bc177dae89 Dimitris Michailidis 2022-02-24  284  /* Gather the page fragments making up the first Rx packet on @q. Its total
db37bc177dae89 Dimitris Michailidis 2022-02-24  285   * length @tot_len includes optional head- and tail-rooms.
db37bc177dae89 Dimitris Michailidis 2022-02-24  286   *
db37bc177dae89 Dimitris Michailidis 2022-02-24  287   * Return 0 if the device retains ownership of at least some of the pages.
db37bc177dae89 Dimitris Michailidis 2022-02-24  288   * In this case the caller may only copy the packet.
db37bc177dae89 Dimitris Michailidis 2022-02-24  289   *
db37bc177dae89 Dimitris Michailidis 2022-02-24  290   * A non-zero return value gives the caller permission to use references to the
db37bc177dae89 Dimitris Michailidis 2022-02-24  291   * pages, e.g., attach them to skbs. Additionally, if the value is <0 at least
db37bc177dae89 Dimitris Michailidis 2022-02-24  292   * one of the pages is PF_MEMALLOC.
db37bc177dae89 Dimitris Michailidis 2022-02-24  293   *
db37bc177dae89 Dimitris Michailidis 2022-02-24  294   * Regardless of outcome the caller is granted a reference to each of the pages.
db37bc177dae89 Dimitris Michailidis 2022-02-24  295   */
db37bc177dae89 Dimitris Michailidis 2022-02-24  296  static int fun_gather_pkt(struct funeth_rxq *q, unsigned int tot_len,
db37bc177dae89 Dimitris Michailidis 2022-02-24  297  			  skb_frag_t *frags)
db37bc177dae89 Dimitris Michailidis 2022-02-24  298  {
db37bc177dae89 Dimitris Michailidis 2022-02-24  299  	struct funeth_rxbuf *buf = q->cur_buf;
db37bc177dae89 Dimitris Michailidis 2022-02-24  300  	unsigned int frag_len;
db37bc177dae89 Dimitris Michailidis 2022-02-24  301  	int ref_ok = 1;
db37bc177dae89 Dimitris Michailidis 2022-02-24  302  
db37bc177dae89 Dimitris Michailidis 2022-02-24  303  	for (;;) {
db37bc177dae89 Dimitris Michailidis 2022-02-24  304  		buf = get_buf(q, buf, tot_len);
db37bc177dae89 Dimitris Michailidis 2022-02-24  305  
db37bc177dae89 Dimitris Michailidis 2022-02-24  306  		/* We always keep the RQ full of buffers so before we can give
db37bc177dae89 Dimitris Michailidis 2022-02-24  307  		 * one of our pages to the stack we require that we can obtain
db37bc177dae89 Dimitris Michailidis 2022-02-24  308  		 * a replacement page. If we can't the packet will either be
db37bc177dae89 Dimitris Michailidis 2022-02-24  309  		 * copied or dropped so we can retain ownership of the page and
db37bc177dae89 Dimitris Michailidis 2022-02-24  310  		 * reuse it.
db37bc177dae89 Dimitris Michailidis 2022-02-24  311  		 */
db37bc177dae89 Dimitris Michailidis 2022-02-24  312  		if (!q->spare_buf.page &&
db37bc177dae89 Dimitris Michailidis 2022-02-24  313  		    funeth_alloc_page(q, &q->spare_buf, numa_mem_id(),
db37bc177dae89 Dimitris Michailidis 2022-02-24  314  				      GFP_ATOMIC | __GFP_MEMALLOC))
db37bc177dae89 Dimitris Michailidis 2022-02-24  315  			ref_ok = 0;
db37bc177dae89 Dimitris Michailidis 2022-02-24  316  
db37bc177dae89 Dimitris Michailidis 2022-02-24  317  		frag_len = min_t(unsigned int, tot_len,
db37bc177dae89 Dimitris Michailidis 2022-02-24  318  				 PAGE_SIZE - q->buf_offset);
db37bc177dae89 Dimitris Michailidis 2022-02-24  319  		dma_sync_single_for_cpu(q->dma_dev,
db37bc177dae89 Dimitris Michailidis 2022-02-24  320  					buf->dma_addr + q->buf_offset,
db37bc177dae89 Dimitris Michailidis 2022-02-24  321  					frag_len, DMA_FROM_DEVICE);
db37bc177dae89 Dimitris Michailidis 2022-02-24  322  		buf->pg_refs--;
db37bc177dae89 Dimitris Michailidis 2022-02-24  323  		if (ref_ok)
db37bc177dae89 Dimitris Michailidis 2022-02-24  324  			ref_ok |= buf->node;
db37bc177dae89 Dimitris Michailidis 2022-02-24  325  
b51f4113ebb020 Yunsheng Lin         2023-05-11 @326  		skb_frag_fill_page_desc(frags++, buf->page, q->buf_offset,
b51f4113ebb020 Yunsheng Lin         2023-05-11  327  					frag_len);
db37bc177dae89 Dimitris Michailidis 2022-02-24  328  
db37bc177dae89 Dimitris Michailidis 2022-02-24  329  		tot_len -= frag_len;
db37bc177dae89 Dimitris Michailidis 2022-02-24  330  		if (!tot_len)
db37bc177dae89 Dimitris Michailidis 2022-02-24  331  			break;
db37bc177dae89 Dimitris Michailidis 2022-02-24  332  
db37bc177dae89 Dimitris Michailidis 2022-02-24  333  		q->buf_offset = PAGE_SIZE;
db37bc177dae89 Dimitris Michailidis 2022-02-24  334  	}
db37bc177dae89 Dimitris Michailidis 2022-02-24  335  	q->buf_offset = ALIGN(q->buf_offset + frag_len, FUN_EPRQ_PKT_ALIGN);
db37bc177dae89 Dimitris Michailidis 2022-02-24  336  	q->cur_buf = buf;
db37bc177dae89 Dimitris Michailidis 2022-02-24  337  	return ref_ok;
db37bc177dae89 Dimitris Michailidis 2022-02-24  338  }
db37bc177dae89 Dimitris Michailidis 2022-02-24  339  

:::::: The code at line 326 was first introduced by commit
:::::: b51f4113ebb02011f0ca86abc3134b28d2071b6a net: introduce and use skb_frag_fill_page_desc()

:::::: TO: Yunsheng Lin <linyunsheng@huawei.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
