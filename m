Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4F184DE8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 20:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716496613; cv=none; b=HLO8f+23xRgZO3s/YWVnYJJLZP1YcbP3ZMRgpQ/kxdneRpLegm8CS5vDw6deBlzs6gII1HY3Imb5S/2+1JU67jINMjknQe6gcB4pg59232c5OOxEMTluXoTFQrGFjAt44pJ/1UCYDXxntQ2XeSrIYgHYXyUsroTrkdydejbsqro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716496613; c=relaxed/simple;
	bh=gcov1rzEQThKxLVdK9QSF3dRJGf4nng3FIpBB3OgK48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSf1dxSMtn+PFFgRaK6Gh7+6xcoO+hZq0S2iI+htFWtJwXv4Iwf8Mml2sQwjWVFYGw7bDWx+af6ViNIpawNXQ3K/aBdLSS8zNVbOoESUDkUMZBjAEwZn3mS3DQ/LuwxwdeHP7NdCpF5W9qKz5TvQMr+KL35iWb1QdOXuPk5HFAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UydCgRSI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UydCgRSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716496611; x=1748032611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gcov1rzEQThKxLVdK9QSF3dRJGf4nng3FIpBB3OgK48=;
  b=UydCgRSIKEwIlDxZ9u0Tx1w0Ucm+YI+RgncLYPcLbt0IvtcAgY/py2V9
   2qjzLACvLxJ/ths5ouMTq24oSsmqBdvbewdVhhWOyIRPndsxXdxpDasTF
   L/9IUYCztCvHauZKzB+NyM2IaVigGmObqcMMPR6fVxfKU5u4PvI392DOs
   SCDpRdgfOproQ3vV7E9XqaYdmGkcC0SMrMlGslsjn1tpDNq4Bcd/9MAh3
   XreojWKm01mx1GrAK9idY0yX6ytzCcKZbScuS9dNNiqqbgSPLqi1prVIw
   4u0BMvaCinuPsJi1Vy/eROTwxesCwSzVBqi+oxdrmVOoeCeHpRWrIsYFS
   Q==;
X-CSE-ConnectionGUID: GNg6UT2ERVSJSTrALjp8rA==
X-CSE-MsgGUID: k8Ef5ZyMQuifptW31Pz7hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12691871"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="12691871"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 13:36:50 -0700
X-CSE-ConnectionGUID: uGKTL3ObRSm2Qkp4oS20Ag==
X-CSE-MsgGUID: 5e4JXislSiWTqNZ3iyNCxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="71211865"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 May 2024 13:36:49 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAFB8-0003VZ-14;
	Thu, 23 May 2024 20:36:46 +0000
Date: Fri, 24 May 2024 04:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7548/9759] drivers/usb/host/xhci.h:2306:17:
 warning: null destination pointer
