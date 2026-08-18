Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A4E3CAE84
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049060; cv=none; b=hgQrtUAScjcs1KlPnS6MZGSZsunA1jfOXar0esH08AnL0pu+Bvqjxa5QrecdxqRu+DlmbEPhuT99pfhmz1qXFBVpnz5KG7+RyNSJDY+pn/UeJLKIGrAjwtX8X8f4faQoosGO0lhfaMsofQobab4APcxYLxIpIAUC88svUNaD+Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049060; c=relaxed/simple;
	bh=z2tryB7bhNEO8Dj71T8ifgD1ZUeJkR7OIXR7xm4S/X8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ODIqkkcRs+yN63xgPC5RB5aDsk/yrtZRXcGx5TsUBenPToX4PY9vmuk/ih0oT8zNmlBEfPvqcxWzADSJ9YO9RKBFbiqrtKi5luC+/30PBYD227TyIbSkLkpwcg0K3Iq2dQlP4raJn8nJ7/PSDXsrmko3f6tapCCTWfykGsZZcEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1/Hz6zK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1/Hz6zK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787049058; x=1818585058;
  h=date:from:to:cc:subject:message-id;
  bh=z2tryB7bhNEO8Dj71T8ifgD1ZUeJkR7OIXR7xm4S/X8=;
  b=V1/Hz6zKyF2NOUIybtq9LXGpGwWEoikhLMcYxb68LD9T4dSfBMG2YD1j
   y0o36t+L0sT0loHneeOUcn4p08j1xDrGhkjzSOgDwEdZ7PeJi+n/Il+W4
   QemdJBwPmf4nTIbdq87OoBLAPtyoDk9PtAEBIa8PeN6xJ6ey1LTSrMKT7
   4aD54FCkPl0BTyIeMb6X8Gaj0CwkzTiZ+k+lexo9sOaOr/Bh+RqdhOs4n
   mohLkk/8kcdCk1+L17zETaN0Hi8SkEZIHnUFxym+FHS/R2Ck7r186Q7mr
   e77iLErTqy+JDgL9W7zxB6leu+s/BEXX+fH1LWZKGs7K2FtWy4nBTiPN4
   g==;
X-CSE-ConnectionGUID: p03ryJAVTDSjWr+NY67HdA==
X-CSE-MsgGUID: 6k7YKlb0TDuLM54gwniadg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="99057341"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="99057341"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 03:30:58 -0700
X-CSE-ConnectionGUID: 0Gmcx6jKRU+3G/dVBZBloQ==
X-CSE-MsgGUID: pOrp/Mp+TSyh2l3IMsK8Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="289995423"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Aug 2026 03:30:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwH5p-00000000eGa-3ArF;
	Tue, 18 Aug 2026 10:30:53 +0000
Date: Tue, 18 Aug 2026 18:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-sdev-printk 1/2] ld.lld: error: undefined
 symbol: kunit_binary_str_assert_format
Message-ID: <202608181844.ksqKvPpl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux scsi-sdev-printk
head:   a31bd03242fd8e9fc6f3b0b5f48ca64bbb6c8f4c
commit: 3046a51bbd1826503f7037dd728fa56f87b73c23 [1/2] scsi: core: Add KUnit tests for scsi_logging.c
config: x86_64-randconfig-101-20260818 (https://download.01.org/0day-ci/archive/20260818/202608181844.ksqKvPpl-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181844.ksqKvPpl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181844.ksqKvPpl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kunit_binary_str_assert_format
   >>> referenced by scsi_logging_test.c:107 (drivers/scsi/scsi_logging_test.c:107)
   >>>               drivers/scsi/scsi_logging.o:(test_sdev_prefix_printk) in archive vmlinux.a
   >>> referenced by scsi_logging_test.c:115 (drivers/scsi/scsi_logging_test.c:115)
   >>>               drivers/scsi/scsi_logging.o:(test_sdev_prefix_printk) in archive vmlinux.a
   >>> referenced by scsi_logging_test.c:109 (drivers/scsi/scsi_logging_test.c:109)
   >>>               drivers/scsi/scsi_logging.o:(test_sdev_prefix_printk) in archive vmlinux.a
   >>> referenced 30 more times
--
>> ld.lld: error: undefined symbol: kunit_binary_ptr_assert_format
   >>> referenced by scsi_logging_test.c:108 (drivers/scsi/scsi_logging_test.c:108)
   >>>               drivers/scsi/scsi_logging.o:(test_sdev_prefix_printk) in archive vmlinux.a
   >>> referenced by scsi_logging_test.c:116 (drivers/scsi/scsi_logging_test.c:116)
   >>>               drivers/scsi/scsi_logging.o:(test_sdev_prefix_printk) in archive vmlinux.a
   >>> referenced by scsi_logging_test.c:135 (drivers/scsi/scsi_logging_test.c:135)
   >>>               drivers/scsi/scsi_logging.o:(test_scmd_printk) in archive vmlinux.a
   >>> referenced 3 more times
--
>> ld.lld: error: undefined symbol: kunit_kmalloc_array
   >>> referenced by test.h:501 (include/kunit/test.h:501)
   >>>               drivers/scsi/scsi_logging.o:(test_scsi_print_sense_cmd) in archive vmlinux.a
   >>> referenced by test.h:501 (include/kunit/test.h:501)
   >>>               drivers/scsi/scsi_logging.o:(scsi_logging_create_fixture) in archive vmlinux.a
   >>> referenced by test.h:501 (include/kunit/test.h:501)
   >>>               drivers/scsi/scsi_logging.o:(scsi_logging_create_fixture) in archive vmlinux.a
   >>> referenced 3 more times

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
