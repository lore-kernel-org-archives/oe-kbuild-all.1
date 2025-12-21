Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA7B2236F7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 05:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766296197; cv=none; b=ioPhBOKAAN7LmJUXEarE1CYNvKtI18mofbOuYRDZndkeRQBKo1/rfVjoWmx9o0W5N/dOda6GjFqDIh7R2wNy6qIVxdCVi0gvE8C4/aD8upJQW9eVLpBf5vRTAIryL1jyoy5LHhqsIINzRlh+bCq/Sx33uYpo7EPjP07ZFZ40yaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766296197; c=relaxed/simple;
	bh=LKZMVag7aOQGnrzFCAGkQg2LHeivnhM0fESwFec6Zkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r/mVUNWNd73Sr/OcYL9q7BX+xV+QU5MuQHqUa1RWF9L+kxNcsuQzidl+LoxW2MsN8oLZpivxXSKQpziKYb6WUhEUOsuCexVgLrULWSyyarq3TwFQUHC2yeJMG/oygLucGQPbMCGYpWGfe6g4TA8RMuFepz7Avvv+K/kevzUsf+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAamSJp/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAamSJp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766296196; x=1797832196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LKZMVag7aOQGnrzFCAGkQg2LHeivnhM0fESwFec6Zkw=;
  b=HAamSJp/RId77bfC2swB/i4WLQ0JfCEr5NLnhuCunbo0RpwGoeESuk3K
   7c/KMieK8sJb7xi53MfWVMqt+hqA6D/w3+xbqiF0YwJqcGYcIipJxLk5Q
   hOgwcpj/d4iuP9Qkcqyfvi4TOLWk1ACiYd2J4tHZID14jMMmqjGOD6VqB
   DEWQ7WQJdJDjCR9AJFHiZqZIwjpmJkEd4BGiULyXu3PcLXGUvgtYaTL0W
   v8xX0JvDTtpGgx5HPrzv+n5JrSIubfFB4jdepDTtfqGQ0EygtFFvqmpn8
   iWRRSSw3SVdUbMIfM31zaQJ0N6HHhQQkEZk7xzxW2EyAJ/Lz9uJHMpAuI
   Q==;
X-CSE-ConnectionGUID: OJxGOXDUT3GyqjDHj6O7WQ==
X-CSE-MsgGUID: 7gXzr90VQyet+UMuFtWUvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85612521"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85612521"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 21:49:56 -0800
X-CSE-ConnectionGUID: f4kIiqOcTR6JMRe+L/V4+w==
X-CSE-MsgGUID: pLQvoh+ZQA+hLndDW5qw9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="236638446"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2025 21:49:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXCKG-000000004we-3MOW;
	Sun, 21 Dec 2025 05:49:52 +0000
Date: Sun, 21 Dec 2025 06:49:37 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for DIMLIB when selected by
 GKI_HIDDEN_VIRTUAL_CONFIGS
Message-ID: <202512210657.SoIrZ31i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 1dfbe413d21f18f714cca818435299947bf5649a [12/12] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: x86_64-kismet-CONFIG_DIMLIB-CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210657.SoIrZ31i-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210657.SoIrZ31i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210657.SoIrZ31i-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DIMLIB when selected by GKI_HIDDEN_VIRTUAL_CONFIGS
   WARNING: unmet direct dependencies detected for DIMLIB
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for HVC_DRIVER
     Depends on [n]: TTY [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
