Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651433537F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 08:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427079; cv=none; b=uLkf1uHI5pSD1FpDP9u6BnqpL5yiM87MtN0L1B76fddg+yb7yKoDdWYI4HHEaoiKciu3sArtJZ/8mhWXIcJRTpibTM53Mx9Aoab1JpL9FV5FvXf2rSP/bai6omj6eTVMJS1IZmxu8QqlC7bQExLl8h5tCWtQ7zXVk9bX2FrCi2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427079; c=relaxed/simple;
	bh=LG/mfDG83Hq5kC0Ncu1Eb1TB8x3kZuQt+UBkIGgU0+U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J5QRH6LHHjyHApDpRxGocHoZqMd+ghBhwSWb9+MahVcKx7d3mHNANh8NRYK9XQw4aOmHBOIbAzV6pIiLcFroVcpwbJkWRd/+r5koc4iQvDGvsBMeeCPvmJN8TNaFzZ7KbUwd/p7gl/ctJMdIXEYoyhG9hTn20XYlLsaqvXnE6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmGEZ/Pu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmGEZ/Pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774427078; x=1805963078;
  h=date:from:to:cc:subject:message-id;
  bh=LG/mfDG83Hq5kC0Ncu1Eb1TB8x3kZuQt+UBkIGgU0+U=;
  b=HmGEZ/Pu0GCW6jZY0sl/uHOb/Wxxs9bTyqKRv2wVrfLLGctvLv6esvcM
   cHHOFA3XtuvkQfxYPC+mmcAfQ1l2NA1gDu0qTto2xUmCwEhSqlYi7Q27V
   1MoMRddqE95kJgInU5M5ayVGZWzK28CPLb8CamwMynu8eZYYVUmwdMiWW
   D229x2WuxnlEwRd1sbBcJwHNV3FHxTsb5U/JWjqtu+v88BlHF0FDYjZ2w
   B6G+uxqsNPhsl+qN7W8Oz3kvayjCStpfjPn9bBoK73MiXEjacvDdoVRs7
   g1Wn3ANOoENbXKUUlFNqVq1gYliaS1Z9gRzNKlnMRIOvVtZNYrg/6AKZ1
   w==;
X-CSE-ConnectionGUID: i72dYp85TDONoHphZIw3UQ==
X-CSE-MsgGUID: Q7XQvAv4RySWMWmM4NayWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75527712"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75527712"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:24:36 -0700
X-CSE-ConnectionGUID: 7jBqWQNIT9e1GKr42vzRXA==
X-CSE-MsgGUID: vYP3sv9NROW8Heg1wHpVYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229385980"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Mar 2026 01:24:36 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5JXU-000000006UP-49Is;
	Wed, 25 Mar 2026 08:24:32 +0000
Date: Wed, 25 Mar 2026 16:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/hfsplus/unicode_test.c:43:2-7: WARNING: NULL check before
 some freeing functions is not needed.
Message-ID: <202603251610.9L4pAi7A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 6f84ceb98538523f49d544aa7c671c87cc23d1b1 hfsplus: introduce KUnit tests for HFS+ string operations
date:   4 months ago
config: s390-randconfig-r052-20260323 (https://download.01.org/0day-ci/archive/20260325/202603251610.9L4pAi7A-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251610.9L4pAi7A-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/hfsplus/unicode_test.c:43:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +43 fs/hfsplus/unicode_test.c

    39	
    40	static void free_mock_str_env(struct test_mock_string_env *env)
    41	{
    42		if (env->buf)
  > 43			kfree(env->buf);
    44		kfree(env);
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
