Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547938E8BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587459; cv=none; b=qcKrWO8jxC/W2xxspMcBmOrTU+qxkojS5ZKIziMoyGZU8ZJxSSDObj7p2p6IUvQxv7slYF8v+kOBHMUy2z8ogsARHC56f1QSgmYC0UA6ta22a1K+iYTnFlzTwrgMX6PpoWgpEd6Q1QRtER0Y2xO0DyKf0csZIJxvOXbX6lS2028=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587459; c=relaxed/simple;
	bh=QuH2EdGeopYcunwowTHj3YcA0F5POBnw9e66qxMI+NE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r8ypVEUPb+3CyLtmd610Pd3uy4YtZzsLL3S7KN7kgbcH8IcM8SrWxCxZRRIClQAmRF4FsCofhLcTLhlKzuYGQxzYXuLwSVXOj3UNesR1rcUxCdqoEh87dLIyf6LX8q4IDagWAQRnjFOlHHuMKurdp3j5Pxx92cJ7hrHA71a3U+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IaUW9KcP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaUW9KcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778587457; x=1810123457;
  h=date:from:to:cc:subject:message-id;
  bh=QuH2EdGeopYcunwowTHj3YcA0F5POBnw9e66qxMI+NE=;
  b=IaUW9KcPen7lGgxgsreHmHz63k+YsI/T/zjLlGNyN55qBJec5UTv7rgc
   rrcp4St2QIlAI1+t1hmwfPY2zey7E+NosvGJm68ZtFgzX6/Vh5mohyu5+
   HWZ/E/ZYsE8TC62xlqYW2t5o0oUhHfbmDe1sFicknjM4UUUxxCHaH5+J/
   G4CSoVr+Ht3iWX8tOlWWeZbMMIGyUD2f4tMZgz1fH5Nl9kI8cc0rv0rpE
   gV9SaDcOwZScQV1MtffM+qEHPqLBJQHEINk5XtbVe3RhP00vU9whMc79x
   A9bnT2+B8rCC24NxZa2EuxlfS5X3FPWT79TTcWPGxi1IMJGx2BkR+WdAA
   g==;
X-CSE-ConnectionGUID: OgBtvLGaTGar63po2rbBdg==
X-CSE-MsgGUID: 3L0N6RInTWqP4/9IMY9FRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79515046"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79515046"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:04:16 -0700
X-CSE-ConnectionGUID: IZy6Gi3cTBOb4LmWY03C2A==
X-CSE-MsgGUID: UN02BvVRQnKUR8OFg9GTsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="241754030"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 May 2026 05:04:14 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMlqN-0000000025g-3qPS;
	Tue, 12 May 2026 12:04:11 +0000
Date: Tue, 12 May 2026 20:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_tests 10/14]
 include/kunit/static_stub.h:68:8: warning: argument 2 of
 'kunit_hooks.get_static_stub_address' might be a candidate for a format
 attribute
Message-ID: <202605122042.SNwJW47p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_tests
head:   2c56034debf1af6ff1539eaf2f3eb6eaf7316944
commit: 226b3ca43ff52df1f35062cc290735bd59cea1cd [10/14] rv: Add KUnit stub to rv_react() and rv_*_task_monitor_slot()
config: parisc-randconfig-002-20260512 (https://download.01.org/0day-ci/archive/20260512/202605122042.SNwJW47p-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605122042.SNwJW47p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605122042.SNwJW47p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/rv/rv_reactors.c:66:
   kernel/trace/rv/rv_reactors.c: In function 'rv_react':
>> include/kunit/static_stub.h:68:8: warning: argument 2 of 'kunit_hooks.get_static_stub_address' might be a candidate for a format attribute [-Wsuggest-attribute=format]
      68 |        &real_fn_name); \
   kernel/trace/rv/rv_reactors.c:472:2: note: in expansion of macro 'KUNIT_STATIC_STUB_REDIRECT'
     472 |  KUNIT_STATIC_STUB_REDIRECT(rv_react, monitor, msg);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +68 include/kunit/static_stub.h

