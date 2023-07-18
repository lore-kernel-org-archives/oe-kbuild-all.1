Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A020410EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 08:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689670107; x=1721206107;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=7Zz0Xz8yvCrnazJD9Q2MvKsmtuuOzbymVBZQof/BUIk=;
  b=UA3cXwJV0tkgSWCjx/2h0Q7HE9dOkNwW1wouDBklnmCXGhEv+vTBYcNG
   iuThX/+hpSZyBJtuMA5Fr2PgdTG+BQ72z/QIr/B116rKwlfjq6GtQW6j/
   u/W2jELy9H59wHBZqClU8Im+Pqqi8yeoEcP9mKWh4z+cJytxGQptNkFMI
   AIs4wZ4cY+crBAAqqNVjGWDDIM/h19h4w0JFHNOLwrBqjPY45buMF82i+
   zlaHkwCjK1GhnNH7L8DhBRU0oIK8Mve9pfo0AbUu3N71gVs8cW600aUXl
   BUgS/s9QVgFDSwzCIiNHJN34w0rbKXEquDU/iTWdfmwzTIhNpKV+Az1D3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="366191672"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="366191672"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 01:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="723532899"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="723532899"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 18 Jul 2023 01:48:25 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLgNc-0000OF-1S;
	Tue, 18 Jul 2023 08:48:24 +0000
Date: Tue, 18 Jul 2023 16:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yunlong Xing <yunlong.xing@unisoc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ovl: fix mount fail because the upper doesn't have space
Message-ID: <ZLZRz9FIbT7KcJAb@c507f7d2ae6a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1689669277-15291-1-git-send-email-yunlong.xing@unisoc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] ovl: fix mount fail because the upper doesn't have space
Link: https://lore.kernel.org/stable/1689669277-15291-1-git-send-email-yunlong.xing%40unisoc.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



