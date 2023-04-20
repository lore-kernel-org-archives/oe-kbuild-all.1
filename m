Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90954946F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 23:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682033820; x=1713569820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yg6/Maga5bypfwEAuoC8l+fVrQXpgzd4IF/Qe3crgMs=;
  b=kiwKE8aXn29BsmAFipO6Vjq9GbmyjagLZUkYry4/E+dJX1eTNqkYlMy4
   cs6hm1EZGgWlf3AQubztanDy/WVKoPA6WKtDj3jhXJSKr9UWGh/YXnWJa
   vAj+w9Wr6bVleBn6I2I3H8qW2XYd1hOX+AAVBOlvmamANMxw2+d/t3EjK
   JxO6Qrq/6rRX2x1RP6BF32ES1B/rHRc/OQDOM1086JKHvG0QOB/pQX6lX
   M4nZ7MEvNHRNCg2Q1Vlc9SHATDWKCBNr6Nch6z2owAEGZxMh5CD70Pb6U
   6hOZ8VsZOv+MITQ9NtWYDRjgHyEfADhxUdiPDEmKhFgc8wSySI3jLGS1d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325479213"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="325479213"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 16:36:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="694774721"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="694774721"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Apr 2023 16:36:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppdph-000gAm-15;
	Thu, 20 Apr 2023 23:36:57 +0000
Date: Fri, 21 Apr 2023 07:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 238/6555] kernel/trace/ftrace.c:6776:6:
 sparse: sparse: symbol 'ftrace_graph_return_stub' was not declared. Should
 it be static?
Message-ID: <202304210716.NCIlJpqb-lkp@intel.com>
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
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/20230421/202304210716.NCIlJpqb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/1183bbba7c80acfb5ab39443e9401c47c8ed153b
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout 1183bbba7c80acfb5ab39443e9401c47c8ed153b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/block/ kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210716.NCIlJpqb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/ftrace.c:117:66: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_ops [noderef] <asn:4> *static [toplevel] ftrace_ops_list @@     got struct ftrace_ops * @@
   kernel/trace/ftrace.c:117:66: sparse:     expected struct ftrace_ops [noderef] <asn:4> *static [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:117:66: sparse:     got struct ftrace_ops *
   kernel/trace/ftrace.c:238:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] <asn:4> *static [addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:238:49: sparse:     expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:238:49: sparse:     got struct ftrace_ops [noderef] <asn:4> *static [addressable] [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:321:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops [noderef] <asn:4> * @@     got struct ftrace_ops * @@
   kernel/trace/ftrace.c:321:23: sparse:     expected struct ftrace_ops [noderef] <asn:4> *
   kernel/trace/ftrace.c:321:23: sparse:     got struct ftrace_ops *
   kernel/trace/ftrace.c:325:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops **p @@     got struct ftrace_ops [noderef] <asn:4> **list @@
   kernel/trace/ftrace.c:325:16: sparse:     expected struct ftrace_ops **p
   kernel/trace/ftrace.c:325:16: sparse:     got struct ftrace_ops [noderef] <asn:4> **list
   kernel/trace/ftrace.c:325:50: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops **p @@     got struct ftrace_ops [noderef] <asn:4> ** @@
   kernel/trace/ftrace.c:325:50: sparse:     expected struct ftrace_ops **p
   kernel/trace/ftrace.c:325:50: sparse:     got struct ftrace_ops [noderef] <asn:4> **
   kernel/trace/ftrace.c:332:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops * @@     got struct ftrace_ops [noderef] <asn:4> *next @@
   kernel/trace/ftrace.c:332:12: sparse:     expected struct ftrace_ops *
   kernel/trace/ftrace.c:332:12: sparse:     got struct ftrace_ops [noderef] <asn:4> *next
>> kernel/trace/ftrace.c:6776:6: sparse: sparse: symbol 'ftrace_graph_return_stub' was not declared. Should it be static?
   kernel/trace/ftrace.c:236:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:236:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:236:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6776:6: warning: no previous prototype for 'ftrace_graph_return_stub' [-Wmissing-prototypes]
    6776 | void ftrace_graph_return_stub(struct ftrace_graph_ret *trace)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:6780:5: warning: no previous prototype for 'ftrace_graph_entry_stub' [-Wmissing-prototypes]
    6780 | int ftrace_graph_entry_stub(struct ftrace_graph_ent *trace)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
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
https://github.com/intel/lkp-tests
