Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC1D3BB4A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 18:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769365635; cv=none; b=uXH9RVp2zDa8TGUJfTCqqrq+vV2ZOKRh2r8IgfAXIIDhdKagbD3BU1LTSOf1H2TmV9/qdY+ZtY02Mxp5MXtDKhUK8TAo77aXcqbLy3WZnSnsC3CtV4YaD7/0J2ooaAn3QRe14PznP7tjMCjlwnaauzUua6adbsQrwDKFxg/LtSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769365635; c=relaxed/simple;
	bh=7fjNRnlQ1FiKtepqEdjTvaf5R87BgCerhglItp3GZ+Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G8P6aR6l5EX6jDYKvxeAZ7dPMQzzSj8gBTXvlpbJGJQxGV8KJrdZhpe2Zj5IKnmrimCSzXcY0ODpy0fcBPisbpZb9UUZZVWD98fpTT4JDuiNPAaDgI8ec8wzLPcG7D1FvMT53FRCrnBMTugaAa0u+KnOICpjPh4X5Ty8Lpr/D8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUqOuKSI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUqOuKSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769365634; x=1800901634;
  h=date:from:to:cc:subject:message-id;
  bh=7fjNRnlQ1FiKtepqEdjTvaf5R87BgCerhglItp3GZ+Y=;
  b=lUqOuKSIv6DRtzdEwIwyyKEpo8NShjkmmSpzltFw/g8I68j7LDF8rAXj
   1HyTJUU54fabsGlLCEbcnvlwwNNMoHX4bTYybXv4pRrbcX6g70Sh5BKTa
   dKHY2v8QFGmwXIT/SONIuKkYN+KgOIPOx6FvE1xrP281iW1Cb+U5u3DLx
   uux9/Y0Ykr/2iYXupGc35qseuzhzKtZ39bh2OPR8qgZqFT5NaR2H5JJ03
   o2iHFNQx8CGBCKWmqq2UjH+71mrZw7BEIsSP186rX3lOLazm1KtbskhHY
   SVE5z6CNtXj+syyhBC9fG7sORpU3sev4+rT8VnrpaDqnu0CDxKaPnmxhD
   A==;
X-CSE-ConnectionGUID: EaKklmAoSTKJ39tHXpaQYA==
X-CSE-MsgGUID: Ry8wq4ZWSEm0wR5l1pACHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70523658"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70523658"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 10:27:14 -0800
X-CSE-ConnectionGUID: ltiUFwWPSUukmRd1IJmsFg==
X-CSE-MsgGUID: cG7xnSVdRhSf/TeDZElfCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="230464040"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jan 2026 10:27:12 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk4pK-000000001Kv-0Hvj;
	Sun, 25 Jan 2026 18:27:10 +0000
Date: Sun, 25 Jan 2026 19:26:58 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] iommufd.c:230:44: error:
 'MOCK_FLAGS_DEVICE_PASID' undeclared; did you mean
 'MOCK_FLAGS_DEVICE_NO_DIRTY'?
Message-ID: <202601251932.ALy05cxy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   9ca0fde2622c59c97612be0765d6d3c101122f69
commit: ec519fbf6dd8dbd8e98702348279ffdfbec77911 [2/2] iommufd/selftest: Add coverage for reporting max_pasid_log2 via IOMMU_HW_INFO
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260125/202601251932.ALy05cxy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251932.ALy05cxy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251932.ALy05cxy-lkp@intel.com/

Note: the android-common/android16-6.12 HEAD 9ca0fde2622c59c97612be0765d6d3c101122f69 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from iommufd_utils.h:13,
                    from iommufd.c:10:
   iommufd.c: In function 'iommufd_ioas_setup':
>> iommufd.c:230:44: error: 'MOCK_FLAGS_DEVICE_PASID' undeclared (first use in this function); did you mean 'MOCK_FLAGS_DEVICE_NO_DIRTY'?
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
   iommufd.c:230:44: note: each undeclared identifier is reported only once for each function it appears in
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
>> iommufd.c:635:35: error: 'MOCK_PASID_WIDTH' undeclared (first use in this function)
     635 |                         ASSERT_EQ(MOCK_PASID_WIDTH, max_pasid);
         |                                   ^~~~~~~~~~~~~~~~
   ../kselftest_harness.h:757:20: note: in definition of macro '__EXPECT'
     757 |         __typeof__(_expected) __exp = (_expected); \
         |                    ^~~~~~~~~
   iommufd.c:635:25: note: in expansion of macro 'ASSERT_EQ'
     635 |                         ASSERT_EQ(MOCK_PASID_WIDTH, max_pasid);
         |                         ^~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
