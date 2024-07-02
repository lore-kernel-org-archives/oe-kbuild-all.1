Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD6F1DA332
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 23:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719963437; cv=none; b=OGh5K9N6UgA2KYgQdQdkiAvEArcjd6IPndibtfIbjYJ0ac3RxA+gyA2TMX69hFwQYAGh6G7UKR54YW57PKJWKxibePaX0Hgs1eiKMaW4/WAZiksUaEycSXDdrNbnfLQxMri3kiRr8X6LJhWpQ8FqI4/iYCUUhO2M1g5SvT8BiAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719963437; c=relaxed/simple;
	bh=rKnJ8LxOVlYeAGCw99qsiSNLbEeMNnROjoNYwvsDyY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R8A6QIC+QF+TqfeJGwaOu0ONrGXIhRjMxxsJVfiD1rqJJ6idYlbWHx646YGA885ggpS1ZJQZcptlZozbAzRKKVSP1X0lofXmjUh6+D6U/gAjW59OWjNE2falt9gkibVA4Nhj/l+SUKO+m0FtmUc5CX5wGJVbGu6RsBK2mRrjrSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9CQTkoi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9CQTkoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719963435; x=1751499435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rKnJ8LxOVlYeAGCw99qsiSNLbEeMNnROjoNYwvsDyY0=;
  b=n9CQTkoiqPnKOzz9AWyTKr5BrC2O9ep9wP3yglxwEZwlCn+8ha6FhrfD
   YX1R2HHYQAyYdWmk+U8k2stg+qxCiv4N/Aqh/li2i8QV+RLj7P3X0zVoh
   GXEsCvxALvYg3yCDaOAySeoA5OMb+jZhBz26ab9fcgrwacg+GKLHpovuZ
   6f+JH6QnnkYVxuBgGvPKUF6uDBDypMW+R1+a8AW5Z7nzwhtlYrOKSDRk8
   0T1Cn5v0z/B+eCKArzgXWC0y5/JLqY+GNkRCaTgpVCv+gxcOI0BMly+qm
   gJr5iaIPtL6KceJ3Y8RN2O0GMpLoAAOidwjb0n1XfumoeHtbpoUdIhXle
   Q==;
X-CSE-ConnectionGUID: DbE+RhisTqetMfXtymHzJA==
X-CSE-MsgGUID: JmRpVRBuRQKgWcum91NMBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20932548"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="20932548"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 16:37:09 -0700
X-CSE-ConnectionGUID: g/OjBv2PRpmFyR/qLDkCfg==
X-CSE-MsgGUID: vxYXOGnRQf6MqubTzshkmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="46798705"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jul 2024 16:37:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOn3U-000Ow2-1V;
	Tue, 02 Jul 2024 23:37:00 +0000
Date: Wed, 3 Jul 2024 07:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 24/36]
 drivers/net/wireless/mediatek/mt76/mt792x_trace.h:24:11: error: expected
 identifier
