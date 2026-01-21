Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CF6324B1C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 16:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012212; cv=none; b=F7Kp45CrLjd27Vf77zGcQidOykiuVqP/Nl6jndYniAZN99KDTGJwl1OmyAeJ225nDsUzRxPIazwkB4Y3GtrQq7mPKIrmqOr6LwxoXTDEZluPTS7jE1nzKqzkgDWyniKrmFvyWZm5Z5xvZwFdKlCMa9PYblksOvd5zLFUf2fBWsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012212; c=relaxed/simple;
	bh=xyXHTidgZWY/g2PxPkFTtT3NCs4dp0/0mZfJqy8CZXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOYGu6Q+Uti+FxeEfXGy3eEp1FAQtiDLA0NteFJCJn4DHIYqso5KqViFgR6XXh2tTTYaacENMQzWCfiP+8a8k820mh9mDONUFrW7vtOs6vKMv10bRghacwptWK7mGJKPPmcfWnpBMvj7kVvf81kNvkkhcjOtEmJv+69vL0n/2dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ds83+RQS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ds83+RQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769012209; x=1800548209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xyXHTidgZWY/g2PxPkFTtT3NCs4dp0/0mZfJqy8CZXU=;
  b=ds83+RQS0wYpsd/RKF/A5dTwsOTqj0DCYBCgdeY8e0Yh3nPiFtysmV86
   l162rgH86zUNQxsb5Jv+Tz0HudsyNUzCEBeWsdf0x+ICUcKpq33IeODgs
   slz/6qwqXiwKo920n5DkUHU9YpOlsw7NBegCl0qv4H+dJcYPJLKU/YlCa
   Eri3ZezPxPOFUgKEHJWYZosVLRl2/t6dGYNrT+92ZR11YDZ2HFRzb3HN3
   K7juJplLtPyoeD85FuXAyx1vIDNkY5usi4BpS28dZE2rJtDOv9q90xTR+
   0sT8944Q4AXo6J9629UDOR8q/dnJKBh048qSN/+vQYEckDz7/2k0wzpoj
   A==;
X-CSE-ConnectionGUID: PWVt3/AxRQyUnBzpYTKrnQ==
X-CSE-MsgGUID: yT2KQs8MRti7gdUGb3vQNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80545744"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="80545744"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 08:16:49 -0800
X-CSE-ConnectionGUID: 2E2KTzYeRSyQpmMLQSXLGQ==
X-CSE-MsgGUID: FvI0bei0Tq+AU5xO1BxfNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="211495702"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2026 08:16:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viast-00000000ROz-3i0x;
	Wed, 21 Jan 2026 16:16:43 +0000
Date: Thu, 22 Jan 2026 00:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: Re: [PATCH v5] usb: dwc3: Log dwc3 address in traces
Message-ID: <202601220002.cJKQOY2h-lkp@intel.com>
References: <20260121084550.3112162-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121084550.3112162-1-prashanth.k@oss.qualcomm.com>

