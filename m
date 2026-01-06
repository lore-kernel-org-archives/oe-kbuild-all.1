Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B38330B25
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767711069; cv=none; b=Ty1InkdwE3YkTq3xIP1j+o0/rG2k6n7WyHsuCHAYyudmDJzZrHm9KeT0azuGqGc6vw/To+toPAUFFpcMgss9jnFXHNBJT3J13yW0hrC4vTfgFVZQtIHcgPSaLQHSi5egEsmjK219x4hF13Y0LgOOmHs/g77fot+i+GbRNr/Q/JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767711069; c=relaxed/simple;
	bh=oq7dbnp89hv+j1T/6F1P8o/m1UApAwIqzc0JqLt7ksU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pNo079I3NJnxkl0qVDNQCuGPiD8pIMBU1Fllt9T6qHtGMuQxuUG+E7UkgOljEK8ab4epmDT4IKaP0X6u+zcYSb8YC/18jnqOXBe/m1+UOK5V/EsRE7hlNHly334I7SbtA0VkZLjZlAsJYAbURCpfKBsw6gzbzJmnUE45MowNbpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDgHNK+m; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDgHNK+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767711068; x=1799247068;
  h=date:from:to:cc:subject:message-id;
  bh=oq7dbnp89hv+j1T/6F1P8o/m1UApAwIqzc0JqLt7ksU=;
  b=SDgHNK+mb3G/bnYEGHrJWKuDkhrf9krcyz4IrHz3ktNOotlm6ZauhLvQ
   3j3jIdyBknDx8Y3fQb7Q6QLSth22q15BZDJsymQG3PI3ZpWNiU8Yh17fs
   eiquNw9Q+sKGyOljM5VBhkomJopen+M/PTvaWwZ9o+NwwAPjr7xKCu08L
   yzR4OQVcUGLd1yVYx8L1/gvq6ZNcX0iKD/Q2FAuv6+2u6/jyf89S67jGn
   d5cxtTQlgw37rtz35jZChAASAPU/Vbmxo5h6aEixoZ6S9/CNDPDPzF0B+
   Mk5WucOPncXJJMUDF9lxKwy34LsxBv3IAt+Cy7S3d87CdxkQ5QtGUq9UQ
   g==;
X-CSE-ConnectionGUID: 8f31q8ptSOCa97SUg01+9w==
X-CSE-MsgGUID: MTJNDACzSneKhU4TeFuHow==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79709808"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="79709808"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 06:51:07 -0800
X-CSE-ConnectionGUID: SWVi3ZqET3SxUqgpezWbSA==
X-CSE-MsgGUID: ubo+LLtiTjivMv1ytysqVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="233804598"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jan 2026 06:51:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd8Ol-0000000022T-2zf2;
	Tue, 06 Jan 2026 14:51:03 +0000
Date: Tue, 06 Jan 2026 22:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_mon_kunit 28/29]
 include/rv/ltl_monitor.h:202: undefined reference to
 `kunit_add_action_or_reset'
Message-ID: <202601062203.P8EHpVGu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   aa87c6b5e8020a853fbc2444ded06a93a7fc1493
commit: a3b580a4d59f349042745e54cb77765dffbdabf3 [28/29] rv: Add KUnit tests for some LTL monitors
config: arm-randconfig-003-20260106 (https://download.01.org/0day-ci/archive/20260106/202601062203.P8EHpVGu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601062203.P8EHpVGu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601062203.P8EHpVGu-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/trace/rv/monitors/sleep/sleep.o: in function `rv_test_sleep':
>> include/rv/ltl_monitor.h:202: undefined reference to `kunit_add_action_or_reset'
>> arm-linux-gnueabi-ld: include/rv/ltl_monitor.h:202: undefined reference to `__kunit_do_failed_assertion'
>> arm-linux-gnueabi-ld: include/rv/ltl_monitor.h:202: undefined reference to `__kunit_abort'
   arm-linux-gnueabi-ld: kernel/trace/rv/monitors/sleep/sleep.o: in function `rv_test_sleep':
   include/kunit/test.h:501: undefined reference to `kunit_kmalloc_array'
>> arm-linux-gnueabi-ld: include/kunit/test.h:501: undefined reference to `kunit_kmalloc_array'
   arm-linux-gnueabi-ld: kernel/trace/rv/monitors/sleep/sleep.o: in function `rv_test_sleep':
>> kernel/trace/rv/monitors/sleep/sleep.c:269: undefined reference to `__kunit_do_failed_assertion'
>> arm-linux-gnueabi-ld: kernel/trace/rv/monitors/sleep/sleep.c:280: undefined reference to `__kunit_do_failed_assertion'
>> arm-linux-gnueabi-ld: kernel/trace/rv/monitors/sleep/sleep.c:281: undefined reference to `kunit_unary_assert_format'
>> arm-linux-gnueabi-ld: kernel/trace/rv/monitors/sleep/sleep.c:281: undefined reference to `kunit_binary_assert_format'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.o: in function `rv_test_sco':
   kernel/trace/rv/rv_monitors_test.h:34: undefined reference to `kunit_try_catch_throw'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.o: in function `rv_trigger_test_init':
   include/kunit/test.h:501: undefined reference to `kunit_kmalloc_array'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.o: in function `rv_trigger_test_init':
   kernel/trace/rv/rv_monitors_test.c:62: undefined reference to `__kunit_do_failed_assertion'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.c:62: undefined reference to `__kunit_abort'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.c:66: undefined reference to `__kunit_activate_static_stub'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.c:67: undefined reference to `__kunit_activate_static_stub'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.c:69: undefined reference to `__kunit_activate_static_stub'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.c:71: undefined reference to `__kunit_activate_static_stub'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.c:72: undefined reference to `__kunit_activate_static_stub'
   arm-linux-gnueabi-ld: kernel/trace/rv/rv_monitors_test.c:75: undefined reference to `kunit_ptr_not_err_assert_format'


vim +202 include/rv/ltl_monitor.h

   189	
   190	/*
   191	 * rv_prepare_test - Enable the monitor for a kunit test
   192	 *
   193	 * Do the bare minimum to set up the monitor, make sure it is not active and
   194	 * real tracepoint handlers are NOT attached.
   195	 */
   196	static inline void ltl_prepare_test(struct kunit *test, struct rv_monitor *rv_this)
   197	{
   198		KUNIT_ASSERT_FALSE(test, rv_this->enabled);
   199		ltl_monitor_init();
   200		rv_this->enabled = 1;
   201	
 > 202		KUNIT_ASSERT_EQ(test, 0,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
