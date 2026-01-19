Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59968F5B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 00:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768781256; cv=none; b=i9FUXr9YdX4GNc+mXEbKEbhhnKFb2Y05EEvwAqtNvj0b9SLcovEDRXIotb2ZhWc0Xw6DJK+OftJFadlVRKv09lzhEXx6MmDhAoZv05l5lHJubjIcrxj9dC3zL+ibsdkARbTemp0qrkEim3kutkYmh8hY3w862Lb5nmAKgXbG6do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768781256; c=relaxed/simple;
	bh=HKpvoNyBPXt0PZzl8uSA+VUJQfM2b3YQUCzXxkpRqy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UcO0aw0fwF53IoNN5ugoulnLIni/houQ49dKMvYHrwY71GZ7RzyuuW3Ga3AIVf5utJhOpRwtLf5k8xECGGTy0etgm49aFMb6ZpWOTk0ru/kTabIDYG1RR4XL1y1dMvs7FwnFD+UA5W/0QpKW1W/7rDh4dUYAR3sFvQs0mWp3AWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIM628Je; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIM628Je"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768781255; x=1800317255;
  h=date:from:to:cc:subject:message-id;
  bh=HKpvoNyBPXt0PZzl8uSA+VUJQfM2b3YQUCzXxkpRqy4=;
  b=cIM628JetFirfFXy3asqisGiWv3takZ5KDqmosTo0+5BLA9Mfiscpypb
   xeIf8r2atrD5AnvZs5m6F3j2k8inHOYNoZIzBBodJcIqFHT+y4axxVoSg
   ahF0zqsgMyUU8Fnbkap8l9gISSGiI1NBwFQHzV27MaMLAKSWzTktAvEgR
   BM9R3LMPXSI49tvBhiPSu8DS1ucQSfwPTYMHOezo6rQYlXyk8wENuDI1h
   +AppRlMl1fH96JCHou/bLe9ySjxYGD2oyXpOe5aw457iY883sckqIUtjN
   S4UKsE8uiQbOYXEcdL7lcqTHgJAe/8Gi+DdDVRnjf1SndUil0WMoF5mke
   Q==;
X-CSE-ConnectionGUID: Pt1XNaoQSSaRyZpHCZOxng==
X-CSE-MsgGUID: JLG3KvdjSMaV8SQaLWfMDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="73844728"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="73844728"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 16:07:29 -0800
X-CSE-ConnectionGUID: BmOBphW5RNqivswEDTrDnA==
X-CSE-MsgGUID: XvingucrQ6WIAr7dgAWmhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="210210754"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jan 2026 16:07:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhcnl-00000000NIf-2XZD;
	Mon, 19 Jan 2026 00:07:25 +0000
Date: Mon, 19 Jan 2026 08:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 126/126] Warning:
 drivers/net/dsa/mxl862xx/mxl862xx-host.c:37 This comment starts with '/**',
 but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202601190740.iHm4G7Gv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   10814cef1daffd2ba7bb1e83afa02509cff8b2e2
commit: 628d0ba60202550dc382a5ca5d9e27272f28c4bf [126/126] net: dsa: mxl862xx: Support cl22-extended and force-isolate option for special purpose.
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260119/202601190740.iHm4G7Gv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601190740.iHm4G7Gv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601190740.iHm4G7Gv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/dsa/mxl862xx/mxl862xx-host.c:37 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    *  write access to MMD register of PHYs via Clause 22 extended access

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