e047c5eaa763245 David Gow  2023-01-31  23  
e047c5eaa763245 David Gow  2023-01-31  24  
e047c5eaa763245 David Gow  2023-01-31  25  /**
e047c5eaa763245 David Gow  2023-01-31  26   * KUNIT_STATIC_STUB_REDIRECT() - call a replacement 'static stub' if one exists
e047c5eaa763245 David Gow  2023-01-31  27   * @real_fn_name: The name of this function (as an identifier, not a string)
e047c5eaa763245 David Gow  2023-01-31  28   * @args: All of the arguments passed to this function
e047c5eaa763245 David Gow  2023-01-31  29   *
e047c5eaa763245 David Gow  2023-01-31  30   * This is a function prologue which is used to allow calls to the current
e047c5eaa763245 David Gow  2023-01-31  31   * function to be redirected by a KUnit test. KUnit tests can call
e047c5eaa763245 David Gow  2023-01-31  32   * kunit_activate_static_stub() to pass a replacement function in. The
582eb3aeed2d06b Kemeng Shi 2023-07-26  33   * replacement function will be called by KUNIT_STATIC_STUB_REDIRECT(), which
e047c5eaa763245 David Gow  2023-01-31  34   * will then return from the function. If the caller is not in a KUnit context,
e047c5eaa763245 David Gow  2023-01-31  35   * the function will continue execution as normal.
e047c5eaa763245 David Gow  2023-01-31  36   *
e047c5eaa763245 David Gow  2023-01-31  37   * Example:
e047c5eaa763245 David Gow  2023-01-31  38   *
e047c5eaa763245 David Gow  2023-01-31  39   * .. code-block:: c
e047c5eaa763245 David Gow  2023-01-31  40   *
e047c5eaa763245 David Gow  2023-01-31  41   *	int real_func(int n)
e047c5eaa763245 David Gow  2023-01-31  42   *	{
e047c5eaa763245 David Gow  2023-01-31  43   *		KUNIT_STATIC_STUB_REDIRECT(real_func, n);
e047c5eaa763245 David Gow  2023-01-31  44   *		return 0;
e047c5eaa763245 David Gow  2023-01-31  45   *	}
e047c5eaa763245 David Gow  2023-01-31  46   *
e047c5eaa763245 David Gow  2023-01-31  47   *	int replacement_func(int n)
e047c5eaa763245 David Gow  2023-01-31  48   *	{
e047c5eaa763245 David Gow  2023-01-31  49   *		return 42;
e047c5eaa763245 David Gow  2023-01-31  50   *	}
e047c5eaa763245 David Gow  2023-01-31  51   *
e047c5eaa763245 David Gow  2023-01-31  52   *	void example_test(struct kunit *test)
e047c5eaa763245 David Gow  2023-01-31  53   *	{
e047c5eaa763245 David Gow  2023-01-31  54   *		kunit_activate_static_stub(test, real_func, replacement_func);
e047c5eaa763245 David Gow  2023-01-31  55   *		KUNIT_EXPECT_EQ(test, real_func(1), 42);
e047c5eaa763245 David Gow  2023-01-31  56   *	}
e047c5eaa763245 David Gow  2023-01-31  57   *
e047c5eaa763245 David Gow  2023-01-31  58   */
e047c5eaa763245 David Gow  2023-01-31  59  #define KUNIT_STATIC_STUB_REDIRECT(real_fn_name, args...)		\
e047c5eaa763245 David Gow  2023-01-31  60  do {									\
e047c5eaa763245 David Gow  2023-01-31  61  	typeof(&real_fn_name) replacement;				\
e047c5eaa763245 David Gow  2023-01-31  62  	struct kunit *current_test = kunit_get_current_test();		\
e047c5eaa763245 David Gow  2023-01-31  63  									\
e047c5eaa763245 David Gow  2023-01-31  64  	if (likely(!current_test))					\
e047c5eaa763245 David Gow  2023-01-31  65  		break;							\
e047c5eaa763245 David Gow  2023-01-31  66  									\
e047c5eaa763245 David Gow  2023-01-31  67  	replacement = kunit_hooks.get_static_stub_address(current_test,	\
e047c5eaa763245 David Gow  2023-01-31 @68  							&real_fn_name);	\
e047c5eaa763245 David Gow  2023-01-31  69  									\
e047c5eaa763245 David Gow  2023-01-31  70  	if (unlikely(replacement))					\
e047c5eaa763245 David Gow  2023-01-31  71  		return replacement(args);				\
e047c5eaa763245 David Gow  2023-01-31  72  } while (0)
e047c5eaa763245 David Gow  2023-01-31  73  

:::::: The code at line 68 was first introduced by commit
:::::: e047c5eaa76324575e1f95664be4c74ce0e2571b kunit: Expose 'static stub' API to redirect functions

:::::: TO: David Gow <davidgow@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
