Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FAF2D46A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050988; cv=none; b=AcPmzpV77GB+SExnQXAOH+3L3azJpDOCaLg9nhOHQcWfPRZSAFmEBKrqcXiJip3jr3+61fWQxVCZK4Xf/t3+zd04gf8s3IsTgeufe3K5DNvjtgMjk0wdgm3SokqRBgPih34PzL31VKfI+V5U1gVCU1txLc1DcxV4Zen1z0weOHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050988; c=relaxed/simple;
	bh=bjsc9vFW22QDcCrPi9aU0uKHy0wRoxebx6t7B8GD14A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HoKkdQ4uLYXU1F/k8kh14N1LAJmpWWQP4FA1uN1RD/ldnrRi2roNGx01LslDx+6rpfpVGQMouft+WXkEoaCe4ZX3DNi0ZlanjJbm/W2RvIFTxmMxpz8lwNkgpXCYu/bi1vgFg/9moKfTMoQ2ny/cWChLLM+CIdYIxJ9Weq8ER54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdQRZCWm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdQRZCWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787050986; x=1818586986;
  h=date:from:to:cc:subject:message-id;
  bh=bjsc9vFW22QDcCrPi9aU0uKHy0wRoxebx6t7B8GD14A=;
  b=fdQRZCWmMAxq/m5Yb9hug8w/rjLxYymd67eU7bjNmOeU6+UrDPYykSja
   Wf7pUkIJ4zheNsW3QGVQV85NZh00uB3eUC1S6U0HxHF2qnYx8JKRD+DO5
   m8dqQDCCvFghlHYxyujUwxfVrI4Ylj49kyBW204WC8CBeymKwnr3Fhb0t
   Yyzyp47RJPPIX7MTwJJqRatavMhWbgftQJrZz8lPyLHdJfmKdqg9IIlFX
   vMhh/gpJ7naI5GpRLStl8MzgoUPhn193ZY29G7icH7tlLJD5LeMH6xnZy
   t+tvBgQP6a+VftH/jk2YzEF2Vpu97dfY6aME7iPLn7VxBqC+uW9LZ1EIW
   A==;
X-CSE-ConnectionGUID: ggEXw6ZVQaq9LuUnKhsMVw==
X-CSE-MsgGUID: Z0guKelXRvCuKA0EtCnI3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="105072667"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="105072667"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:03:05 -0700
X-CSE-ConnectionGUID: qAym86bGSS+200M5wXcx1w==
X-CSE-MsgGUID: x67Zh4zARPS/b0HDNNmPXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263463489"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Aug 2026 04:03:04 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwHav-00000000eHu-2iWH;
	Tue, 18 Aug 2026 11:03:01 +0000
Date: Tue, 18 Aug 2026 19:02:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-sdev-printk 1/2]
 include/kunit/test.h:501:undefined reference to `kunit_kmalloc_array'
Message-ID: <202608181821.mkxIWTiq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux scsi-sdev-printk
head:   a31bd03242fd8e9fc6f3b0b5f48ca64bbb6c8f4c
commit: 3046a51bbd1826503f7037dd728fa56f87b73c23 [1/2] scsi: core: Add KUnit tests for scsi_logging.c
config: i386-randconfig-054-20260818 (https://download.01.org/0day-ci/archive/20260818/202608181821.mkxIWTiq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181821.mkxIWTiq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181821.mkxIWTiq-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/scsi/scsi_logging.o: in function `kunit_kmalloc':
>> include/kunit/test.h:501:(.text+0x562): undefined reference to `kunit_kmalloc_array'
>> ld: include/kunit/test.h:501:(.text+0x5b2): undefined reference to `kunit_kmalloc_array'
   ld: include/kunit/test.h:501:(.text+0x609): undefined reference to `kunit_kmalloc_array'
   ld: include/kunit/test.h:501:(.text+0x661): undefined reference to `kunit_kmalloc_array'
   ld: include/kunit/test.h:501:(.text+0x6b9): undefined reference to `kunit_kmalloc_array'
   ld: drivers/scsi/scsi_logging.o: in function `scsi_logging_create_fixture':
