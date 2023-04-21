Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CDD646
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 05:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682054105; x=1713590105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MJYV4Kd+/eQUhKoSSJp/uqOzPpDEhQJR6i6u4FidhgE=;
  b=Z+K0la2trTxTUHsqnHKOlvqtK5ZFBskFka9rQsFIx/eoc9TVKGZwvaNs
   Z/XTeOHTmlfGf0G4JmPQ/DrY5ZOQxJcjFi7z/4ygUbGW8GNxAbInhebpt
   hiGsGFoE8SUH5xjTpo6PGGBAWufln0/IlQJREoDwQJ1IaL9W+QQU227PD
   b0hYrZP3XBW/WyKD1M9RPJRPApRJmcBy9kZLI/phSkqz5LpWPhboLTn1H
   ssMG8N95L4QR7nXNZCSfZXdHdrnW8RHbNZaqu3YcCio15JbtoVkeGOBSp
   /jjAPcRzfS+EItBTrYrbmVcaHxsdpq00d3oI3PNdf+Vxzbyv5Y5+nVdHB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="334790616"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="334790616"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 22:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="836048471"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="836048471"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2023 22:15:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppj6t-000gKy-24;
	Fri, 21 Apr 2023 05:15:03 +0000
Date: Fri, 21 Apr 2023 13:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: Scott Mayhew <smayhew@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/5] SUNRPC: store GSS creds in keyrings
Message-ID: <202304211200.n2ErV9D8-lkp@intel.com>
References: <20230420202004.239116-6-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420202004.239116-6-smayhew@redhat.com>

Hi Scott,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v6.3-rc7 next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Scott-Mayhew/keys-export-keyring_ptr_to_key/20230421-042202
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20230420202004.239116-6-smayhew%40redhat.com
patch subject: [RFC PATCH 5/5] SUNRPC: store GSS creds in keyrings
config: arc-defconfig (https://download.01.org/0day-ci/archive/20230421/202304211200.n2ErV9D8-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6a654188690846a7c5e1de83e390a2bce53d79a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Scott-Mayhew/keys-export-keyring_ptr_to_key/20230421-042202
        git checkout 6a654188690846a7c5e1de83e390a2bce53d79a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211200.n2ErV9D8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/rpcgss.h:726,
                    from net/sunrpc/auth_gss/trace.c:14:
   include/trace/events/rpcgss.h: In function 'trace_event_raw_event_rpcgss_request_key_result':
>> include/trace/events/rpcgss.h:654:46: error: invalid use of undefined type 'const struct key'
     654 |                         __entry->serial = key->serial;
         |                                              ^~
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/rpcgss.h:629:1: note: in expansion of macro 'TRACE_EVENT'
     629 | TRACE_EVENT(rpcgss_request_key_result,
         | ^~~~~~~~~~~
   include/trace/events/rpcgss.h:645:9: note: in expansion of macro 'TP_fast_assign'
     645 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:103:
   include/trace/events/rpcgss.h: In function 'perf_trace_rpcgss_request_key_result':
>> include/trace/events/rpcgss.h:654:46: error: invalid use of undefined type 'const struct key'
     654 |                         __entry->serial = key->serial;
         |                                              ^~
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
      44 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/rpcgss.h:629:1: note: in expansion of macro 'TRACE_EVENT'
     629 | TRACE_EVENT(rpcgss_request_key_result,
         | ^~~~~~~~~~~
   include/trace/events/rpcgss.h:645:9: note: in expansion of macro 'TP_fast_assign'
     645 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~


vim +654 include/trace/events/rpcgss.h

   628	
   629	TRACE_EVENT(rpcgss_request_key_result,
   630		TP_PROTO(
   631			const struct auth_cred *acred,
   632			const struct key *key
   633		),
   634	
   635		TP_ARGS(acred, key),
   636	
   637		TP_STRUCT__entry(
   638			__field(u32, uid)
   639			__string(principal, acred->principal)
   640			__field(const void *, credkey)
   641			__field(int, serial)
   642			__field(int, error)
   643		),
   644	
   645		TP_fast_assign(
   646			__entry->uid = from_kuid(&init_user_ns, acred->cred->fsuid);
   647			__assign_str(principal, acred->principal);
   648			if (IS_ERR(key)) {
   649				__entry->credkey = 0;
   650				__entry->serial = 0;
   651				__entry->error = PTR_ERR(key);
   652			} else {
   653				__entry->credkey = key;
 > 654				__entry->serial = key->serial;
   655				__entry->error = 0;
   656			}
   657		),
   658	
   659		TP_printk(" for acred { uid %u princ %s }, key=%px serial=%d error=%d",
   660			__entry->uid, __get_str(principal), __entry->credkey,
   661			__entry->serial, __entry->error)
   662	);
   663	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
