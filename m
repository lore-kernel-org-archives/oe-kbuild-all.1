Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A4D2E62B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 18:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752863506; cv=none; b=K5kdOvi6v3hVWGu/r9HEqndZcY1mChw9xEqjdIHGi4zLqvpAAZRp3UVwHOZVW9wZVMbBKiuouxu08SbfXgJyrWYPrPg7qYonLVMvtXaErmZesp+zfXSDicMIexBGP3hA70VeYHps1hdLKm1mxyslsV4A5cXwLfSdmC0P27i3/fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752863506; c=relaxed/simple;
	bh=M/ieJ6Ur8NvNAl7y/7y8YFjnfX4A1s04f9LWPcJP5gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Asvam5B2AFyG6mBOa6ZVNe+bP1ZEgNR8oQAdoTXwO0RS/kjIOQhcu9DTrVAqk+ueUG4g6XCRoQvTjHndo6oVVsqp7QU8bMLObSNVeV9LaP1EbtQFflzQThlkqETNsDAMoeQgOR7rxdUEgIGEyjvAk9rK/PRzYfxm30vhXk5NtPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOHIwUhe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOHIwUhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752863505; x=1784399505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M/ieJ6Ur8NvNAl7y/7y8YFjnfX4A1s04f9LWPcJP5gc=;
  b=DOHIwUheJctjSm/tmkCeJ//FcsyWUVr2KTkn7r3Z6GDS/FuSsmQZBmdG
   2sn9Ri4A2zMbKchcLv0jBNtxM6P0mEO2SXoAdFZyYXC5Lo/Q7N7mWjw0j
   Xs0QRFo9UN92wjAF+Fhn9roQn3V68w2DZNHxSfyCu5naJQO0PrNFmJfqe
   8XZ9uIRG8L4oyOe4n032uDBBYeUWb3gDfrOuDRB90y4WxcvT2pf1KnUhB
   VWTLpyU9vXhZrUn2h6KHUzH3o4CgkLuPEdPvJKDcO2GlVSbHftKHde2CT
   TA4EjBx2snohijBclWprLvhSGuJJRhyMr5m0fClD/QGrHzrcE0P7xutcH
   g==;
X-CSE-ConnectionGUID: PiiZ3SOeSrGmeQeyT6hplA==
X-CSE-MsgGUID: v7mghCPGSOSy7LocTyGfkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="80609823"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="80609823"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 11:31:44 -0700
X-CSE-ConnectionGUID: BZyYC4RRQ8O00bgpsoq5cg==
X-CSE-MsgGUID: JLkg/DWATiGCFjrmIDN+cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="162154036"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2025 11:31:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucprx-000ExD-0e;
	Fri, 18 Jul 2025 18:31:41 +0000
Date: Sat, 19 Jul 2025 02:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:string-helper-2025-07-18 136/157]
 drivers/media/common/siano/sms-cards.c:329:44: error: implicit declaration
 of function 'str_enabled_disabled'
Message-ID: <202507190229.9bI0Z6yb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux string-helper-2025-07-18
head:   ea52943b017c3b53f3f8c9ff679ccfb8eaae222a
commit: bf2663b3eae3cf21e2f2c35e996e77f225cbd468 [136/157] media: siano: use string choices helper
config: csky-randconfig-002-20250718 (https://download.01.org/0day-ci/archive/20250719/202507190229.9bI0Z6yb-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190229.9bI0Z6yb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190229.9bI0Z6yb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:623,
                    from include/asm-generic/bug.h:28,
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/media/common/siano/smscoreapi.h:16,
                    from drivers/media/common/siano/sms-cards.h:11,
                    from drivers/media/common/siano/sms-cards.c:8:
   drivers/media/common/siano/sms-cards.c: In function 'sms_board_lna_control':
>> drivers/media/common/siano/sms-cards.c:329:44: error: implicit declaration of function 'str_enabled_disabled' [-Wimplicit-function-declaration]
     329 |         pr_debug("%s: LNA %s\n", __func__, str_enabled_disabled(onoff));
         |                                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:638:9: note: in expansion of macro 'dynamic_pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/common/siano/sms-cards.c:329:9: note: in expansion of macro 'pr_debug'
     329 |         pr_debug("%s: LNA %s\n", __func__, str_enabled_disabled(onoff));
         |         ^~~~~~~~
>> drivers/media/common/siano/smscoreapi.h:14:21: warning: format '%s' expects argument of type 'char *', but argument 6 has type 'int' [-Wformat=]
      14 | #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
         |                     ^~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'pr_fmt'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:638:9: note: in expansion of macro 'dynamic_pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/common/siano/sms-cards.c:329:9: note: in expansion of macro 'pr_debug'
     329 |         pr_debug("%s: LNA %s\n", __func__, str_enabled_disabled(onoff));
         |         ^~~~~~~~


vim +/str_enabled_disabled +329 drivers/media/common/siano/sms-cards.c

   323	
   324	int sms_board_lna_control(struct smscore_device_t *coredev, int onoff)
   325	{
   326		int board_id = smscore_get_board_id(coredev);
   327		struct sms_board *board = sms_get_board(board_id);
   328	
 > 329		pr_debug("%s: LNA %s\n", __func__, str_enabled_disabled(onoff));
   330	
   331		switch (board_id) {
   332		case SMS1XXX_BOARD_HAUPPAUGE_TIGER_MINICARD_R2:
   333		case SMS1XXX_BOARD_HAUPPAUGE_TIGER_MINICARD:
   334			sms_set_gpio(coredev,
   335				     board->rf_switch, onoff ? 1 : 0);
   336			return sms_set_gpio(coredev,
   337					    board->lna_ctrl, onoff ? 1 : 0);
   338		}
   339		return -EINVAL;
   340	}
   341	EXPORT_SYMBOL_GPL(sms_board_lna_control);
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
