Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0743323AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679478994; x=1711014994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MC1++v8uzzVxX0kLC0/6+7JlVE+jvB53eztCktsGFv0=;
  b=CSnVLwcFUQoe9HYHcuMZPwOliVhD0Iji89af6q6rpHUgIp63eD/2oEcN
   x94qbseO27KYsQLdX0yVJDOVfLga4gc38YT9ssyHobDPJXg8rUV3V4/nx
   MGDK9lwm/KDPmEWhVx5CmZBTZJa0RMbiVSzDvp7/1XtMge7Q+k/keOjTO
   jXcO8/oFjEHLGy4C6IKS/GD7haliD/BsqpQEY3cEpXPM3mrGB64kNDh44
   zbx+oIPW5RGRNr1XixuwlO14ssBgZRWt+Af/eKZEud5+rINMGg+ctre04
   Sg6S4YaF2NoAKvyq5ACdVnvcfO1WXgrG/gNFBK9ktc+l/if+8VdOA0DLG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="337897228"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="337897228"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 02:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684239505"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="684239505"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Mar 2023 02:56:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pevCp-000D9E-1Y;
	Wed, 22 Mar 2023 09:56:31 +0000
Date: Wed, 22 Mar 2023 17:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: alison.schofield@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 2/6] cxl/trace: Add TRACE support for CXL media-error
 records
Message-ID: <202303221753.P718s5Is-lkp@intel.com>
References: <be0b6edfb0a9fdafe783c68f37972f6bc6d805c4.1679448904.git.alison.schofield@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be0b6edfb0a9fdafe783c68f37972f6bc6d805c4.1679448904.git.alison.schofield@intel.com>

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on e686c32590f40bffc45f105c04c836ffad3e531a]

url:    https://github.com/intel-lab-lkp/linux/commits/alison-schofield-intel-com/cxl-mbox-Add-GET_POISON_LIST-mailbox-command/20230322-101449
base:   e686c32590f40bffc45f105c04c836ffad3e531a
patch link:    https://lore.kernel.org/r/be0b6edfb0a9fdafe783c68f37972f6bc6d805c4.1679448904.git.alison.schofield%40intel.com
patch subject: [PATCH v10 2/6] cxl/trace: Add TRACE support for CXL media-error records
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230322/202303221753.P718s5Is-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a687c2458d48c06353e02426ded6982be06b3a66
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review alison-schofield-intel-com/cxl-mbox-Add-GET_POISON_LIST-mailbox-command/20230322-101449
        git checkout a687c2458d48c06353e02426ded6982be06b3a66
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/cxl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221753.P718s5Is-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from drivers/cxl/core/trace.h:700,
                    from drivers/cxl/core/trace.c:5:
   drivers/cxl/core/./trace.h: In function 'trace_raw_output_cxl_poison':
