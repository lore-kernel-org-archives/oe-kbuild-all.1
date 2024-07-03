Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78AB173359
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014106; cv=none; b=U8a37PRO56pxizistOokkoQfq/Ada8fIEy8rshVUyT6madnlHpEDjGxAyTIeeD7Slw6Twk/ch2uChDtTTBErO/bR41vkzHxyyNjelsIOCLpNIhgd1qBxSvMmYCB67ig8lNtfTHpNiMVp0Jik9aYPIyN0ANo5J1mIpMUL6vebCDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014106; c=relaxed/simple;
	bh=I6Ohi6QjgDRxglo9QPWIL7fhYFZSOOffS5Af0i6x4IA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d9rPb+n0yt7Z2ciu4NRThfvPIa1HomqTakbZKLQ3xcExlsjsGaOfp8UQW4Rv26DN8tTZjU1nKJ2O2fPTfpwmm3gtv/MpvpmUS0J+UyyJXSv6xllAcod5pRH6GOOmmQ3+jUAVWHmL9lf4UBkfi/itGGabXSkaFwGYego4onL+kws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEE8gQgA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEE8gQgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720014104; x=1751550104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I6Ohi6QjgDRxglo9QPWIL7fhYFZSOOffS5Af0i6x4IA=;
  b=QEE8gQgAY72YSa2190qUrzAqa4B64hks8wwAaZ6ps2qfMU3VWYMWa/vA
   nzTQ7IEkN6EoKGDmuRj6tHhYCm/2SnPjEIJpHDp1W3EzdBIBUgVMh5VfN
   6sJOCC5MqXRz+OOT4xkiEPJcLxjn3Uh5i2n5v3AUH2Pm/3kBRdJRPb4Xz
   aI2FI8RdnBtqIR8WX+0wvDcv5yUluSdlfxTbBkRSxdR3yFMnEZYOXMRvc
   Ez/rzP6ZeymqAz6lBD9vCmXmnKteG73bNsjwj2C/hQ71eOmZTz+AlhMeO
   BBpxLDCzpePdQ6ehbaJKdv32fHppNOopSg1IBoQNM/oSHNOJH7PYGyjlu
   w==;
X-CSE-ConnectionGUID: rmA7vLTMRGa+QeL+FJLo0w==
X-CSE-MsgGUID: uVvavjvbTFCNqsxJBm5hiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16966566"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="16966566"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 06:41:43 -0700
X-CSE-ConnectionGUID: c+4Kv1aGTQOV6dherta7rQ==
X-CSE-MsgGUID: m3xXfP44T1+WwmV7bHUy4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="46270477"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jul 2024 06:41:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sP0Et-000Pms-2T;
	Wed, 03 Jul 2024 13:41:39 +0000
Date: Wed, 3 Jul 2024 21:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 25/37]
 drivers/net/wireless/mediatek/mt76/mt792x_trace.h:34:13: error: expected ')'
