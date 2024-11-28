Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDE21C3033
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 21:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732829312; cv=none; b=gTw8uq5XIN4GtytMj+nXCMyKlN/HjZ43MwXrnW4rzYBl/uEuBXBxyIDVKlfV7BV8EsufuAd2bBljQtxr/QqKw9wgR6tE6bDAaNhReaytLLkf2kpC6AGJdkR9F9gFG9GJ7QL+F4HgQQvGsx+lP9p2ngG0MCTRXaHrfdliXSRWvKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732829312; c=relaxed/simple;
	bh=69auPsi1J8RE6Ykhdo19SUXgCjkuGAjhyjd1d2RFuGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LTvtJ1o2CYvk600jx+63HEg70GdzLNdLdPNBlcpMgiHeAGY5yB8XIc4knhXE3/HZiWbMHGQYSemallA9A77s9qBewxYVS+y/xDY3Y+hWA5kOXwIKRxe8PjydpcGkeITHJffYaifvyNPGunf0VZwuX5pgRzA0J3sAXm5vc3sf9WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwtgzWSc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwtgzWSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732829310; x=1764365310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=69auPsi1J8RE6Ykhdo19SUXgCjkuGAjhyjd1d2RFuGA=;
  b=KwtgzWScIiQPziNtT6DOMtq6dvVJXbnw0CGsiUVJLnBjN2xaxnlqzlR7
   xL/nrhPlvPPQCbQBZ57CfD1ClkL3yZhYSEgvOADoPiVxUJe79EVct59Ad
   X5+IHIajUfapUBG/FGaOx74VD+McCxw0Mp/Qi7tSoiN1qmdx8n7eeJvCe
   06rI7/r/zUM6u277fpC6SNUTXOtlAvtqXhlJdkK1y83YDNwsAni1wFwaP
   LdqyWy+2cGFnokdc+GDvbeNtDz7xQRpo9YXKBky+OtiD9Dz+IYjFQZ5CK
   1sDKCkGB2ED+TjuM4TtZnK+Al2bnPskn1I0/SsioqmvA2hpL4tyN8XT5/
   w==;
X-CSE-ConnectionGUID: OSJ8vBEyS4m22AsBjf9ZYg==
X-CSE-MsgGUID: iKc+l9KaRny/a7WeJsWgdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33209332"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="33209332"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 13:28:28 -0800
X-CSE-ConnectionGUID: IcXimJ7DST+CYafd/VToiw==
X-CSE-MsgGUID: 8KGSlgkjSrKIa1KXoPzAKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97371750"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Nov 2024 13:28:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGm3k-000A45-2V;
	Thu, 28 Nov 2024 21:28:24 +0000
Date: Fri, 29 Nov 2024 05:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1559/1559] drivers/usb/host/xhci.h:2801:15:
 warning: argument 1 null where non-null expected
