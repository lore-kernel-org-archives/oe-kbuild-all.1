Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2D24292A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 21:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHw7pRvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697664388; x=1729200388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iWXvx4OLdp9Gm3y9lHlrMQ58aF1ADMsDLMa6ofSLprA=;
  b=aHw7pRvx1wU6mFYslvfzFYY//eATmbfNHOhinUB0lN6WaBei64RfvTpF
   9ugOS6HrTAjhiTIZCtO0CTtNScpn7d9egCAGZWZM8fn2TdiWXZve995uC
   B5iXzSTAja+GiLVFcx1XXn23BLHuCaxpPyoQinZsA/xiTP7avRV8YzoAa
   bGHoSBKgQQ8i5k91dWhzYstQrespSUkG613tylYZOLU/KzdK07FFq4dRm
   0Rr5ytd7muy0xpRG98ekydL5X/djh4pjCbIYhXzvPdutFZxPaIzFg6VK9
   CTFqD7zNb+FEgJsTjr/MIKb4jbUueJDnJalfJ9nuRnQnCEOjSTwmT8TMH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="388975281"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="388975281"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 14:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4507723"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2023 14:25:18 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtE3b-000152-2u;
	Wed, 18 Oct 2023 21:26:23 +0000
Date: Thu, 19 Oct 2023 05:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12128/13299]
 drivers/net/ethernet/engleder/tsnep_main.c:470:25: warning: argument 2 null
 where non-null expected
Message-ID: <202310190541.U0K7h90n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2dac75696c6da3c848daa118a729827541c89d33
commit: dccce1d7c04051bc25d3abbe7716d0ae7af9c28a [12128/13299] tsnep: Inline small fragments within TX descriptor
config: powerpc64-randconfig-r033-20220404 (https://download.01.org/0day-ci/archive/20231019/202310190541.U0K7h90n-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190541.U0K7h90n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190541.U0K7h90n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'tsnep_tx_map_frag',
       inlined from 'tsnep_tx_map' at drivers/net/ethernet/engleder/tsnep_main.c:511:13:
>> drivers/net/ethernet/engleder/tsnep_main.c:470:25: warning: argument 2 null where non-null expected [-Wnonnull]
     470 |                         memcpy(&entry->desc->tx, fragdata + skb_frag_off(frag),
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     471 |                                len);
         |                                ~~~~
   In file included from include/linux/string.h:20,
                    from arch/powerpc/include/asm/paca.h:16,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/net/ethernet/engleder/tsnep.h:9,
                    from drivers/net/ethernet/engleder/tsnep_main.c:18:
   arch/powerpc/include/asm/string.h: In function 'tsnep_tx_map':
   arch/powerpc/include/asm/string.h:27:15: note: in a call to function 'memcpy' declared 'nonnull'
      27 | extern void * memcpy(void *,const void *,__kernel_size_t);
         |               ^~~~~~


vim +470 drivers/net/ethernet/engleder/tsnep_main.c

   447	
   448	static int tsnep_tx_map_frag(skb_frag_t *frag, struct tsnep_tx_entry *entry,
   449				     struct device *dmadev, dma_addr_t *dma)
   450	{
   451		unsigned int len;
   452		int mapped;
   453	
   454		len = skb_frag_size(frag);
   455		if (likely(len > TSNEP_DESC_SIZE_DATA_AFTER_INLINE)) {
   456			*dma = skb_frag_dma_map(dmadev, frag, 0, len, DMA_TO_DEVICE);
   457			if (dma_mapping_error(dmadev, *dma))
   458				return -ENOMEM;
   459			entry->type = TSNEP_TX_TYPE_SKB_FRAG_MAP_PAGE;
   460			mapped = 1;
   461		} else {
   462			void *fragdata = skb_frag_address_safe(frag);
   463	
   464			if (likely(fragdata)) {
   465				memcpy(&entry->desc->tx, fragdata, len);
   466			} else {
   467				struct page *page = skb_frag_page(frag);
   468	
   469				fragdata = kmap_local_page(page);
 > 470				memcpy(&entry->desc->tx, fragdata + skb_frag_off(frag),
   471				       len);
   472				kunmap_local(fragdata);
   473			}
   474			entry->type = TSNEP_TX_TYPE_SKB_FRAG_INLINE;
   475			mapped = 0;
   476		}
   477	
   478		return mapped;
   479	}
   480	
   481	static int tsnep_tx_map(struct sk_buff *skb, struct tsnep_tx *tx, int count)
   482	{
   483		struct device *dmadev = tx->adapter->dmadev;
   484		struct tsnep_tx_entry *entry;
   485		unsigned int len;
   486		int map_len = 0;
   487		dma_addr_t dma;
   488		int i, mapped;
   489	
   490		for (i = 0; i < count; i++) {
   491			entry = &tx->entry[(tx->write + i) & TSNEP_RING_MASK];
   492	
   493			if (!i) {
   494				len = skb_headlen(skb);
   495				if (likely(len > TSNEP_DESC_SIZE_DATA_AFTER_INLINE)) {
   496					dma = dma_map_single(dmadev, skb->data, len,
   497							     DMA_TO_DEVICE);
   498					if (dma_mapping_error(dmadev, dma))
   499						return -ENOMEM;
   500					entry->type = TSNEP_TX_TYPE_SKB_MAP;
   501					mapped = 1;
   502				} else {
   503					memcpy(&entry->desc->tx, skb->data, len);
   504					entry->type = TSNEP_TX_TYPE_SKB_INLINE;
   505					mapped = 0;
   506				}
   507			} else {
   508				skb_frag_t *frag = &skb_shinfo(skb)->frags[i - 1];
   509	
   510				len = skb_frag_size(frag);
 > 511				mapped = tsnep_tx_map_frag(frag, entry, dmadev, &dma);
   512				if (mapped < 0)
   513					return mapped;
   514			}
   515	
   516			entry->len = len;
   517			if (likely(mapped)) {
   518				dma_unmap_addr_set(entry, dma, dma);
   519				entry->desc->tx = __cpu_to_le64(dma);
   520			}
   521	
   522			map_len += len;
   523		}
   524	
   525		return map_len;
   526	}
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