Message-ID: <202405240401.vDimp7ud-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c564f68dbcd17a532bedbcd78ee4a0b3a2853a84
commit: 1119ec49ac4ac643e6d7c9a5a834040aef87612e [7548/9759] mm, fs: Add BPF_READAHEAD build option for bpf readhead
config: arm64-randconfig-003-20240524 (https://download.01.org/0day-ci/archive/20240524/202405240401.vDimp7ud-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405240401.vDimp7ud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405240401.vDimp7ud-lkp@intel.com/

All warnings (new ones prefixed by >>):

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


vim +2306 drivers/usb/host/xhci.h

52407729fbeabb Felipe Balbi    2017-04-07  2281  
cbf286e8ef8337 Mathias Nyman   2021-08-20  2282  static inline const char *xhci_decode_trb(char *str, size_t size,
cbf286e8ef8337 Mathias Nyman   2021-08-20  2283  					  u32 field0, u32 field1, u32 field2, u32 field3)
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2284  {
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2285  	int type = TRB_FIELD_TO_TYPE(field3);
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2286  
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2287  	switch (type) {
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2288  	case TRB_LINK:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2289  		snprintf(str, size,
96d9a6eb97d77d Lu Baolu        2017-04-07  2290  			"LINK %08x%08x intr %d type '%s' flags %c:%c:%c:%c",
96d9a6eb97d77d Lu Baolu        2017-04-07  2291  			field1, field0, GET_INTR_TARGET(field2),
d2561626b9d126 Lu Baolu        2017-04-07  2292  			xhci_trb_type_string(type),
96d9a6eb97d77d Lu Baolu        2017-04-07  2293  			field3 & TRB_IOC ? 'I' : 'i',
96d9a6eb97d77d Lu Baolu        2017-04-07  2294  			field3 & TRB_CHAIN ? 'C' : 'c',
96d9a6eb97d77d Lu Baolu        2017-04-07  2295  			field3 & TRB_TC ? 'T' : 't',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2296  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2297  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2298  	case TRB_TRANSFER:
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2299  	case TRB_COMPLETION:
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2300  	case TRB_PORT_STATUS:
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2301  	case TRB_BANDWIDTH_EVENT:
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2302  	case TRB_DOORBELL:
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2303  	case TRB_HC_EVENT:
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2304  	case TRB_DEV_NOTE:
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2305  	case TRB_MFINDEX_WRAP:
cbf286e8ef8337 Mathias Nyman   2021-08-20 @2306  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2307  			"TRB %08x%08x status '%s' len %d slot %d ep %d type '%s' flags %c:%c",
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2308  			field1, field0,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2309  			xhci_trb_comp_code_string(GET_COMP_CODE(field2)),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2310  			EVENT_TRB_LEN(field2), TRB_TO_SLOT_ID(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2311  			/* Macro decrements 1, maybe it shouldn't?!? */
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2312  			TRB_TO_EP_INDEX(field3) + 1,
d2561626b9d126 Lu Baolu        2017-04-07  2313  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2314  			field3 & EVENT_DATA ? 'E' : 'e',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2315  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2316  
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2317  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2318  	case TRB_SETUP:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2319  		snprintf(str, size,
cbf286e8ef8337 Mathias Nyman   2021-08-20  2320  			"bRequestType %02x bRequest %02x wValue %02x%02x wIndex %02x%02x wLength %d length %d TD size %d intr %d type '%s' flags %c:%c:%c",
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2321  				field0 & 0xff,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2322  				(field0 & 0xff00) >> 8,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2323  				(field0 & 0xff000000) >> 24,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2324  				(field0 & 0xff0000) >> 16,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2325  				(field1 & 0xff00) >> 8,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2326  				field1 & 0xff,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2327  				(field1 & 0xff000000) >> 16 |
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2328  				(field1 & 0xff0000) >> 16,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2329  				TRB_LEN(field2), GET_TD_SIZE(field2),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2330  				GET_INTR_TARGET(field2),
d2561626b9d126 Lu Baolu        2017-04-07  2331  				xhci_trb_type_string(type),
5d062aba0d399c Felipe Balbi    2017-04-07  2332  				field3 & TRB_IDT ? 'I' : 'i',
5d062aba0d399c Felipe Balbi    2017-04-07  2333  				field3 & TRB_IOC ? 'I' : 'i',
5d062aba0d399c Felipe Balbi    2017-04-07  2334  				field3 & TRB_CYCLE ? 'C' : 'c');
5d062aba0d399c Felipe Balbi    2017-04-07  2335  		break;
5d062aba0d399c Felipe Balbi    2017-04-07  2336  	case TRB_DATA:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2337  		snprintf(str, size,
cbf286e8ef8337 Mathias Nyman   2021-08-20  2338  			 "Buffer %08x%08x length %d TD size %d intr %d type '%s' flags %c:%c:%c:%c:%c:%c:%c",
5d062aba0d399c Felipe Balbi    2017-04-07  2339  				field1, field0, TRB_LEN(field2), GET_TD_SIZE(field2),
5d062aba0d399c Felipe Balbi    2017-04-07  2340  				GET_INTR_TARGET(field2),
d2561626b9d126 Lu Baolu        2017-04-07  2341  				xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2342  				field3 & TRB_IDT ? 'I' : 'i',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2343  				field3 & TRB_IOC ? 'I' : 'i',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2344  				field3 & TRB_CHAIN ? 'C' : 'c',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2345  				field3 & TRB_NO_SNOOP ? 'S' : 's',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2346  				field3 & TRB_ISP ? 'I' : 'i',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2347  				field3 & TRB_ENT ? 'E' : 'e',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2348  				field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2349  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2350  	case TRB_STATUS:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2351  		snprintf(str, size,
cbf286e8ef8337 Mathias Nyman   2021-08-20  2352  			 "Buffer %08x%08x length %d TD size %d intr %d type '%s' flags %c:%c:%c:%c",
5d062aba0d399c Felipe Balbi    2017-04-07  2353  				field1, field0, TRB_LEN(field2), GET_TD_SIZE(field2),
5d062aba0d399c Felipe Balbi    2017-04-07  2354  				GET_INTR_TARGET(field2),
d2561626b9d126 Lu Baolu        2017-04-07  2355  				xhci_trb_type_string(type),
5d062aba0d399c Felipe Balbi    2017-04-07  2356  				field3 & TRB_IOC ? 'I' : 'i',
5d062aba0d399c Felipe Balbi    2017-04-07  2357  				field3 & TRB_CHAIN ? 'C' : 'c',
5d062aba0d399c Felipe Balbi    2017-04-07  2358  				field3 & TRB_ENT ? 'E' : 'e',
5d062aba0d399c Felipe Balbi    2017-04-07  2359  				field3 & TRB_CYCLE ? 'C' : 'c');
5d062aba0d399c Felipe Balbi    2017-04-07  2360  		break;
5d062aba0d399c Felipe Balbi    2017-04-07  2361  	case TRB_NORMAL:
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2362  	case TRB_ISOC:
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2363  	case TRB_EVENT_DATA:
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2364  	case TRB_TR_NOOP:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2365  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2366  			"Buffer %08x%08x length %d TD size %d intr %d type '%s' flags %c:%c:%c:%c:%c:%c:%c:%c",
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2367  			field1, field0, TRB_LEN(field2), GET_TD_SIZE(field2),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2368  			GET_INTR_TARGET(field2),
d2561626b9d126 Lu Baolu        2017-04-07  2369  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2370  			field3 & TRB_BEI ? 'B' : 'b',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2371  			field3 & TRB_IDT ? 'I' : 'i',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2372  			field3 & TRB_IOC ? 'I' : 'i',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2373  			field3 & TRB_CHAIN ? 'C' : 'c',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2374  			field3 & TRB_NO_SNOOP ? 'S' : 's',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2375  			field3 & TRB_ISP ? 'I' : 'i',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2376  			field3 & TRB_ENT ? 'E' : 'e',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2377  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2378  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2379  
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2380  	case TRB_CMD_NOOP:
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2381  	case TRB_ENABLE_SLOT:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2382  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2383  			"%s: flags %c",
d2561626b9d126 Lu Baolu        2017-04-07  2384  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2385  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2386  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2387  	case TRB_DISABLE_SLOT:
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2388  	case TRB_NEG_BANDWIDTH:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2389  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2390  			"%s: slot %d flags %c",
d2561626b9d126 Lu Baolu        2017-04-07  2391  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2392  			TRB_TO_SLOT_ID(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2393  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2394  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2395  	case TRB_ADDR_DEV:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2396  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2397  			"%s: ctx %08x%08x slot %d flags %c:%c",
d2561626b9d126 Lu Baolu        2017-04-07  2398  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2399  			field1, field0,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2400  			TRB_TO_SLOT_ID(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2401  			field3 & TRB_BSR ? 'B' : 'b',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2402  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2403  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2404  	case TRB_CONFIG_EP:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2405  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2406  			"%s: ctx %08x%08x slot %d flags %c:%c",
d2561626b9d126 Lu Baolu        2017-04-07  2407  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2408  			field1, field0,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2409  			TRB_TO_SLOT_ID(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2410  			field3 & TRB_DC ? 'D' : 'd',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2411  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2412  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2413  	case TRB_EVAL_CONTEXT:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2414  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2415  			"%s: ctx %08x%08x slot %d flags %c",
d2561626b9d126 Lu Baolu        2017-04-07  2416  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2417  			field1, field0,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2418  			TRB_TO_SLOT_ID(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2419  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2420  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2421  	case TRB_RESET_EP:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2422  		snprintf(str, size,
8a62dff2c0734a Mathias Nyman   2019-08-30  2423  			"%s: ctx %08x%08x slot %d ep %d flags %c:%c",
d2561626b9d126 Lu Baolu        2017-04-07  2424  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2425  			field1, field0,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2426  			TRB_TO_SLOT_ID(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2427  			/* Macro decrements 1, maybe it shouldn't?!? */
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2428  			TRB_TO_EP_INDEX(field3) + 1,
8a62dff2c0734a Mathias Nyman   2019-08-30  2429  			field3 & TRB_TSP ? 'T' : 't',
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2430  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2431  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2432  	case TRB_STOP_RING:
1ce69c35b86038 Sergey Shtylyov 2022-06-30  2433  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2434  			"%s: slot %d sp %d ep %d flags %c",
d2561626b9d126 Lu Baolu        2017-04-07  2435  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2436  			TRB_TO_SLOT_ID(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2437  			TRB_TO_SUSPEND_PORT(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2438  			/* Macro decrements 1, maybe it shouldn't?!? */
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2439  			TRB_TO_EP_INDEX(field3) + 1,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2440  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2441  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2442  	case TRB_SET_DEQ:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2443  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2444  			"%s: deq %08x%08x stream %d slot %d ep %d flags %c",
d2561626b9d126 Lu Baolu        2017-04-07  2445  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2446  			field1, field0,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2447  			TRB_TO_STREAM_ID(field2),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2448  			TRB_TO_SLOT_ID(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2449  			/* Macro decrements 1, maybe it shouldn't?!? */
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2450  			TRB_TO_EP_INDEX(field3) + 1,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2451  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2452  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2453  	case TRB_RESET_DEV:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2454  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2455  			"%s: slot %d flags %c",
d2561626b9d126 Lu Baolu        2017-04-07  2456  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2457  			TRB_TO_SLOT_ID(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2458  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2459  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2460  	case TRB_FORCE_EVENT:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2461  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2462  			"%s: event %08x%08x vf intr %d vf id %d flags %c",
d2561626b9d126 Lu Baolu        2017-04-07  2463  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2464  			field1, field0,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2465  			TRB_TO_VF_INTR_TARGET(field2),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2466  			TRB_TO_VF_ID(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2467  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2468  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2469  	case TRB_SET_LT:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2470  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2471  			"%s: belt %d flags %c",
d2561626b9d126 Lu Baolu        2017-04-07  2472  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2473  			TRB_TO_BELT(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2474  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2475  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2476  	case TRB_GET_BW:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2477  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2478  			"%s: ctx %08x%08x slot %d speed %d flags %c",
d2561626b9d126 Lu Baolu        2017-04-07  2479  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2480  			field1, field0,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2481  			TRB_TO_SLOT_ID(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2482  			TRB_TO_DEV_SPEED(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2483  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2484  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2485  	case TRB_FORCE_HEADER:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2486  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2487  			"%s: info %08x%08x%08x pkt type %d roothub port %d flags %c",
d2561626b9d126 Lu Baolu        2017-04-07  2488  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2489  			field2, field1, field0 & 0xffffffe0,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2490  			TRB_TO_PACKET_TYPE(field0),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2491  			TRB_TO_ROOTHUB_PORT(field3),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2492  			field3 & TRB_CYCLE ? 'C' : 'c');
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2493  		break;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2494  	default:
cbf286e8ef8337 Mathias Nyman   2021-08-20  2495  		snprintf(str, size,
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2496  			"type '%s' -> raw %08x %08x %08x %08x",
d2561626b9d126 Lu Baolu        2017-04-07  2497  			xhci_trb_type_string(type),
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2498  			field0, field1, field2, field3);
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2499  	}
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2500  
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2501  	return str;
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2502  }
a37c3f76e6a6b5 Felipe Balbi    2017-01-23  2503  

:::::: The code at line 2306 was first introduced by commit
:::::: cbf286e8ef8337308c259ff5b9ce2e74d403be5a xhci: fix unsafe memory usage in xhci tracing

:::::: TO: Mathias Nyman <mathias.nyman@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
