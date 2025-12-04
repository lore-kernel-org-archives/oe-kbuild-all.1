Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0AF398FBF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 21:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764884929; cv=none; b=eGA8BDkyB4qyc5PL7QEF+KQ3asc9W+tWjf1XtrggcnByxQF4wvlx114b0lO7bcjiIgs8uqRp10cETlSih7dAuk/+pauw58I3HmLc43CS8h6vzujcdZH++57mel5jVNhbj1PmxXhXn5XazjT5ym8rSDsPk+sLEwCk9/kLsDATxXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764884929; c=relaxed/simple;
	bh=TmIENnqmM6+s5qyGKlUpnATHJNRlH73E/P7flAlLcUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z8lEqxFdlx97ee93yTC9ACg6hUt94df8o9TFd8QH8f/Ijm6tN4Jl7aBkD4UTtKRwRxyFNmpkcQwW7TtbPA/yQ69kTbKDFLPAc3WkeogkQFDXXxZjtTXSP2qHdQL6WyVy/Viv1wjufcJC9nsgzTx4M+rbYVTgEzp5tcbxkwq7xnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QspTF4Lv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QspTF4Lv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764884928; x=1796420928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TmIENnqmM6+s5qyGKlUpnATHJNRlH73E/P7flAlLcUU=;
  b=QspTF4Lvy3KO8+uxhTa86Z3W+zDUkwfF7ASubqx1/n18nUKjeW8H7NG5
   my6wS8tgcegYFcsUp/QLer7cdSWDGYdWHLJw6Fx1wgGk/gJhOtdsr0zxZ
   ++tvfOBSHLtGTDQidtETavJJI+RABrBJo52tjFUDyYAhDfbk13yVxJVGk
   JEdo1vF0A/zHtAPnOHCATlmH0DGF845p4D1K9fei7rrRvh6a/LiMkw9Qg
   zM7SBAumr/Hgk34MO+zDgMR3XeqRc4iq3hS/ahJnW0cs/hTsOiyNcYIh9
   AJKjORHBCeMgZJ2qki2dOV8CUyqvqWUi+RdUqgfl2JrXKuOasL+Th+VwV
   w==;
X-CSE-ConnectionGUID: qeZBs/QMQL68q6DnceYY0A==
X-CSE-MsgGUID: scLR1ZsATgy/wpHzixCTgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66959492"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="66959492"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 13:48:48 -0800
X-CSE-ConnectionGUID: sOv895pmQGKFx9j6chhezw==
X-CSE-MsgGUID: swasv7naQearNKoOL9m5AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="199269548"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Dec 2025 13:48:48 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRHBs-000000000ov-3UD4;
	Thu, 04 Dec 2025 21:48:44 +0000
Date: Thu, 4 Dec 2025 22:47:52 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [joel-granados:jag/no-macro-conv 23/25] htmldocs:
 Documentation/filesystems/api-summary:107: ./kernel/sysctl.c:794: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202512042225.QcSwy0wi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/no-macro-conv
head:   60075afc9fabecdb5b1015df21a05df3b2d50562
commit: bedd3b4197fd211e1ea0dd90f17b72524d205e9c [23/25] sysctl: clarify proc_douintvec_minmax doc
reproduce: (https://download.01.org/0day-ci/archive/20251204/202512042225.QcSwy0wi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512042225.QcSwy0wi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/fs.h
   ERROR: Cannot find file ./include/linux/dcache.h
   ERROR: Cannot find file ./include/linux/dcache.h
   WARNING: No kernel-doc for file ./include/linux/dcache.h
   Documentation/filesystems/api-summary:107: ./kernel/sysctl.c:793: ERROR: Unexpected indentation. [docutils]
>> Documentation/filesystems/api-summary:107: ./kernel/sysctl.c:794: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/buffer_head.h
   WARNING: No kernel-doc for file ./include/linux/buffer_head.h
   ERROR: Cannot find file ./include/linux/fscache-cache.h
   WARNING: No kernel-doc for file ./include/linux/fscache-cache.h
   ERROR: Cannot find file ./include/linux/fscache.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
