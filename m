Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9BC1D53E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 20:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKoyyRRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699390225; x=1730926225;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=tBYbO7an/f2PrYOjQTtjLKk4Nb0ZIV+DEQlRJapnXKM=;
  b=KKoyyRRgdjRTDAyZRKczr2xAEkNuVQIpT7snXN7x+fcLhKXEkWoPn1/f
   fOOw+0NKMGezVyjgo6xZNwznVdQ4ddw7pxOXlU6xAut7tEdhOUyVL0svT
   15hd6n7HETArOq3AxYeppzhyTI3chjFRVJoqZ3OnnbSFBHGgGt/RFjKo7
   cyZo1K1l+1NtcuvyRHfx1ZN0grY56Etr6d+UQGD1GZRzuHiU6HF3oh+j9
   S57XghIvCfAT7Xh3Bv5NEpn9XsMCFzoF2YncJHwXPP8cJ+tZAk+g2IEfT
   KYW9k3Fj4+3t25R70BpHVyfhpoCBzYhkrQH3/6WtjujRbWoqYu3moF7Qt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="8270717"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="8270717"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 12:50:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="906540901"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="906540901"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Nov 2023 12:50:22 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0T1h-0007Nr-01;
	Tue, 07 Nov 2023 20:50:21 +0000
Date: Wed, 8 Nov 2023 04:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 5/5] drm/panel-edp: Avoid adding multiple preferred
 modes
Message-ID: <ZUqi3YUBSGTJwBhF@b4d6968193cf>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107204611.3082200-6-hsinyi@chromium.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v6 5/5] drm/panel-edp: Avoid adding multiple preferred modes
Link: https://lore.kernel.org/stable/20231107204611.3082200-6-hsinyi%40chromium.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



