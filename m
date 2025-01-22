Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06118467
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 04:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737519268; cv=none; b=psY/ng4rUOVzb/UZFv7pv4Va4UvNF1/f42Fb3CKQSmDvBHM3UxQTn0vvM7bhJXOHUO8UMFs/VcCNNQFA/Y7reMJcF7Ovl7NLj5b48JXv5kqviY7M/w4m+fDFRhLFbx5vyez2vQhMYEs8xT346C7t6jGfYY4+FW/LB0tGuZpZbC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737519268; c=relaxed/simple;
	bh=+SXYZtnb4/bGhK6P9wFGTsrE3sb6ZTK1cCP+fMBKJIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PLU883ObL3KQe18ix9vWBsHmOByyfTPDlH6PlzaW5pGlp0AUXN9yF/ehh619GSrFgX+zcEoeeN2ZOEDTAYHpaOK3Ko/4Xm0Iv2mY+WfOmaFvo2KY91C7iTm24RuRrSjkt/tpsAOJijp1i+R+DbVCz1kEa7yKY4ndAIm9bmTyj7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVS/rJEL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVS/rJEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737519266; x=1769055266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+SXYZtnb4/bGhK6P9wFGTsrE3sb6ZTK1cCP+fMBKJIs=;
  b=CVS/rJEL+VVabUceor6GdccLNSX8zOJGDg/sDyeVzmqlQRvUkiTGf56p
   9ZSRulQh+p9GqQfTfLf+GqcJdhItm2BNc4Zs5VkiOjyZbLbVXBowCfJ1m
   vJPbZLUXk1Kaa87sAhFPLez2Zm+uCa/JFpWU7TE75Mjn1CgrVbpaoQgUa
   JtvKl7LWMBToL+TjB0/GdFgAIhqzE9W0MiJpDH4x/H/dDtGeyego5OxCl
   7wKS9s/NWTCLbkqH1e+q92SKSqg+8dV0Xi+OtQ79D0mQtPoQdr6JgbrtY
   3FBZ56Gz0k9+PUsvYEx2KppaE/c6urtIYz8myETxjWb3p5hh3uZH7d/kL
   g==;
X-CSE-ConnectionGUID: j2YL9HQlR5eG1A0AvanFlw==
X-CSE-MsgGUID: hX0TFgXmS4q8pI7+XzQ+Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37836378"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="37836378"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 20:14:25 -0800
X-CSE-ConnectionGUID: BThLGA91QJyI9fc911sOGA==
X-CSE-MsgGUID: FcPqngNLQ0W+g2ZsEN7fvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111631882"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2025 20:14:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taS8D-000ZRJ-1o;
	Wed, 22 Jan 2025 04:14:21 +0000
Date: Wed, 22 Jan 2025 12:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1411/1411]
 drivers/cpuidle/.tmp_cpuidle-haltpoll.o: warning: objtool: missing symbol
 for section .init.text
Message-ID: <202501221206.KfU0Mays-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fdf62dff2537450d438667d817333e17ec71148a
commit: 8104395ba98a81c8cb1ddd245482baca0d57d163 [1411/1411] add cpuidle-haltpoll driver
config: x86_64-buildonly-randconfig-005-20250121 (https://download.01.org/0day-ci/archive/20250122/202501221206.KfU0Mays-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221206.KfU0Mays-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221206.KfU0Mays-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpuidle/.tmp_cpuidle-haltpoll.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
