Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2831DDCC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpotpZ2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701424774; x=1732960774;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=V4x3Q/R7T7QKX19PnQKvBjiTh2TY7lk7gqSGHtPYTTA=;
  b=FpotpZ2SfoBpunRb5DmIuaZDa/YPl4NLmLfIJC5p44MFXhuzRYoY6wtA
   Zsz04zaG+LJnVJJDoRjDKtR3fe01SeSg2c+ZSyJlT37BmbiSmInu8AwMa
   6/LoxNjE8gYK6TbpEbmJz7DCsThlmjgO6jcg2A9dlIptqj9B3cp39JS2p
   sHDvztYfCkKmrRsRoxnJkoQMHJpQyQp+yyg7hAULBfAXbKl/gSRa3NRs3
   MWFLZpDI2zGl/SFDeuplx4OD8mBwhewrPX9JJnKhdNTUv79xBpR9EiHB4
   uXWTpU0jebSPC1iGUiQqtWEQVtPGEjaJSD7UhErgieqTUn7ScbZQHLT/8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="496293"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="496293"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 01:59:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913535819"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="913535819"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2023 01:59:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r90Iz-0003Sy-31;
	Fri, 01 Dec 2023 09:59:29 +0000
Date: Fri, 1 Dec 2023 17:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Ramirez-Ortiz <jorge@foundries.io>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv2] mmc: rpmb: fixes pause retune on all RPMB partitions.
Message-ID: <ZWmuRiVovprlOVQE@520bc4c78bef>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201095608.1022191-1-jorge@foundries.io>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCHv2] mmc: rpmb: fixes pause retune on all RPMB partitions.
Link: https://lore.kernel.org/stable/20231201095608.1022191-1-jorge%40foundries.io

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



