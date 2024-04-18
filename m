Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEDE177980
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 18:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713463263; cv=none; b=ANAd0PVWVWusm/Ed+1XBoRZarbUzX7Z2N60eKA5W6mWbqU55rwYUicGY8TJNvp2P8oyaNBkMKNYpwlpeAKQBXeyf9nWNjherVTrXJktzFsbDyDu7A//MGcCyRdH7Hs2s9ugCZs8ZEG2XmcvXC8DF7eqrCRGywXn8JBSrliVn0iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713463263; c=relaxed/simple;
	bh=Z++8R3XRJ93+VxyPZr10SOs/Z3m4qEcPsS4q26EPoMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dAA8Nqt9GGu6Pv42+QISeBbDmOehpaZdTyf2JkJ9LwAm5TAx86yhHiVSdC9T7wlDOh7PdlUzWS9rc6CxglSXY6lQWoFW/Z2EBEXJOrWQXy3O2Uf8Xicg16GNtWeTR/5sMhQ2s7nl0QmcZKCcfTULmfup2VPOhTiQnr5dhQDulMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDxW/W2h; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDxW/W2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713463261; x=1744999261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z++8R3XRJ93+VxyPZr10SOs/Z3m4qEcPsS4q26EPoMA=;
  b=TDxW/W2hn7ZplQUa70qYh6Mzj0RNck8fJiUMKdqqc2w8EGrRUvtuollo
   Xf7DRzKb+lj/rdMCCNLvIvKYAmSbYOII5z0R12VgklhmpWK7VWoiKXGTd
   pR84FBoB/kUxvfZ/0hy5eiQeNB0Iwwgakho1onzumglad3jnZCwdNfqsO
   iHp0r43jFBs8OyutkqWOtlEtRwFzLdfgP2HggvTNqkEnJU679NhZOz4J9
   +xi0FruBVMCKgfZDqrHLUACIu8C5S/kV7Yjs54VK59+iim9f0Qsf79VoO
   hKpczO+tkXV0IE+ezJqDx1v4R6YawMiIeFeC2sKoq5hTeLc4KzKdsZNy9
   w==;
X-CSE-ConnectionGUID: l59XA7n9QbOLfx61i7XFMw==
X-CSE-MsgGUID: rtgHyy9pSIOStUDFe+6CPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8894963"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8894963"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 11:01:00 -0700
X-CSE-ConnectionGUID: l9RNMd8wSIiV2nQuSC+Cuw==
X-CSE-MsgGUID: u6QEKYxbSxitQeDapNKA+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="27520123"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Apr 2024 11:00:48 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxW3y-00093n-04;
	Thu, 18 Apr 2024 18:00:46 +0000
Date: Fri, 19 Apr 2024 02:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: oe-kbuild-all@lists.linux.dev, linux1394-devel@lists.sourceforge.net
Subject: [ieee1394-linux1394:topic/packet-header-serdes 10/13]
 drivers/firewire/./trace.h:34:40: warning: cast from pointer to integer of
 different size
Message-ID: <202404190129.h6cnnwQw-lkp@intel.com>
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
config: i386-buildonly-randconfig-004-20240419 (https://download.01.org/0day-ci/archive/20240419/202404190129.h6cnnwQw-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190129.h6cnnwQw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190129.h6cnnwQw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from drivers/firewire/trace.h:95,
                    from drivers/firewire/trace.c:5:
   drivers/firewire/./trace.h: In function 'trace_event_raw_event_async_request_outbound_initiate':
>> drivers/firewire/./trace.h:34:40: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      34 |                 __entry->transaction = (u64)transaction;
         |                                        ^
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/firewire/./trace.h:16:1: note: in expansion of macro 'TRACE_EVENT'
      16 | TRACE_EVENT(async_request_outbound_initiate,
         | ^~~~~~~~~~~
   drivers/firewire/./trace.h:33:9: note: in expansion of macro 'TP_fast_assign'
      33 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   drivers/firewire/./trace.h: In function 'trace_event_raw_event_async_request_outbound_complete':
   drivers/firewire/./trace.h:75:40: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      75 |                 __entry->transaction = (u64)transaction;
         |                                        ^
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/firewire/./trace.h:63:1: note: in expansion of macro 'TRACE_EVENT'
      63 | TRACE_EVENT(async_request_outbound_complete,
         | ^~~~~~~~~~~
   drivers/firewire/./trace.h:74:9: note: in expansion of macro 'TP_fast_assign'
      74 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:103:
   drivers/firewire/./trace.h: In function 'perf_trace_async_request_outbound_initiate':
>> drivers/firewire/./trace.h:34:40: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      34 |                 __entry->transaction = (u64)transaction;
         |                                        ^
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/firewire/./trace.h:16:1: note: in expansion of macro 'TRACE_EVENT'
      16 | TRACE_EVENT(async_request_outbound_initiate,
         | ^~~~~~~~~~~
   drivers/firewire/./trace.h:33:9: note: in expansion of macro 'TP_fast_assign'
      33 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   drivers/firewire/./trace.h: In function 'perf_trace_async_request_outbound_complete':
   drivers/firewire/./trace.h:75:40: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      75 |                 __entry->transaction = (u64)transaction;
         |                                        ^
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   drivers/firewire/./trace.h:63:1: note: in expansion of macro 'TRACE_EVENT'
      63 | TRACE_EVENT(async_request_outbound_complete,
         | ^~~~~~~~~~~
   drivers/firewire/./trace.h:74:9: note: in expansion of macro 'TP_fast_assign'
      74 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~


vim +34 drivers/firewire/./trace.h

    15	
    16	TRACE_EVENT(async_request_outbound_initiate,
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
  > 34			__entry->transaction = (u64)transaction;
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
