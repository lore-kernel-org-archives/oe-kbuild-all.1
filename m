Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0E219069A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 21:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713474022; cv=none; b=NEaEudqlkNThJ78UD0U2iTDVmO75kVynGLL91H6bNYYvha+ZFk+LSI8qiO6eNbGN9gdup4cUYj1EnXZOh8fWp3CX7l+Z8FS54iMWaU3OWB+8qY45azx0/D8RGxXB/ebv1Rma6w4S1fjNUjykRE/sutAxN444fRZxCv7J2dM2qyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713474022; c=relaxed/simple;
	bh=ukIktOgFHGHXnhp/YHcfskvdWPlBe8UtDeIkHvVi/3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LWbR5SPSepOQsGaeU3UX0t9iA84/t7ecjZkIdKStOT7cDgOmdYQViS1HcVUPRUcLZ8sHMYryE2ZPDQoj7fgaqBPMhRwof9GR1xYYsrvWmB9/MBa3zY9jsr1kLtOFnR/B/9q/zjyf17YS76BFkcrb+LdLPx92AMPhMiN79SCgc9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apx7ljoQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apx7ljoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713474021; x=1745010021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ukIktOgFHGHXnhp/YHcfskvdWPlBe8UtDeIkHvVi/3g=;
  b=apx7ljoQ4ovq2mYsOHE8eG5muk6+vF0TLuUgKmBcuEgW9FE2lhykPGSw
   Tqnr5cKw/ylqXtc7RUtE2lWj9O+SNR7bz9ASfB/NaDKZCvHjcthOqp7Qo
   yVLa7VWL7/GxqJ8rmQYTvYtWY0w+VKmfNTopKUAjSQt6s5Cl0E7+aAELS
   tUoXxu4ghklHpnbOPvZ+X/cisq2IMcBmbEy5+K2cBPeOXXMC5ANM1ITCG
   Lr1N3ozt/yNs5yNvUTp/Hur/sIyuJ8zQjehbypVIspcKgEXlabalZ2bOd
   2yUkAnSJBGwCzhT/bLYclXh2SBm/I2tPv2q8zJx+9ELQ6Zwu2oWOjqCUA
   g==;
X-CSE-ConnectionGUID: JsYIspwuQPKzlvJl+rw/CQ==
X-CSE-MsgGUID: hMn0JsA4T/2LlbMXQxdqag==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20476080"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="20476080"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 14:00:18 -0700
X-CSE-ConnectionGUID: i7iq0Q0jQeCOTqHU3RUlRw==
X-CSE-MsgGUID: zefwuJh3RCKiyBZA7nYdEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23175677"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Apr 2024 14:00:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxYre-0009EH-0T;
	Thu, 18 Apr 2024 21:00:14 +0000
Date: Fri, 19 Apr 2024 05:00:02 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: oe-kbuild-all@lists.linux.dev, linux1394-devel@lists.sourceforge.net
Subject: [ieee1394-linux1394:topic/packet-header-serdes 10/13]
 drivers/firewire/./trace.h:16:1: sparse: sparse: non size-preserving pointer
 to integer cast
Message-ID: <202404190451.MZBHxSxk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git topic/packet-header-serdes
head:   3fd0015019a0f43eb7c75cb201401277f26d25c8
commit: e406eaaef9d5c80a3b7651fadc1a048659f18029 [10/13] firewire: core: add tracepoints events for asynchronous outbound request
config: i386-randconfig-063-20240419 (https://download.01.org/0day-ci/archive/20240419/202404190451.MZBHxSxk-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190451.MZBHxSxk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190451.MZBHxSxk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firewire/trace.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, drivers/firewire/trace.h):
>> drivers/firewire/./trace.h:16:1: sparse: sparse: non size-preserving pointer to integer cast
   drivers/firewire/./trace.h:63:1: sparse: sparse: non size-preserving pointer to integer cast
   drivers/firewire/trace.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, drivers/firewire/trace.h):
>> drivers/firewire/./trace.h:16:1: sparse: sparse: non size-preserving pointer to integer cast
   drivers/firewire/./trace.h:63:1: sparse: sparse: non size-preserving pointer to integer cast

vim +16 drivers/firewire/./trace.h

    15	
  > 16	TRACE_EVENT(async_request_outbound_initiate,
    17		TP_PROTO(const struct fw_card *card, const struct fw_transaction *transaction,
    18			 const struct fw_packet *packet, const u32 *data, size_t data_count),
    19		TP_ARGS(card, transaction, packet, data, data_count),
    20		TP_STRUCT__entry(
    21			__field(u64, transaction)
    22			__field(u8, scode)
    23			__field(u8, generation)
    24			__field(u16, destination)
    25			__field(u8, tlabel)
    26			__field(u8, retry)
    27			__field(u8, tcode)
    28			__field(u8, priority)
    29			__field(u16, source)
    30			__field(u64, offset)
    31			__dynamic_array(u32, data, data_count)
    32		),
    33		TP_fast_assign(
    34			__entry->transaction = (u64)transaction;
    35			__entry->scode = packet->speed;
    36			__entry->generation = packet->generation;
    37			__entry->destination = async_header_get_destination(packet->header);
    38			__entry->tlabel = async_header_get_tlabel(packet->header);
    39			__entry->retry = async_header_get_retry(packet->header);
    40			__entry->tcode = async_header_get_tcode(packet->header);
    41			__entry->priority = async_header_get_priority(packet->header);
    42			__entry->source = async_header_get_source(packet->header);
    43			__entry->offset = async_header_get_offset(packet->header);
    44			memcpy(__get_dynamic_array(data), data, __get_dynamic_array_len(data));
    45		),
    46		TP_printk(
    47			"transaction=0x%llx scode=%u generation=%u dst_id=0x%04x tlabel=%u retry=%u tcode=%u priority=%u src_id=0x%04x offset=0x%012llx data=%s",
    48			__entry->transaction,
    49			__entry->scode,
    50			__entry->generation,
    51			__entry->destination,
    52			__entry->tlabel,
    53			__entry->retry,
    54			__entry->tcode,
    55			__entry->priority,
    56			__entry->source,
    57			__entry->offset,
    58			__print_array(__get_dynamic_array(data),
    59				      __get_dynamic_array_len(data) / sizeof(u32), sizeof(u32))
    60		)
    61	)
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
