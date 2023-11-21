Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD311864B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 04:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sye4EBGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700541112; x=1732077112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Fz+sy6tyvEBwrt2EV4TOIMesnoVWS1t06HQ4JYa/h4=;
  b=Sye4EBGg01v/hTjkIogsJ//lhs+l21J4AolLx8ZsrF3/ZLaW7MykRFC0
   AaS5KoGFuaj2Hi9XlfjRKMXy9oA9LnCFdJRU0NsBH4IgWtNyB4uLhExBV
   5o9MsSSN3eTor5iP1ZOlOqwIzyumsIMnSmVNCnfc3euaQgjIQXdZButKq
   JFo7ck9FXzfhCpVkK3bWyczkRqJmCqfGc7Dr8tot5XnDyM1XvwhGNyuy4
   9CwIH4050fkWO/Jsq5S0hUI6eV+yWbrBedDCEPpQnaE25qjkCa8g2tMOq
   Hi0Jnm/svKYL0vhKw5Gyrg+NubEE4kgg3M0uECI7WZlkVMwIbSwtRy/G/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4885298"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="4885298"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 20:31:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="832511211"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="832511211"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2023 20:31:48 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5IQM-0007IY-2J;
	Tue, 21 Nov 2023 04:31:46 +0000
Date: Tue, 21 Nov 2023 12:30:38 +0800
From: kernel test robot <lkp@intel.com>
To: Naresh Solanki <naresh.solanki@9elements.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Naresh Solanki <naresh.solanki@9elements.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] regulator: event: Add regulator netlink event support
Message-ID: <202311211259.fKjbHG1i-lkp@intel.com>
References: <20231120194311.3581036-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120194311.3581036-1-naresh.solanki@9elements.com>

Hi Naresh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 753e4d5c433da57da75dd4c3e1aececc8e874a62]

url:    https://github.com/intel-lab-lkp/linux/commits/Naresh-Solanki/regulator-event-Add-regulator-netlink-event-support/20231121-034604
base:   753e4d5c433da57da75dd4c3e1aececc8e874a62
patch link:    https://lore.kernel.org/r/20231120194311.3581036-1-naresh.solanki%409elements.com
patch subject: [PATCH v1] regulator: event: Add regulator netlink event support
config: arm-randconfig-003-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211259.fKjbHG1i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211259.fKjbHG1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211259.fKjbHG1i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from include/linux/skbuff.h:13,
                    from include/linux/netlink.h:7,
                    from include/net/netlink.h:6,
                    from drivers/regulator/event.c:3:
   drivers/regulator/event.c: In function 'reg_generate_netlink_event':
>> drivers/regulator/event.c:92:18: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
      92 |         pr_debug("%s -> %lx , ret: %x %x", reg_name, event, size);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:345:21: note: in definition of macro 'pr_fmt'
     345 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/regulator/event.c:92:9: note: in expansion of macro 'pr_debug'
      92 |         pr_debug("%s -> %lx , ret: %x %x", reg_name, event, size);
         |         ^~~~~~~~
   drivers/regulator/event.c:92:27: note: format string is defined here
      92 |         pr_debug("%s -> %lx , ret: %x %x", reg_name, event, size);
         |                         ~~^
         |                           |
         |                           long unsigned int
         |                         %llx
>> drivers/regulator/event.c:92:18: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat=]
      92 |         pr_debug("%s -> %lx , ret: %x %x", reg_name, event, size);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:345:21: note: in definition of macro 'pr_fmt'
     345 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/regulator/event.c:92:9: note: in expansion of macro 'pr_debug'
      92 |         pr_debug("%s -> %lx , ret: %x %x", reg_name, event, size);
         |         ^~~~~~~~
   drivers/regulator/event.c:92:40: note: format string is defined here
      92 |         pr_debug("%s -> %lx , ret: %x %x", reg_name, event, size);
         |                                       ~^
         |                                        |
         |                                        unsigned int


vim +92 drivers/regulator/event.c

    49	
    50	int reg_generate_netlink_event(const char *reg_name, u64 event)
    51	{
    52		struct sk_buff *skb;
    53		struct nlattr *attr;
    54		struct reg_genl_event *edata;
    55		void *msg_header;
    56		int size;
    57	
    58		/* allocate memory */
    59		size = nla_total_size(sizeof(struct reg_genl_event)) +
    60		    nla_total_size(0);
    61	
    62		skb = genlmsg_new(size, GFP_ATOMIC);
    63		if (!skb)
    64			return -ENOMEM;
    65	
    66		/* add the genetlink message header */
    67		msg_header = genlmsg_put(skb, 0, reg_event_seqnum++,
    68					 &reg_event_genl_family, 0,
    69					 REG_GENL_CMD_EVENT);
    70		if (!msg_header) {
    71			nlmsg_free(skb);
    72			return -ENOMEM;
    73		}
    74	
    75		/* fill the data */
    76		attr = nla_reserve(skb, REG_GENL_ATTR_EVENT, sizeof(struct reg_genl_event));
    77		if (!attr) {
    78			nlmsg_free(skb);
    79			return -EINVAL;
    80		}
    81	
    82		edata = nla_data(attr);
    83		memset(edata, 0, sizeof(struct reg_genl_event));
    84	
    85		strscpy(edata->reg_name, reg_name, sizeof(edata->reg_name));
    86		edata->event = event;
    87	
    88		/* send multicast genetlink message */
    89		genlmsg_end(skb, msg_header);
    90		size = genlmsg_multicast(&reg_event_genl_family, skb, 0, 0, GFP_ATOMIC);
    91	
  > 92		pr_debug("%s -> %lx , ret: %x %x", reg_name, event, size);
    93		if (size == -ESRCH)
    94			pr_debug("multicast message sent, but nobody was listening...\n");
    95		else if (size)
    96			pr_debug("failed to send multicast genl message\n");
    97		else
    98			pr_debug("multicast message sent %d\n", reg_event_seqnum);
    99	
   100		return 0;
   101	}
   102	EXPORT_SYMBOL(reg_generate_netlink_event);
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
