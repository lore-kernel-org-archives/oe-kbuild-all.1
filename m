Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D518235A939
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206025; cv=none; b=A6DLF2ya+xh8bDpMqMSREaYN9VFTsiBj9YzcjrX0Il4yTtMXxskvXJtrC4RCTPbkF9mwevOjbN+kEvKDl1bFVEiXdCwUv60mni9016m1vAwbNKujj6kWVnWqzgJdrowidJLnLQ1NQ9BWeBDq29Gu+mVkaOj+p8XgoHF845a1NJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206025; c=relaxed/simple;
	bh=4V267bHb56I2Aiwrkmx+UvFmAbEFIq1m8/RG29G+bjk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MZW/JnufmXFBedT0np+9ZROMw6uVzLA5bIfvY/slJ9WGbKGVSQWCOHfoASoNJIcqXPV3wx+R+Vx1tlE9znuJVYLXT18/BT7V4qimhHgiA7jH1QEYn5ji4Zfld35HCeOMshZkurRlsJbWLIK/LWB8ASA59Zlf2DXrDkxC/NYMaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWCCQRUx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWCCQRUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206024; x=1806742024;
  h=date:from:to:cc:subject:message-id;
  bh=4V267bHb56I2Aiwrkmx+UvFmAbEFIq1m8/RG29G+bjk=;
  b=YWCCQRUxHsCNsFzTFf5vak33Knl4PudqI0rl9XuK8yAugi90Gi1YqDLj
   oXXwR7Xqoxt0oPcpjGsKoiUvlWgp7ZLE0aO/2kkYMsyRxU4DiAVECVRbY
   HWpU9o9wT279AM1aPnTgG6e6DgbR62ucpOHmElFoMbe7iQql7ag6XkfSS
   VhfqgCVsGSGayp5o1YutUCC8/cKN86Bap8UkOfwPb5aQZo1OJ0tTboSYG
   LCSSa5d2iAmfQTXk7MdtTDrlguAmeftAopb+U58d/C4bxcDHuJdKxGIDh
   gVwqFZf01t67KFoE4Izk507e09FiB+cF7lX0KKfcpZFmA91CI4C0EQly+
   g==;
X-CSE-ConnectionGUID: OI6LgyWXRQqYbRIps62odA==
X-CSE-MsgGUID: lG5eupazTBeUm6RgIHLTOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889135"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889135"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:47:01 -0700
X-CSE-ConnectionGUID: M/ErpCFCS4SuHWTMl3nyDw==
X-CSE-MsgGUID: r56BHiM9QCKCbFpSfboNXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="231605138"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2026 01:47:00 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aB6-0000000016l-3N1J;
	Fri, 03 Apr 2026 08:46:56 +0000
Date: Fri, 03 Apr 2026 16:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Jian Zhang via Openipmi-developer" <openipmi-developer@lists.sourceforge.net>
Cc: oe-kbuild-all@lists.linux.dev, Corey Minyard <corey@minyard.net>
Subject: [cminyard-ipmi:for-next 6/6]
 drivers/char/ipmi/ssif_bmc.c:1064:43: error: 'struct ssif_bmc_ctx' has no
 member named 'response_in_send'; did you mean 'response_timer'?
Message-ID: <202604031228.UoNOKsz1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cminyard/linux-ipmi for-next
head:   90478a78b71fffa35ecaca82d229036fcd9a4a58
commit: 90478a78b71fffa35ecaca82d229036fcd9a4a58 [6/6] ipmi: ssif_bmc: add unit test for state machine
config: x86_64-randconfig-071-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031228.UoNOKsz1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031228.UoNOKsz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031228.UoNOKsz1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/ipmi/ssif_bmc.c: In function 'ssif_bmc_remove':
   drivers/char/ipmi/ssif_bmc.c:865:9: error: implicit declaration of function 'del_timer_sync' [-Wimplicit-function-declaration]
     865 |         del_timer_sync(&ssif_bmc->response_timer);
         |         ^~~~~~~~~~~~~~
   In file included from include/linux/cleanup.h:5,
                    from include/linux/acpi.h:11,
                    from include/linux/i2c.h:13,
                    from drivers/char/ipmi/ssif_bmc.c:9:
   drivers/char/ipmi/ssif_bmc.c: In function 'ssif_bmc_test_singlepart_read_response_completion':
