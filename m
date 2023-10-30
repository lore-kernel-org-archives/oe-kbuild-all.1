Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F56319449
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJrL9zcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698685956; x=1730221956;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=FTwAiGQLGBxOhr8IZVkOmFrokbq4fbBVG7aczvP9Pgw=;
  b=RJrL9zcP8Jvwfp7ksTi7ZUta/mTyl2zJbHPZ8hnTLrhYXJ10kni3FXzx
   Tp/ZITma756BDI/HnSY4pdsRdswYJRXOJ+0ALNm1DMzxjEEYpFUYIfMnt
   jJj0CnkTzEzhAMuy10xdVTKSn9IHpgBOPzr+xP6dtDpVqR7GGSd4CWipI
   qW0wv3pD4i87TjbrPJiqK3rxr+gFFU8uyofcQYAibby6/iK//s3vH5/yF
   ACcH2Xk8T0m+6Sr+Umv80TyCl0Hmy1HY69Cx/1nTQJmjXD4CfMY0nRnT8
   obsMsBsDec9lYG1UWQ5tix0qu2kJRLNfIlGKJxj6E38r+LfE52sk1vase
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="452380513"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="452380513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 10:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="1541958"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Oct 2023 10:12:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxVoW-000DR5-0T;
	Mon, 30 Oct 2023 17:12:32 +0000
Date: Tue, 31 Oct 2023 01:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/amd/display: remove redundant check
Message-ID: <ZT/j3ROgcuuACOU0@dceb3e7df498>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030170407.28408-1-jose.pekkarinen@foxhound.fi>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] drm/amd/display: remove redundant check
Link: https://lore.kernel.org/stable/20231030170407.28408-1-jose.pekkarinen%40foxhound.fi

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



