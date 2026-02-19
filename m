Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64592FFF9B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 19:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771529929; cv=none; b=kBt3xh9thClerfLite75xC0/sFQFEGSR94pnYW6k92khx6Ya5h/tBzTAoL6KS5Sh870pOW7jaZcuxneflftCbon6Ni+FMKu1SnrtulH8XdL3SfUT6ImGdqFfeSTQEa377U4Si/YH00x+MOy3qvrj4wWHtTJUXsqgAxM/RkKSRs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771529929; c=relaxed/simple;
	bh=8kHubjpDu220KEyxB6/Ej/qsTyxOBaywRGv7c0Adzr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AIpDbXttOdJaX8i2Cl/aWxPEGacmtPGx7eEPuIwOAtA11CEMmyFpC5pnynpSKbnMQ7AGB7lxNvLEzwRrvkM0A833IEI7oDk0lsaA6IjjGgDPAHTvD5hgtBrqYqNg3u69ov7BjV5SCmAro4qdKFLdAP4mi4Gp46fexH/E/CnwhQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItVLM4Ah; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItVLM4Ah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771529927; x=1803065927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8kHubjpDu220KEyxB6/Ej/qsTyxOBaywRGv7c0Adzr4=;
  b=ItVLM4Ah24jgTPMt3sraTswECJsrdQk/ROZ5AvFVjq/pK0h7PUSVyXQt
   91CZzdD2qLzcbL4LefPkWdj8bfCkteegbwCQw1p9fJfoa45qsedPr+K5m
   H79qvfY6of0Chit2oVx5swDkpbQEfc02eRh56vtuwJQcu0DdpqJT/ggvd
   B4/wwhxehNkWwG7DopbuN8wM+5/osb6GXE9s6aWd8RTPu/1cZxLUdvdvD
   0HlAY83+royhmVlcninpGpzqlWKLjEfoEfnWnOjCJO5pryEKHQ28fn+ZX
   GSkNAe11bSwnVW8ijqqPwB3YZRmnfEblQOX/yGMGtQU6WeCdjC3AOXXOh
   g==;
X-CSE-ConnectionGUID: Tj0H9vAjQ56SXuRxesjeyA==
X-CSE-MsgGUID: 4yZ0gQgNQEOuA3HzUyqbMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83250788"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="83250788"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 11:38:47 -0800
X-CSE-ConnectionGUID: JDLNCxH+SXSrZDIb4DlIlg==
X-CSE-MsgGUID: YIjD1PtLQ1GfAcbdMQ8nXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="214480870"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Feb 2026 11:38:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vt9rH-000000013Uu-1taO;
	Thu, 19 Feb 2026 19:38:43 +0000
Date: Fri, 20 Feb 2026 03:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joe-lawrence:klp-build-config-work 23/40]
 =?us-ascii?Q?tools/testing/selftests/klp-build/tests/fail/quick/bad-co?=
 =?us-ascii?Q?ntext/bad-context.patch:?= warning: ignored by one of the
 .gitignore files
Message-ID: <202602200310.WRmhB9Zn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/joe-lawrence/linux klp-build-config-work
head:   54b8903c5c298f58d56cd7a8189b377cb660651f
commit: e65c10290b5e3e64ec8c0c0ba53924483684d085 [23/40] selftests/klp-build: add more tests from klp-build-kselftests
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602200310.WRmhB9Zn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200310.WRmhB9Zn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200310.WRmhB9Zn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/klp-build/tests/fail/quick/bad-context/bad-context.patch: warning: ignored by one of the .gitignore files
   tools/testing/selftests/klp-build/tests/pass/long/add-file-diff/add-file-diff.patch: warning: ignored by one of the .gitignore files
   tools/testing/selftests/klp-build/tests/pass/long/add-file-git/add-file-git.patch: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/klp-build/tests/pass/long/multi-file/multi-file.patch: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/klp-build/tests/pass/long/multi-patch/0001-multi-patch.patch: warning: ignored by one of the .gitignore files
   tools/testing/selftests/klp-build/tests/pass/long/multi-patch/0002-multi-patch.patch: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/klp-build/tests/pass/long/new-local-symbol/new-local-symbol.patch: warning: ignored by one of the .gitignore files
   tools/testing/selftests/klp-build/tests/pass/long/remove-file-diff/remove-file-diff.patch: warning: ignored by one of the .gitignore files
   tools/testing/selftests/klp-build/tests/pass/quick/simple-proc-cmdline/simple-proc-cmdline.patch: warning: ignored by one of the .gitignore files
   tools/testing/selftests/klp-build/tests/pass/quick/simple/simple.patch: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
