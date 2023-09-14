Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF02224F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694684925; x=1726220925;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=4p3zvVbNlEdTy4rKe0/r+q90zwKbdyf+gPaB+VColSI=;
  b=bi27D710CB+XgpYhtIFtFzC/22B4MFzHyG9YhmY6jAN3RZQSKuWWpR7F
   nAk4ikuMHRfwI/SZDE5KIxo6eQJuNo29deYCGrRN7EI8FV7afP89n+SBx
   I4ykpU5aT8wv/lCGsI/AkhNJs9YwzhPL8/VLdAj3OGtx5RqEgGbETb74O
   7eq1IFjC4XU2wlQvgK89H2VOdWbCvx9OJ7VE4XJFmhxY+vYpVyFjbAPLA
   oAgPfFN8FARJ/PVJvtnlaXS4xWw/y2mI/ykH+YbE3L2/6J5UzHcC0+dkn
   Sc9wxAb67EOJ85aFBVN9aY1tmMxHdgH5G1XJNvAdYngLSFO8o8jxmg47V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="381591159"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="381591159"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 02:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="721185753"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="721185753"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Sep 2023 02:48:43 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgixl-0001Sh-0y;
	Thu, 14 Sep 2023 09:48:41 +0000
Date: Thu, 14 Sep 2023 17:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Anastasia Belova <abelova@astralinux.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10] btrfs: fix region size in count_bitmap_extents
Message-ID: <ZQLWykRVfQf/0jxh@6fe19fc45f19>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914094555.25657-1-abelova@astralinux.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 5.10] btrfs: fix region size in count_bitmap_extents
Link: https://lore.kernel.org/stable/20230914094555.25657-1-abelova%40astralinux.ru

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



