Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C962AE6C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 21:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727298944; cv=none; b=eJ0R/+iNTP3cUjFhKsVaRup+CkqthdlIG1zI/BuD8wUYPgj9UGQ4IxWUfoKXlU5EBnj0bEqomuUhDdiw5qOnyT/Nwa/w03U0voxNi3RzCDPNtYvhk7NAj6jXyRyLPtaQtxvH0e+GRdAiEo7nB0T57QXeS0YHNL6FeL0x/t1DzHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727298944; c=relaxed/simple;
	bh=qfDNw+wZHSrTvyh20BW6zPJT8BV+q7QNKaMi0srK0B0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DhpfsNL6CUBJvhWECyqXrAjU/xuyC5N3TqrIoign+rI73Kl7+GBHvHp43uz31zYv851lITCUTRgKvSKDL4IMpJAy8UdFO2UWaStnDeDf+rmi/ItbbNWO3xzt+ZcqiAZrbMj2AVgrFKtbWjF+GEZWSEU1ubwAeoTeCUvxPLSxmuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Urf3vgR+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Urf3vgR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727298941; x=1758834941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qfDNw+wZHSrTvyh20BW6zPJT8BV+q7QNKaMi0srK0B0=;
  b=Urf3vgR+JKLm/FVJmgwLTamQJTY81jj1vAXou1j6oRiifj7RpuIo5Fjd
   s+0gbYE2eVtv9W2SkRg+SwPBMxfZ42Q7+lAMJQr8kDk86N97WkQbo9ifN
   2Hy/lns8jz9XLbQ87k7zyeaCaeNCLQ/qiEPXRdyrkY2ev60axzAJ4R2aP
   SE3inxA7P1eEGsts0wPcWAjsVtOzx5fa9tRykSTZu53CwFvhfY/CaoH0t
   0UZgBVghxRc8YNfqBzFV52BYqsTHHyjOUadWxKoZUEyHu/qjm1l7Yb58W
   TvKXzy6hfzQdxGTdyqcOXFu1YleskbNk9FM7i6y3QaJcjV4SSPXVWn0Ep
   Q==;
X-CSE-ConnectionGUID: mNtlguBHR3y/0Ay14dHyJg==
X-CSE-MsgGUID: kkEq7NVaSJWy6Rf5HtmlXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37514615"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="37514615"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 14:15:41 -0700
X-CSE-ConnectionGUID: PLaT6ULRTg+8vo1U0Zujwg==
X-CSE-MsgGUID: p82FvcYXS5q+XPSL+8DBtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="109372062"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Sep 2024 14:15:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stZMG-000Jxr-1k;
	Wed, 25 Sep 2024 21:15:36 +0000
