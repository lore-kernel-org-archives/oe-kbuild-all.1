Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650C45666
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jul 2023 09:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688203569; x=1719739569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=guPUzOsccsAoVtAStZ3OAn8Mq4wudB6SrJeUvHM8mk4=;
  b=ExMb7lpaq+iAE1jCxpAr32gW9d+iQKJXuZMoKjONrDCeLSBibPEpaFAz
   fHPei47dO6aLtjCUXNCPK4cU2zqFfHhrqV260hlpkNCFmvMfg+gKZnvdf
   ALXg0SN/olj+1u9gQqd1cc6T4UyzGAqY/0BUHdT5dUhEB5Cg+nftEIxTU
   0oyPkBpdpVkybKrxZOAXxwsG3qcXDGypbqhBQH449vKEOw0LBkTXPrLgq
   hXQDs8y70C8XJjmk9nwrAm87IDbfjKoSGqJiqpMq04vgz9++WQmpcELU6
   9Il85mu9AOHFfjoTUfSTK3DB9Rz4WmrbX58YyHwgZvUJXSpU3V441xnTZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="362617914"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="362617914"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 02:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="787987589"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="787987589"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Jul 2023 02:26:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFWrm-000Fw1-0R;
	Sat, 01 Jul 2023 09:26:06 +0000
Date: Sat, 1 Jul 2023 17:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stffrdhrn:travis 2/2] .github/workflows/ci.yml: warning: ignored by
 one of the .gitignore files
Message-ID: <202307011754.ScaaHqKf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stffrdhrn/linux.git travis
head:   8032c32a67d26182ef4416483f83e4eb88ab2525
commit: 8032c32a67d26182ef4416483f83e4eb88ab2525 [2/2] Add travis cia for openrisc kernel
config: um-defconfig (https://download.01.org/0day-ci/archive/20230701/202307011754.ScaaHqKf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011754.ScaaHqKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307011754.ScaaHqKf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/workflows/ci.yml: warning: ignored by one of the .gitignore files
>> .travis.yml: warning: ignored by one of the .gitignore files
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
