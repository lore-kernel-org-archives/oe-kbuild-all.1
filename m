Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606E71B0402
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 18:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750703582; cv=none; b=DX2YyQBacFLTW4CpByoz4fI0g5FgZtL2vAFEL6KSJklQYmhKt+xZtIUpe3yXli1/oYTYtmYiYkiFWkgNIqa8lUW4ovht0RsTwj69Jzhoj8mtjwVk1RPT2YYaFJKIBHqQf0MzQuQY1fdvIG4KribpgfCLqlwPbdq+ECdkUOwjyiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750703582; c=relaxed/simple;
	bh=goSoYqAPR9x32i29LXRjDbvie7iSfciQ3uaSeVRcYZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DUUfCvqSwpii4IH/pfjDizKz6nvYuHDxN/wJx00ZAjv/whdQyO8DDw5NxPO7dhUlEFKZYx0Gqm2VXfmU1+wkql3Pxc5xxqUs97J8fDQ/oYBT5f2R5QvxOuW/NFuuy/V8Zw19dYmR8KUTOaQPswCbqMoZQmB8F8CsDJqc7kr1iVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnW+tEe9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnW+tEe9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750703580; x=1782239580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=goSoYqAPR9x32i29LXRjDbvie7iSfciQ3uaSeVRcYZU=;
  b=XnW+tEe9K3DB1GJWvtZK72lSn29z9zqiG7J8pDKWdAPsnezXtXV+4eKh
   YomLJRJYvcCtIccPlTv21zFvnPBi0SiXTEfVnSlHwtZ53diHlbt6SGpaw
   wF5iDbvL6xV3O4R/TojRgkeGsXqLxJjRN4LIeNK+3wW+U5VmC1ExFWXpv
   5dX6QRvJbSiIDfMU8xx1GJp/lkn5wDvPly7U98Mth/CZU3ZG3yBlzu3JO
   OBPrXu32q/M5nbXZFFTv5J6myHWHUp6zA2uoht+tV0Ai9sYpk6rmGllMF
   xUZx7qwU1xaUU/0hSQvu+oxjm6c4YU3tZpQlfLmX75TuqRpdOAIXezLeU
   Q==;
X-CSE-ConnectionGUID: dyRX/NnvQN2rKW+tJqtWGA==
X-CSE-MsgGUID: qELoPMP7Tpaq9IIW4s8DdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56729105"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="56729105"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 11:32:59 -0700
X-CSE-ConnectionGUID: +RgnUZ8DT7SQr2C7ow953w==
X-CSE-MsgGUID: viIhjy1xRgiMIBi4PEimSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="182722555"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2025 11:32:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTlyS-000PCk-0P;
	Mon, 23 Jun 2025 18:32:56 +0000
Date: Tue, 24 Jun 2025 02:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to_build 46/57]
 arch/powerpc/kvm/test-guest-state-buffer.c:116:41: error: macro
 'KUNIT_ASSERT_NOT_ERR_OR_NULL' requires 2 arguments, but only 1 given
Message-ID: <202506240247.3ZRFfztH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   45965d80ee21635e7f04e6d7fd6caa929820b219
commit: aa1641c09eda005dbeabb56ebb283492c336309a [46/57] powerpc: kvm: allocate kvmppc_gs_parser off stack
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506240247.3ZRFfztH-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240247.3ZRFfztH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240247.3ZRFfztH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/powerpc/kvm/test-guest-state-buffer.c: In function 'test_gs_parsing':
>> arch/powerpc/kvm/test-guest-state-buffer.c:116:41: error: macro 'KUNIT_ASSERT_NOT_ERR_OR_NULL' requires 2 arguments, but only 1 given
     116 |         KUNIT_ASSERT_NOT_ERR_OR_NULL(gsp);
         |                                         ^
   In file included from arch/powerpc/kvm/test-guest-state-buffer.c:5:
   include/kunit/test.h:1646:9: note: macro 'KUNIT_ASSERT_NOT_ERR_OR_NULL' defined here
    1646 | #define KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr) \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/kvm/test-guest-state-buffer.c:116:9: error: 'KUNIT_ASSERT_NOT_ERR_OR_NULL' undeclared (first use in this function)
     116 |         KUNIT_ASSERT_NOT_ERR_OR_NULL(gsp);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kvm/test-guest-state-buffer.c:116:9: note: each undeclared identifier is reported only once for each function it appears in
   arch/powerpc/kvm/test-guest-state-buffer.c: In function 'test1_refresh_info':
