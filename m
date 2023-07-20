Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2482D1773D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689871743; x=1721407743;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=7NX/AlPAGDSpnGK1rEuONyGAazZeaIxCWd5UEb1DPcg=;
  b=J+rt02Y3afk4g0dKiUQ2yPzxuroijLaMDwQUZeDwMKMkd/eK21lTND7k
   iyGIyfnoObKKso4c+yScRBcJiodN8ekIlKYdli5Wgpq3UmLwe4hs8k7TN
   ANdDkkGI/mLkczO4dTwienYVdO3UD05+TC1WfsMRmaErETzy0n2yqNJlS
   725CHf70DFLvFDWtZMwxLHCQPjRXkj2g2BNDiRr+rYM5mHDzTHNr81mFL
   3tziXitga50YsCgSdCzn8X9UqqsDAawl49bI2sN4yDq3mgRyYWinqY1dD
   pWHsPn+JjLCdxfz2KBS3icbw1ebjq4afiuZAZqbiXRn5bWqh7LH7fLQTo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="430594196"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="430594196"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 09:49:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="759635124"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="759635124"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Jul 2023 09:49:01 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMWpj-0006I1-0v;
	Thu, 20 Jul 2023 16:48:56 +0000
Date: Fri, 21 Jul 2023 00:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 5/9] drm/i915/gt: Refactor
 intel_emit_pipe_control_cs() in a single function
Message-ID: <ZLllTD9GhIDvh09O@c507f7d2ae6a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720164454.757075-6-andi.shyti@linux.intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v6 5/9] drm/i915/gt: Refactor intel_emit_pipe_control_cs() in a single function
Link: https://lore.kernel.org/stable/20230720164454.757075-6-andi.shyti%40linux.intel.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



