Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F282145355
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 05:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756705535; cv=none; b=Lo0gmzr/3/xWQnl5rPeyKSGWknYrvGrA4E4UlLubNQ8zxGU8Tw5lpgk9xh+U+FFtUghm1iPflYrGQri/9PmOecDTNAlp2ckl/ZAWgzhAQAf2NrGIdMNYo7LxEHdYzQ2s9nrcuy9FVMaxKjhOJEI5u3OSLzr9lLPlHvvswao+4Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756705535; c=relaxed/simple;
	bh=tew5cVKJl6XmnowZkMXHrc4zu2DCW7OGKnFVUx6XGug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/tLvrWV8pH62f/prEb8UwT7OzABvr2xAc95oPFQLbl4tZlWJWLiOmUt2rSKvt/YnGDfcBHt+Ygn+Qx1wQT8D1pnhO48ej6jmQFQeaX61EIGCfaWw3Wc2EWDIh2RPy22EjOP6shCVAUCbvKk3sgN+11mOcuL00OwrDgNzd6qHrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkZmxRCd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkZmxRCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756705533; x=1788241533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tew5cVKJl6XmnowZkMXHrc4zu2DCW7OGKnFVUx6XGug=;
  b=VkZmxRCdHN3QSGb+0NspsDTbESyS+K8uSdCiIAkvZdBkEP8T/I/e2Pe3
   LluqqnQXSNpy/lpwfbxoqjIsIj6MYfd3zBX9Bvpimty9Z6M6Lq1jK8Icl
   li1H89XgikdJpOz6yj/Rza07uwOpqtqhOwHOu2J7Wgs0ErTXp8XrT2TRS
   S6gl/NmUptl8NbxaC9aMhBabNU3EVl6u5JaoGHjsso+H6Dbw2QIR9laKl
   S8MO3xjXdP9O8h0uAP/hkq3rkvpnbHPu3iX98Ixi1gHo/aDOqHXGvDywn
   GKEOwt1IUg3BDl4Bx2zKV6zxHkPjHQeB9l7BBi7JVGKCcToLgClaVgv0F
   g==;
X-CSE-ConnectionGUID: D2lqOsOoR769YqaFE8aDqg==
X-CSE-MsgGUID: rzfoDwWeQpaaRNH5f1Kl3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="58959801"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58959801"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 22:45:32 -0700
X-CSE-ConnectionGUID: ixWFQ+ldSXqgSEtwr6jF0g==
X-CSE-MsgGUID: ahhubgM3QzuIF/MeOWRdxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170793695"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 31 Aug 2025 22:45:31 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usxM9-0000GT-23;
	Mon, 01 Sep 2025 05:45:29 +0000
Date: Mon, 1 Sep 2025 13:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1343/1343] fs/ext4/mballoc.o: warning:
 objtool: ext4_mb_complex_scan_group()+0x11a4: unreachable instruction
Message-ID: <202509011339.wShfHPCs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Theodore,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7dd09dff93e7ad921baf5cec4b58301d9aebb79a
commit: 41298197ead9e85ee2ec1d52122f03fd1863cff2 [1343/1343] ext4: convert BUG_ON's to WARN_ON's in mballoc.c
config: x86_64-randconfig-101-20241223 (https://download.01.org/0day-ci/archive/20250901/202509011339.wShfHPCs-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250901/202509011339.wShfHPCs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509011339.wShfHPCs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/mballoc.c:4734: warning: Function parameter or member 'bh' not described in 'ext4_free_blocks'
>> fs/ext4/mballoc.o: warning: objtool: ext4_mb_complex_scan_group()+0x11a4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
