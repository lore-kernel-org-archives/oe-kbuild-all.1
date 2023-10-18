Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91E434CED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 19:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTBnYHhX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697658141; x=1729194141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=exYr8Jo8vT1iSMzYEea7SHR3uDi1JwQRbhn12CxNpl4=;
  b=XTBnYHhXyNP+1IFBdcFhNW8dYh2grxdpKUmZM/IG6RkFf55JmD0vHhVv
   aLGiTlezgOd0MqqsirYP7uJUgrREYxO2itqn5xfF6ae66STkcAUOkqWGn
   vJjFWwHmhhvhEFi8n/UXIjrJHlVrXhgjFp4+qji3i5783aQtHwj09hnuN
   4qKLHVAzKpOGRNapBCNjimxfgKsUFSZcCloSlSbEtHxGG3KXrq0VLkR0o
   yaeGYEfft7EtkO/zwzHSEDmF9CJS7Pdbxtpu1N3VkKlcAcFwcNj8Yp/wa
   FbWHpT9zYXJmICX/IcOJCYiDyTjNtEnTnrEjgLG96wi3Zzd3tHbhFN1Rw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452567175"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="452567175"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 12:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="1003920941"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="1003920941"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Oct 2023 12:42:18 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtCQq-0000vY-35;
	Wed, 18 Oct 2023 19:42:16 +0000
Date: Thu, 19 Oct 2023 03:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liu-song-6:bpf-tramp-to-prog-pack-test 1243/1251]
 .github/actions/veristat_baseline_compare/action.yml: warning: ignored by
 one of the .gitignore files
Message-ID: <202310190355.4LZBtA0J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/liu-song-6/linux.git bpf-tramp-to-prog-pack-test
head:   e011dcca6a43f6b5cf65731a10329b28f127d8cc
commit: ebf4281dda01248dda555e0f95e9db08fb973ec3 [1243/1251] adding ci files
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20231019/202310190355.4LZBtA0J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190355.4LZBtA0J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190355.4LZBtA0J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one of the .gitignore files
>> .github/scripts/bpf-objects-rootfs.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/compare-veristat-results.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/get-commit-metadata.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/matrix.py: warning: ignored by one of the .gitignore files
>> .github/scripts/prepare-incremental-builds.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/tar-artifact.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/veristat-compare.py: warning: ignored by one of the .gitignore files
   .github/workflows/lint.yml: warning: ignored by one of the .gitignore files
   .github/workflows/test.yml: warning: ignored by one of the .gitignore files
>> ci/diffs/.keep: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-Revert-bpf-Avoid-unnecessary-audit-log-for-CPU-secur.patch: warning: ignored by one of the .gitignore files
   tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one of the .gitignore files
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