Hi Prashanth,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.19-rc6 next-20260120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prashanth-K/usb-dwc3-Log-dwc3-address-in-traces/20260121-165130
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260121084550.3112162-1-prashanth.k%40oss.qualcomm.com
patch subject: [PATCH v5] usb: dwc3: Log dwc3 address in traces
config: sparc64-randconfig-001-20260121 (https://download.01.org/0day-ci/archive/20260122/202601220002.cJKQOY2h-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220002.cJKQOY2h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220002.cJKQOY2h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from drivers/usb/dwc3/trace.h:387,
                    from drivers/usb/dwc3/trace.c:11:
   drivers/usb/dwc3/./trace.h: In function 'trace_raw_output_dwc3_log_set_prtcap':
>> drivers/usb/dwc3/./trace.h:33:19: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Wformat=]
      33 |         TP_printk("%pa: mode %s", __entry->base_address, dwc3_mode_string(__entry->mode))
         |                   ^~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   drivers/usb/dwc3/./trace.h:33:9: note: in expansion of macro 'TP_printk'
      33 |         TP_printk("%pa: mode %s", __entry->base_address, dwc3_mode_string(__entry->mode))
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:256:
   drivers/usb/dwc3/./trace.h:33:21: note: format string is defined here
      33 |         TP_printk("%pa: mode %s", __entry->base_address, dwc3_mode_string(__entry->mode))
         |                    ~^
         |                     |
         |                     void *
         |                    %lld
   drivers/usb/dwc3/./trace.h: In function 'trace_raw_output_dwc3_log_io':
   drivers/usb/dwc3/./trace.h:56:19: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Wformat=]
      56 |         TP_printk("%pa: addr %p offset %04x value %08x",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   drivers/usb/dwc3/./trace.h:56:9: note: in expansion of macro 'TP_printk'
      56 |         TP_printk("%pa: addr %p offset %04x value %08x",
         |         ^~~~~~~~~
   drivers/usb/dwc3/./trace.h:56:21: note: format string is defined here
      56 |         TP_printk("%pa: addr %p offset %04x value %08x",
         |                    ~^
         |                     |
         |                     void *
         |                    %lld
   drivers/usb/dwc3/./trace.h: In function 'trace_raw_output_dwc3_log_event':
   drivers/usb/dwc3/./trace.h:86:19: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Wformat=]
      86 |         TP_printk("%pa: event (%08x): %s", __entry->base_address, __entry->event,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   drivers/usb/dwc3/./trace.h:86:9: note: in expansion of macro 'TP_printk'
      86 |         TP_printk("%pa: event (%08x): %s", __entry->base_address, __entry->event,
         |         ^~~~~~~~~
   drivers/usb/dwc3/./trace.h:86:21: note: format string is defined here
      86 |         TP_printk("%pa: event (%08x): %s", __entry->base_address, __entry->event,
         |                    ~^
         |                     |
         |                     void *
         |                    %lld
   drivers/usb/dwc3/./trace.h: In function 'trace_raw_output_dwc3_log_ctrl':
   drivers/usb/dwc3/./trace.h:115:19: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Wformat=]
     115 |         TP_printk("%pa: %s", __entry->base_address, usb_decode_ctrl(__get_buf(DWC3_MSG_MAX),
         |                   ^~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   drivers/usb/dwc3/./trace.h:115:9: note: in expansion of macro 'TP_printk'
     115 |         TP_printk("%pa: %s", __entry->base_address, usb_decode_ctrl(__get_buf(DWC3_MSG_MAX),
         |         ^~~~~~~~~
   drivers/usb/dwc3/./trace.h:115:21: note: format string is defined here
     115 |         TP_printk("%pa: %s", __entry->base_address, usb_decode_ctrl(__get_buf(DWC3_MSG_MAX),
         |                    ~^
         |                     |
         |                     void *
         |                    %lld
   drivers/usb/dwc3/./trace.h: In function 'trace_raw_output_dwc3_log_request':
   drivers/usb/dwc3/./trace.h:152:19: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Wformat=]
     152 |         TP_printk("%pa: %s: req %p length %u/%u %s%s%s ==> %d",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   drivers/usb/dwc3/./trace.h:152:9: note: in expansion of macro 'TP_printk'
     152 |         TP_printk("%pa: %s: req %p length %u/%u %s%s%s ==> %d",
         |         ^~~~~~~~~
   drivers/usb/dwc3/./trace.h:152:21: note: format string is defined here
     152 |         TP_printk("%pa: %s: req %p length %u/%u %s%s%s ==> %d",
         |                    ~^
         |                     |
         |                     void *
         |                    %lld
   drivers/usb/dwc3/./trace.h: In function 'trace_raw_output_dwc3_log_generic_cmd':
   drivers/usb/dwc3/./trace.h:203:19: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Wformat=]
     203 |         TP_printk("%pa: cmd '%s' [%x] param %08x --> status: %s",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     219 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   drivers/usb/dwc3/./trace.h:203:9: note: in expansion of macro 'TP_printk'
     203 |         TP_printk("%pa: cmd '%s' [%x] param %08x --> status: %s",
         |         ^~~~~~~~~
   drivers/usb/dwc3/./trace.h:203:21: note: format string is defined here
     203 |         TP_printk("%pa: cmd '%s' [%x] param %08x --> status: %s",
         |                    ~^
         |                     |
         |                     void *
         |                    %lld
   drivers/usb/dwc3/./trace.h: In function 'trace_raw_output_dwc3_log_gadget_ep_cmd':
   drivers/usb/dwc3/./trace.h:237:19: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Wformat=]
     237 |         TP_printk("%pa: %s: cmd '%s' [%x] params %08x %08x %08x --> status: %s",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:219:34: note: in definition of macro 'DECLARE_EVENT_CLASS'


vim +33 drivers/usb/dwc3/./trace.h

    21	
    22	DECLARE_EVENT_CLASS(dwc3_log_set_prtcap,
    23		TP_PROTO(struct dwc3 *dwc, u32 mode),
    24		TP_ARGS(dwc, mode),
    25		TP_STRUCT__entry(
    26			__field(phys_addr_t, base_address)
    27			__field(u32, mode)
    28		),
    29		TP_fast_assign(
    30			__entry->base_address = dwc->xhci_resources[0].start;
    31			__entry->mode = mode;
    32		),
  > 33		TP_printk("%pa: mode %s", __entry->base_address, dwc3_mode_string(__entry->mode))
    34	);
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
