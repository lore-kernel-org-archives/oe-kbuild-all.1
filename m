Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF60310E8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 07:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692255672; x=1723791672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wxyrEdrHfrN8lc8CS5wtkv70u/g5yf0QAn9cbl/kTgQ=;
  b=Pf5yicY6M9CmVB1TyA872jkvzCqSV/5Amfif7LsrO1I970KCTJ7r1gfn
   xyH94sI2BdQ7DjVCyRCO2fzSL+fcsUhxE1N16O0Vl8d87gesRzxA9+4fz
   Y/0RT99KFQLR+twrkr44bX0UAq7MJD/SGRameakXs3bSjvXzMjn/vbx2n
   qOs2YgSK5MwRaB5Kz5dmXOKfcYZo85wmWgsKIPqbK8/3/Fue05Ti0jkx8
   mNdOkRsse/JsfUYLn6VWUFnJkt7NbkFfyA8RQ953/pgUJw2I9MLEkUxv7
   GZiiyAshqMYN5U447aF46QxPtirqA8tBd9RzeIOvXZPWFtQEIEfrcjpNx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436634206"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="436634206"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848781589"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="848781589"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2023 00:01:10 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWX0H-0000sL-2E;
	Thu, 17 Aug 2023 07:01:09 +0000
Date: Thu, 17 Aug 2023 15:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_dl_files 17/19] include/trace/events/devlink.h:17:
 multiple definition of `__traceiter_devlink_hwmsg';
 net/devlink/core.o:net/devlink/core.c:17: first defined here
Message-ID: <202308171400.r9OMXWXI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_dl_files
head:   00a5b9621f0bc27e4f004dc027f187a5ef824a53
commit: 7d5b9c0f23e2895699cddab7f4e29c9025d61ba7 [17/19] devlink: move devlink_hw*() tracepoint definitions into core.c
config: loongarch-randconfig-r021-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171400.r9OMXWXI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171400.r9OMXWXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171400.r9OMXWXI-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: net/devlink/trap.o: in function `__traceiter_devlink_hwmsg':
>> include/trace/events/devlink.h:17: multiple definition of `__traceiter_devlink_hwmsg'; net/devlink/core.o:net/devlink/core.c:17: first defined here
>> loongarch64-linux-ld: net/devlink/trap.o:include/trace/events/devlink.h:17: multiple definition of `__tracepoint_devlink_hwmsg'; net/devlink/core.o:include/trace/events/devlink.h:17: first defined here
   loongarch64-linux-ld: net/devlink/trap.o: in function `__probestub_devlink_hwmsg':
>> include/trace/events/devlink.h:17: multiple definition of `__probestub_devlink_hwmsg'; net/devlink/core.o:net/devlink/core.c:17: first defined here
   loongarch64-linux-ld: net/devlink/trap.o: in function `__traceiter_devlink_hwerr':
>> include/trace/events/devlink.h:52: multiple definition of `__traceiter_devlink_hwerr'; net/devlink/core.o:net/devlink/core.c:52: first defined here
>> loongarch64-linux-ld: net/devlink/trap.o:include/trace/events/devlink.h:52: multiple definition of `__tracepoint_devlink_hwerr'; net/devlink/core.o:include/trace/events/devlink.h:52: first defined here
   loongarch64-linux-ld: net/devlink/trap.o: in function `__probestub_devlink_hwerr':
>> include/trace/events/devlink.h:52: multiple definition of `__probestub_devlink_hwerr'; net/devlink/core.o:net/devlink/core.c:52: first defined here
   loongarch64-linux-ld: net/devlink/trap.o: in function `__traceiter_devlink_health_report':
