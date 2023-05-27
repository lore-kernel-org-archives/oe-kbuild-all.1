Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56860D52C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 22:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685226144; x=1716762144;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=yK1qtllN1lGwDPqXZyRZ6af8naRaW3Rq1ITjJb5gjns=;
  b=jSczEINxabdLFgesJFPkpthA1etenwzzcYogqdmktnM47m7lcQkRY0pB
   7V1WuIs7ZN2HIkumKYnBorbwiKgcYV9AWsWi6EVMSw15gcIU2GPEmSs4G
   g7yAf/jNMRayVGnS7KHuAU2zSbJaXtx6BDjmla8RvI8hEaqwNrECEtnXC
   aIwCJ/exACDAx8vUQHT/4Rt8e1nMIkPL+ptKuGVoORElMY+ieAuG/qwTc
   C6RzZM3ocLlrmGjx3Zu8AoQS1kSAOstI7ynokT7rO8rLGt6Fr3VKxIE4f
   /uDilGf2V8jFCpE3oc56THWXUtBrHJo/22jT5kAvY/VeKZ8QPOJfAtOhQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="351952852"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="351952852"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 15:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="775470764"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="775470764"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 May 2023 15:22:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q32In-000KDW-3C;
	Sat, 27 May 2023 22:22:22 +0000
Date: Sun, 28 May 2023 06:21:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <david@fromorbit.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH, STABLE 6.3.x] xfs: fix livelock in delayed allocation at
 ENOSPC
Message-ID: <ZHKCZhLmienVrL5I@3bef23cc04e9>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHKB/KD1yyx77fop@dread.disaster.area>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH, STABLE 6.3.x] xfs: fix livelock in delayed allocation at ENOSPC
Link: https://lore.kernel.org/stable/ZHKB%2FKD1yyx77fop%40dread.disaster.area

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



