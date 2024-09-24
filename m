Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA80D146D6E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 22:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727216869; cv=none; b=FV+amT6gNPDgaVvScsTdu5BhlSxB6MhttvVNeinqWO/ff5na41g+uns3+KhqjOuS+LCWZQxJz6A0Vr6LkbKS8O3Xp1xdbwxG8i/qa2t92AIwTFVNcCvAicfBlJH8rcplkuzhqQR9Nar9sM2BI1lKk5RdWKJahoZWiq7AMsQpO/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727216869; c=relaxed/simple;
	bh=1KT8JsF7dFmWaU1E+MmbaZVahSXzssNF4xnvWizLijg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nij8E4PjkLe14On4CpZPyEYjC1tCJftJn2JJxerVlda+wRWxUNIsTw3jumZQ7mwdyMwlip/nqJRzZAH58gTO/Ll75SeaCMwF0bFQD0+JJ0olAOFhAEYkIV11dUIZZiVU0DNX/zqPXH92joHotf6Br+6i0Rw2Jam9YoaI8sfmCos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cM8+bKHf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cM8+bKHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727216868; x=1758752868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1KT8JsF7dFmWaU1E+MmbaZVahSXzssNF4xnvWizLijg=;
  b=cM8+bKHfDIjj7Dw2hc2ZOy1vml0XAtJT2pxUXiuP4RR563wrL+EzU4wx
   71Od31OTYho8gMhsKGvrXsnEidZESFlfgdmdNXnL4Z7e9zqEg5ukv4sNL
   Jom0GRDSI6Qz1r9DPig5cQUyh0gfdXg7xuuafmg83+blR0tCp5Uts/VUj
   vqIPNiS6ip6Rt+OLjeQyzD95h9rYgvXqYZ52rsnyQpLG6+GYlnTy0QZs9
   GX+BIKBTq+9sC6UPI/1RbnKXyAKen8zqC55fB1GQiOS881m1gQ7mO7e4T
   QRBB9vOIl8Pv/mnpQZt4VHOC4C+eeptXlvEGvO9RdYT5R4z4fTpflbZcF
   Q==;
X-CSE-ConnectionGUID: GooZqgaqRwSQXMfcbMRJ9A==
X-CSE-MsgGUID: 75+p1qUOQPqkwmq/ZysniQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="25715478"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="25715478"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 15:27:46 -0700
X-CSE-ConnectionGUID: kCEQysbWRNGajWreGhXAzw==
X-CSE-MsgGUID: EwXPbwzLTy+kFZKXT2M4Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="72020142"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2024 15:27:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stE0T-000Itt-0w;
	Tue, 24 Sep 2024 22:27:41 +0000
Date: Wed, 25 Sep 2024 06:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/thermal/testing/thermal-testing.o: warning: objtool:
 .text.tt_add_tz: unexpected end of section
Message-ID: <202409250637.5QiiHNph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rafael,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   68e5c7d4cefb66de3953a874e670ec8f1ce86a24
commit: f6a034f2df426e279f1ecad53626bab80c04796a thermal: Introduce a debugfs-based testing facility
date:   5 weeks ago
config: x86_64-randconfig-122-20240925 (https://download.01.org/0day-ci/archive/20240925/202409250637.5QiiHNph-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250637.5QiiHNph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250637.5QiiHNph-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/testing/thermal-testing.o: warning: objtool: .text.tt_add_tz: unexpected end of section
>> drivers/thermal/testing/thermal-testing.o: warning: objtool: .text.tt_del_tz: unexpected end of section
>> drivers/thermal/testing/thermal-testing.o: warning: objtool: .text.tt_zone_add_trip: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