Message-ID: <202411290526.4JBRte8h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi ZhaoLong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 1119ec49ac4ac643e6d7c9a5a834040aef87612e [1559/1559] mm, fs: Add BPF_READAHEAD build option for bpf readhead
config: arm64-randconfig-004-20241129 (https://download.01.org/0day-ci/archive/20241129/202411290526.4JBRte8h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290526.4JBRte8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290526.4JBRte8h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/host/xhci-trace.h:25,
                    from drivers/usb/host/xhci-trace.c:12:
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
>> drivers/usb/host/xhci.h:2801:15: warning: null destination pointer [-Wformat-overflow=]
    2801 |         ret = sprintf(str, "State %s mult %d max P. Streams %d %s",
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2802 |                         xhci_ep_state_string(ep_state), mult,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2803 |                         max_pstr, lsa ? "LSA " : "");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from drivers/usb/host/xhci-trace.h:622:
   drivers/usb/host/./xhci-trace.h: In function 'trace_raw_output_xhci_log_ep_ctx':
>> drivers/usb/host/./xhci-trace.h:327:19: warning: '%s' directive argument is null [-Wformat-overflow=]
     327 |         TP_printk("%s", xhci_decode_ep_context(__get_buf(XHCI_MSG_MAX),
         |                   ^~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   drivers/usb/host/./xhci-trace.h:327:9: note: in expansion of macro 'TP_printk'
     327 |         TP_printk("%s", xhci_decode_ep_context(__get_buf(XHCI_MSG_MAX),
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:237:
   drivers/usb/host/./xhci-trace.h:327:20: note: format string is defined here
     327 |         TP_printk("%s", xhci_decode_ep_context(__get_buf(XHCI_MSG_MAX),
         |                    ^~
   In function 'xhci_decode_doorbell',
       inlined from 'trace_raw_output_xhci_log_doorbell' at drivers/usb/host/./xhci-trace.h:543:1:
   drivers/usb/host/xhci.h:2706:17: warning: argument 1 null where non-null expected [-Wnonnull]
    2706 |                 sprintf(str, "Command Ring %d", doorbell);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sprintf.h: In function 'trace_raw_output_xhci_log_doorbell':
   include/linux/sprintf.h:10:20: note: in a call to function 'sprintf' declared 'nonnull'
      10 | __printf(2, 3) int sprintf(char *buf, const char * fmt, ...);
         |                    ^~~~~~~
   In function 'xhci_decode_doorbell',
       inlined from 'trace_raw_output_xhci_log_doorbell' at drivers/usb/host/./xhci-trace.h:543:1:
   drivers/usb/host/xhci.h:2709:15: warning: argument 1 null where non-null expected [-Wnonnull]
    2709 |         ret = sprintf(str, "Slot %d ", slot);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sprintf.h: In function 'trace_raw_output_xhci_log_doorbell':
   include/linux/sprintf.h:10:20: note: in a call to function 'sprintf' declared 'nonnull'
      10 | __printf(2, 3) int sprintf(char *buf, const char * fmt, ...);
         |                    ^~~~~~~
   In function 'xhci_decode_doorbell',
       inlined from 'trace_raw_output_xhci_log_doorbell' at drivers/usb/host/./xhci-trace.h:543:1:
   drivers/usb/host/xhci.h:2709:15: warning: null destination pointer [-Wformat-overflow=]
    2709 |         ret = sprintf(str, "Slot %d ", slot);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci.h:2706:17: warning: null destination pointer [-Wformat-overflow=]
    2706 |                 sprintf(str, "Command Ring %d", doorbell);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/./xhci-trace.h: In function 'trace_raw_output_xhci_log_doorbell':
   drivers/usb/host/./xhci-trace.h:554:19: warning: '%s' directive argument is null [-Wformat-overflow=]
     554 |         TP_printk("Ring doorbell for %s",
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   drivers/usb/host/./xhci-trace.h:554:9: note: in expansion of macro 'TP_printk'
     554 |         TP_printk("Ring doorbell for %s",
         |         ^~~~~~~~~
   drivers/usb/host/./xhci-trace.h:554:38: note: format string is defined here
     554 |         TP_printk("Ring doorbell for %s",
         |                                      ^~
   drivers/usb/host/xhci.h: In function 'xhci_decode_portsc.constprop':
   drivers/usb/host/xhci.h:2624:15: warning: argument 1 null where non-null expected [-Wnonnull]
    2624 |         ret = sprintf(str, "%s %s %s Link:%s PortSpeed:%d ",
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2625 |                       portsc & PORT_POWER       ? "Powered" : "Powered-off",
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2626 |                       portsc & PORT_CONNECT     ? "Connected" : "Not-connected",
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2627 |                       portsc & PORT_PE          ? "Enabled" : "Disabled",
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2628 |                       xhci_portsc_link_state_string(portsc),
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2629 |                       DEV_PORT_SPEED(portsc));
         |                       ~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sprintf.h:10:20: note: in a call to function 'sprintf' declared 'nonnull'
      10 | __printf(2, 3) int sprintf(char *buf, const char * fmt, ...);
         |                    ^~~~~~~
   drivers/usb/host/xhci.h:2624:15: warning: null destination pointer [-Wformat-overflow=]
    2624 |         ret = sprintf(str, "%s %s %s Link:%s PortSpeed:%d ",
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2625 |                       portsc & PORT_POWER       ? "Powered" : "Powered-off",
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2626 |                       portsc & PORT_CONNECT     ? "Connected" : "Not-connected",
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2627 |                       portsc & PORT_PE          ? "Enabled" : "Disabled",
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2628 |                       xhci_portsc_link_state_string(portsc),
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2629 |                       DEV_PORT_SPEED(portsc));
         |                       ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/./xhci-trace.h: In function 'trace_raw_output_xhci_log_portsc':
   drivers/usb/host/./xhci-trace.h:522:31: warning: '%s' directive argument is null [-Wformat-overflow=]
     522 |                     TP_printk("port-%d: %s",
         |                               ^~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   drivers/usb/host/./xhci-trace.h:522:21: note: in expansion of macro 'TP_printk'
     522 |                     TP_printk("port-%d: %s",
         |                     ^~~~~~~~~
   drivers/usb/host/./xhci-trace.h:522:41: note: format string is defined here
     522 |                     TP_printk("port-%d: %s",
         |                                         ^~
   In function 'xhci_decode_slot_context',
       inlined from 'trace_raw_output_xhci_log_slot_ctx' at drivers/usb/host/./xhci-trace.h:357:1:
   drivers/usb/host/xhci.h:2546:15: warning: argument 1 null where non-null expected [-Wnonnull]
    2546 |         ret = sprintf(str, "RS %05x %s%s%s Ctx Entries %d MEL %d us Port# %d/%d",
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2547 |                         info & ROUTE_STRING_MASK,


vim +2801 drivers/usb/host/xhci.h

19a7d0d65c4a81 Felipe Balbi  2017-04-07  2763  
4843b4b5ec64b8 Mathias Nyman 2021-08-20  2764  static inline const char *xhci_decode_ep_context(char *str, u32 info,
4843b4b5ec64b8 Mathias Nyman 2021-08-20  2765  		u32 info2, u64 deq, u32 tx_info)
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2766  {
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2767  	int ret;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2768  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2769  	u32 esit;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2770  	u16 maxp;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2771  	u16 avg;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2772  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2773  	u8 max_pstr;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2774  	u8 ep_state;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2775  	u8 interval;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2776  	u8 ep_type;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2777  	u8 burst;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2778  	u8 cerr;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2779  	u8 mult;
97ef0faf575e03 Mathias Nyman 2018-03-08  2780  
97ef0faf575e03 Mathias Nyman 2018-03-08  2781  	bool lsa;
97ef0faf575e03 Mathias Nyman 2018-03-08  2782  	bool hid;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2783  
76a14d7bf92960 Mathias Nyman 2017-09-18  2784  	esit = CTX_TO_MAX_ESIT_PAYLOAD_HI(info) << 16 |
76a14d7bf92960 Mathias Nyman 2017-09-18  2785  		CTX_TO_MAX_ESIT_PAYLOAD(tx_info);
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2786  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2787  	ep_state = info & EP_STATE_MASK;
97ef0faf575e03 Mathias Nyman 2018-03-08  2788  	max_pstr = CTX_TO_EP_MAXPSTREAMS(info);
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2789  	interval = CTX_TO_EP_INTERVAL(info);
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2790  	mult = CTX_TO_EP_MULT(info) + 1;
97ef0faf575e03 Mathias Nyman 2018-03-08  2791  	lsa = !!(info & EP_HAS_LSA);
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2792  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2793  	cerr = (info2 & (3 << 1)) >> 1;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2794  	ep_type = CTX_TO_EP_TYPE(info2);
97ef0faf575e03 Mathias Nyman 2018-03-08  2795  	hid = !!(info2 & (1 << 7));
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2796  	burst = CTX_TO_MAX_BURST(info2);
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2797  	maxp = MAX_PACKET_DECODED(info2);
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2798  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2799  	avg = EP_AVG_TRB_LENGTH(tx_info);
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2800  
19a7d0d65c4a81 Felipe Balbi  2017-04-07 @2801  	ret = sprintf(str, "State %s mult %d max P. Streams %d %s",
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2802  			xhci_ep_state_string(ep_state), mult,
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2803  			max_pstr, lsa ? "LSA " : "");
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2804  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2805  	ret += sprintf(str + ret, "interval %d us max ESIT payload %d CErr %d ",
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2806  			(1 << interval) * 125, esit, cerr);
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2807  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2808  	ret += sprintf(str + ret, "Type %s %sburst %d maxp %d deq %016llx ",
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2809  			xhci_ep_type_string(ep_type), hid ? "HID" : "",
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2810  			burst, maxp, deq);
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2811  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2812  	ret += sprintf(str + ret, "avg trb len %d", avg);
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2813  
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2814  	return str;
19a7d0d65c4a81 Felipe Balbi  2017-04-07  2815  }
a37c3f76e6a6b5 Felipe Balbi  2017-01-23  2816  

:::::: The code at line 2801 was first introduced by commit
:::::: 19a7d0d65c4a813069f4bc4ca701d6a163c337e9 usb: host: xhci: add Slot and EP Context tracers

:::::: TO: Felipe Balbi <felipe.balbi@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
