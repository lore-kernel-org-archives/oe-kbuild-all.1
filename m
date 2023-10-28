Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665EC23A5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kM/TzVrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698506428; x=1730042428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JxirMMB4uUxWvObBzxycB19xaaJl1L5/KrX80E1nP5I=;
  b=kM/TzVrbpeGb2/cKIy1VilGY3CinqQ9EY6N7aTwEKBLITueBDOanxw9M
   Bu9ZtKw9vEf4ymA5j2GRY4KECgSRZqeh2y9wamx04qDd94L8hO/fzyvnd
   KTE2kTiloUyegwQyKnrLRqUuKnPNXOnd55jZNZc5ZDoh/dU7jOaesK5Uj
   FtnNxk2e5sXgIc0dmumHPk3Z1sgFgYsbggq+11+P1t1G4ePjPMMlhX4KB
   q3tTYlU9Y3rEzIajdFUUEbCfVmpd2e5x7FlMDyktFWDvdGcU9+bGFUnNy
   IPxy5Nno3ePHqR5tGeilmSfDTDA4/wRc7MTVVNoM3jxJOVWFkLtIJ58qI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="701219"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="701219"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 08:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="7924801"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Oct 2023 08:20:13 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwl6u-000Bqd-26;
	Sat, 28 Oct 2023 15:20:24 +0000
Date: Sat, 28 Oct 2023 23:19:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4-lts 14383/29903] htmldocs:
 ./include/kunit/test.h:174: warning: Function parameter or member 'debugfs'
 not described in 'kunit_suite'
Message-ID: <202310282306.zWqnaKOW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4-lts
head:   fcdc8d9a71cdda01c736bb52ad5d494e5b0937a3
commit: f6651bd242ce4de8287e499e74e9f08e52faf0a8 [14383/29903] UPSTREAM: kunit: add debugfs /sys/kernel/debug/kunit/<suite>/results display
reproduce: (https://download.01.org/0day-ci/archive/20231028/202310282306.zWqnaKOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310282306.zWqnaKOW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/kunit/test.h:174: warning: Function parameter or member 'debugfs' not described in 'kunit_suite'
>> ./include/kunit/test.h:174: warning: Function parameter or member 'log' not described in 'kunit_suite'

vim +174 ./include/kunit/test.h

ff82dbcb3e2cc5 Brendan Higgins 2019-09-23 @174  

:::::: The code at line 174 was first introduced by commit
:::::: ff82dbcb3e2cc596f464302579fdf331f7422384 UPSTREAM: kunit: test: add KUnit test runner core

:::::: TO: Brendan Higgins <brendanhiggins@google.com>
:::::: CC: Alexander Potapenko <glider@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