Message-ID: <202407032112.X9drUESA-lkp@intel.com>
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
commit: f40c5967337c5bf3616ff1dee55e63ce1988a22f [25/37] page_pool: add page_pool_state_hold() helper
config: i386-buildonly-randconfig-001-20240703 (https://download.01.org/0day-ci/archive/20240703/202407032112.X9drUESA-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407032112.X9drUESA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407032112.X9drUESA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/mediatek/mt76/mt792x_trace.c:10:
   drivers/net/wireless/mediatek/mt76/mt792x_trace.h:24:11: error: expected identifier
      24 |         TP_PROTO(struct mt792x_dev *dev, u8 lp_state),
         |                  ^
>> drivers/net/wireless/mediatek/mt76/mt792x_trace.h:34:13: error: expected ')'
      34 |                 DEV_ASSIGN;
         |                           ^
   drivers/net/wireless/mediatek/mt76/mt792x_trace.h:23:12: note: to match this '('
      23 | TRACE_EVENT(lp_event,
         |            ^
   drivers/net/wireless/mediatek/mt76/mt792x_trace.h:23:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      23 | TRACE_EVENT(lp_event,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/mt792x_trace.h:23:12: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      23 | TRACE_EVENT(lp_event,
         |            ^
>> drivers/net/wireless/mediatek/mt76/mt792x_trace.h:35:3: error: unknown type name 'entry'
      35 |                 __entry->lp_state = lp_state;
         |                 ^
   include/trace/stages/stage6_event_callback.h:9:17: note: expanded from macro '__entry'
       9 | #define __entry entry
         |                 ^
   In file included from drivers/net/wireless/mediatek/mt76/mt792x_trace.c:10:
>> drivers/net/wireless/mediatek/mt76/mt792x_trace.h:35:10: error: expected identifier or '('
      35 |                 __entry->lp_state = lp_state;
         |                        ^
   drivers/net/wireless/mediatek/mt76/mt792x_trace.h:36:3: error: expected identifier or '('
      36 |         ),
         |          ^
   In file included from drivers/net/wireless/mediatek/mt76/mt792x_trace.c:10:
   In file included from drivers/net/wireless/mediatek/mt76/mt792x_trace.h:51:
   In file included from include/trace/define_trace.h:95:
>> drivers/net/wireless/mediatek/mt76/mt792x_trace.h:23:1: error: use of undeclared identifier '__SCT__tp_func_lp_event'; did you mean '__SCK__tp_func_lp_event'?
      23 | TRACE_EVENT(lp_event,
         | ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:343:2: note: expanded from macro 'DEFINE_TRACE'
     343 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:314:24: note: expanded from macro 'DEFINE_TRACE_FN'
     314 |                 .static_call_tramp = STATIC_CALL_TRAMP_ADDR(tp_func_##_name), \
         |                                      ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:38:1: note: expanded from here
      38 | __SCT__tp_func_lp_event
         | ^
   drivers/net/wireless/mediatek/mt76/mt792x_trace.h:23:1: note: '__SCK__tp_func_lp_event' declared here
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:343:2: note: expanded from macro 'DEFINE_TRACE'
     343 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:306:32: note: expanded from macro 'DEFINE_TRACE_FN'
     306 |         extern struct static_call_key STATIC_CALL_KEY(tp_func_##_name); \
         |                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:30:1: note: expanded from here
      30 | __SCK__tp_func_lp_event
         | ^
   In file included from drivers/net/wireless/mediatek/mt76/mt792x_trace.c:10:
   In file included from drivers/net/wireless/mediatek/mt76/mt792x_trace.h:51:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> drivers/net/wireless/mediatek/mt76/mt792x_trace.h:23:1: error: call to undeclared function 'check_trace_callback_type_lp_event'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      23 | TRACE_EVENT(lp_event,
         | ^
   include/trace/trace_events.h:46:2: note: expanded from macro 'TRACE_EVENT'
      46 |         DEFINE_EVENT(name, name, PARAMS(proto), PARAMS(args));
         |         ^
   include/trace/trace_events.h:416:2: note: expanded from macro 'DEFINE_EVENT'
     416 |         check_trace_callback_type_##call(trace_event_raw_event_##template); \
         |         ^
   <scratch space>:7:1: note: expanded from here
       7 | check_trace_callback_type_lp_event
         | ^
   In file included from drivers/net/wireless/mediatek/mt76/mt792x_trace.c:10:
   In file included from drivers/net/wireless/mediatek/mt76/mt792x_trace.h:51:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> drivers/net/wireless/mediatek/mt76/mt792x_trace.h:23:1: error: call to undeclared function 'check_trace_callback_type_lp_event'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      23 | TRACE_EVENT(lp_event,
         | ^
   include/trace/trace_events.h:46:2: note: expanded from macro 'TRACE_EVENT'
      46 |         DEFINE_EVENT(name, name, PARAMS(proto), PARAMS(args));
         |         ^
   include/trace/perf.h:67:2: note: expanded from macro 'DEFINE_EVENT'
      67 |         check_trace_callback_type_##call(perf_trace_##template);        \
         |         ^
   <scratch space>:40:1: note: expanded from here
      40 | check_trace_callback_type_lp_event
         | ^
   10 errors generated.
--
   In file included from drivers/net/wireless/mediatek/mt76/trace.c:10:
   drivers/net/wireless/mediatek/mt76/trace.h:33:11: error: expected identifier
      33 |         TP_PROTO(struct mt76_dev *dev, u32 reg, u32 val),
         |                  ^
>> drivers/net/wireless/mediatek/mt76/trace.h:40:16: error: expected ')'
      40 |                 DEVICE_ASSIGN;
         |                              ^
   drivers/net/wireless/mediatek/mt76/trace.h:32:20: note: to match this '('
      32 | DECLARE_EVENT_CLASS(dev_reg_evt,
         |                    ^
   drivers/net/wireless/mediatek/mt76/trace.h:32:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      32 | DECLARE_EVENT_CLASS(dev_reg_evt,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/trace.h:32:20: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      32 | DECLARE_EVENT_CLASS(dev_reg_evt,
         |                    ^
>> drivers/net/wireless/mediatek/mt76/trace.h:41:3: error: unknown type name 'entry'
      41 |                 REG_ASSIGN;
         |                 ^
   drivers/net/wireless/mediatek/mt76/trace.h:23:20: note: expanded from macro 'REG_ASSIGN'
      23 | #define REG_ASSIGN      __entry->reg = reg; __entry->val = val
         |                         ^
   include/trace/stages/stage6_event_callback.h:9:17: note: expanded from macro '__entry'
       9 | #define __entry entry
         |                 ^
   In file included from drivers/net/wireless/mediatek/mt76/trace.c:10:
>> drivers/net/wireless/mediatek/mt76/trace.h:41:3: error: expected identifier or '('
   drivers/net/wireless/mediatek/mt76/trace.h:23:27: note: expanded from macro 'REG_ASSIGN'
      23 | #define REG_ASSIGN      __entry->reg = reg; __entry->val = val
         |                                ^
>> drivers/net/wireless/mediatek/mt76/trace.h:41:3: error: unknown type name 'entry'
   drivers/net/wireless/mediatek/mt76/trace.h:23:40: note: expanded from macro 'REG_ASSIGN'
      23 | #define REG_ASSIGN      __entry->reg = reg; __entry->val = val
         |                                             ^
   include/trace/stages/stage6_event_callback.h:9:17: note: expanded from macro '__entry'
       9 | #define __entry entry
         |                 ^
   In file included from drivers/net/wireless/mediatek/mt76/trace.c:10:
>> drivers/net/wireless/mediatek/mt76/trace.h:41:3: error: expected identifier or '('
   drivers/net/wireless/mediatek/mt76/trace.h:23:47: note: expanded from macro 'REG_ASSIGN'
      23 | #define REG_ASSIGN      __entry->reg = reg; __entry->val = val
         |                                                    ^
   drivers/net/wireless/mediatek/mt76/trace.h:42:3: error: expected identifier or '('
      42 |         ),
         |          ^
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
   drivers/net/wireless/mediatek/mt76/trace.h:71:16: error: expected ')'
      71 |                 DEVICE_ASSIGN;
         |                              ^
   drivers/net/wireless/mediatek/mt76/trace.h:59:12: note: to match this '('
      59 | TRACE_EVENT(dev_irq,
         |            ^
   drivers/net/wireless/mediatek/mt76/trace.h:59:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      59 | TRACE_EVENT(dev_irq,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/trace.h:59:12: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      59 | TRACE_EVENT(dev_irq,
         |            ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from drivers/net/wireless/mediatek/mt76/mt76x02_trace.c:10:
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:27:11: error: expected identifier
      27 |         TP_PROTO(struct mt76x02_dev *dev),
         |                  ^
>> drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:33:13: error: expected ')'
      33 |                 DEV_ASSIGN;
         |                           ^
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:26:20: note: to match this '('
      26 | DECLARE_EVENT_CLASS(dev_evt,
         |                    ^
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:26:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      26 | DECLARE_EVENT_CLASS(dev_evt,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:26:20: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      26 | DECLARE_EVENT_CLASS(dev_evt,
         |                    ^
>> drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:34:3: error: expected identifier or '('
      34 |         ),
         |          ^
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
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:60:13: error: expected ')'
      60 |                 DEV_ASSIGN;
         |                           ^
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:43:12: note: to match this '('
      43 | TRACE_EVENT(mac_txstat_fetch,
         |            ^
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:43:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      43 | TRACE_EVENT(mac_txstat_fetch,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:43:12: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      43 | TRACE_EVENT(mac_txstat_fetch,
         |            ^
>> drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:61:3: error: unknown type name 'entry'
      61 |                 __entry->success = stat->success;
         |                 ^
   include/trace/stages/stage6_event_callback.h:9:17: note: expanded from macro '__entry'
       9 | #define __entry entry
         |                 ^
   In file included from drivers/net/wireless/mediatek/mt76/mt76x02_trace.c:10:
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:61:10: error: expected identifier or '('
      61 |                 __entry->success = stat->success;
         |                        ^
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:62:3: error: unknown type name 'entry'
      62 |                 __entry->aggr = stat->aggr;
         |                 ^
   include/trace/stages/stage6_event_callback.h:9:17: note: expanded from macro '__entry'
       9 | #define __entry entry
         |                 ^
   In file included from drivers/net/wireless/mediatek/mt76/mt76x02_trace.c:10:
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:62:10: error: expected identifier or '('
      62 |                 __entry->aggr = stat->aggr;
         |                        ^
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:63:3: error: unknown type name 'entry'
      63 |                 __entry->ack_req = stat->ack_req;
         |                 ^
   include/trace/stages/stage6_event_callback.h:9:17: note: expanded from macro '__entry'
       9 | #define __entry entry
         |                 ^
   In file included from drivers/net/wireless/mediatek/mt76/mt76x02_trace.c:10:
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:63:10: error: expected identifier or '('
      63 |                 __entry->ack_req = stat->ack_req;
         |                        ^
   drivers/net/wireless/mediatek/mt76/mt76x02_trace.h:64:3: error: unknown type name 'entry'
      64 |                 __entry->wcid = stat->wcid;
         |                 ^
   include/trace/stages/stage6_event_callback.h:9:17: note: expanded from macro '__entry'
       9 | #define __entry entry
         |                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from drivers/net/wireless/mediatek/mt76/mt7615/trace.c:10:
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:28:11: error: expected identifier
      28 |         TP_PROTO(struct mt7615_dev *dev, u16 token),
         |                  ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:35:13: error: expected ')'
      35 |                 DEV_ASSIGN;
         |                           ^
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:27:20: note: to match this '('
      27 | DECLARE_EVENT_CLASS(dev_token,
         |                    ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:27:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      27 | DECLARE_EVENT_CLASS(dev_token,
         | ^
         | int
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:27:20: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      27 | DECLARE_EVENT_CLASS(dev_token,
         |                    ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:36:3: error: unknown type name 'entry'
      36 |                 TOKEN_ASSIGN;
         |                 ^
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:23:22: note: expanded from macro 'TOKEN_ASSIGN'
      23 | #define TOKEN_ASSIGN    __entry->token = token
         |                         ^
   include/trace/stages/stage6_event_callback.h:9:17: note: expanded from macro '__entry'
       9 | #define __entry entry
         |                 ^
   In file included from drivers/net/wireless/mediatek/mt76/mt7615/trace.c:10:
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:36:3: error: expected identifier or '('
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:23:29: note: expanded from macro 'TOKEN_ASSIGN'
      23 | #define TOKEN_ASSIGN    __entry->token = token
         |                                ^
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:37:3: error: expected identifier or '('
      37 |         ),
         |          ^
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:45:11: error: expected identifier
      45 |         TP_PROTO(struct mt7615_dev *dev, u16 token),
         |                  ^
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:44:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      44 | DEFINE_EVENT(dev_token, mac_tx_free,
         | ^
         | int
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:44:13: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      44 | DEFINE_EVENT(dev_token, mac_tx_free,
         |             ^
      45 |         TP_PROTO(struct mt7615_dev *dev, u16 token),
      46 |         TP_ARGS(dev, token)
      47 | );
         | void
   In file included from drivers/net/wireless/mediatek/mt76/mt7615/trace.c:10:
   In file included from drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:56:
   In file included from include/trace/define_trace.h:95:
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:28:11: error: expected identifier
      28 |         TP_PROTO(struct mt7615_dev *dev, u16 token),
         |                  ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:35:13: error: expected ')'
      35 |                 DEV_ASSIGN;
         |                           ^
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:27:20: note: to match this '('
      27 | DECLARE_EVENT_CLASS(dev_token,
         |                    ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:27:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      27 | DECLARE_EVENT_CLASS(dev_token,
         | ^
         | int
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:27:20: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      27 | DECLARE_EVENT_CLASS(dev_token,
         |                    ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:36:3: error: unknown type name 'entry'
      36 |                 TOKEN_ASSIGN;
         |                 ^
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:23:22: note: expanded from macro 'TOKEN_ASSIGN'
      23 | #define TOKEN_ASSIGN    __entry->token = token
         |                         ^
   include/trace/stages/stage6_event_callback.h:9:17: note: expanded from macro '__entry'
       9 | #define __entry entry
         |                 ^
   In file included from drivers/net/wireless/mediatek/mt76/mt7615/trace.c:10:
   In file included from drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:56:
   In file included from include/trace/define_trace.h:95:
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:36:3: error: expected identifier or '('
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:23:29: note: expanded from macro 'TOKEN_ASSIGN'
      23 | #define TOKEN_ASSIGN    __entry->token = token
         |                                ^
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:37:3: error: expected identifier or '('
      37 |         ),
         |          ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:44:1: error: use of undeclared identifier '__SCT__tp_func_mac_tx_free'; did you mean '__SCK__tp_func_mac_tx_free'?
      44 | DEFINE_EVENT(dev_token, mac_tx_free,
         | ^
   include/trace/define_trace.h:57:2: note: expanded from macro 'DEFINE_EVENT'
      57 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:343:2: note: expanded from macro 'DEFINE_TRACE'
     343 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:314:24: note: expanded from macro 'DEFINE_TRACE_FN'
     314 |                 .static_call_tramp = STATIC_CALL_TRAMP_ADDR(tp_func_##_name), \
         |                                      ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:14:1: note: expanded from here
      14 | __SCT__tp_func_mac_tx_free
         | ^
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:44:1: note: '__SCK__tp_func_mac_tx_free' declared here
   include/trace/define_trace.h:57:2: note: expanded from macro 'DEFINE_EVENT'
      57 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:343:2: note: expanded from macro 'DEFINE_TRACE'
     343 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:306:32: note: expanded from macro 'DEFINE_TRACE_FN'
     306 |         extern struct static_call_key STATIC_CALL_KEY(tp_func_##_name); \
         |                                       ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:6:1: note: expanded from here
       6 | __SCK__tp_func_mac_tx_free
         | ^
   In file included from drivers/net/wireless/mediatek/mt76/mt7615/trace.c:10:
   In file included from drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:56:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:44:1: error: call to undeclared function 'check_trace_callback_type_mac_tx_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      44 | DEFINE_EVENT(dev_token, mac_tx_free,
         | ^
   include/trace/trace_events.h:416:2: note: expanded from macro 'DEFINE_EVENT'
     416 |         check_trace_callback_type_##call(trace_event_raw_event_##template); \
         |         ^
   <scratch space>:79:1: note: expanded from here
      79 | check_trace_callback_type_mac_tx_free
         | ^
   drivers/net/wireless/mediatek/mt76/mt7615/mt7615_trace.h:44:1: note: did you mean 'check_trace_callback_type_page_pool_release'?
   include/trace/trace_events.h:416:2: note: expanded from macro 'DEFINE_EVENT'
     416 |         check_trace_callback_type_##call(trace_event_raw_event_##template); \
         |         ^
   <scratch space>:79:1: note: expanded from here
      79 | check_trace_callback_type_mac_tx_free
         | ^
   include/trace/events/page_pool.h:14:1: note: 'check_trace_callback_type_page_pool_release' declared here
      14 | TRACE_EVENT(page_pool_release,
         | ^
   include/linux/tracepoint.h:568:2: note: expanded from macro 'TRACE_EVENT'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:434:2: note: expanded from macro 'DECLARE_TRACE'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:289:2: note: expanded from macro '__DECLARE_TRACE'
     289 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |         ^
   <scratch space>:51:1: note: expanded from here
      51 | check_trace_callback_type_page_pool_release
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +34 drivers/net/wireless/mediatek/mt76/mt792x_trace.h

2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  22  
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11 @23  TRACE_EVENT(lp_event,
975e122ddb7cd6 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2023-06-28  24  	TP_PROTO(struct mt792x_dev *dev, u8 lp_state),
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  25  
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  26  	TP_ARGS(dev, lp_state),
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  27  
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  28  	TP_STRUCT__entry(
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  29  		DEV_ENTRY
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  30  		__field(u8, lp_state)
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  31  	),
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  32  
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  33  	TP_fast_assign(
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11 @34  		DEV_ASSIGN;
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11 @35  		__entry->lp_state = lp_state;
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  36  	),
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  37  
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  38  	TP_printk(
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  39  		DEV_PR_FMT " %s",
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  40  		DEV_PR_ARG, LP_STATE_PR_ARG
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  41  	)
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  42  );
2afd17b4d0fc15 drivers/net/wireless/mediatek/mt76/mt7921/mt7921_trace.h Lorenzo Bianconi 2021-04-11  43  

:::::: The code at line 34 was first introduced by commit
:::::: 2afd17b4d0fc15cba0144e7a4c26549b0e829ce9 mt76: mt7921: introduce MCU_EVENT_LP_INFO event parsing

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
