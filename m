Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730E5270ED7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693341; cv=none; b=RjLjOBA9RFWj4W9VyZj/W5ExopvFv16rtqThDe6UbwJwCsKW7LnjF0T3PSorWtMa391OFyJ4oEfbx+Q34Owm506VXchebxscQ4xOThzxmup66q/epOXEpX67Qxbvv83v6mvz8YMypL9u3TDAFLyqU98iODnLmP63PEzOdUfAH7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693341; c=relaxed/simple;
	bh=1ey05v2YlAhqb0Wus/kMMJUUn6XpL/Cm2uqfxu/GUXY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LFTDUr3zvKYPRIzn/hQeu77vJybDVaU78pVnfES8DW5j4xlTzzv1TJr14Y3i5b1dOpjhnkU9AG5w/l8vl/cOt6Ns8SQjWuJ1shI8VRicx+uRWL10hOHLH03qcxC4dIuWoGc0NZZqW7n+7T0kLGtp1Vq4L0193BiMoTkR7QriklA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHaon2uD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHaon2uD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769693340; x=1801229340;
  h=date:from:to:cc:subject:message-id;
  bh=1ey05v2YlAhqb0Wus/kMMJUUn6XpL/Cm2uqfxu/GUXY=;
  b=LHaon2uD683b5YQcDHeS/8LncF9oCwvVlQQNGhBc9nuv7UEpzhDvfaHX
   lmKpTwvRMgE5vGhAzMryMlrvluKq4kzASITBebMngPkqukUxgdF3nVJoN
   RHPFlg8FtVCONAq1LDjcRDsRxsR8fmtFhaXWu+v3hTYS9aLvI23fY0n6/
   r5gREAfwCUCMOx7EHhGK1V1Y16dYCZarZ0tchHNrzTFmIWqguBZDoGOAi
   +EnNfEHNsN2Moj5gN+pJqaLAJDiWMAnj03mdM9Vr+hqhpk9FRH18uSV6w
   sAmoQICLSjzgncVS+a4nGs0rPKrcB2mag/DPY3A76F1BUZU1mnt0dWjqq
   g==;
X-CSE-ConnectionGUID: N27NI37zQQK2gEb9eoxrIQ==
X-CSE-MsgGUID: GbeZ+8psROGnwtSnIWW9zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="71096360"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="71096360"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 05:28:59 -0800
X-CSE-ConnectionGUID: mGjokIk7QLmaXrW3XmoM3A==
X-CSE-MsgGUID: 5qVnoRhnT62tscNAIzwdmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="207827941"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 29 Jan 2026 05:28:58 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlS4t-000000002IT-0V4U;
	Thu, 29 Jan 2026 13:28:55 +0000
Date: Thu, 29 Jan 2026 14:28:36 +0100
From: kernel test robot <lkp@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: lib/tests/string_kunit.c:116:20: error: implicit declaration
 of function 'PAGE_ALIGN'; did you mean 'PTR_ALIGN'?
Message-ID: <202601291407.HjM9WeKa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Feng-Jiang/lib-string_kunit-add-correctness-test-for-strlen/20260129-151036
head:   67af66348b53134f8da8ffb8452558c5570bdcf3
commit: ae8f3072971495fcdd5a420197b9906c5ac8c032 lib/string_kunit: add correctness test for strlen()
date:   6 hours ago
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260129/202601291407.HjM9WeKa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291407.HjM9WeKa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291407.HjM9WeKa-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/tests/string_kunit.c: In function 'string_test_strlen':
>> lib/tests/string_kunit.c:116:20: error: implicit declaration of function 'PAGE_ALIGN'; did you mean 'PTR_ALIGN'? [-Wimplicit-function-declaration]
     116 |         buf_size = PAGE_ALIGN(STRING_TEST_MAX_LEN + STRING_TEST_MAX_OFFSET + 1);
         |                    ^~~~~~~~~~
         |                    PTR_ALIGN


vim +116 lib/tests/string_kunit.c

   110	
   111	static void string_test_strlen(struct kunit *test)
   112	{
   113		size_t buf_size;
   114		char *buf, *s;
   115	
 > 116		buf_size = PAGE_ALIGN(STRING_TEST_MAX_LEN + STRING_TEST_MAX_OFFSET + 1);
   117		buf = vmalloc(buf_size);
   118		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
   119	
   120		memset(buf, 'A', buf_size);
   121	
   122		for (size_t offset = 0; offset < STRING_TEST_MAX_OFFSET; offset++) {
   123			for (size_t len = 0; len <= STRING_TEST_MAX_LEN; len++) {
   124				s = buf + buf_size - 1 - offset - len;
   125				s[len] = '\0';
   126				KUNIT_EXPECT_EQ_MSG(test, strlen(s), len,
   127					"offset:%zu len:%zu", offset, len);
   128				s[len] = 'A';
   129			}
   130		}
   131	
   132		vfree(buf);
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
