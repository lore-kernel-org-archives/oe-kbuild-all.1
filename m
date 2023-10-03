Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162C405CF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 23:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696376316; x=1727912316;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=iR69J5Rz1bvKe+1Wiwx3rNhfw9Erpqr44/gXLQ3m50Y=;
  b=IFqVlbl+GkaaFNGWzPjDfiCJUmWuElq2aPJjT+j5Crk+u24dJT5o1dJy
   qESfCDn5+1ydAwGqUOJGvj2hoopPwm2Y8yd/0v1hPJzlBpSVoy/5Nzffm
   lvFxjxHuH5fdA4+h0ttQZmP2Q5jI4ZPVLjcpDNNlNrA1jOSRG5lvEmLrZ
   NeSdf8NakoEduIf01QOc/j/8BmAchX3OTWhs1ltej3aTn9QjzYs+hBZJT
   +Ih3SmOadryi+Cw1VohXtPkMBFbeYPizv6wS7HUT2bxQWNTZ8gjOu1ifk
   95ktAbIGCLmznlOlHMDvHZFF6zG6oGHEIneH2n5JTqvQ1CgkUNzDPLoVy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="4568052"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="4568052"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 16:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1082211072"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="1082211072"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Oct 2023 16:38:33 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnoyE-0009nm-1K;
	Tue, 03 Oct 2023 23:38:30 +0000
Date: Wed, 4 Oct 2023 07:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH][6.5, 6.1, 5.15] iommu/arm-smmu-v3: Fix soft lockup
 triggered by arm_smmu_mm_invalidate_range
Message-ID: <ZRyl2w4k9dYQB70T@f61ccfac960a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003233549.33678-1-nicolinc@nvidia.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH][6.5, 6.1, 5.15] iommu/arm-smmu-v3: Fix soft lockup triggered by arm_smmu_mm_invalidate_range
Link: https://lore.kernel.org/stable/20231003233549.33678-1-nicolinc%40nvidia.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