>> drivers/scsi/scsi_logging_test.c:75:(.text+0x733): undefined reference to `kunit_binary_ptr_assert_format'
>> ld: drivers/scsi/scsi_logging_test.c:75:(.text+0x76e): undefined reference to `__kunit_do_failed_assertion'
>> ld: drivers/scsi/scsi_logging_test.c:75:(.text+0x775): undefined reference to `__kunit_abort'
>> ld: drivers/scsi/scsi_logging_test.c:78:(.text+0x78c): undefined reference to `kunit_binary_ptr_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:78:(.text+0x7be): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:78:(.text+0x7c5): undefined reference to `__kunit_abort'
   ld: drivers/scsi/scsi_logging_test.c:81:(.text+0x7da): undefined reference to `kunit_binary_ptr_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:81:(.text+0x80e): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:81:(.text+0x815): undefined reference to `__kunit_abort'
   ld: drivers/scsi/scsi_logging_test.c:84:(.text+0x82f): undefined reference to `kunit_binary_ptr_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:84:(.text+0x85e): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:84:(.text+0x865): undefined reference to `__kunit_abort'
   ld: drivers/scsi/scsi_logging_test.c:87:(.text+0x873): undefined reference to `kunit_binary_ptr_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:87:(.text+0x8ae): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:87:(.text+0x8b5): undefined reference to `__kunit_abort'
   ld: drivers/scsi/scsi_logging.o: in function `kunit_kmalloc':
   include/kunit/test.h:501:(.text+0x11e6): undefined reference to `kunit_kmalloc_array'
   ld: drivers/scsi/scsi_logging.o: in function `test_scsi_print_sense_cmd':
