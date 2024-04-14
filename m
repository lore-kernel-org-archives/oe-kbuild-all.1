Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46035135A49
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Apr 2024 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713118275; cv=none; b=FyYBgfPwXajBzaZiyaTLCOj5ky8NE/DJWB0epfAQ64fXn1srBBHkV1bs4PP7wBWfK8lyUGptBQViNjCV1KzwolrAPCfFDV2r9V8DozqvTUd2uoi7QbjgP3/lS9K8iA+uuh64vts4MYfMmMaBsnPa2RI7zoguxGkbhddwEYU/5lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713118275; c=relaxed/simple;
	bh=7NQzqmKgYo++y/p2VUCacT4htpf3EFEWN672hf1AIiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dn7JFJ7t2CahtSSXujq6N3Tw4ttzaGHX5AzAWsr708asdyfrVTKjr2p0d/bQ5LbVv8CFsLem4q8tEAYPW7OAMkFt+qyv4XrcTyRydUiAERT+qWhSybi6aahcm2WLnxAlZSTMH3Xfc+isl0pUyQxP+zgusMwYf0f5khnU6fFGoqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZJJilHi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZJJilHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713118273; x=1744654273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7NQzqmKgYo++y/p2VUCacT4htpf3EFEWN672hf1AIiU=;
  b=QZJJilHifjTeWOpARjB/0FFMW/2f4vehefQGebY+RZNcDt5zI3oqv0y0
   hHkT4PKwwSo61nfgZmuolItrUyCMbYmLrFK8qYHNJAALi7sDY6IysVVda
   yHLmev/+zWY+Yf9rjrHLmHMSBrV6nEJX0zzDZGHRJftAwKCSBN9IijMbv
   BzedJnSpm81mF9UdQq+iPhkK5LQx6cUQdwJd2Xh5tTF4nDbdenEFI4zv7
   WgPSAI98VWnttgNzD5Iean4GMCZic3ULUPxDVrOJR7tj7YBR5vCBed0DC
   rr6G6+cVz6a7xN6ix++rgPxBrlEDfSkVEqmuPu5HWmXgHR1b/UZB6NzJE
   A==;
X-CSE-ConnectionGUID: 3AE+914rQbef5OPWb5JvBQ==
X-CSE-MsgGUID: SzVr99s5SfC+MkMAvAXVFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="33894272"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="33894272"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 11:11:12 -0700
X-CSE-ConnectionGUID: atzlTfz4QnCcsh9t0v2bRg==
X-CSE-MsgGUID: PDNzQcyGRHiORpeG8pwrKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="26377419"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Apr 2024 11:11:11 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rw4Jo-0003l6-1W;
	Sun, 14 Apr 2024 18:11:08 +0000
Date: Mon, 15 Apr 2024 02:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:iou/disable-iowait 1/7]
 drivers/net/xen-netback/netback.c:1159:8: error: no member named 'callback'
 in 'struct ubuf_info'
Message-ID: <202404150239.P5WqhsJd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux iou/disable-iowait
head:   9dbefc5bd91e4c09c282fa0e7c31fe4f4c6d0a2e
commit: 62a4e09968a9a0f73780876dc6fb0f784bee5fae [1/7] net: extend ubuf_info callback to ops structure
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240415/202404150239.P5WqhsJd-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404150239.P5WqhsJd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404150239.P5WqhsJd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/xen-netback/netback.c:35:
   In file included from drivers/net/xen-netback/common.h:35:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/xen-netback/netback.c:1159:8: error: no member named 'callback' in 'struct ubuf_info'
    1159 |         uarg->callback(NULL, uarg, true);
         |         ~~~~  ^
   5 warnings and 1 error generated.
