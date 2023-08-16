Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C7A17ADC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 23:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692228577; x=1723764577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fY+K1Wip0xe2pDlDgY5Otav+Wq1oTJasz9aU8MDJEdo=;
  b=XpxDBpAzk1Y++wMmA43DFKuKXjttfZWfLnwCP2uno5XYYiQTTTfPKWKT
   00ZvfhqooBXCJZQKUBtlsrjngrfGrwiZt4K4xsNDDyrXRkoe+rEu1ZNRS
   EQUTdUITtEW2i1I4lDJzOcjjN/tM7Vu+3ISuTJZFeckplLCCO6JLA0Fr7
   IWe0uJrHZvPENenAEpQbz8Uvl4DytjW6e2BUbJ5fs5vAcihUnye8J9y9e
   6RG+RWdOjFup47D/xHQl9jdqZjQXGyBvY7rC2RK7LJSGoG2ryeHzYFrwG
   0uZiOy96IKiqQyczkR04c30qEux5Z2tXzNwDxGCqgybZrkbmneEGgyv5d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362816204"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="362816204"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 16:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763803099"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="763803099"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2023 16:29:34 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWPxF-0000eT-31;
	Wed, 16 Aug 2023 23:29:33 +0000
Date: Thu, 17 Aug 2023 07:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 238/6555] kernel/trace/ftrace.c:6776:6:
 warning: no previous declaration for 'ftrace_graph_return_stub'
Message-ID: <202308170723.DxZPL3ma-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 1183bbba7c80acfb5ab39443e9401c47c8ed153b [238/6555] ANDROID: ftrace: fix function type mismatches
config: x86_64-randconfig-x003-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170723.DxZPL3ma-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170723.DxZPL3ma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170723.DxZPL3ma-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ftrace.c:618:5: warning: no previous declaration for 'ftrace_profile_pages_init' [-Wmissing-declarations]
    int ftrace_profile_pages_init(struct ftrace_profile_stat *stat)
        ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/ftrace.c:6776:6: warning: no previous declaration for 'ftrace_graph_return_stub' [-Wmissing-declarations]
    void ftrace_graph_return_stub(struct ftrace_graph_ret *trace)
         ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:6780:5: warning: no previous declaration for 'ftrace_graph_entry_stub' [-Wmissing-declarations]
    int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace)
        ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:4757: warning: Function parameter or member 'ops' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:4757: warning: Function parameter or member 'ip' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:4757: warning: Function parameter or member 'remove' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:4757: warning: Function parameter or member 'reset' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:4771: warning: Function parameter or member 'ops' not described in 'ftrace_ops_set_global_filter'
   kernel/trace/ftrace.c:4799: warning: Function parameter or member 'ops' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:4799: warning: Function parameter or member 'buf' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:4799: warning: Function parameter or member 'len' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:4799: warning: Function parameter or member 'reset' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:4818: warning: Function parameter or member 'ops' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:4818: warning: Function parameter or member 'buf' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:4818: warning: Function parameter or member 'len' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:4818: warning: Function parameter or member 'reset' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:4833: warning: Function parameter or member 'buf' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:4833: warning: Function parameter or member 'len' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:4833: warning: Function parameter or member 'reset' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:4849: warning: Function parameter or member 'buf' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:4849: warning: Function parameter or member 'len' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:4849: warning: Function parameter or member 'reset' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:6678: warning: Function parameter or member 'ops' not described in 'register_ftrace_function'
   kernel/trace/ftrace.c:6700: warning: Function parameter or member 'ops' not described in 'unregister_ftrace_function'


vim +/ftrace_graph_return_stub +6776 kernel/trace/ftrace.c

  6775	
> 6776	void ftrace_graph_return_stub(struct ftrace_graph_ret *trace)
  6777	{
  6778	}
  6779	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