>> drivers/char/ipmi/ssif_bmc.c:1064:43: error: 'struct ssif_bmc_ctx' has no member named 'response_in_send'; did you mean 'response_timer'?
    1064 |         KUNIT_EXPECT_TRUE(test, ssif_bmc->response_in_send);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   include/kunit/test.h:786:13: note: in expansion of macro 'likely'
     786 |         if (likely(!!(condition_) == !!expected_true_))                        \
         |             ^~~~~~
   include/kunit/test.h:800:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     800 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:996:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
     996 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:993:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE_MSG'
     993 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ssif_bmc.c:1064:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE'
    1064 |         KUNIT_EXPECT_TRUE(test, ssif_bmc->response_in_send);
         |         ^~~~~~~~~~~~~~~~~
>> drivers/char/ipmi/ssif_bmc.c:1064:43: error: 'struct ssif_bmc_ctx' has no member named 'response_in_send'; did you mean 'response_timer'?
    1064 |         KUNIT_EXPECT_TRUE(test, ssif_bmc->response_in_send);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   include/kunit/test.h:786:13: note: in expansion of macro 'likely'
     786 |         if (likely(!!(condition_) == !!expected_true_))                        \
         |             ^~~~~~
   include/kunit/test.h:800:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     800 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:996:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
     996 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:993:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE_MSG'
     993 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ssif_bmc.c:1064:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE'
    1064 |         KUNIT_EXPECT_TRUE(test, ssif_bmc->response_in_send);
         |         ^~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ssif_bmc.c:1088:44: error: 'struct ssif_bmc_ctx' has no member named 'response_in_send'; did you mean 'response_timer'?
    1088 |         KUNIT_EXPECT_FALSE(test, ssif_bmc->response_in_send);
         |                                            ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   include/kunit/test.h:786:13: note: in expansion of macro 'likely'
     786 |         if (likely(!!(condition_) == !!expected_true_))                        \
         |             ^~~~~~
   include/kunit/test.h:808:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     808 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1015:9: note: in expansion of macro 'KUNIT_FALSE_MSG_ASSERTION'
    1015 |         KUNIT_FALSE_MSG_ASSERTION(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1012:9: note: in expansion of macro 'KUNIT_EXPECT_FALSE_MSG'
    1012 |         KUNIT_EXPECT_FALSE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ssif_bmc.c:1088:9: note: in expansion of macro 'KUNIT_EXPECT_FALSE'
    1088 |         KUNIT_EXPECT_FALSE(test, ssif_bmc->response_in_send);
         |         ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ssif_bmc.c:1088:44: error: 'struct ssif_bmc_ctx' has no member named 'response_in_send'; did you mean 'response_timer'?
    1088 |         KUNIT_EXPECT_FALSE(test, ssif_bmc->response_in_send);
         |                                            ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   include/kunit/test.h:786:13: note: in expansion of macro 'likely'
     786 |         if (likely(!!(condition_) == !!expected_true_))                        \
         |             ^~~~~~
   include/kunit/test.h:808:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     808 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1015:9: note: in expansion of macro 'KUNIT_FALSE_MSG_ASSERTION'
    1015 |         KUNIT_FALSE_MSG_ASSERTION(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1012:9: note: in expansion of macro 'KUNIT_EXPECT_FALSE_MSG'
    1012 |         KUNIT_EXPECT_FALSE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ssif_bmc.c:1088:9: note: in expansion of macro 'KUNIT_EXPECT_FALSE'
    1088 |         KUNIT_EXPECT_FALSE(test, ssif_bmc->response_in_send);
         |         ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ssif_bmc.c: In function 'ssif_bmc_test_write_interrupts_response_send':
   drivers/char/ipmi/ssif_bmc.c:1191:43: error: 'struct ssif_bmc_ctx' has no member named 'response_in_send'; did you mean 'response_timer'?
    1191 |         KUNIT_EXPECT_TRUE(test, ssif_bmc->response_in_send);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   include/kunit/test.h:786:13: note: in expansion of macro 'likely'
     786 |         if (likely(!!(condition_) == !!expected_true_))                        \
         |             ^~~~~~
   include/kunit/test.h:800:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     800 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:996:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
     996 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:993:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE_MSG'
     993 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ssif_bmc.c:1191:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE'
    1191 |         KUNIT_EXPECT_TRUE(test, ssif_bmc->response_in_send);
         |         ^~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ssif_bmc.c:1191:43: error: 'struct ssif_bmc_ctx' has no member named 'response_in_send'; did you mean 'response_timer'?
    1191 |         KUNIT_EXPECT_TRUE(test, ssif_bmc->response_in_send);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   include/kunit/test.h:786:13: note: in expansion of macro 'likely'
     786 |         if (likely(!!(condition_) == !!expected_true_))                        \
         |             ^~~~~~
   include/kunit/test.h:800:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     800 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:996:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
     996 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:993:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE_MSG'


vim +1064 drivers/char/ipmi/ssif_bmc.c

  1042	
  1043	static void ssif_bmc_test_singlepart_read_response_completion(struct kunit *test)
  1044	{
  1045		struct ssif_bmc_test_ctx *test_ctx = test->priv;
  1046		struct ssif_bmc_ctx *ssif_bmc = &test_ctx->ssif_bmc;
  1047		u8 value;
  1048	
  1049		ssif_bmc->state = SSIF_SMBUS_CMD;
  1050		ssif_bmc->part_buf.smbus_cmd = SSIF_IPMI_SINGLEPART_READ;
  1051		ssif_bmc->response.len = 2;
  1052		ssif_bmc->response.payload[0] = 0x11;
  1053		ssif_bmc->response.payload[1] = 0x22;
  1054		ssif_bmc->response_in_progress = true;
  1055		ssif_bmc->is_singlepart_read = true;
  1056		ssif_bmc->pec_support = true;
  1057	
  1058		value = 0;
  1059		KUNIT_ASSERT_EQ(test,
  1060				ssif_bmc_test_run_event_val(test_ctx, I2C_SLAVE_READ_REQUESTED,
  1061							    &value), 0);
  1062		KUNIT_EXPECT_EQ(test, value, 2);
  1063		KUNIT_EXPECT_EQ(test, ssif_bmc->state, SSIF_RES_SENDING);
> 1064		KUNIT_EXPECT_TRUE(test, ssif_bmc->response_in_send);
  1065	
  1066		value = 0;
  1067		KUNIT_EXPECT_EQ(test,
  1068				ssif_bmc_test_run_event_val(test_ctx, I2C_SLAVE_READ_PROCESSED,
  1069							    &value), 0);
  1070		KUNIT_EXPECT_EQ(test, value, 0x11);
  1071	
  1072		value = 0;
  1073		KUNIT_EXPECT_EQ(test,
  1074				ssif_bmc_test_run_event_val(test_ctx, I2C_SLAVE_READ_PROCESSED,
  1075							    &value), 0);
  1076		KUNIT_EXPECT_EQ(test, value, 0x22);
  1077	
  1078		value = 0;
  1079		KUNIT_EXPECT_EQ(test,
  1080				ssif_bmc_test_run_event_val(test_ctx, I2C_SLAVE_READ_PROCESSED,
  1081							    &value), 0);
  1082		KUNIT_EXPECT_EQ(test, value, ssif_bmc->part_buf.pec);
  1083	
  1084		KUNIT_EXPECT_EQ(test,
  1085				ssif_bmc_test_run_event(test_ctx, I2C_SLAVE_STOP, 0), 0);
  1086		KUNIT_EXPECT_EQ(test, ssif_bmc->state, SSIF_READY);
  1087		KUNIT_EXPECT_FALSE(test, ssif_bmc->response_in_progress);
  1088		KUNIT_EXPECT_FALSE(test, ssif_bmc->response_in_send);
  1089		KUNIT_EXPECT_EQ(test, ssif_bmc->response.len, 0);
  1090	}
  1091	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
