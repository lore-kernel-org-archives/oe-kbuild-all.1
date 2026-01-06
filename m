Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406E6279DC0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708609; cv=none; b=L+bG4bMorobx5tFhwD3rRycflb3leNLxv2MOYodfpC4LAPejyR/CH08ZZyPKAOjbI8MJtqCVBQhXtl6ZCigD5aYebjfi5DRTjvPi/cSSOIj0XGJZ6Ey+TOpCjJti+rLpGkZ0oBPlIKRYl0/CCJwd2HizEpDewZh+pT0+utpuSko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708609; c=relaxed/simple;
	bh=ZVGEkHIA+tBEkSfCESQTob2nEMy4TnaDjHhPH9YK0xc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ANHr93SN7ukWplCDC13uX3FvDB3Cy1LE/5hWhRVNoPsaf7HD0xm+4O9j2jcQJifv9doVPHMdvMVBgCfQVJjVb6y+0h3QFHtdP1a5QZg3ohv1OptXmMpam1vUXXyeqO5NofIBy7yZloFCXR0rjpnnj/IJ1ksSrqZryvHiTphKXEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxvhnzRM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxvhnzRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767708608; x=1799244608;
  h=date:from:to:cc:subject:message-id;
  bh=ZVGEkHIA+tBEkSfCESQTob2nEMy4TnaDjHhPH9YK0xc=;
  b=gxvhnzRMBRL9bQVwIMFJ5YaUX2D3LC+CzYRnt4poC2jlZbFuXyXZHszM
   m1fbP+3hzcU+eGL9o+vg/UelAOlmqIYMFzgnxrF3VhKq5er/hfQdxfu8E
   AO6MrbAku7uHv2sfI0fS86kQ53XAksowC61nKP7XEO6yNx0Foa+qTSO2d
   Vwzs7tWCzkSibMi/2DJV3KME/EJV5W5y0bj8KGRfNpeFki/yxEX+9GABN
   DptKuJtIHSCLee55By7k0S6MldTv8mBFUWB7AVt8fuVX2jB+kARc+Yyqi
   p9KKlu6yrwSCxGQj7NeWZAgwa8p3ahXmjG9Zm1ld1IfHQ2N/SyiWCRtsg
   A==;
X-CSE-ConnectionGUID: LO8JjTjeRCOetw5+ofgJ5A==
X-CSE-MsgGUID: Jm2RD6jSRI25YQWORj85VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79706242"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="79706242"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 06:10:05 -0800
X-CSE-ConnectionGUID: gupmiaRDSuGXCdiZOS1EWg==
X-CSE-MsgGUID: tV9fFlBFR7ugEdYaNxWqew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202681830"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Jan 2026 06:10:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd7l3-00000000209-27sT;
	Tue, 06 Jan 2026 14:10:01 +0000
Date: Tue, 06 Jan 2026 22:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_mon_kunit 26/28]
 kernel/trace/rv/rv_monitors_test.c:41:42: warning: initialization left-hand
 side might be a candidate for a format attribute
Message-ID: <202601062250.9mLsBNbP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   aa87c6b5e8020a853fbc2444ded06a93a7fc1493
commit: a3a107602a180742b0a05704b5c554f5ba056bf0 [26/28] rv: Add KUnit tests for some DA/HA monitors
config: arc-randconfig-001-20260106 (https://download.01.org/0day-ci/archive/20260106/202601062250.9mLsBNbP-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601062250.9mLsBNbP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601062250.9mLsBNbP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:55,
                    from include/linux/kref.h:16,
                    from include/kunit/test.h:22,
                    from kernel/trace/rv/rv_monitors_test.h:3,
                    from kernel/trace/rv/rv_monitors_test.c:10:
   kernel/trace/rv/rv_monitors_test.c: In function 'rv_trigger_test_init':
>> kernel/trace/rv/rv_monitors_test.c:41:42: warning: initialization left-hand side might be a candidate for a format attribute [-Wsuggest-attribute=format]
      41 |         kunit_activate_static_stub(test, rv_react, stub_rv_react);
         |                                          ^~~~~~~~
   include/linux/typecheck.h:21:30: note: in definition of macro 'typecheck_fn'
      21 | ({      typeof(type) __tmp = function; \
         |                              ^~~~~~~~
   kernel/trace/rv/rv_monitors_test.c:41:9: note: in expansion of macro 'kunit_activate_static_stub'
      41 |         kunit_activate_static_stub(test, rv_react, stub_rv_react);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/rv/rv_monitors_test.c:11:
>> kernel/trace/rv/rv_monitors_test.c:41:42: warning: argument 2 of '__kunit_activate_static_stub' might be a candidate for a format attribute [-Wsuggest-attribute=format]
      41 |         kunit_activate_static_stub(test, rv_react, stub_rv_react);
         |                                          ^~~~~~~~
   include/kunit/static_stub.h:97:44: note: in definition of macro 'kunit_activate_static_stub'
      97 |         __kunit_activate_static_stub(test, real_fn_addr, replacement_addr);     \
         |                                            ^~~~~~~~~~~~


vim +41 kernel/trace/rv/rv_monitors_test.c

    31	
    32	static int rv_trigger_test_init(struct kunit *test)
    33	{
    34		struct rv_kunit_ctx *ctx;
    35	
    36		ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
    37		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
    38	
    39		test->priv = ctx;
    40	
  > 41		kunit_activate_static_stub(test, rv_react, stub_rv_react);
    42		kunit_activate_static_stub(test, rv_get_task_monitor_slot,
    43					   stub_rv_get_task_monitor_slot);
    44		kunit_activate_static_stub(test, rv_put_task_monitor_slot,
    45					   stub_rv_put_task_monitor_slot);
    46	
    47		return 0;
    48	}
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
