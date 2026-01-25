Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD982F5A10
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 20:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769371758; cv=none; b=KIS6swxhvlm6M7+dXWbLnPslN76WVCjMS7TvoD3q/Kx4o3/TIscpL+4G2/X5OAXT7c/EQnVZ4mlRL9C8M+xZ3mudW8oE86L3uheyjq3xHyvsnJnYVSHmoAGQqGOaaj+9kicz0t//IMcaTqX7a3SGwh9CbJNHrOIMHSzkWp1nnM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769371758; c=relaxed/simple;
	bh=L6pxONPK13f4rVhaie0USWoVNuP/z5o4767HUNj9reg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YtqGAn6VCpcVmhifDfAHTCyAZHuG6iWhwvmHeCcGV7RSBkO5gmu9vgc81vIGh23iYT7TYzewE5Mrk/j50Sjxqi+UMRChntoYWqVCnKQLeJowV8ok8SqZB9P7zggUmdUh12PUkJWl5YQkubSQOm/EoDgiwWOyPAp/KVYPRSzKze8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lr2IkdFe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lr2IkdFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769371755; x=1800907755;
  h=date:from:to:cc:subject:message-id;
  bh=L6pxONPK13f4rVhaie0USWoVNuP/z5o4767HUNj9reg=;
  b=Lr2IkdFewOWEa7ktWlw4nmeeS0BxzEsExPsUavpXIBNAA++hLLek4FJG
   O9DX5DCK7IDQgRFHrEftzVARLRC7dslybnfIiL9ujH0mFG3B1kNXC0XnR
   sLoS5Ln1kPa1oZTyuso9C4jh7GZxQjzeinsJXaLe9Hfp1VY5DjOX+JelX
   4lP/bhHSX1yrp4P22qqQasCzPn76KPPCmutF7iafc4K9cC5mHm81uj44r
   uP9Qkpsne740jgxYenUFGOJM32KdDh7nRyU2sbwDOiWgAJWVlkCmeUxsB
   5NCzAW5VWJFyQk7fsrcTj5PbXjEr6Yfdb9HmTnZC4WC07i+1//wdpzjIJ
   g==;
X-CSE-ConnectionGUID: ZWYM8J1XQk6hZ5/Cu5VwbQ==
X-CSE-MsgGUID: ixyidhvYRlCoBpe1T6iEZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="87974013"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="87974013"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 12:09:15 -0800
X-CSE-ConnectionGUID: 1X3zXUG3TdOJoqeQDiHtOA==
X-CSE-MsgGUID: pJ1lV/CPQ5mEQWTXkGxjUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="206753621"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 25 Jan 2026 12:09:13 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk6Q2-000000001Lx-2rMX;
	Sun, 25 Jan 2026 20:09:10 +0000
Date: Sun, 25 Jan 2026 21:08:37 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] iommufd_utils.h:649:18:
 error: 'struct iommu_hw_info' has no member named 'in_data_type'; did you
 mean 'out_data_type'?
Message-ID: <202601252110.Hs9VS9kc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   9ca0fde2622c59c97612be0765d6d3c101122f69
commit: 724f6df514f78613995fb5c02463e42429942495 [2/2] iommufd/selftest: Update hw_info coverage for an input data_type
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260125/202601252110.Hs9VS9kc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601252110.Hs9VS9kc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601252110.Hs9VS9kc-lkp@intel.com/

Note: the android-common/android16-6.12 HEAD 9ca0fde2622c59c97612be0765d6d3c101122f69 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from iommufd.c:10:
   iommufd_utils.h: In function '_test_cmd_get_hw_info':
>> iommufd_utils.h:649:18: error: 'struct iommu_hw_info' has no member named 'in_data_type'; did you mean 'out_data_type'?
     649 |                 .in_data_type = data_type,
         |                  ^~~~~~~~~~~~
         |                  out_data_type
>> iommufd_utils.h:655:26: error: 'IOMMU_HW_INFO_TYPE_DEFAULT' undeclared (first use in this function); did you mean 'IOMMU_HW_INFO_TYPE_SELFTEST'?
     655 |         if (data_type != IOMMU_HW_INFO_TYPE_DEFAULT)
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          IOMMU_HW_INFO_TYPE_SELFTEST
   iommufd_utils.h:655:26: note: each undeclared identifier is reported only once for each function it appears in
