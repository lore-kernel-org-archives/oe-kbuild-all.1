Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FA0211A28
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 03:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770695362; cv=none; b=rR2IRxE9aLiBhk2iXdxAzACMRuK6s7bviWyQznOx6E0MWfvndfqH1wafOQXLp1pl1TFCUJVA8UzL9YK+U86q3QrKOejbUR/4Jv+/1qoKGEUlHpo7E9cN+34P3vND+/8RoVQ4XDhQYzCYefE5oY1sDMRJKppyMaW9jvGNnCbjCmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770695362; c=relaxed/simple;
	bh=/Fnsq5Hssg3W0aIbMhxCoTVn0SXrkht8WDwIrhsq1Gg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kT2tefsUy1C2+X9UQnlm7PPDCkpe1wJMZY2ETibsP41X1OgHETeNatEpcsc0zPignua8aHf/q7suIzDgD5Uk5r+ogofiWgjLPbqVyXIyw9/hJ4ohIE/ZxsG3k/lugxS4fcHuG8lwGdktcBfAPWJ40a176GYCSMAUPWewJC7Whrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7z+R/6z; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7z+R/6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770695360; x=1802231360;
  h=date:from:to:cc:subject:message-id;
  bh=/Fnsq5Hssg3W0aIbMhxCoTVn0SXrkht8WDwIrhsq1Gg=;
  b=f7z+R/6ze7UgiFblrd2VN+0+gLJ826t87NSDmy9tPNNk1+JkcoLwS78Y
   omcnR91QZbrqXPkOTLzwBr2cncIMupxl6nZyjYVdrynN8arbZOL9Cdq3w
   4RNWPmDcnzKOwXVjG+jPsCNrtgtD5z67hQsPxxNh07mc2FkwYUS5adyl5
   X4K4UDnop7f8OBHE4K4E05GMDEeu9hEHwd5HO8+EKuOBcHHuTF4nVsSA+
   8kC707YwgOVf5RKVpD8Ssn/+EGtU1ccAEFSCiQi/EbMuaHZNQuxrbaqlZ
   MlXNNyvNeJ5C6EPlkz1tMKHCoz1HJvUKtvqfIjUQeYU9VbLEev48+mTPU
   A==;
X-CSE-ConnectionGUID: TK36khmNTE22pxF9h1r+8w==
X-CSE-MsgGUID: 6527ZM2dRVeIAUUQE7xZAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="97276182"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="97276182"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 19:49:19 -0800
X-CSE-ConnectionGUID: h+low3q/R+mF8BFtP5OlpQ==
X-CSE-MsgGUID: iJueYnqxSuWDt+BPe9s3bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211861599"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 19:49:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpekV-00000000obA-3Pel;
	Tue, 10 Feb 2026 03:49:15 +0000
Date: Tue, 10 Feb 2026 11:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: chenmiao <chenmiao.ku@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __set_fixmap+0x8c (section: .text.unlikely) -> map_page.isra.0 (section:
 .init.text)
Message-ID: <202602101147.5YL1dXf2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi chenmiao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4adc13ed7c281c16152a700e47b65d17de07321a
commit: 4735037b5d9b0f809c51976c87d737fa2c48fdea openrisc: Add text patching API support
date:   5 months ago
config: openrisc-randconfig-r054-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101147.5YL1dXf2-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101147.5YL1dXf2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101147.5YL1dXf2-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __set_fixmap+0x8c (section: .text.unlikely) -> map_page.isra.0 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
