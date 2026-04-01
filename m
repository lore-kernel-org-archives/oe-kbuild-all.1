Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A5B301493
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 04:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775017380; cv=none; b=UOX/OLqwvO0IF/b+JW0tQbiIF90PKOmtNfa9spwCWdQjsbfoUn8fni/F6Cx4bWikCsY43bdO8Jyl/jncyBiG5iTIBPvGSel3+/Rax7irPngw3L8DrHqNEPWuW26khfIsfNu37CP4foi6jIx5lJrm/K00peDdtUJTsV/14E9s0Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775017380; c=relaxed/simple;
	bh=omIKvZbaLjAte5tSNkqePsgEAGpT5HrhyAyvQp3+BHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B5ttUwqZDXjZ1YDjagqOyifRnQPvcm5s3a4XFYp5LMLSXfNFUTqcLmJ+pYCwHXFYD9mXzKjepKsNleZFAYb6L5iJmuWxd9+bnxG6C7uyswDhf5fg78+3WKYU7vZDjXFm7Ov7SYpBj3LgYfRW2kszB/4ngCmZEBs8R8NPSzIj0+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iI0GVzGY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iI0GVzGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775017378; x=1806553378;
  h=date:from:to:cc:subject:message-id;
  bh=omIKvZbaLjAte5tSNkqePsgEAGpT5HrhyAyvQp3+BHg=;
  b=iI0GVzGYnG2Cte52ecouq0ZGenSSVgXqO2d69fGX6XGMKDv8xpRuBAxi
   GAWF6CTWXm1AwtGSh8Ls8sYqIJ4QnoTVqYwzqiWcwbDR4U12XLkMH4rQu
   TtS9V7kNcY19lyTFvZkxnPZv4AxWeQ01PoJTVB/bfhUpkP8iQQ/7iyHMT
   6F6hYj0icmR2ysHpLsLlcUeT71lTzlkI11uEJXL4p7X966LD547CqHMGd
   cqXp5X3fs8a5mPRSm1oQpCz/Zn9Ac1MNA+mEw/Y9AZLao26gpL9DSfd1q
   Ro9teR/+KehBtq/oZgwTmp2g1agJHpMRoZKkfyua/7OT7eULo9PEkETAR
   A==;
X-CSE-ConnectionGUID: yIL1B+NMQlGqy7OrSComCw==
X-CSE-MsgGUID: AUFrZMDgTH6FuWLwRT1L2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76160416"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76160416"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 21:22:58 -0700
X-CSE-ConnectionGUID: 2es2eaNAS/yAobffpZaM+w==
X-CSE-MsgGUID: Xwnu8osSQ1CLOAvZ8Qg2hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="221706987"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 31 Mar 2026 21:22:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7n6U-000000008dl-41sD;
	Wed, 01 Apr 2026 04:22:54 +0000
Date: Wed, 01 Apr 2026 06:22:48 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu 1/1]
 iommufd_utils.h:649:18: error: 'struct iommu_hw_info' has no member named
 'in_data_type'; did you mean 'out_data_type'?
Message-ID: <202604010624.EwhbbCOh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Nicolin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu
head:   9cbd7eeda1fe517f9ce3451fb3d7b4663df71429
commit: 724f6df514f78613995fb5c02463e42429942495 [1/1] iommufd/selftest: Update hw_info coverage for an input data_type
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260401/202604010624.EwhbbCOh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010624.EwhbbCOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010624.EwhbbCOh-lkp@intel.com/

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