>> iommufd_utils.h:656:30: error: 'IOMMU_HW_INFO_FLAG_INPUT_TYPE' undeclared (first use in this function)
     656 |                 cmd.flags |= IOMMU_HW_INFO_FLAG_INPUT_TYPE;
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from iommufd_utils.h:13:
   iommufd.c: In function 'iommufd_ioas_setup':
   iommufd.c:230:44: error: 'MOCK_FLAGS_DEVICE_PASID' undeclared (first use in this function); did you mean 'MOCK_FLAGS_DEVICE_NO_DIRTY'?
     230 |                                            MOCK_FLAGS_DEVICE_PASID,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~
   ../kselftest_harness.h:758:20: note: in definition of macro '__EXPECT'
     758 |         __typeof__(_seen) __seen = (_seen); \
         |                    ^~~~~
   iommufd_utils.h:123:9: note: in expansion of macro 'ASSERT_EQ'
     123 |         ASSERT_EQ(0, _test_cmd_mock_domain_flags(self->fd, ioas_id, flags,     \
         |         ^~~~~~~~~
   iommufd.c:229:17: note: in expansion of macro 'test_cmd_mock_domain_flags'
     229 |                 test_cmd_mock_domain_flags(self->ioas_id,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   iommufd.c: In function 'iommufd_ioas_get_hw_info':
>> iommufd.c:618:38: error: 'IOMMU_HW_INFO_TYPE_DEFAULT' undeclared (first use in this function); did you mean 'IOMMU_HW_INFO_TYPE_SELFTEST'?
     618 |                                      IOMMU_HW_INFO_TYPE_DEFAULT, NULL, 0);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   ../kselftest_harness.h:758:20: note: in definition of macro '__EXPECT'
     758 |         __typeof__(_seen) __seen = (_seen); \
         |                    ^~~~~
   iommufd_utils.h:701:9: note: in expansion of macro 'ASSERT_EQ'
     701 |         ASSERT_EQ(0, _test_cmd_get_hw_info(self->fd, device_id, data_type, \
         |         ^~~~~~~~~
   iommufd.c:617:17: note: in expansion of macro 'test_cmd_get_hw_info'
     617 |                 test_cmd_get_hw_info(self->device_id,
         |                 ^~~~~~~~~~~~~~~~~~~~
   iommufd.c:650:35: error: 'MOCK_PASID_WIDTH' undeclared (first use in this function)
     650 |                         ASSERT_EQ(MOCK_PASID_WIDTH, max_pasid);
         |                                   ^~~~~~~~~~~~~~~~
   ../kselftest_harness.h:757:20: note: in definition of macro '__EXPECT'
     757 |         __typeof__(_expected) __exp = (_expected); \
         |                    ^~~~~~~~~
   iommufd.c:650:25: note: in expansion of macro 'ASSERT_EQ'
     650 |                         ASSERT_EQ(MOCK_PASID_WIDTH, max_pasid);
         |                         ^~~~~~~~~
   iommufd.c: In function 'iommufd_dirty_tracking_device_dirty_capability':
   iommufd_utils.h:711:44: error: 'IOMMU_HW_INFO_TYPE_DEFAULT' undeclared (first use in this function); did you mean 'IOMMU_HW_INFO_TYPE_SELFTEST'?
     711 |                                            IOMMU_HW_INFO_TYPE_DEFAULT, NULL, \
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   ../kselftest_harness.h:758:20: note: in definition of macro '__EXPECT'
     758 |         __typeof__(_seen) __seen = (_seen); \
         |                    ^~~~~
   iommufd_utils.h:710:9: note: in expansion of macro 'ASSERT_EQ'
     710 |         ASSERT_EQ(0, _test_cmd_get_hw_info(self->fd, device_id,              \
         |         ^~~~~~~~~
   iommufd.c:1965:9: note: in expansion of macro 'test_cmd_get_hw_capabilities'
    1965 |         test_cmd_get_hw_capabilities(self->idev_id, caps);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from iommufd_fail_nth.c:23:
   iommufd_utils.h: In function '_test_cmd_get_hw_info':
>> iommufd_utils.h:649:18: error: 'struct iommu_hw_info' has no member named 'in_data_type'; did you mean 'out_data_type'?
     649 |                 .in_data_type = data_type,
         |                  ^~~~~~~~~~~~
         |                  out_data_type
>> iommufd_utils.h:655:26: error: 'IOMMU_HW_INFO_TYPE_DEFAULT' undeclared (first use in this function); did you mean 'IOMMU_HW_INFO_TYPE_SELFTEST'?
     655 |         if (data_type != IOMMU_HW_INFO_TYPE_DEFAULT)
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          IOMMU_HW_INFO_TYPE_SELFTEST
   iommufd_utils.h:655:26: note: each undeclared identifier is reported only once for each function it appears in
>> iommufd_utils.h:656:30: error: 'IOMMU_HW_INFO_FLAG_INPUT_TYPE' undeclared (first use in this function)
     656 |                 cmd.flags |= IOMMU_HW_INFO_FLAG_INPUT_TYPE;
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   iommufd_fail_nth.c: In function 'test_nth_device':
>> iommufd_fail_nth.c:615:54: error: 'IOMMU_HW_INFO_TYPE_DEFAULT' undeclared (first use in this function); did you mean 'IOMMU_HW_INFO_TYPE_SELFTEST'?
     615 |         if (_test_cmd_get_hw_info(self->fd, idev_id, IOMMU_HW_INFO_TYPE_DEFAULT,
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                      IOMMU_HW_INFO_TYPE_SELFTEST

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