--
   In file included from drivers/net/xen-netback/interface.c:31:
   In file included from drivers/net/xen-netback/common.h:35:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/xen-netback/interface.c:596:9: error: field designator 'callback' does not refer to any field in type 'struct ubuf_info'
     596 |                         { { .callback = xenvif_zerocopy_callback },
         |                             ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings and 1 error generated.


vim +1159 drivers/net/xen-netback/netback.c

f942dc2552b8bf Ian Campbell            2011-03-15  1106  
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1107  /* Consolidate skb with a frag_list into a brand new one with local pages on
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1108   * frags. Returns 0 or -ENOMEM if can't allocate new pages.
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1109   */
e9ce7cb6b10740 Wei Liu                 2014-06-04  1110  static int xenvif_handle_frag_list(struct xenvif_queue *queue, struct sk_buff *skb)
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1111  {
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1112  	unsigned int offset = skb_headlen(skb);
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1113  	skb_frag_t frags[MAX_SKB_FRAGS];
49d9991a18f9aa David Vrabel            2015-03-04  1114  	int i, f;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1115  	struct ubuf_info *uarg;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1116  	struct sk_buff *nskb = skb_shinfo(skb)->frag_list;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1117  
e9ce7cb6b10740 Wei Liu                 2014-06-04  1118  	queue->stats.tx_zerocopy_sent += 2;
e9ce7cb6b10740 Wei Liu                 2014-06-04  1119  	queue->stats.tx_frag_overflow++;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1120  
e9ce7cb6b10740 Wei Liu                 2014-06-04  1121  	xenvif_fill_frags(queue, nskb);
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1122  	/* Subtract frags size, we will correct it later */
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1123  	skb->truesize -= skb->data_len;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1124  	skb->len += nskb->len;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1125  	skb->data_len += nskb->len;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1126  
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1127  	/* create a brand new frags array and coalesce there */
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1128  	for (i = 0; offset < skb->len; i++) {
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1129  		struct page *page;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1130  		unsigned int len;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1131  
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1132  		BUG_ON(i >= MAX_SKB_FRAGS);
44cc8ed17e2034 Zoltan Kiss             2014-10-28  1133  		page = alloc_page(GFP_ATOMIC);
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1134  		if (!page) {
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1135  			int j;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1136  			skb->truesize += skb->data_len;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1137  			for (j = 0; j < i; j++)
d7840976e39156 Matthew Wilcox (Oracle  2019-07-22  1138) 				put_page(skb_frag_page(&frags[j]));
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1139  			return -ENOMEM;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1140  		}
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1141  
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1142  		if (offset + PAGE_SIZE < skb->len)
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1143  			len = PAGE_SIZE;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1144  		else
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1145  			len = skb->len - offset;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1146  		if (skb_copy_bits(skb, offset, page_address(page), len))
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1147  			BUG();
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1148  
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1149  		offset += len;
b51f4113ebb020 Yunsheng Lin            2023-05-11  1150  		skb_frag_fill_page_desc(&frags[i], page, 0, len);
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1151  	}
49d9991a18f9aa David Vrabel            2015-03-04  1152  
49d9991a18f9aa David Vrabel            2015-03-04  1153  	/* Release all the original (foreign) frags. */
49d9991a18f9aa David Vrabel            2015-03-04  1154  	for (f = 0; f < skb_shinfo(skb)->nr_frags; f++)
49d9991a18f9aa David Vrabel            2015-03-04  1155  		skb_frag_unref(skb, f);
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1156  	uarg = skb_shinfo(skb)->destructor_arg;
a64bd934528e26 Wei Liu                 2014-08-12  1157  	/* increase inflight counter to offset decrement in callback */
a64bd934528e26 Wei Liu                 2014-08-12  1158  	atomic_inc(&queue->inflight_packets);
36177832f42d9c Jonathan Lemon          2021-01-06 @1159  	uarg->callback(NULL, uarg, true);
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1160  	skb_shinfo(skb)->destructor_arg = NULL;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1161  
b0c21badf174eb David Vrabel            2015-03-04  1162  	/* Fill the skb with the new (local) frags. */
b0c21badf174eb David Vrabel            2015-03-04  1163  	memcpy(skb_shinfo(skb)->frags, frags, i * sizeof(skb_frag_t));
b0c21badf174eb David Vrabel            2015-03-04  1164  	skb_shinfo(skb)->nr_frags = i;
b0c21badf174eb David Vrabel            2015-03-04  1165  	skb->truesize += i * PAGE_SIZE;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1166  
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1167  	return 0;
e3377f36ca20a0 Zoltan Kiss             2014-03-06  1168  }
b3f980bd827e6e Wei Liu                 2013-08-26  1169  

:::::: The code at line 1159 was first introduced by commit
:::::: 36177832f42d9c7b222ab039678398a9d4070fff skbuff: Add skb parameter to the ubuf zerocopy callback

:::::: TO: Jonathan Lemon <jonathan.lemon@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