>> drivers/cxl/core/./trace.h:680:19: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 10 has type 'u32' {aka 'unsigned int'} [-Wformat=]
     680 |         TP_printk("memdev=%s host=%s serial=%lld type=%s region=%s "    \
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   drivers/cxl/core/./trace.h:639:1: note: in expansion of macro 'TRACE_EVENT'
     639 | TRACE_EVENT(cxl_poison,
         | ^~~~~~~~~~~
   drivers/cxl/core/./trace.h:680:9: note: in expansion of macro 'TP_printk'
     680 |         TP_printk("memdev=%s host=%s serial=%lld type=%s region=%s "    \
         |         ^~~~~~~~~
>> drivers/cxl/core/./trace.h:680:19: warning: format '%x' expects argument of type 'unsigned int', but argument 11 has type 'const char *' [-Wformat=]
     680 |         TP_printk("memdev=%s host=%s serial=%lld type=%s region=%s "    \
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   drivers/cxl/core/./trace.h:639:1: note: in expansion of macro 'TRACE_EVENT'
     639 | TRACE_EVENT(cxl_poison,
         | ^~~~~~~~~~~
   drivers/cxl/core/./trace.h:680:9: note: in expansion of macro 'TP_printk'
     680 |         TP_printk("memdev=%s host=%s serial=%lld type=%s region=%s "    \
         |         ^~~~~~~~~
>> drivers/cxl/core/./trace.h:680:19: warning: format '%s' expects argument of type 'char *', but argument 13 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
     680 |         TP_printk("memdev=%s host=%s serial=%lld type=%s region=%s "    \
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   drivers/cxl/core/./trace.h:639:1: note: in expansion of macro 'TRACE_EVENT'
     639 | TRACE_EVENT(cxl_poison,
         | ^~~~~~~~~~~
   drivers/cxl/core/./trace.h:680:9: note: in expansion of macro 'TP_printk'
     680 |         TP_printk("memdev=%s host=%s serial=%lld type=%s region=%s "    \
         |         ^~~~~~~~~
>> drivers/cxl/core/./trace.h:680:19: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
     680 |         TP_printk("memdev=%s host=%s serial=%lld type=%s region=%s "    \
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   drivers/cxl/core/./trace.h:639:1: note: in expansion of macro 'TRACE_EVENT'
     639 | TRACE_EVENT(cxl_poison,
         | ^~~~~~~~~~~
   drivers/cxl/core/./trace.h:680:9: note: in expansion of macro 'TP_printk'
     680 |         TP_printk("memdev=%s host=%s serial=%lld type=%s region=%s "    \
         |         ^~~~~~~~~


vim +680 drivers/cxl/core/./trace.h

   604	
   605	#define show_poison_trace_type(type)		   \
   606		__print_symbolic(type,			   \
   607		{ CXL_POISON_TRACE_LIST,	"LIST"	})
   608	
   609	#define __show_poison_source(source)                          \
   610		__print_symbolic(source,                              \
   611			{ CXL_POISON_SOURCE_UNKNOWN,   "Unknown"  },  \
   612			{ CXL_POISON_SOURCE_EXTERNAL,  "External" },  \
   613			{ CXL_POISON_SOURCE_INTERNAL,  "Internal" },  \
   614			{ CXL_POISON_SOURCE_INJECTED,  "Injected" },  \
   615			{ CXL_POISON_SOURCE_VENDOR,    "Vendor"   })
   616	
   617	#define show_poison_source(source)			     \
   618		(((source > CXL_POISON_SOURCE_INJECTED) &&	     \
   619		 (source != CXL_POISON_SOURCE_VENDOR)) ? "Reserved"  \
   620		 : __show_poison_source(source))
   621	
   622	#define show_poison_flags(flags)                             \
   623		__print_flags(flags, "|",                            \
   624			{ CXL_POISON_FLAG_MORE,      "More"     },   \
   625			{ CXL_POISON_FLAG_OVERFLOW,  "Overflow"  },  \
   626			{ CXL_POISON_FLAG_SCANNING,  "Scanning"  })
   627	
   628	#define __cxl_poison_addr(record)					\
   629		(le64_to_cpu(record->address))
   630	#define cxl_poison_record_dpa(record)					\
   631		(__cxl_poison_addr(record) & CXL_POISON_START_MASK)
   632	#define cxl_poison_record_source(record)				\
   633		(__cxl_poison_addr(record)  & CXL_POISON_SOURCE_MASK)
   634	#define cxl_poison_record_dpa_length(record)				\
   635		(le32_to_cpu(record->length) * CXL_POISON_LEN_MULT)
   636	#define cxl_poison_overflow(flags, time)				\
   637		(flags & CXL_POISON_FLAG_OVERFLOW ? le64_to_cpu(time) : 0)
   638	
 > 639	TRACE_EVENT(cxl_poison,
   640	
   641		TP_PROTO(struct cxl_memdev *cxlmd, struct cxl_region *region,
   642			 const struct cxl_poison_record *record, u8 flags,
   643			 __le64 overflow_t, enum cxl_poison_trace_type type),
   644	
   645		TP_ARGS(cxlmd, region, record, flags, overflow_t, type),
   646	
   647		TP_STRUCT__entry(
   648			__string(memdev, dev_name(&cxlmd->dev))
   649			__string(host, dev_name(cxlmd->dev.parent))
   650			__field(u64, serial)
   651			__field(u8, type)
   652			__string(region, region)
   653			__field(u64, overflow_t)
   654			__field(u64, dpa)
   655			__field(u32, dpa_length)
   656			__array(char, uuid, 16)
   657			__field(u8, source)
   658			__field(u8, flags)
   659		    ),
   660	
   661		TP_fast_assign(
   662			__assign_str(memdev, dev_name(&cxlmd->dev));
   663			__assign_str(host, dev_name(cxlmd->dev.parent));
   664			__entry->serial = cxlmd->cxlds->serial;
   665			__entry->overflow_t = cxl_poison_overflow(flags, overflow_t);
   666			__entry->dpa = cxl_poison_record_dpa(record);
   667			__entry->dpa_length = cxl_poison_record_dpa_length(record);
   668			__entry->source = cxl_poison_record_source(record);
   669			__entry->type = type;
   670			__entry->flags = flags;
   671			if (region) {
   672				__assign_str(region, dev_name(&region->dev));
   673				memcpy(__entry->uuid, &region->params.uuid, 16);
   674			} else {
   675				__assign_str(region, "");
   676				memset(__entry->uuid, 0, 16);
   677			}
   678		    ),
   679	
 > 680		TP_printk("memdev=%s host=%s serial=%lld type=%s region=%s "	\
   681			"region_uuid=%pU hpa=0x%llx dpa=0x%llx dpa_length=0x%x "\
   682			"source=%s flags=%s overflow_time=%llu",
   683			__get_str(memdev),
   684			__get_str(host),
   685			__entry->serial,
   686			show_poison_trace_type(__entry->type),
   687			__get_str(region),
   688			__entry->uuid,
   689			__entry->dpa,
   690			__entry->dpa_length,
   691			show_poison_source(__entry->source),
   692			show_poison_flags(__entry->flags),
   693			__entry->overflow_t
   694		)
   695	);
   696	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
