Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFDB21D5AE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 18:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740596280; cv=none; b=VAYqeXZmshGkd26TZqvaM4Fn//UFOFrLfS3dhmO56Gm3wbRXBJ8qL+XK4zFeHFeMKeWhfgIvTNs2bw9TLlS9605ngz200Uxz10CU/YMm38qRyZBnCWennQJUjfTiK0wdUxaJUJWPFLFTzrsW2HJrpatUNWNKz+d0DNwuYvLAtZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740596280; c=relaxed/simple;
	bh=JB3o/OwBvmyip9hkmFRptsIh8zdMIsyhYSS3HvqRfFg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FBF2GGK2Y0MNBs3sfliHsPoHqEFh8qL9WqF7KG7FZ/YUNz1KBzfY2aRYcuW7ZX/3k5CRy/iMraKPm0ltI4WfUpaH6fuJUipBsnzWB6i2DqJMiAIvQ+CPAeYRtFMjY6SwbVbjrVSNcJk4SOIWmDr0DnYKvIOeVBYEQEP3WiyLgto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfQdBHY6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfQdBHY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740596279; x=1772132279;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JB3o/OwBvmyip9hkmFRptsIh8zdMIsyhYSS3HvqRfFg=;
  b=jfQdBHY6CNd42N5btwr8yWJK5f0JOOGzVS4a/FlYHB3UTntVP4LtFZWX
   qftWcmHybuKalUfw3NVjuYuI/Dn1a7/LlveM+cAuc9KXdjjo4weh3u3oC
   ERwRksvlLIYbu9g4cL5pHLdB8OvV5vKUrxhwWHrBbKI5YRA5u2t2w6guM
   nBgE77g6lNnzOe10XkSxrwQUtNbef0/j+R7QSB0dLX3gxasQlgUhza2iQ
   juoQdRP8Cz2LUshl0cnCms4lJnhB9lUiLZsbl9v+lOLxEKvWxmnHCGEZi
   N781UzpyLnHpErhfBSff86biuoRnqAyQE5GwSq3QTNACRM6TFAhBe8Bwz
   Q==;
X-CSE-ConnectionGUID: SwULqBXySmGESPjkTUGHew==
X-CSE-MsgGUID: mlAbDZmCTAS8G6d7eXfJTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="63931043"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="63931043"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 10:57:58 -0800
X-CSE-ConnectionGUID: pL4JFsv0THWVeKCcce7eyQ==
X-CSE-MsgGUID: suiuMSVIQ0Kl/TRyAZH86Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="140007851"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Feb 2025 10:57:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnMbT-000CGN-1F
	for oe-kbuild-all@lists.linux.dev;
	Wed, 26 Feb 2025 18:57:55 +0000
Date: Thu, 27 Feb 2025 02:56:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] kernel/gcov/clang.o: warning: objtool: missing
 symbol for section .text
Message-ID: <202502270200.sSOivedO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: e178a5beb36960902379040ee0b667fb0a8eee93 [1/1] gcov: clang support
config: x86_64-buildonly-randconfig-005-20250218 (https://download.01.org/0day-ci/archive/20250227/202502270200.sSOivedO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270200.sSOivedO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270200.sSOivedO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/gcov/clang.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
