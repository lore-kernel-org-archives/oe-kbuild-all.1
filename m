Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D017848D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 01:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718672907; cv=none; b=KPTRHm9RnZ/SqDayzVRQADyMF3TV8B4pWhkGICi7LVIDM89BvPbbByVZwocH3qIfJOvyvh8VdZao60b5esx6eiJCB4TmgnDSID8qbnji4QKbIQ/HJkD0lYYhJ1ISiTpcF/RMIFvjVVlkqjat6zQeWDz2oZMG5rPILIiVdibAgwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718672907; c=relaxed/simple;
	bh=/CtH/CXvOupIwJ51obIissnzaWCotZC7RtI9S0Mqs6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kz/+NOdj1ki0O4zyAET25WstYblrUPn8ccXb6u3NItERGuFIak/7zuTImu5cnVKguj05XW1dL2S6g++/4PFdO5ZJVgYNxdCdwdtW7ibZGqyXTIA/hTwt/VqTYJDYeZH7Neb/GLBrqAWvE9YRJ+KITPnbDaq7xHUepDI9Z5GEQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eeaj6yB7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eeaj6yB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718672905; x=1750208905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/CtH/CXvOupIwJ51obIissnzaWCotZC7RtI9S0Mqs6U=;
  b=eeaj6yB7Hj1gBkSF+U+8O9+qeSdC2usmDQ5hTDyzoCQw0D6YgmZYwhyZ
   RGo/Vp+Ly9aZge6ZUnFbjctHuGl0JbzgNs2pcPMH0529fCqcnFqRz2n1q
   DuhPPfkZdMDRGrAD/dPhyyKjSTMa4sUzIuhlGZ9nY7v223V+P+s1DEXZ2
   nAd51EuVUFSK2p3nTDgyoVWm1N/i5G6F477Lo0il6AM7lZ9iZuqCtGuUG
   U8XxnUltQNPbGD69q/LgVl1onJrOzVzD9T3NypJnGRSssnKJZaeuK7e/x
   GoemdfPyMBluDPYbyCKleypkjvUvaHKUZH1CJesoIyaS44n0B5q2t3JG+
   A==;
X-CSE-ConnectionGUID: qEolWpSfSi6GToK4Fpo6+g==
X-CSE-MsgGUID: zJvYfgpdTx25aZJ1OfAJdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19344595"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="19344595"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 18:08:24 -0700
X-CSE-ConnectionGUID: 067Ubs4HQaasVrjyTBkJag==
X-CSE-MsgGUID: PbXxqrh8R3qyGxQsyNSNqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="41847944"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jun 2024 18:08:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJNKe-00054j-1i;
	Tue, 18 Jun 2024 01:08:20 +0000
Date: Tue, 18 Jun 2024 09:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Blaesius <andi@unlegacy-android.org>
Cc: oe-kbuild-all@lists.linux.dev, Dom Cobley <popcornmix@gmail.com>
Subject: [kbingham-rcar:kbingham/rpi-6.10.y/vchiq-dma-mask 3/686]
 .github/ISSUE_TEMPLATE/bug_report.yml: warning: ignored by one of the
 .gitignore files
Message-ID: <202406180945.A89rPB0K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git kbingham/rpi-6.10.y/vchiq-dma-mask
head:   ace1099e2d55805827b3b3b2b6833c10a86242fc
commit: 0600b80c6e83e65adbfd344c95c6843a71e72f32 [3/686] Use GitHubs issue form for bug reports
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240618/202406180945.A89rPB0K-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180945.A89rPB0K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180945.A89rPB0K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/ISSUE_TEMPLATE/bug_report.yml: warning: ignored by one of the .gitignore files
>> .github/ISSUE_TEMPLATE/config.yml: warning: ignored by one of the .gitignore files
   .github/workflows/checkpatch.yml: warning: ignored by one of the .gitignore files
   .github/workflows/ci_checkpatch.conf: warning: ignored by one of the .gitignore files
   .github/workflows/dtoverlaycheck.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kunit.yml: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
