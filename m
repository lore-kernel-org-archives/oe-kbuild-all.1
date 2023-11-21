Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437271549F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 02:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkzy5Djk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700533971; x=1732069971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I3KXbIJz5aKj3iv+O03cvS4BabvvS6Y4JaK0ag7J/20=;
  b=jkzy5DjkQiLsSYLMpOgWMzAIIyT8xGoQ7ZuPidyRRtZfRzMbvc/yt5Vz
   XcWSuzBuIvESGBd654cxunLHXJY9Epy9loC7HXzNxqRvFQs62z8LR2iHN
   la/3em9iSTk+NULvLBj+GLtQhpS6XHlNW3juvAqxpMnPyaLsEfN5f9ga5
   6l0UHeqbS8dj8f9sH6LT3rbEvDXphbAdfquNvvwnVVDLmlyX7b85N2BqA
   ASKneAUXD/ehTZCD3CWxzYIlZ6yGRk5ia74eULjG6Cdq5FPPVgLm8lWSF
   ikxmSokHozbvgmgofmHqfKvnKZJNRn5BmjiyaTLaKpUjS1+OehuWq3Ues
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371090886"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371090886"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 18:32:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939959223"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939959223"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2023 18:32:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5GZ9-0007CI-1w;
	Tue, 21 Nov 2023 02:32:43 +0000
Date: Tue, 21 Nov 2023 10:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>
Subject: kernel/cgroup/debug.c:1: warning: no structured comments found
Message-ID: <202311211005.Qwt1FHrO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: a28f8f5e995fe5964ae304444913536058f26e37 cgroup: Move debug cgroup to its own file
date:   6 years ago
config: i386-buildonly-randconfig-005-20231120 (https://download.01.org/0day-ci/archive/20231121/202311211005.Qwt1FHrO-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211005.Qwt1FHrO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211005.Qwt1FHrO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/debug.c:1: warning: no structured comments found


vim +1 kernel/cgroup/debug.c

   > 1	#include <linux/ctype.h>
     2	#include <linux/mm.h>
     3	#include <linux/slab.h>
     4	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