Message-ID: <202407030715.FzXsvsG0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   daa95af9ac26711b21e20be3c8d512d6de26bb11
commit: ae027e8620ed35529906c8ff93bdb00813b93909 [24/36] page_pool: add page_pool_state_hold() helper
config: powerpc64-randconfig-003-20240703 (https://download.01.org/0day-ci/archive/20240703/202407030715.FzXsvsG0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030715.FzXsvsG0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030715.FzXsvsG0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/mediatek/mt76/mt792x_trace.c:10:
   In file included from drivers/net/wireless/mediatek/mt76/mt792x_trace.h:10:
   In file included from drivers/net/wireless/mediatek/mt76/mt792x.h:7:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/wireless/mediatek/mt76/mt792x_trace.c:10:
>> drivers/net/wireless/mediatek/mt76/mt792x_trace.h:24:11: error: expected identifier
      24 |         TP_PROTO(struct mt792x_dev *dev, u8 lp_state),
         |                  ^
>> drivers/net/wireless/mediatek/mt76/mt792x_trace.h:23:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      23 | TRACE_EVENT(lp_event,
         | ^
         | int
>> drivers/net/wireless/mediatek/mt76/mt792x_trace.h:23:12: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      23 | TRACE_EVENT(lp_event,
         |            ^
   1 warning and 3 errors generated.
--
   In file included from drivers/net/wireless/mediatek/mt76/mt76x02_trace.c:10:
   In file included from drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:10:
   In file included from drivers/net/wireless/mediatek/mt76/mt76x02.h:10:
   In file included from include/linux/kfifo.h:40:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/wireless/mediatek/mt76/mt76x02_trace.c:10:
>> drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:27:11: error: expected identifier
      27 |         TP_PROTO(struct mt76x02_dev *dev),
         |                  ^
>> drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:26:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      26 | DECLARE_EVENT_CLASS(dev_evt,
         | ^
         | int
>> drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:26:20: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      26 | DECLARE_EVENT_CLASS(dev_evt,
         |                    ^
      27 |         TP_PROTO(struct mt76x02_dev *dev),
      28 |         TP_ARGS(dev),
      29 |         TP_STRUCT__entry(
      30 |                 DEV_ENTRY
      31 |         ),
      32 |         TP_fast_assign(
      33 |                 DEV_ASSIGN;
      34 |         ),
      35 |         TP_printk(DEV_PR_FMT, DEV_PR_ARG)
      36 | );
         | void
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:39:11: error: expected identifier
      39 |         TP_PROTO(struct mt76x02_dev *dev),
         |                  ^
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:38:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      38 | DEFINE_EVENT(dev_evt, mac_txstat_poll,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:38:13: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      38 | DEFINE_EVENT(dev_evt, mac_txstat_poll,
         |             ^
      39 |         TP_PROTO(struct mt76x02_dev *dev),
      40 |         TP_ARGS(dev)
      41 | );
         | void
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:44:11: error: expected identifier
      44 |         TP_PROTO(struct mt76x02_dev *dev,
         |                  ^
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:43:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      43 | TRACE_EVENT(mac_txstat_fetch,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:43:12: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      43 | TRACE_EVENT(mac_txstat_fetch,
         |            ^
   In file included from drivers/net/wireless/mediatek/mt76/mt76x02_trace.c:10:
   In file included from drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:87:
   In file included from include/trace/define_trace.h:95:
>> drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:27:11: error: expected identifier
      27 |         TP_PROTO(struct mt76x02_dev *dev),
         |                  ^
>> drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:26:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      26 | DECLARE_EVENT_CLASS(dev_evt,
         | ^
         | int
>> drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:26:20: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      26 | DECLARE_EVENT_CLASS(dev_evt,
         |                    ^
      27 |         TP_PROTO(struct mt76x02_dev *dev),
      28 |         TP_ARGS(dev),
      29 |         TP_STRUCT__entry(
      30 |                 DEV_ENTRY
      31 |         ),
      32 |         TP_fast_assign(
      33 |                 DEV_ASSIGN;
      34 |         ),
      35 |         TP_printk(DEV_PR_FMT, DEV_PR_ARG)
      36 | );
         | void
   1 warning and 12 errors generated.
--
   In file included from drivers/net/wireless/mediatek/mt76/trace.c:10:
   In file included from drivers/net/wireless/mediatek/mt76/trace.h:10:
   In file included from drivers/net/wireless/mediatek/mt76/mt76.h:10:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/wireless/mediatek/mt76/trace.c:10:
>> drivers/net/wireless/mediatek/mt76/trace.h:33:11: error: expected identifier
      33 |         TP_PROTO(struct mt76_dev *dev, u32 reg, u32 val),
         |                  ^
>> drivers/net/wireless/mediatek/mt76/trace.h:32:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      32 | DECLARE_EVENT_CLASS(dev_reg_evt,
         | ^
         | int
>> drivers/net/wireless/mediatek/mt76/trace.h:32:20: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      32 | DECLARE_EVENT_CLASS(dev_reg_evt,
         |                    ^
      33 |         TP_PROTO(struct mt76_dev *dev, u32 reg, u32 val),
      34 |         TP_ARGS(dev, reg, val),
      35 |         TP_STRUCT__entry(
      36 |                 DEV_ENTRY
      37 |                 REG_ENTRY
      38 |         ),
      39 |         TP_fast_assign(
      40 |                 DEVICE_ASSIGN;
      41 |                 REG_ASSIGN;
      42 |         ),
      43 |         TP_printk(
      44 |                 DEV_PR_FMT REG_PR_FMT,
      45 |                 DEV_PR_ARG, REG_PR_ARG
      46 |         )
      47 | );
         | void
   drivers/net/wireless/mediatek/mt76/trace.h:50:11: error: expected identifier
      50 |         TP_PROTO(struct mt76_dev *dev, u32 reg, u32 val),
         |                  ^
   drivers/net/wireless/mediatek/mt76/trace.h:49:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      49 | DEFINE_EVENT(dev_reg_evt, reg_rr,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/trace.h:49:13: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      49 | DEFINE_EVENT(dev_reg_evt, reg_rr,
         |             ^
      50 |         TP_PROTO(struct mt76_dev *dev, u32 reg, u32 val),
      51 |         TP_ARGS(dev, reg, val)
      52 | );
         | void
   drivers/net/wireless/mediatek/mt76/trace.h:55:11: error: expected identifier
      55 |         TP_PROTO(struct mt76_dev *dev, u32 reg, u32 val),
         |                  ^
   drivers/net/wireless/mediatek/mt76/trace.h:54:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      54 | DEFINE_EVENT(dev_reg_evt, reg_wr,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/trace.h:54:13: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      54 | DEFINE_EVENT(dev_reg_evt, reg_wr,
         |             ^
      55 |         TP_PROTO(struct mt76_dev *dev, u32 reg, u32 val),
      56 |         TP_ARGS(dev, reg, val)
      57 | );
         | void
   drivers/net/wireless/mediatek/mt76/trace.h:60:11: error: expected identifier
      60 |         TP_PROTO(struct mt76_dev *dev, u32 val, u32 mask),
         |                  ^
   drivers/net/wireless/mediatek/mt76/trace.h:59:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      59 | TRACE_EVENT(dev_irq,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/trace.h:59:12: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      59 | TRACE_EVENT(dev_irq,
         |            ^
   drivers/net/wireless/mediatek/mt76/trace.h:83:11: error: expected identifier
      83 |         TP_PROTO(struct mt76_dev *dev, u8 wcid, u8 pktid),
         |                  ^
   drivers/net/wireless/mediatek/mt76/trace.h:82:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      82 | DECLARE_EVENT_CLASS(dev_txid_evt,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/trace.h:82:20: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      82 | DECLARE_EVENT_CLASS(dev_txid_evt,
         |                    ^
      83 |         TP_PROTO(struct mt76_dev *dev, u8 wcid, u8 pktid),
      84 |         TP_ARGS(dev, wcid, pktid),
      85 |         TP_STRUCT__entry(
      86 |                 DEV_ENTRY
      87 |                 TXID_ENTRY
      88 |         ),
      89 |         TP_fast_assign(
      90 |                 DEVICE_ASSIGN;
      91 |                 TXID_ASSIGN;
      92 |         ),
      93 |         TP_printk(
      94 |                 DEV_PR_FMT TXID_PR_FMT,
      95 |                 DEV_PR_ARG, TXID_PR_ARG
      96 |         )
      97 | );
         | void
   drivers/net/wireless/mediatek/mt76/trace.h:100:11: error: expected identifier
     100 |         TP_PROTO(struct mt76_dev *dev, u8 wcid, u8 pktid),
         |                  ^
   drivers/net/wireless/mediatek/mt76/trace.h:99:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      99 | DEFINE_EVENT(dev_txid_evt, mac_txdone,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/trace.h:99:13: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      99 | DEFINE_EVENT(dev_txid_evt, mac_txdone,
         |             ^
     100 |         TP_PROTO(struct mt76_dev *dev, u8 wcid, u8 pktid),
     101 |         TP_ARGS(dev, wcid, pktid)
     102 | );
         | void
   In file included from drivers/net/wireless/mediatek/mt76/trace.c:10:
   In file included from drivers/net/wireless/mediatek/mt76/trace.h:111:
   In file included from include/trace/define_trace.h:95:
>> drivers/net/wireless/mediatek/mt76/trace.h:33:11: error: expected identifier
      33 |         TP_PROTO(struct mt76_dev *dev, u32 reg, u32 val),
         |                  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +24 drivers/net/wireless/mediatek/mt76/mt792x_trace.h

2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  22  
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11 @23  TRACE_EVENT(lp_event,
975e122ddb7cd6 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2023-06-28 @24  	TP_PROTO(struct mt792x_dev *dev, u8 lp_state),
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  25  
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  26  	TP_ARGS(dev, lp_state),
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  27  
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  28  	TP_STRUCT__entry(
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  29  		DEV_ENTRY
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  30  		__field(u8, lp_state)
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  31  	),
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  32  
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  33  	TP_fast_assign(
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  34  		DEV_ASSIGN;
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  35  		__entry->lp_state = lp_state;
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  36  	),
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  37  
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  38  	TP_printk(
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  39  		DEV_PR_FMT " %s",
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  40  		DEV_PR_ARG, LP_STATE_PR_ARG
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  41  	)
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  42  );
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  43  

:::::: The code at line 24 was first introduced by commit
:::::: 975e122ddb7cd6f67bff974d2ea00c5568d2014c wifi: mt76: mt7921: rename mt7921_dev in mt792x_dev

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