>> include/trace/events/devlink.h:81: multiple definition of `__traceiter_devlink_health_report'; net/devlink/core.o:net/devlink/core.c:81: first defined here
>> loongarch64-linux-ld: net/devlink/trap.o:include/trace/events/devlink.h:81: multiple definition of `__tracepoint_devlink_health_report'; net/devlink/core.o:include/trace/events/devlink.h:81: first defined here
   loongarch64-linux-ld: net/devlink/trap.o: in function `__probestub_devlink_health_report':
>> include/trace/events/devlink.h:81: multiple definition of `__probestub_devlink_health_report'; net/devlink/core.o:net/devlink/core.c:81: first defined here
   loongarch64-linux-ld: net/devlink/trap.o: in function `__traceiter_devlink_health_recover_aborted':
>> include/trace/events/devlink.h:112: multiple definition of `__traceiter_devlink_health_recover_aborted'; net/devlink/core.o:net/devlink/core.c:112: first defined here
>> loongarch64-linux-ld: net/devlink/trap.o:include/trace/events/devlink.h:112: multiple definition of `__tracepoint_devlink_health_recover_aborted'; net/devlink/core.o:include/trace/events/devlink.h:112: first defined here
   loongarch64-linux-ld: net/devlink/trap.o: in function `__probestub_devlink_health_recover_aborted':
>> include/trace/events/devlink.h:112: multiple definition of `__probestub_devlink_health_recover_aborted'; net/devlink/core.o:net/devlink/core.c:112: first defined here
   loongarch64-linux-ld: net/devlink/trap.o: in function `__traceiter_devlink_health_reporter_state_update':
>> include/trace/events/devlink.h:146: multiple definition of `__traceiter_devlink_health_reporter_state_update'; net/devlink/core.o:net/devlink/core.c:146: first defined here
>> loongarch64-linux-ld: net/devlink/trap.o:include/trace/events/devlink.h:146: multiple definition of `__tracepoint_devlink_health_reporter_state_update'; net/devlink/core.o:include/trace/events/devlink.h:146: first defined here
   loongarch64-linux-ld: net/devlink/trap.o: in function `__probestub_devlink_health_reporter_state_update':
>> include/trace/events/devlink.h:146: multiple definition of `__probestub_devlink_health_reporter_state_update'; net/devlink/core.o:net/devlink/core.c:146: first defined here
   loongarch64-linux-ld: net/devlink/trap.o: in function `__traceiter_devlink_trap_report':
>> include/trace/events/devlink.h:177: multiple definition of `__traceiter_devlink_trap_report'; net/devlink/core.o:net/devlink/core.c:177: first defined here
>> loongarch64-linux-ld: net/devlink/trap.o:include/trace/events/devlink.h:177: multiple definition of `__tracepoint_devlink_trap_report'; net/devlink/core.o:include/trace/events/devlink.h:177: first defined here
   loongarch64-linux-ld: net/devlink/trap.o: in function `__probestub_devlink_trap_report':