Date: Thu, 26 Sep 2024 05:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7550/14112] main.c:undefined reference to
 `perf_trace_buf_alloc'
Message-ID: <202409260526.DcjJ8rxS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   31022a26e12a84745f84a4e505c128e7cc8a1f33
commit: 1119ec49ac4ac643e6d7c9a5a834040aef87612e [7550/14112] mm, fs: Add BPF_READAHEAD build option for bpf readhead
config: loongarch-randconfig-002-20240925 (https://download.01.org/0day-ci/archive/20240926/202409260526.DcjJ8rxS-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409260526.DcjJ8rxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409260526.DcjJ8rxS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/usb/host/xhci-trace.h:25,
                    from drivers/usb/host/xhci-trace.c:12:
   In function 'xhci_decode_trb',
       inlined from 'trace_raw_output_xhci_log_trb' at drivers/usb/host/./xhci-trace.h:110:1:
>> drivers/usb/host/xhci.h:2306:17: warning: null destination pointer [-Wformat-truncation=]
    2306 |                 snprintf(str, size,
         |                 ^~~~~~~~~~~~~~~~~~~
    2307 |                         "TRB %08x%08x status '%s' len %d slot %d ep %d type '%s' flags %c:%c",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2308 |                         field1, field0,
         |                         ~~~~~~~~~~~~~~~
    2309 |                         xhci_trb_comp_code_string(GET_COMP_CODE(field2)),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2310 |                         EVENT_TRB_LEN(field2), TRB_TO_SLOT_ID(field3),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2311 |                         /* Macro decrements 1, maybe it shouldn't?!? */
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2312 |                         TRB_TO_EP_INDEX(field3) + 1,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2313 |                         xhci_trb_type_string(type),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2314 |                         field3 & EVENT_DATA ? 'E' : 'e',
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2315 |                         field3 & TRB_CYCLE ? 'C' : 'c');
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.h:2486:17: warning: null destination pointer [-Wformat-truncation=]
    2486 |                 snprintf(str, size,
         |                 ^~~~~~~~~~~~~~~~~~~
    2487 |                         "%s: info %08x%08x%08x pkt type %d roothub port %d flags %c",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2488 |                         xhci_trb_type_string(type),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2489 |                         field2, field1, field0 & 0xffffffe0,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2490 |                         TRB_TO_PACKET_TYPE(field0),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2491 |                         TRB_TO_ROOTHUB_PORT(field3),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2492 |                         field3 & TRB_CYCLE ? 'C' : 'c');
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.h:2477:17: warning: null destination pointer [-Wformat-truncation=]
    2477 |                 snprintf(str, size,
         |                 ^~~~~~~~~~~~~~~~~~~
    2478 |                         "%s: ctx %08x%08x slot %d speed %d flags %c",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2479 |                         xhci_trb_type_string(type),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2480 |                         field1, field0,
         |                         ~~~~~~~~~~~~~~~
    2481 |                         TRB_TO_SLOT_ID(field3),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
    2482 |                         TRB_TO_DEV_SPEED(field3),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
    2483 |                         field3 & TRB_CYCLE ? 'C' : 'c');
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.h:2470:17: warning: null destination pointer [-Wformat-truncation=]
    2470 |                 snprintf(str, size,
         |                 ^~~~~~~~~~~~~~~~~~~
    2471 |                         "%s: belt %d flags %c",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
    2472 |                         xhci_trb_type_string(type),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2473 |                         TRB_TO_BELT(field3),
         |                         ~~~~~~~~~~~~~~~~~~~~
    2474 |                         field3 & TRB_CYCLE ? 'C' : 'c');
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.h:2461:17: warning: null destination pointer [-Wformat-truncation=]
    2461 |                 snprintf(str, size,
         |                 ^~~~~~~~~~~~~~~~~~~
    2462 |                         "%s: event %08x%08x vf intr %d vf id %d flags %c",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2463 |                         xhci_trb_type_string(type),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2464 |                         field1, field0,
         |                         ~~~~~~~~~~~~~~~
    2465 |                         TRB_TO_VF_INTR_TARGET(field2),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2466 |                         TRB_TO_VF_ID(field3),
         |                         ~~~~~~~~~~~~~~~~~~~~~
    2467 |                         field3 & TRB_CYCLE ? 'C' : 'c');
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.h:2454:17: warning: null destination pointer [-Wformat-truncation=]
    2454 |                 snprintf(str, size,
         |                 ^~~~~~~~~~~~~~~~~~~
    2455 |                         "%s: slot %d flags %c",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
    2456 |                         xhci_trb_type_string(type),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2457 |                         TRB_TO_SLOT_ID(field3),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
    2458 |                         field3 & TRB_CYCLE ? 'C' : 'c');
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.h:2443:17: warning: null destination pointer [-Wformat-truncation=]
    2443 |                 snprintf(str, size,
         |                 ^~~~~~~~~~~~~~~~~~~
    2444 |                         "%s: deq %08x%08x stream %d slot %d ep %d flags %c",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2445 |                         xhci_trb_type_string(type),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2446 |                         field1, field0,
         |                         ~~~~~~~~~~~~~~~
    2447 |                         TRB_TO_STREAM_ID(field2),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
    2448 |                         TRB_TO_SLOT_ID(field3),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
--
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2359 |                                 field3 & TRB_CYCLE ? 'C' : 'c');
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.h:2337:17: warning: null destination pointer [-Wformat-truncation=]
    2337 |                 snprintf(str, size,
         |                 ^~~~~~~~~~~~~~~~~~~
    2338 |                          "Buffer %08x%08x length %d TD size %d intr %d type '%s' flags %c:%c:%c:%c:%c:%c:%c",
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2339 |                                 field1, field0, TRB_LEN(field2), GET_TD_SIZE(field2),
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2340 |                                 GET_INTR_TARGET(field2),
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~
    2341 |                                 xhci_trb_type_string(type),
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2342 |                                 field3 & TRB_IDT ? 'I' : 'i',
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2343 |                                 field3 & TRB_IOC ? 'I' : 'i',
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2344 |                                 field3 & TRB_CHAIN ? 'C' : 'c',
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2345 |                                 field3 & TRB_NO_SNOOP ? 'S' : 's',
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2346 |                                 field3 & TRB_ISP ? 'I' : 'i',
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2347 |                                 field3 & TRB_ENT ? 'E' : 'e',
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2348 |                                 field3 & TRB_CYCLE ? 'C' : 'c');
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.h:2319:17: warning: null destination pointer [-Wformat-truncation=]
    2319 |                 snprintf(str, size,
         |                 ^~~~~~~~~~~~~~~~~~~
    2320 |                         "bRequestType %02x bRequest %02x wValue %02x%02x wIndex %02x%02x wLength %d length %d TD size %d intr %d type '%s' flags %c:%c:%c",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2321 |                                 field0 & 0xff,
         |                                 ~~~~~~~~~~~~~~
    2322 |                                 (field0 & 0xff00) >> 8,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~
    2323 |                                 (field0 & 0xff000000) >> 24,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2324 |                                 (field0 & 0xff0000) >> 16,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
    2325 |                                 (field1 & 0xff00) >> 8,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~
    2326 |                                 field1 & 0xff,
         |                                 ~~~~~~~~~~~~~~
    2327 |                                 (field1 & 0xff000000) >> 16 |
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2328 |                                 (field1 & 0xff0000) >> 16,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
    2329 |                                 TRB_LEN(field2), GET_TD_SIZE(field2),
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2330 |                                 GET_INTR_TARGET(field2),
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~
    2331 |                                 xhci_trb_type_string(type),
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2332 |                                 field3 & TRB_IDT ? 'I' : 'i',
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2333 |                                 field3 & TRB_IOC ? 'I' : 'i',
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2334 |                                 field3 & TRB_CYCLE ? 'C' : 'c');
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.h:2365:17: warning: null destination pointer [-Wformat-truncation=]
    2365 |                 snprintf(str, size,
         |                 ^~~~~~~~~~~~~~~~~~~
    2366 |                         "Buffer %08x%08x length %d TD size %d intr %d type '%s' flags %c:%c:%c:%c:%c:%c:%c:%c",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2367 |                         field1, field0, TRB_LEN(field2), GET_TD_SIZE(field2),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2368 |                         GET_INTR_TARGET(field2),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~
    2369 |                         xhci_trb_type_string(type),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2370 |                         field3 & TRB_BEI ? 'B' : 'b',
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2371 |                         field3 & TRB_IDT ? 'I' : 'i',
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2372 |                         field3 & TRB_IOC ? 'I' : 'i',
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2373 |                         field3 & TRB_CHAIN ? 'C' : 'c',
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2374 |                         field3 & TRB_NO_SNOOP ? 'S' : 's',
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2375 |                         field3 & TRB_ISP ? 'I' : 'i',
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2376 |                         field3 & TRB_ENT ? 'E' : 'e',
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2377 |                         field3 & TRB_CYCLE ? 'C' : 'c');
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.h:2495:17: warning: null destination pointer [-Wformat-truncation=]
    2495 |                 snprintf(str, size,
         |                 ^~~~~~~~~~~~~~~~~~~
    2496 |                         "type '%s' -> raw %08x %08x %08x %08x",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2497 |                         xhci_trb_type_string(type),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2498 |                         field0, field1, field2, field3);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from drivers/usb/host/xhci-trace.h:622:
   drivers/usb/host/./xhci-trace.h: In function 'trace_raw_output_xhci_log_trb':
>> drivers/usb/host/./xhci-trace.h:127:19: warning: '%s' directive argument is null [-Wformat-overflow=]
     127 |         TP_printk("%s: %s", xhci_ring_type_string(__entry->type),
         |                   ^~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   drivers/usb/host/./xhci-trace.h:127:9: note: in expansion of macro 'TP_printk'
     127 |         TP_printk("%s: %s", xhci_ring_type_string(__entry->type),
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:237:
   drivers/usb/host/./xhci-trace.h:127:24: note: format string is defined here
     127 |         TP_printk("%s: %s", xhci_ring_type_string(__entry->type),
         |                        ^~
   In function 'xhci_decode_ep_context',
       inlined from 'trace_raw_output_xhci_log_ep_ctx' at drivers/usb/host/./xhci-trace.h:312:1:
>> drivers/usb/host/xhci.h:2801:15: warning: argument 1 null where non-null expected [-Wnonnull]
    2801 |         ret = sprintf(str, "State %s mult %d max P. Streams %d %s",
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2802 |                         xhci_ep_state_string(ep_state), mult,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2803 |                         max_pstr, lsa ? "LSA " : "");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:32,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/tracepoint.h:15,
                    from drivers/usb/host/xhci-trace.h:24:
   include/linux/sprintf.h: In function 'trace_raw_output_xhci_log_ep_ctx':
   include/linux/sprintf.h:10:20: note: in a call to function 'sprintf' declared 'nonnull'
      10 | __printf(2, 3) int sprintf(char *buf, const char * fmt, ...);
         |                    ^~~~~~~
   In function 'xhci_decode_ep_context',
       inlined from 'trace_raw_output_xhci_log_ep_ctx' at drivers/usb/host/./xhci-trace.h:312:1:
   drivers/usb/host/xhci.h:2801:15: warning: null destination pointer [-Wformat-overflow=]
    2801 |         ret = sprintf(str, "State %s mult %d max P. Streams %d %s",
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2802 |                         xhci_ep_state_string(ep_state), mult,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2803 |                         max_pstr, lsa ? "LSA " : "");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/./xhci-trace.h: In function 'trace_raw_output_xhci_log_ep_ctx':
   drivers/usb/host/./xhci-trace.h:327:19: warning: '%s' directive argument is null [-Wformat-overflow=]
     327 |         TP_printk("%s", xhci_decode_ep_context(__get_buf(XHCI_MSG_MAX),
         |                   ^~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   drivers/usb/host/./xhci-trace.h:327:9: note: in expansion of macro 'TP_printk'
     327 |         TP_printk("%s", xhci_decode_ep_context(__get_buf(XHCI_MSG_MAX),
         |         ^~~~~~~~~
   drivers/usb/host/./xhci-trace.h:327:20: note: format string is defined here
     327 |         TP_printk("%s", xhci_decode_ep_context(__get_buf(XHCI_MSG_MAX),
         |                    ^~
   In function 'xhci_decode_slot_context',
       inlined from 'trace_raw_output_xhci_log_slot_ctx' at drivers/usb/host/./xhci-trace.h:357:1:
   drivers/usb/host/xhci.h:2546:15: warning: argument 1 null where non-null expected [-Wnonnull]
    2546 |         ret = sprintf(str, "RS %05x %s%s%s Ctx Entries %d MEL %d us Port# %d/%d",
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2547 |                         info & ROUTE_STRING_MASK,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
    2548 |                         ({ char *s;
         |                         ~~~~~~~~~~~
    2549 |                         switch (speed) {
         |                         ~~~~~~~~~~~~~~~~
    2550 |                         case SLOT_SPEED_FS:
         |                         ~~~~~~~~~~~~~~~~~~~
    2551 |                                 s = "full-speed";
         |                                 ~~~~~~~~~~~~~~~~~
    2552 |                                 break;
         |                                 ~~~~~~
    2553 |                         case SLOT_SPEED_LS:
         |                         ~~~~~~~~~~~~~~~~~~~
    2554 |                                 s = "low-speed";
         |                                 ~~~~~~~~~~~~~~~~
    2555 |                                 break;
         |                                 ~~~~~~
    2556 |                         case SLOT_SPEED_HS:
         |                         ~~~~~~~~~~~~~~~~~~~
    2557 |                                 s = "high-speed";
         |                                 ~~~~~~~~~~~~~~~~~
    2558 |                                 break;
         |                                 ~~~~~~
    2559 |                         case SLOT_SPEED_SS:
         |                         ~~~~~~~~~~~~~~~~~~~
    2560 |                                 s = "super-speed";
         |                                 ~~~~~~~~~~~~~~~~~~
    2561 |                                 break;
         |                                 ~~~~~~
    2562 |                         case SLOT_SPEED_SSP:
         |                         ~~~~~~~~~~~~~~~~~~~~
    2563 |                                 s = "super-speed plus";
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~
    2564 |                                 break;
         |                                 ~~~~~~
    2565 |                         default:
         |                         ~~~~~~~~
    2566 |                                 s = "UNKNOWN speed";
         |                                 ~~~~~~~~~~~~~~~~~~~~
    2567 |                         } s; }),
         |                         ~~~~~~~~
    2568 |                         mtt ? " multi-TT" : "",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
    2569 |                         hub ? " Hub" : "",
         |                         ~~~~~~~~~~~~~~~~~~
    2570 |                         (info & LAST_CTX_MASK) >> 27,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2571 |                         info2 & MAX_EXIT,
         |                         ~~~~~~~~~~~~~~~~~
    2572 |                         DEVINFO_TO_ROOT_HUB_PORT(info2),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2573 |                         DEVINFO_TO_MAX_PORTS(info2));
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sprintf.h: In function 'trace_raw_output_xhci_log_slot_ctx':
   include/linux/sprintf.h:10:20: note: in a call to function 'sprintf' declared 'nonnull'
      10 | __printf(2, 3) int sprintf(char *buf, const char * fmt, ...);
         |                    ^~~~~~~
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
