Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30481314B63
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 22:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778451713; cv=none; b=oS7nOpsG4DbNuAiUwF8QpOsRMgyJortRcBRnJZKUCmugoLWXRa59VxR+pU00uOrMrN2Lk4iVttRP0TCfAyyxbAbBTbQWlPtU6dWbnUvcbjaeYQZ9mHn9emv282nKiIMEITJzEHCRAQF5OkrAsZfIiQnD38E/YPzj2vOOTcnIElk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778451713; c=relaxed/simple;
	bh=TCrt0+tdWuVc1T13xw3gPB8b48hSg+2Mhzoy5JHSdwU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jzBlCgiTi5tsvyXrMwF71jBBnp31+UaqApaPptt5LJdlLVStLbK+n8UrDqJabMDB1zm6W4phl4Z/uCmG/znMykHpREQ1OxtLcPG8AaAxS/a4I6U1ew/dm0hCNaVRFaPNaoM2DSDDD5auQYHWmPVjlUyMzDEHB3zsWQf988W9xPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N020A1xo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N020A1xo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778451712; x=1809987712;
  h=date:from:to:cc:subject:message-id;
  bh=TCrt0+tdWuVc1T13xw3gPB8b48hSg+2Mhzoy5JHSdwU=;
  b=N020A1xox4yYABLVH6Beql9kmOSscDEe2ScAW8aLWuw2CZxBFLgKTtHs
   cNeW1vI/POOGGRMl8/KZAiHRW7GNYBBch/sxoQn4Da0dhIE3a6FDTPBh1
   aVkzNJnk5S/hWYS20pMRxxpEF/gK0211fkcvI17U4cVCteo8N2SimlIOe
   CkPHN8O+TkBEk8hMOm+CV1RcoJt04ESqLQP+PjgTRFPOXxE36R7NTccAJ
   avctJhXnh7c1zNly/pDUrvynHTl9BAXlxqUttp1WAK2bPrkfWCfPGetNb
   mOM2gtnF4/xQKVJ+C/ifpbCtdL3+HkmstPu6OfW/0EIjOAcMCZsUvvK0u
   w==;
X-CSE-ConnectionGUID: xZsxtKU7Rx+c9cTV2PX5EA==
X-CSE-MsgGUID: 22ymLfouTp6gI4Mg3sxxBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79377188"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79377188"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 15:21:51 -0700
X-CSE-ConnectionGUID: /ji6K+B/TKCRvkW3+rfv9w==
X-CSE-MsgGUID: 2qPOZGjkRDermz+xfenkPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="236313646"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 May 2026 15:21:50 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMCWs-000000002dZ-0VzY;
	Sun, 10 May 2026 22:21:44 +0000
Date: Mon, 11 May 2026 06:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:lib-raid6 3/17] error: option '-maltivec' cannot
 be specified with '-msoft-float'
Message-ID: <202605110627.bg12SKfg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   4904674049bc3b70c509754b53cbe708e49f03ee
commit: 04f46cf399047f3e3a537e26bdfa3e17bf2400e5 [3/17] raid6: move to lib/raid/
config: powerpc-pasemi_defconfig (https://download.01.org/0day-ci/archive/20260511/202605110627.bg12SKfg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110627.bg12SKfg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605110627.bg12SKfg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: option '-maltivec' cannot be specified with '-msoft-float'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