>> include/trace/events/devlink.h:177: multiple definition of `__probestub_devlink_trap_report'; net/devlink/core.o:include/trace/events/devlink.h:177: first defined here
>> loongarch64-linux-ld: net/devlink/trap.o:include/trace/events/devlink.h:177: multiple definition of `__SCK__tp_func_devlink_trap_report'; net/devlink/core.o:include/trace/events/devlink.h:177: first defined here
>> loongarch64-linux-ld: net/devlink/trap.o:include/trace/events/devlink.h:146: multiple definition of `__SCK__tp_func_devlink_health_reporter_state_update'; net/devlink/core.o:include/trace/events/devlink.h:146: first defined here
   loongarch64-linux-ld: net/devlink/trap.o:include/trace/events/devlink.h:112: multiple definition of `__SCK__tp_func_devlink_health_recover_aborted'; net/devlink/core.o:include/trace/events/devlink.h:112: first defined here
   loongarch64-linux-ld: net/devlink/trap.o:include/trace/events/devlink.h:81: multiple definition of `__SCK__tp_func_devlink_health_report'; net/devlink/core.o:include/trace/events/devlink.h:81: first defined here
   loongarch64-linux-ld: net/devlink/trap.o:include/trace/events/devlink.h:52: multiple definition of `__SCK__tp_func_devlink_hwerr'; net/devlink/core.o:include/trace/events/devlink.h:52: first defined here
   loongarch64-linux-ld: net/devlink/trap.o:include/trace/events/devlink.h:17: multiple definition of `__SCK__tp_func_devlink_hwmsg'; net/devlink/core.o:include/trace/events/devlink.h:17: first defined here


vim +17 include/trace/events/devlink.h

e5224f0fe2acddb Jiri Pirko              2016-07-12   13  
e5224f0fe2acddb Jiri Pirko              2016-07-12   14  /*
e5224f0fe2acddb Jiri Pirko              2016-07-12   15   * Tracepoint for devlink hardware message:
e5224f0fe2acddb Jiri Pirko              2016-07-12   16   */
e5224f0fe2acddb Jiri Pirko              2016-07-12  @17  TRACE_EVENT(devlink_hwmsg,
e5224f0fe2acddb Jiri Pirko              2016-07-12   18  	TP_PROTO(const struct devlink *devlink, bool incoming,
e5224f0fe2acddb Jiri Pirko              2016-07-12   19  		 unsigned long type, const u8 *buf, size_t len),
e5224f0fe2acddb Jiri Pirko              2016-07-12   20  
e5224f0fe2acddb Jiri Pirko              2016-07-12   21  	TP_ARGS(devlink, incoming, type, buf, len),
e5224f0fe2acddb Jiri Pirko              2016-07-12   22  
e5224f0fe2acddb Jiri Pirko              2016-07-12   23  	TP_STRUCT__entry(
21314638c9f251b Leon Romanovsky         2021-10-12   24  		__string(bus_name, devlink_to_dev(devlink)->bus->name)
21314638c9f251b Leon Romanovsky         2021-10-12   25  		__string(dev_name, dev_name(devlink_to_dev(devlink)))
21314638c9f251b Leon Romanovsky         2021-10-12   26  		__string(driver_name, devlink_to_dev(devlink)->driver->name)
e5224f0fe2acddb Jiri Pirko              2016-07-12   27  		__field(bool, incoming)
e5224f0fe2acddb Jiri Pirko              2016-07-12   28  		__field(unsigned long, type)
e5224f0fe2acddb Jiri Pirko              2016-07-12   29  		__dynamic_array(u8, buf, len)
e5224f0fe2acddb Jiri Pirko              2016-07-12   30  		__field(size_t, len)
e5224f0fe2acddb Jiri Pirko              2016-07-12   31  	),
e5224f0fe2acddb Jiri Pirko              2016-07-12   32  
e5224f0fe2acddb Jiri Pirko              2016-07-12   33  	TP_fast_assign(
21314638c9f251b Leon Romanovsky         2021-10-12   34  		__assign_str(bus_name, devlink_to_dev(devlink)->bus->name);
21314638c9f251b Leon Romanovsky         2021-10-12   35  		__assign_str(dev_name, dev_name(devlink_to_dev(devlink)));
21314638c9f251b Leon Romanovsky         2021-10-12   36  		__assign_str(driver_name, devlink_to_dev(devlink)->driver->name);
e5224f0fe2acddb Jiri Pirko              2016-07-12   37  		__entry->incoming = incoming;
e5224f0fe2acddb Jiri Pirko              2016-07-12   38  		__entry->type = type;
e5224f0fe2acddb Jiri Pirko              2016-07-12   39  		memcpy(__get_dynamic_array(buf), buf, len);
e5224f0fe2acddb Jiri Pirko              2016-07-12   40  		__entry->len = len;
e5224f0fe2acddb Jiri Pirko              2016-07-12   41  	),
e5224f0fe2acddb Jiri Pirko              2016-07-12   42  
caeccd5180930eb Arnd Bergmann           2016-07-14   43  	TP_printk("bus_name=%s dev_name=%s driver_name=%s incoming=%d type=%lu buf=0x[%*phD] len=%zu",
e5224f0fe2acddb Jiri Pirko              2016-07-12   44  		  __get_str(bus_name), __get_str(dev_name),
0e1824c98a0ffd7 Jiri Pirko              2016-07-14   45  		  __get_str(driver_name), __entry->incoming, __entry->type,
e5224f0fe2acddb Jiri Pirko              2016-07-12   46  		  (int) __entry->len, __get_dynamic_array(buf), __entry->len)
e5224f0fe2acddb Jiri Pirko              2016-07-12   47  );
e5224f0fe2acddb Jiri Pirko              2016-07-12   48  
57186a5f43d093e Nir Dotan               2019-02-04   49  /*
57186a5f43d093e Nir Dotan               2019-02-04   50   * Tracepoint for devlink hardware error:
57186a5f43d093e Nir Dotan               2019-02-04   51   */
57186a5f43d093e Nir Dotan               2019-02-04  @52  TRACE_EVENT(devlink_hwerr,
57186a5f43d093e Nir Dotan               2019-02-04   53  	TP_PROTO(const struct devlink *devlink, int err, const char *msg),
57186a5f43d093e Nir Dotan               2019-02-04   54  
57186a5f43d093e Nir Dotan               2019-02-04   55  	TP_ARGS(devlink, err, msg),
57186a5f43d093e Nir Dotan               2019-02-04   56  
57186a5f43d093e Nir Dotan               2019-02-04   57  	TP_STRUCT__entry(
21314638c9f251b Leon Romanovsky         2021-10-12   58  		__string(bus_name, devlink_to_dev(devlink)->bus->name)
21314638c9f251b Leon Romanovsky         2021-10-12   59  		__string(dev_name, dev_name(devlink_to_dev(devlink)))
21314638c9f251b Leon Romanovsky         2021-10-12   60  		__string(driver_name, devlink_to_dev(devlink)->driver->name)
57186a5f43d093e Nir Dotan               2019-02-04   61  		__field(int, err)
57186a5f43d093e Nir Dotan               2019-02-04   62  		__string(msg, msg)
57186a5f43d093e Nir Dotan               2019-02-04   63  		),
57186a5f43d093e Nir Dotan               2019-02-04   64  
57186a5f43d093e Nir Dotan               2019-02-04   65  	TP_fast_assign(
21314638c9f251b Leon Romanovsky         2021-10-12   66  		__assign_str(bus_name, devlink_to_dev(devlink)->bus->name);
21314638c9f251b Leon Romanovsky         2021-10-12   67  		__assign_str(dev_name, dev_name(devlink_to_dev(devlink)));
21314638c9f251b Leon Romanovsky         2021-10-12   68  		__assign_str(driver_name, devlink_to_dev(devlink)->driver->name);
57186a5f43d093e Nir Dotan               2019-02-04   69  		__entry->err = err;
57186a5f43d093e Nir Dotan               2019-02-04   70  		__assign_str(msg, msg);
57186a5f43d093e Nir Dotan               2019-02-04   71  		),
57186a5f43d093e Nir Dotan               2019-02-04   72  
57186a5f43d093e Nir Dotan               2019-02-04   73  	TP_printk("bus_name=%s dev_name=%s driver_name=%s err=%d %s",
57186a5f43d093e Nir Dotan               2019-02-04   74  			__get_str(bus_name), __get_str(dev_name),
57186a5f43d093e Nir Dotan               2019-02-04   75  			__get_str(driver_name), __entry->err, __get_str(msg))
57186a5f43d093e Nir Dotan               2019-02-04   76  );
57186a5f43d093e Nir Dotan               2019-02-04   77  
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   78  /*
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   79   * Tracepoint for devlink health message:
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   80   */
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  @81  TRACE_EVENT(devlink_health_report,
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   82  	TP_PROTO(const struct devlink *devlink, const char *reporter_name,
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   83  		 const char *msg),
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   84  
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   85  	TP_ARGS(devlink, reporter_name, msg),
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   86  
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   87  	TP_STRUCT__entry(
21314638c9f251b Leon Romanovsky         2021-10-12   88  		__string(bus_name, devlink_to_dev(devlink)->bus->name)
21314638c9f251b Leon Romanovsky         2021-10-12   89  		__string(dev_name, dev_name(devlink_to_dev(devlink)))
21314638c9f251b Leon Romanovsky         2021-10-12   90  		__string(driver_name, devlink_to_dev(devlink)->driver->name)
d0ab772c1f1558a Moshe Shemesh           2023-02-14   91  		__string(reporter_name, reporter_name)
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   92  		__string(msg, msg)
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   93  	),
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   94  
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   95  	TP_fast_assign(
21314638c9f251b Leon Romanovsky         2021-10-12   96  		__assign_str(bus_name, devlink_to_dev(devlink)->bus->name);
21314638c9f251b Leon Romanovsky         2021-10-12   97  		__assign_str(dev_name, dev_name(devlink_to_dev(devlink)));
21314638c9f251b Leon Romanovsky         2021-10-12   98  		__assign_str(driver_name, devlink_to_dev(devlink)->driver->name);
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07   99  		__assign_str(reporter_name, reporter_name);
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  100  		__assign_str(msg, msg);
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  101  	),
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  102  
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  103  	TP_printk("bus_name=%s dev_name=%s driver_name=%s reporter_name=%s: %s",
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  104  		  __get_str(bus_name), __get_str(dev_name),
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  105  		  __get_str(driver_name), __get_str(reporter_name),
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  106  		  __get_str(msg))
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  107  );
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  108  
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  109  /*
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  110   * Tracepoint for devlink health recover aborted message:
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  111   */
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07 @112  TRACE_EVENT(devlink_health_recover_aborted,
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  113  	TP_PROTO(const struct devlink *devlink, const char *reporter_name,
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  114  		 bool health_state, u64 time_since_last_recover),
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  115  
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  116  	TP_ARGS(devlink, reporter_name, health_state, time_since_last_recover),
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  117  
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  118  	TP_STRUCT__entry(
21314638c9f251b Leon Romanovsky         2021-10-12  119  		__string(bus_name, devlink_to_dev(devlink)->bus->name)
21314638c9f251b Leon Romanovsky         2021-10-12  120  		__string(dev_name, dev_name(devlink_to_dev(devlink)))
21314638c9f251b Leon Romanovsky         2021-10-12  121  		__string(driver_name, devlink_to_dev(devlink)->driver->name)
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  122  		__string(reporter_name, reporter_name)
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  123  		__field(bool, health_state)
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  124  		__field(u64, time_since_last_recover)
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  125  	),
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  126  
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  127  	TP_fast_assign(
21314638c9f251b Leon Romanovsky         2021-10-12  128  		__assign_str(bus_name, devlink_to_dev(devlink)->bus->name);
21314638c9f251b Leon Romanovsky         2021-10-12  129  		__assign_str(dev_name, dev_name(devlink_to_dev(devlink)));
21314638c9f251b Leon Romanovsky         2021-10-12  130  		__assign_str(driver_name, devlink_to_dev(devlink)->driver->name);
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  131  		__assign_str(reporter_name, reporter_name);
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  132  		__entry->health_state = health_state;
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  133  		__entry->time_since_last_recover = time_since_last_recover;
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  134  	),
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  135  
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  136  	TP_printk("bus_name=%s dev_name=%s driver_name=%s reporter_name=%s: health_state=%d time_since_last_recover=%llu recover aborted",
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  137  		  __get_str(bus_name), __get_str(dev_name),
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  138  		  __get_str(driver_name), __get_str(reporter_name),
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  139  		  __entry->health_state,
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  140  		  __entry->time_since_last_recover)
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  141  );
c8e1da0bf9238e4 Eran Ben Elisha         2019-02-07  142  
3167b27a7ded846 Eran Ben Elisha         2019-03-03  143  /*
3167b27a7ded846 Eran Ben Elisha         2019-03-03  144   * Tracepoint for devlink health reporter state update:
3167b27a7ded846 Eran Ben Elisha         2019-03-03  145   */
3167b27a7ded846 Eran Ben Elisha         2019-03-03 @146  TRACE_EVENT(devlink_health_reporter_state_update,
3167b27a7ded846 Eran Ben Elisha         2019-03-03  147  	TP_PROTO(const struct devlink *devlink, const char *reporter_name,
3167b27a7ded846 Eran Ben Elisha         2019-03-03  148  		 bool new_state),
3167b27a7ded846 Eran Ben Elisha         2019-03-03  149  
3167b27a7ded846 Eran Ben Elisha         2019-03-03  150  	TP_ARGS(devlink, reporter_name, new_state),
3167b27a7ded846 Eran Ben Elisha         2019-03-03  151  
3167b27a7ded846 Eran Ben Elisha         2019-03-03  152  	TP_STRUCT__entry(
21314638c9f251b Leon Romanovsky         2021-10-12  153  		__string(bus_name, devlink_to_dev(devlink)->bus->name)
21314638c9f251b Leon Romanovsky         2021-10-12  154  		__string(dev_name, dev_name(devlink_to_dev(devlink)))
21314638c9f251b Leon Romanovsky         2021-10-12  155  		__string(driver_name, devlink_to_dev(devlink)->driver->name)
3167b27a7ded846 Eran Ben Elisha         2019-03-03  156  		__string(reporter_name, reporter_name)
3167b27a7ded846 Eran Ben Elisha         2019-03-03  157  		__field(u8, new_state)
3167b27a7ded846 Eran Ben Elisha         2019-03-03  158  	),
3167b27a7ded846 Eran Ben Elisha         2019-03-03  159  
3167b27a7ded846 Eran Ben Elisha         2019-03-03  160  	TP_fast_assign(
21314638c9f251b Leon Romanovsky         2021-10-12  161  		__assign_str(bus_name, devlink_to_dev(devlink)->bus->name);
21314638c9f251b Leon Romanovsky         2021-10-12  162  		__assign_str(dev_name, dev_name(devlink_to_dev(devlink)));
21314638c9f251b Leon Romanovsky         2021-10-12  163  		__assign_str(driver_name, devlink_to_dev(devlink)->driver->name);
3167b27a7ded846 Eran Ben Elisha         2019-03-03  164  		__assign_str(reporter_name, reporter_name);
3167b27a7ded846 Eran Ben Elisha         2019-03-03  165  		__entry->new_state = new_state;
3167b27a7ded846 Eran Ben Elisha         2019-03-03  166  	),
3167b27a7ded846 Eran Ben Elisha         2019-03-03  167  
3167b27a7ded846 Eran Ben Elisha         2019-03-03  168  	TP_printk("bus_name=%s dev_name=%s driver_name=%s reporter_name=%s: new_state=%d",
3167b27a7ded846 Eran Ben Elisha         2019-03-03  169  		  __get_str(bus_name), __get_str(dev_name),
3167b27a7ded846 Eran Ben Elisha         2019-03-03  170  		  __get_str(driver_name), __get_str(reporter_name),
3167b27a7ded846 Eran Ben Elisha         2019-03-03  171  		  __entry->new_state)
3167b27a7ded846 Eran Ben Elisha         2019-03-03  172  );
3167b27a7ded846 Eran Ben Elisha         2019-03-03  173  
5b88823bfe0875b Ido Schimmel            2020-09-29  174  /*
5b88823bfe0875b Ido Schimmel            2020-09-29  175   * Tracepoint for devlink packet trap:
5b88823bfe0875b Ido Schimmel            2020-09-29  176   */
5b88823bfe0875b Ido Schimmel            2020-09-29 @177  TRACE_EVENT(devlink_trap_report,
5b88823bfe0875b Ido Schimmel            2020-09-29  178  	TP_PROTO(const struct devlink *devlink, struct sk_buff *skb,
5b88823bfe0875b Ido Schimmel            2020-09-29  179  		 const struct devlink_trap_metadata *metadata),
5b88823bfe0875b Ido Schimmel            2020-09-29  180  
5b88823bfe0875b Ido Schimmel            2020-09-29  181  	TP_ARGS(devlink, skb, metadata),
5b88823bfe0875b Ido Schimmel            2020-09-29  182  
5b88823bfe0875b Ido Schimmel            2020-09-29  183  	TP_STRUCT__entry(
21314638c9f251b Leon Romanovsky         2021-10-12  184  		__string(bus_name, devlink_to_dev(devlink)->bus->name)
21314638c9f251b Leon Romanovsky         2021-10-12  185  		__string(dev_name, dev_name(devlink_to_dev(devlink)))
21314638c9f251b Leon Romanovsky         2021-10-12  186  		__string(driver_name, devlink_to_dev(devlink)->driver->name)
5b88823bfe0875b Ido Schimmel            2020-09-29  187  		__string(trap_name, metadata->trap_name)
5b88823bfe0875b Ido Schimmel            2020-09-29  188  		__string(trap_group_name, metadata->trap_group_name)
2a04b8d846dca19 Steven Rostedt (Google  2022-07-12  189) 		__array(char, input_dev_name, IFNAMSIZ)
5b88823bfe0875b Ido Schimmel            2020-09-29  190  	),
5b88823bfe0875b Ido Schimmel            2020-09-29  191  
5b88823bfe0875b Ido Schimmel            2020-09-29  192  	TP_fast_assign(
5b88823bfe0875b Ido Schimmel            2020-09-29  193  		struct net_device *input_dev = metadata->input_dev;
5b88823bfe0875b Ido Schimmel            2020-09-29  194  
21314638c9f251b Leon Romanovsky         2021-10-12  195  		__assign_str(bus_name, devlink_to_dev(devlink)->bus->name);
21314638c9f251b Leon Romanovsky         2021-10-12  196  		__assign_str(dev_name, dev_name(devlink_to_dev(devlink)));
21314638c9f251b Leon Romanovsky         2021-10-12  197  		__assign_str(driver_name, devlink_to_dev(devlink)->driver->name);
5b88823bfe0875b Ido Schimmel            2020-09-29  198  		__assign_str(trap_name, metadata->trap_name);
5b88823bfe0875b Ido Schimmel            2020-09-29  199  		__assign_str(trap_group_name, metadata->trap_group_name);
2a04b8d846dca19 Steven Rostedt (Google  2022-07-12  200) 		strscpy(__entry->input_dev_name, input_dev ? input_dev->name : "NULL", IFNAMSIZ);
5b88823bfe0875b Ido Schimmel            2020-09-29  201  	),
5b88823bfe0875b Ido Schimmel            2020-09-29  202  
5b88823bfe0875b Ido Schimmel            2020-09-29  203  	TP_printk("bus_name=%s dev_name=%s driver_name=%s trap_name=%s "
5b88823bfe0875b Ido Schimmel            2020-09-29  204  		  "trap_group_name=%s input_dev_name=%s", __get_str(bus_name),
5b88823bfe0875b Ido Schimmel            2020-09-29  205  		  __get_str(dev_name), __get_str(driver_name),
5b88823bfe0875b Ido Schimmel            2020-09-29  206  		  __get_str(trap_name), __get_str(trap_group_name),
2a04b8d846dca19 Steven Rostedt (Google  2022-07-12  207) 		  __entry->input_dev_name)
5b88823bfe0875b Ido Schimmel            2020-09-29  208  );
5b88823bfe0875b Ido Schimmel            2020-09-29  209  

:::::: The code at line 17 was first introduced by commit
:::::: e5224f0fe2acddbc2fa9b419d8867ced7f5381fc devlink: add hardware messages tracing facility

:::::: TO: Jiri Pirko <jiri@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
