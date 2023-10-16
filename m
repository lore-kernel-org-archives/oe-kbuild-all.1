Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1451872
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 00:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OOwUMxgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697416276; x=1728952276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u9LIPzJ9i8DOCpIadFPC22G5y5OFlzxd64/Y0kgDdG4=;
  b=OOwUMxgryK4lDn9G/FKcIp75BZH0ZkpkxDBzaNqFBxWVRbuILru+VPVZ
   NhiLdCXyaZG2vJbS06zBmH65fg/AULnhfBnpvLNWWGNVVco2ql0Jw5ZOq
   Inc5PHm/cgIarGR/DF1xNxh1Ec2XmxPL354rDiZupmeJxBXSIY+NT12kE
   W/J6YKwlCtf5Ovxx1ZMUDT38oEQzqpld1K9pqqQJb5Mt9Z4+OWoyO5TOB
   YkLR6TO910Vp39UQYsgKf0SBEmiwUYpKxnbB/yRwgFyZPzOn3OBLB/HZB
   SxolBN8mxJCX55YezKUA9l4K/u4WPGhyfmopjsf9yB9kaYn1UfvXvhcA4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="6992906"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="6992906"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 17:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="732105232"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="732105232"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Oct 2023 17:31:13 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsBVn-0007xz-1U;
	Mon, 16 Oct 2023 00:31:11 +0000
Date: Mon, 16 Oct 2023 08:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 143/206] checkpatch: ERROR:
 trailing whitespace
Message-ID: <202310160808.WInIgXgj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: 4f8d2d369cfca24a6dc75ff7a43cecbcf1ab2204 [143/206] ASoC: macaudio: Tune DT parsing error messages
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160808.WInIgXgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160808.WInIgXgj-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#127: FILE: sound/soc/apple/macaudio.c:373:
+^I^I^I/* $

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
