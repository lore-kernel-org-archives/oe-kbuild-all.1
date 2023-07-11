Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCA5211F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 06:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689057847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jMxvCGVApT+/gBu1e9SCdTJXqw0c3Cx5d5hb47SKJuk=;
	b=L8bFNyd9ArKRE/MAIt8KpKbJ3EoWPrUJbsiQNhAd2SyyA0pbqrHMEDBXwqc9KRbaOnHfFy
	oQJmpKOIVEB751Z484CIsH7nogKSv9cyu3/BJ4lZ/QH5XBp+ACypBndAgJp3XXQIU1FMZ2
	nQ0aIC8vgioGx0Q/dUor77ach+Zb80c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-gQzsAU4CN_mNUvV9DIHymg-1; Tue, 11 Jul 2023 02:44:04 -0400
X-MC-Unique: gQzsAU4CN_mNUvV9DIHymg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E4B91C08960;
	Tue, 11 Jul 2023 06:44:03 +0000 (UTC)
Received: from localhost (ovpn-12-93.pek2.redhat.com [10.72.12.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 668F11454141;
	Tue, 11 Jul 2023 06:44:00 +0000 (UTC)
Date: Tue, 11 Jul 2023 14:43:50 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: Re: [linux-next:master 1208/1391] arch/s390/include/asm/io.h:29:17:
 error: implicit declaration of function 'iounmap'; did you mean 'vunmap'?
Message-ID: <ZKz6JoKXJIRQHAeW@MiWiFi-R3L-srv>
References: <202307111309.401QvMTN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202307111309.401QvMTN-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 07/11/23 at 02:06pm, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8e4b7f2f3d6071665b1dfd70786229c8a5d6c256
> commit: 438780c042f7b65cb02ac16846f226fe87f3b410 [1208/1391] s390: mm: convert to GENERIC_IOREMAP
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230711/202307111309.401QvMTN-lkp@intel.com/config)

In above config file, we have:

# CONFIG_PCI is not set

It's not the mentioned commit which caused these reported erros. They
have been there for long time. Below patchset I posted can fix them:

[PATCH 0/8] Make several Kconfig options depend on HAS_IOMEM
https://lore.kernel.org/all/20230707135852.24292-1-bhe@redhat.com/T/#u

Thanks

> compiler: s390-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111309.401QvMTN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307111309.401QvMTN-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/io.h:13,
>                     from include/linux/pci.h:39,
>                     from drivers/pcmcia/cistpl.c:21:
>    drivers/pcmcia/cistpl.c: In function 'release_cis_mem':
> >> arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
>       29 | #define iounmap iounmap
>          |                 ^~~~~~~
>    drivers/pcmcia/cistpl.c:72:17: note: in expansion of macro 'iounmap'
>       72 |                 iounmap(s->cis_virt);
>          |                 ^~~~~~~
>    drivers/pcmcia/cistpl.c: In function 'set_cis_map':
> >> drivers/pcmcia/cistpl.c:103:31: error: implicit declaration of function 'ioremap'; did you mean 'iounmap'? [-Werror=implicit-function-declaration]
>      103 |                 s->cis_virt = ioremap(mem->res->start, s->map_size);
>          |                               ^~~~~~~
>          |                               iounmap
>    drivers/pcmcia/cistpl.c:103:29: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      103 |                 s->cis_virt = ioremap(mem->res->start, s->map_size);
>          |                             ^
>    drivers/pcmcia/cistpl.c:118:29: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      118 |                 s->cis_virt = ioremap(mem->static_start, s->map_size);
>          |                             ^
>    cc1: some warnings being treated as errors
> --
>    drivers/net/arcnet/com90xx.c: In function 'com90xx_probe':
> >> drivers/net/arcnet/com90xx.c:225:24: error: implicit declaration of function 'ioremap'; did you mean 'ifr_map'? [-Werror=implicit-function-declaration]
>      225 |                 base = ioremap(*p, MIRROR_SIZE);
>          |                        ^~~~~~~
>          |                        ifr_map
>    drivers/net/arcnet/com90xx.c:225:22: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      225 |                 base = ioremap(*p, MIRROR_SIZE);
>          |                      ^
>    In file included from include/linux/scatterlist.h:9,
>                     from include/linux/dma-mapping.h:11,
>                     from include/linux/skbuff.h:28,
>                     from include/net/net_namespace.h:43,
>                     from include/linux/netdevice.h:38,
>                     from drivers/net/arcnet/com90xx.c:36:
> >> arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
>       29 | #define iounmap iounmap
>          |                 ^~~~~~~
>    drivers/net/arcnet/com90xx.c:260:17: note: in expansion of macro 'iounmap'
>      260 |                 iounmap(base);
>          |                 ^~~~~~~
>    drivers/net/arcnet/com90xx.c: In function 'check_mirror':
>    drivers/net/arcnet/com90xx.c:444:11: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      444 |         p = ioremap(addr, size);
>          |           ^
>    drivers/net/arcnet/com90xx.c: In function 'com90xx_found':
>    drivers/net/arcnet/com90xx.c:526:23: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      526 |         lp->mem_start = ioremap(dev->mem_start,
>          |                       ^
>    cc1: some warnings being treated as errors
> --
>    drivers/net/arcnet/arc-rimi.c: In function 'check_mirror':
> >> drivers/net/arcnet/arc-rimi.c:107:13: error: implicit declaration of function 'ioremap'; did you mean 'ifr_map'? [-Werror=implicit-function-declaration]
>      107 |         p = ioremap(addr, size);
>          |             ^~~~~~~
>          |             ifr_map
>    drivers/net/arcnet/arc-rimi.c:107:11: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      107 |         p = ioremap(addr, size);
>          |           ^
>    In file included from include/linux/scatterlist.h:9,
>                     from include/linux/dma-mapping.h:11,
>                     from include/linux/skbuff.h:28,
>                     from include/net/net_namespace.h:43,
>                     from include/linux/netdevice.h:38,
>                     from drivers/net/arcnet/arc-rimi.c:35:
> >> arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
>       29 | #define iounmap iounmap
>          |                 ^~~~~~~
>    drivers/net/arcnet/arc-rimi.c:113:17: note: in expansion of macro 'iounmap'
>      113 |                 iounmap(p);
>          |                 ^~~~~~~
>    drivers/net/arcnet/arc-rimi.c: In function 'arcrimi_found':
>    drivers/net/arcnet/arc-rimi.c:131:11: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      131 |         p = ioremap(dev->mem_start, MIRROR_SIZE);
>          |           ^
>    drivers/net/arcnet/arc-rimi.c:202:23: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      202 |         lp->mem_start = ioremap(dev->mem_start,
>          |                       ^
>    cc1: some warnings being treated as errors
> --
>    drivers/tty/ipwireless/main.c: In function 'ipwireless_probe':
> >> drivers/tty/ipwireless/main.c:115:30: error: implicit declaration of function 'ioremap'; did you mean 'iounmap'? [-Werror=implicit-function-declaration]
>      115 |         ipw->common_memory = ioremap(p_dev->resource[2]->start,
>          |                              ^~~~~~~
>          |                              iounmap
>    drivers/tty/ipwireless/main.c:115:28: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      115 |         ipw->common_memory = ioremap(p_dev->resource[2]->start,
>          |                            ^
>    drivers/tty/ipwireless/main.c:139:26: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      139 |         ipw->attr_memory = ioremap(p_dev->resource[3]->start,
>          |                          ^
>    In file included from include/linux/io.h:13,
>                     from drivers/tty/ipwireless/main.c:26:
> >> arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
>       29 | #define iounmap iounmap
>          |                 ^~~~~~~
>    drivers/tty/ipwireless/main.c:155:9: note: in expansion of macro 'iounmap'
>      155 |         iounmap(ipw->attr_memory);
>          |         ^~~~~~~
>    cc1: some warnings being treated as errors
> --
>    drivers/net/ethernet/8390/pcnet_cs.c: In function 'get_hwinfo':
> >> drivers/net/ethernet/8390/pcnet_cs.c:290:12: error: implicit declaration of function 'ioremap'; did you mean 'ifr_map'? [-Werror=implicit-function-declaration]
>      290 |     virt = ioremap(link->resource[2]->start,
>          |            ^~~~~~~
>          |            ifr_map
>    drivers/net/ethernet/8390/pcnet_cs.c:290:10: warning: assignment to 'u_char *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      290 |     virt = ioremap(link->resource[2]->start,
>          |          ^
>    In file included from include/linux/scatterlist.h:9,
>                     from include/linux/dma-mapping.h:11,
>                     from include/linux/skbuff.h:28,
>                     from include/net/net_namespace.h:43,
>                     from include/linux/netdevice.h:38,
>                     from drivers/net/ethernet/8390/pcnet_cs.c:38:
> >> arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
>       29 | #define iounmap iounmap
>          |                 ^~~~~~~
>    drivers/net/ethernet/8390/pcnet_cs.c:311:5: note: in expansion of macro 'iounmap'
>      311 |     iounmap(virt);
>          |     ^~~~~~~
>    drivers/net/ethernet/8390/pcnet_cs.c: In function 'setup_shmem_window':
>    drivers/net/ethernet/8390/pcnet_cs.c:1440:16: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>     1440 |     info->base = ioremap(link->resource[3]->start,
>          |                ^
>    cc1: some warnings being treated as errors
> --
>    drivers/net/ethernet/fujitsu/fmvj18x_cs.c: In function 'fmvj18x_get_hwinfo':
> >> drivers/net/ethernet/fujitsu/fmvj18x_cs.c:549:12: error: implicit declaration of function 'ioremap'; did you mean 'iounmap'? [-Werror=implicit-function-declaration]
>      549 |     base = ioremap(link->resource[2]->start, resource_size(link->resource[2]));
>          |            ^~~~~~~
>          |            iounmap
>    drivers/net/ethernet/fujitsu/fmvj18x_cs.c:549:10: warning: assignment to 'u_char *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      549 |     base = ioremap(link->resource[2]->start, resource_size(link->resource[2]));
>          |          ^
>    In file included from include/linux/scatterlist.h:9,
>                     from include/linux/dma-mapping.h:11,
>                     from include/linux/skbuff.h:28,
>                     from include/linux/if_ether.h:19,
>                     from include/linux/ethtool.h:18,
>                     from drivers/net/ethernet/fujitsu/fmvj18x_cs.c:45:
> >> arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
>       29 | #define iounmap iounmap
>          |                 ^~~~~~~
>    drivers/net/ethernet/fujitsu/fmvj18x_cs.c:579:5: note: in expansion of macro 'iounmap'
>      579 |     iounmap(base);
>          |     ^~~~~~~
>    drivers/net/ethernet/fujitsu/fmvj18x_cs.c: In function 'fmvj18x_setup_mfc':
>    drivers/net/ethernet/fujitsu/fmvj18x_cs.c:600:14: warning: assignment to 'u_char *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      600 |     lp->base = ioremap(link->resource[3]->start,
>          |              ^
>    cc1: some warnings being treated as errors
> --
>    drivers/net/ethernet/smsc/smc91c92_cs.c: In function 'mhz_mfc_config':
> >> drivers/net/ethernet/smsc/smc91c92_cs.c:447:17: error: implicit declaration of function 'ioremap'; did you mean 'ifr_map'? [-Werror=implicit-function-declaration]
>      447 |     smc->base = ioremap(link->resource[2]->start,
>          |                 ^~~~~~~
>          |                 ifr_map
>    drivers/net/ethernet/smsc/smc91c92_cs.c:447:15: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      447 |     smc->base = ioremap(link->resource[2]->start,
>          |               ^
>    In file included from include/linux/scatterlist.h:9,
>                     from include/linux/dma-mapping.h:11,
>                     from include/linux/skbuff.h:28,
>                     from include/net/net_namespace.h:43,
>                     from include/linux/netdevice.h:38,
>                     from drivers/net/ethernet/smsc/smc91c92_cs.c:38:
>    drivers/net/ethernet/smsc/smc91c92_cs.c: In function 'smc91c92_release':
> >> arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
>       29 | #define iounmap iounmap
>          |                 ^~~~~~~
>    drivers/net/ethernet/smsc/smc91c92_cs.c:962:17: note: in expansion of macro 'iounmap'
>      962 |                 iounmap(smc->base);
>          |                 ^~~~~~~
>    cc1: some warnings being treated as errors
> --
>    drivers/net/ethernet/xircom/xirc2ps_cs.c: In function 'xirc2ps_config':
> >> drivers/net/ethernet/xircom/xirc2ps_cs.c:843:28: error: implicit declaration of function 'ioremap'; did you mean 'iounmap'? [-Werror=implicit-function-declaration]
>      843 |         local->dingo_ccr = ioremap(link->resource[2]->start, 0x1000) + 0x0800;
>          |                            ^~~~~~~
>          |                            iounmap
>    drivers/net/ethernet/xircom/xirc2ps_cs.c:843:26: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      843 |         local->dingo_ccr = ioremap(link->resource[2]->start, 0x1000) + 0x0800;
>          |                          ^
>    In file included from include/linux/scatterlist.h:9,
>                     from include/linux/dma-mapping.h:11,
>                     from include/linux/skbuff.h:28,
>                     from include/linux/if_ether.h:19,
>                     from include/linux/ethtool.h:18,
>                     from drivers/net/ethernet/xircom/xirc2ps_cs.c:77:
>    drivers/net/ethernet/xircom/xirc2ps_cs.c: In function 'xirc2ps_release':
> >> arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
>       29 | #define iounmap iounmap
>          |                 ^~~~~~~
>    drivers/net/ethernet/xircom/xirc2ps_cs.c:934:25: note: in expansion of macro 'iounmap'
>      934 |                         iounmap(local->dingo_ccr - 0x0800);
>          |                         ^~~~~~~
>    cc1: some warnings being treated as errors
> 
> 
> vim +29 arch/s390/include/asm/io.h
> 
>     24	
>     25	/*
>     26	 * I/O memory mapping functions.
>     27	 */
>     28	#define ioremap_prot ioremap_prot
>   > 29	#define iounmap iounmap
>     30	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