>> arch/powerpc/kvm/test-guest-state-buffer.c:279:33: error: passing argument 1 of 'kvmppc_gsp_lookup' from incompatible pointer type [-Wincompatible-pointer-types]
     279 |         gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_CR);
         |                                 ^~~~
         |                                 |
         |                                 struct kvmppc_gs_parser **
   In file included from arch/powerpc/kvm/test-guest-state-buffer.c:7:
   arch/powerpc/include/asm/guest-state-buffer.h:846:67: note: expected 'struct kvmppc_gs_parser *' but argument is of type 'struct kvmppc_gs_parser **'
     846 | struct kvmppc_gs_elem *kvmppc_gsp_lookup(struct kvmppc_gs_parser *gsp,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>> arch/powerpc/kvm/test-guest-state-buffer.c:269:13: warning: unused variable 'rc' [-Wunused-variable]
     269 |         int rc;
         |             ^~
   arch/powerpc/kvm/test-guest-state-buffer.c: In function 'test_hostwide_refresh_info':
>> arch/powerpc/kvm/test-guest-state-buffer.c:384:31: error: passing argument 1 of 'kvmppc_gse_parse' from incompatible pointer type [-Wincompatible-pointer-types]
     384 |         rc = kvmppc_gse_parse(&gsp, gsb);
         |                               ^~~~
         |                               |
         |                               struct kvmppc_gs_parser *
   arch/powerpc/include/asm/guest-state-buffer.h:562:66: note: expected 'struct kvmppc_gs_buff *' but argument is of type 'struct kvmppc_gs_parser *'
     562 | struct kvmppc_gs_parser *kvmppc_gse_parse(struct kvmppc_gs_buff *gsb);
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~^~~
>> arch/powerpc/kvm/test-guest-state-buffer.c:384:14: error: too many arguments to function 'kvmppc_gse_parse'; expected 1, have 2
     384 |         rc = kvmppc_gse_parse(&gsp, gsb);
         |              ^~~~~~~~~~~~~~~~       ~~~
   arch/powerpc/include/asm/guest-state-buffer.h:562:26: note: declared here
     562 | struct kvmppc_gs_parser *kvmppc_gse_parse(struct kvmppc_gs_buff *gsb);
         |                          ^~~~~~~~~~~~~~~~
>> arch/powerpc/kvm/test-guest-state-buffer.c:384:12: error: assignment to 'int' from 'struct kvmppc_gs_parser *' makes integer from pointer without a cast [-Wint-conversion]
     384 |         rc = kvmppc_gse_parse(&gsp, gsb);
         |            ^
   arch/powerpc/kvm/test-guest-state-buffer.c: In function 'test_gs_hostwide_counters':
   arch/powerpc/kvm/test-guest-state-buffer.c:494:31: error: passing argument 1 of 'kvmppc_gse_parse' from incompatible pointer type [-Wincompatible-pointer-types]
     494 |         rc = kvmppc_gse_parse(&gsp, gsb);
         |                               ^~~~
         |                               |
         |                               struct kvmppc_gs_parser *
   arch/powerpc/include/asm/guest-state-buffer.h:562:66: note: expected 'struct kvmppc_gs_buff *' but argument is of type 'struct kvmppc_gs_parser *'
     562 | struct kvmppc_gs_parser *kvmppc_gse_parse(struct kvmppc_gs_buff *gsb);
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/powerpc/kvm/test-guest-state-buffer.c:494:14: error: too many arguments to function 'kvmppc_gse_parse'; expected 1, have 2
     494 |         rc = kvmppc_gse_parse(&gsp, gsb);
         |              ^~~~~~~~~~~~~~~~       ~~~
   arch/powerpc/include/asm/guest-state-buffer.h:562:26: note: declared here
     562 | struct kvmppc_gs_parser *kvmppc_gse_parse(struct kvmppc_gs_buff *gsb);
         |                          ^~~~~~~~~~~~~~~~
   arch/powerpc/kvm/test-guest-state-buffer.c:494:12: error: assignment to 'int' from 'struct kvmppc_gs_parser *' makes integer from pointer without a cast [-Wint-conversion]
     494 |         rc = kvmppc_gse_parse(&gsp, gsb);
         |            ^


vim +/KUNIT_ASSERT_NOT_ERR_OR_NULL +116 arch/powerpc/kvm/test-guest-state-buffer.c

   100	
   101	static void test_gs_parsing(struct kunit *test)
   102	{
   103		struct kvmppc_gs_elem *gse;
   104		struct kvmppc_gs_parser *gsp;
   105		struct kvmppc_gs_buff *gsb;
   106		size_t size = 0x1000;
   107		u64 tmp1, tmp2;
   108	
   109		gsb = kvmppc_gsb_new(size, 0, 0, GFP_KERNEL);
   110		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gsb);
   111	
   112		tmp1 = 0xdeadbeefull;
   113		kvmppc_gse_put_u64(gsb, KVMPPC_GSID_GPR(0), tmp1);
   114	
   115		gsp = kvmppc_gse_parse(gsb);
 > 116		KUNIT_ASSERT_NOT_ERR_OR_NULL(gsp);
   117	
   118		gse = kvmppc_gsp_lookup(gsp, KVMPPC_GSID_GPR(0));
   119		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gse);
   120	
   121		tmp2 = kvmppc_gse_get_u64(gse);
   122		KUNIT_EXPECT_EQ(test, tmp2, 0xdeadbeefull);
   123	
   124		kfree(gsp);
   125		kvmppc_gsb_free(gsb);
   126	}
   127	
   128	static void test_gs_bitmap(struct kunit *test)
   129	{
   130		struct kvmppc_gs_bitmap gsbm = { 0 };
   131		struct kvmppc_gs_bitmap gsbm1 = { 0 };
   132		struct kvmppc_gs_bitmap gsbm2 = { 0 };
   133		u16 iden;
   134		int i, j;
   135	
   136		i = 0;
   137		for (u16 iden = KVMPPC_GSID_HOST_STATE_SIZE;
   138		     iden <= KVMPPC_GSID_PROCESS_TABLE; iden++) {
   139			kvmppc_gsbm_set(&gsbm, iden);
   140			kvmppc_gsbm_set(&gsbm1, iden);
   141			KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
   142			kvmppc_gsbm_clear(&gsbm, iden);
   143			KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
   144			i++;
   145		}
   146	
   147		for (u16 iden = KVMPPC_GSID_L0_GUEST_HEAP;
   148		     iden <= KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM; iden++) {
   149			kvmppc_gsbm_set(&gsbm, iden);
   150			kvmppc_gsbm_set(&gsbm1, iden);
   151			KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
   152			kvmppc_gsbm_clear(&gsbm, iden);
   153			KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
   154			i++;
   155		}
   156	
   157		for (u16 iden = KVMPPC_GSID_RUN_INPUT; iden <= KVMPPC_GSID_VPA;
   158		     iden++) {
   159			kvmppc_gsbm_set(&gsbm, iden);
   160			kvmppc_gsbm_set(&gsbm1, iden);
   161			KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
   162			kvmppc_gsbm_clear(&gsbm, iden);
   163			KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
   164			i++;
   165		}
   166	
   167		for (u16 iden = KVMPPC_GSID_GPR(0); iden <= KVMPPC_GSE_DW_REGS_END; iden++) {
   168			kvmppc_gsbm_set(&gsbm, iden);
   169			kvmppc_gsbm_set(&gsbm1, iden);
   170			KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
   171			kvmppc_gsbm_clear(&gsbm, iden);
   172			KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
   173			i++;
   174		}
   175	
   176		for (u16 iden = KVMPPC_GSID_CR; iden <= KVMPPC_GSID_PSPB; iden++) {
   177			kvmppc_gsbm_set(&gsbm, iden);
   178			kvmppc_gsbm_set(&gsbm1, iden);
   179			KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
   180			kvmppc_gsbm_clear(&gsbm, iden);
   181			KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
   182			i++;
   183		}
   184	
   185		for (u16 iden = KVMPPC_GSID_VSRS(0); iden <= KVMPPC_GSID_VSRS(63);
   186		     iden++) {
   187			kvmppc_gsbm_set(&gsbm, iden);
   188			kvmppc_gsbm_set(&gsbm1, iden);
   189			KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
   190			kvmppc_gsbm_clear(&gsbm, iden);
   191			KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
   192			i++;
   193		}
   194	
   195		for (u16 iden = KVMPPC_GSID_HDAR; iden <= KVMPPC_GSID_ASDR; iden++) {
   196			kvmppc_gsbm_set(&gsbm, iden);
   197			kvmppc_gsbm_set(&gsbm1, iden);
   198			KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
   199			kvmppc_gsbm_clear(&gsbm, iden);
   200			KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
   201			i++;
   202		}
   203	
   204		j = 0;
   205		kvmppc_gsbm_for_each(&gsbm1, iden)
   206		{
   207			kvmppc_gsbm_set(&gsbm2, iden);
   208			j++;
   209		}
   210		KUNIT_EXPECT_EQ(test, i, j);
   211		KUNIT_EXPECT_MEMEQ(test, &gsbm1, &gsbm2, sizeof(gsbm1));
   212	}
   213	
   214	struct kvmppc_gs_msg_test1_data {
   215		u64 a;
   216		u32 b;
   217		struct kvmppc_gs_part_table c;
   218		struct kvmppc_gs_proc_table d;
   219		struct kvmppc_gs_buff_info e;
   220	};
   221	
   222	static size_t test1_get_size(struct kvmppc_gs_msg *gsm)
   223	{
   224		size_t size = 0;
   225		u16 ids[] = {
   226			KVMPPC_GSID_PARTITION_TABLE,
   227			KVMPPC_GSID_PROCESS_TABLE,
   228			KVMPPC_GSID_RUN_INPUT,
   229			KVMPPC_GSID_GPR(0),
   230			KVMPPC_GSID_CR,
   231		};
   232	
   233		for (int i = 0; i < ARRAY_SIZE(ids); i++)
   234			size += kvmppc_gse_total_size(kvmppc_gsid_size(ids[i]));
   235		return size;
   236	}
   237	
   238	static int test1_fill_info(struct kvmppc_gs_buff *gsb,
   239				   struct kvmppc_gs_msg *gsm)
   240	{
   241		struct kvmppc_gs_msg_test1_data *data = gsm->data;
   242	
   243		if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_GPR(0)))
   244			kvmppc_gse_put_u64(gsb, KVMPPC_GSID_GPR(0), data->a);
   245	
   246		if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_CR))
   247			kvmppc_gse_put_u32(gsb, KVMPPC_GSID_CR, data->b);
   248	
   249		if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_PARTITION_TABLE))
   250			kvmppc_gse_put_part_table(gsb, KVMPPC_GSID_PARTITION_TABLE,
   251						  data->c);
   252	
   253		if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_PROCESS_TABLE))
   254			kvmppc_gse_put_proc_table(gsb, KVMPPC_GSID_PARTITION_TABLE,
   255						  data->d);
   256	
   257		if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_RUN_INPUT))
   258			kvmppc_gse_put_buff_info(gsb, KVMPPC_GSID_RUN_INPUT, data->e);
   259	
   260		return 0;
   261	}
   262	
   263	static int test1_refresh_info(struct kvmppc_gs_msg *gsm,
   264				      struct kvmppc_gs_buff *gsb)
   265	{
   266		struct kvmppc_gs_parser *gsp;
   267		struct kvmppc_gs_msg_test1_data *data = gsm->data;
   268		struct kvmppc_gs_elem *gse;
 > 269		int rc;
   270	
   271		gsp = kvmppc_gse_parse(gsb);
   272		if (IS_ERR(gsp))
   273			return PTR_ERR(gsp);
   274	
   275		gse = kvmppc_gsp_lookup(gsp, KVMPPC_GSID_GPR(0));
   276		if (gse)
   277			data->a = kvmppc_gse_get_u64(gse);
   278	
 > 279		gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_CR);
   280		if (gse)
   281			data->b = kvmppc_gse_get_u32(gse);
   282	
   283		kfree(gsp);
   284		return 0;
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
