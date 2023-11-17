Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C7917994
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6VsVOYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700216197; x=1731752197;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=yJPsPhF5wclSrG0ibvMi58FrGM0vcjhtpxV3DNG0rhg=;
  b=N6VsVOYDfjOQFFZ1HlLwp/bG4qNi+QCUqxEUWM13lHK5+JfKCF6Bnzj0
   icR8RfMxHK0tsFgAYSxQ5nYbNeHVsClz4p3rhgHG3ZudJcn7gpWL0Qz2u
   AmbV09CTmPaJXZPi8Y2Hnn3qwRmuXR+veY1/GgRZ0/h6CDHac5AoaecKP
   gMXf3Ri8E8jGoNrM4iJisqVQQASG62m21R5esiehebabH3rYxs8QUPn2u
   10jAh4XuCgIrj0XU5DjlCtCMPj+7CgWapWgB428XpKSk+BFmLv8uF2/v/
   HtMPUExCJlZLqkvyrUzWSbnIEGN9Lfs786D+7ShQNlsQwS/s9niISPbUM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="455573337"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="455573337"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:16:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="6803264"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Nov 2023 02:16:36 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3vtm-0002bR-1W;
	Fri, 17 Nov 2023 10:16:31 +0000
Date: Fri, 17 Nov 2023 18:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net] net: wangxun: fix kernel panic due to null pointer
Message-ID: <ZVc8UrRhUXzzE6FV@6473735b5665>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117101108.893335-1-jiawenwu@trustnetic.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net] net: wangxun: fix kernel panic due to null pointer
Link: https://lore.kernel.org/stable/20231117101108.893335-1-jiawenwu%40trustnetic.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