>> drivers/scsi/scsi_logging_test.c:341:(.text+0x14ac): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:341:(.text+0x14d1): undefined reference to `__kunit_do_failed_assertion'
>> ld: drivers/scsi/scsi_logging_test.c:343:(.text+0x1500): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:343:(.text+0x1539): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:328:(.text+0x155f): undefined reference to `kunit_binary_ptr_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:328:(.text+0x158e): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:328:(.text+0x1595): undefined reference to `__kunit_abort'
>> ld: drivers/scsi/scsi_logging_test.c:340:(.text+0x15a7): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:340:(.text+0x15ea): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging.o: in function `test_scsi_print_sense_buffer':
   drivers/scsi/scsi_logging_test.c:307:(.text+0x21b4): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:307:(.text+0x21d9): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:317:(.text+0x2208): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:317:(.text+0x2241): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:309:(.text+0x2289): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:309:(.text+0x22a9): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:316:(.text+0x22c5): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:316:(.text+0x2302): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:306:(.text+0x232d): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:306:(.text+0x235a): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging.o: in function `test_sdev_prefix_printk':
   drivers/scsi/scsi_logging_test.c:107:(.text+0x2541): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:107:(.text+0x2566): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:109:(.text+0x2690): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:109:(.text+0x26ba): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:115:(.text+0x280c): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:115:(.text+0x284d): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:117:(.text+0x29c8): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:117:(.text+0x2a01): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:116:(.text+0x2a9a): undefined reference to `kunit_binary_ptr_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:116:(.text+0x2ac9): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:114:(.text+0x2ade): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:114:(.text+0x2b22): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:108:(.text+0x2b3f): undefined reference to `kunit_binary_ptr_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:108:(.text+0x2b69): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:102:(.text+0x2b7f): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:102:(.text+0x2bc2): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:106:(.text+0x2bd7): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:106:(.text+0x2c1a): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging.o: in function `test_scsi_print_sense_hdr':
   drivers/scsi/scsi_logging_test.c:259:(.text+0x328b): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:259:(.text+0x32c9): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:290:(.text+0x32f8): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:290:(.text+0x3331): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:287:(.text+0x337c): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:287:(.text+0x33a1): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:275:(.text+0x33da): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:275:(.text+0x3409): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:272:(.text+0x3456): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:272:(.text+0x3471): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:261:(.text+0x34b4): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:261:(.text+0x34d9): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:271:(.text+0x34f5): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:271:(.text+0x3532): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:286:(.text+0x3547): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:286:(.text+0x358a): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:258:(.text+0x35a8): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:258:(.text+0x35e2): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging.o: in function `test_scmd_printk':
   drivers/scsi/scsi_logging_test.c:134:(.text+0x37c4): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:134:(.text+0x37f3): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:144:(.text+0x3a6a): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:144:(.text+0x3aab): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:136:(.text+0x3d46): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:136:(.text+0x3d61): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:153:(.text+0x3d90): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:153:(.text+0x3dc9): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:145:(.text+0x3e14): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:145:(.text+0x3e39): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:127:(.text+0x3e84): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:127:(.text+0x3ec2): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:143:(.text+0x3ed6): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:143:(.text+0x3f1a): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:135:(.text+0x3f32): undefined reference to `kunit_binary_ptr_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:135:(.text+0x3f61): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:133:(.text+0x3f7c): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:133:(.text+0x3fba): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:152:(.text+0x3fd5): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:152:(.text+0x4012): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging.o: in function `test_scsi_print_result':
   drivers/scsi/scsi_logging_test.c:360:(.text+0x46c4): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:360:(.text+0x4709): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:395:(.text+0x4738): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:395:(.text+0x4771): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:386:(.text+0x47bc): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:386:(.text+0x47e1): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:377:(.text+0x4824): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:377:(.text+0x4849): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:368:(.text+0x488c): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:368:(.text+0x48b1): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:367:(.text+0x48c7): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:367:(.text+0x490a): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:376:(.text+0x491f): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:376:(.text+0x4962): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:385:(.text+0x4977): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:385:(.text+0x49ba): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:394:(.text+0x49d5): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:394:(.text+0x4a12): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:359:(.text+0x4a26): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:359:(.text+0x4a6a): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging.o: in function `test_scsi_print_command':
   drivers/scsi/scsi_logging_test.c:216:(.text+0x5079): undefined reference to `kunit_binary_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:216:(.text+0x50bd): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:207:(.text+0x5689): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:207:(.text+0x56a9): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:197:(.text+0x56f1): undefined reference to `kunit_binary_str_assert_format'
   ld: drivers/scsi/scsi_logging_test.c:197:(.text+0x5711): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/scsi/scsi_logging_test.c:187:(.text+0x5754): undefined reference to `kunit_binary_str_assert_format'


vim +501 include/kunit/test.h

7122debb4367ee Daniel Latypov  2021-05-03  487  
7122debb4367ee Daniel Latypov  2021-05-03  488  /**
7122debb4367ee Daniel Latypov  2021-05-03  489   * kunit_kmalloc() - Like kmalloc() except the allocation is *test managed*.
7122debb4367ee Daniel Latypov  2021-05-03  490   * @test: The test context object.
7122debb4367ee Daniel Latypov  2021-05-03  491   * @size: The size in bytes of the desired memory.
7122debb4367ee Daniel Latypov  2021-05-03  492   * @gfp: flags passed to underlying kmalloc().
7122debb4367ee Daniel Latypov  2021-05-03  493   *
7122debb4367ee Daniel Latypov  2021-05-03  494   * See kmalloc() and kunit_kmalloc_array() for more information.
57e3cded99e9c8 David Gow       2023-05-25  495   *
57e3cded99e9c8 David Gow       2023-05-25  496   * Note that some internal context data is also allocated with GFP_KERNEL,
57e3cded99e9c8 David Gow       2023-05-25  497   * regardless of the gfp passed in.
7122debb4367ee Daniel Latypov  2021-05-03  498   */
7122debb4367ee Daniel Latypov  2021-05-03  499  static inline void *kunit_kmalloc(struct kunit *test, size_t size, gfp_t gfp)
7122debb4367ee Daniel Latypov  2021-05-03  500  {
7122debb4367ee Daniel Latypov  2021-05-03 @501  	return kunit_kmalloc_array(test, 1, size, gfp);
7122debb4367ee Daniel Latypov  2021-05-03  502  }
0a756853586ce1 Brendan Higgins 2019-09-23  503  

:::::: The code at line 501 was first introduced by commit
:::::: 7122debb4367ee5c89237e5d36dcc0007d7ec43c kunit: introduce kunit_kmalloc_array/kunit_kcalloc() helpers

:::::: TO: Daniel Latypov <dlatypov@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
