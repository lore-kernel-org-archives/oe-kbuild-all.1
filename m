Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF0415485
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 17:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4jm4Ghy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699809620; x=1731345620;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=A+ladAgLjDK1J5A68SWHTLVa+yDpBy9DjW3bmjnLS9Y=;
  b=D4jm4GhyqD1zVHbIx0SJbAyu1AK4SaXgvXtybwAeFgHGd/cbt2OCjJJo
   4tOJXxbv/04hdQzH9pklIZOWmmhhmoPg3HbAMNtFmMf2MTqX1ekDDApar
   P7zF3pjcs/eaDnM3j7I6GW5YB8Q1sLdcoXpCdRdpWYsx9FrFxuaxqW85F
   zElyfgJGFee9krNCrGNHdCVY7xIdXaJU5VUlon4NuVmA0yoRy1Howipeq
   cqCMo3sNzQY5sUZ5OHq2Uh/Hx8SJmE08vS4wnzHNefAHKow+KGF5FCObg
   1t1fT7s63d4wxztMY1dspvG1dzN3iUAORc6uRBEZLmoFOmjuwL2n31plR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="387504052"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="387504052"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 09:20:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="834538585"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="834538585"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Nov 2023 09:20:18 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2E88-000BMG-1m;
	Sun, 12 Nov 2023 17:20:16 +0000
Date: Mon, 13 Nov 2023 01:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [v6.6][PATCH] eventfs: Check for NULL ef in eventfs_set_attr()
Message-ID: <ZVEJFLmuAFBe1Wsg@a9cca7fa5d54>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112121817.2713c150@rorschach.local.home>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [v6.6][PATCH] eventfs: Check for NULL ef in eventfs_set_attr()
Link: https://lore.kernel.org/stable/20231112121817.2713c150%40rorschach.local.home

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



