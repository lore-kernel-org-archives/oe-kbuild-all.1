Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F5D4314E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 21:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qqkn7u+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700258000; x=1731794000;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=XfRK9CbmnDT/JoiBfxphuvqDLe9o1PMhJ9EfQAHyHSI=;
  b=Qqkn7u+oBvZ7EMt961BQHaXFd/eZz3BFFla58CbLq32iJlEmf21S/d8Y
   jLiwSkchrA6MolSJnfHj9/N9vAmRa22aHxUYXFoSsEbRTcbr7PrsKItvd
   Ckgi8x9RJHQTB+xEw2L5Vjf3Oj6xCgQhpXi1SrR0HTfCYd/RnTrUD9PH7
   4p8ofrwHmkXmSMzIpBbtgqVHLzpz2xt50Lw1Hid66MwWQ1DiexffDk9SB
   nro0JfTaFAdBzZN35KbfuLttlwHn91AJswhvEHimD5/vbcQO1nglq/BIz
   b0fMc1V5hDhT0ttoHy2sUMuSSshRj77I/x7vaAinRXFXS4jKGG3Pf0fOF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="390233832"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="390233832"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 13:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="794939787"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="794939787"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Nov 2023 13:53:18 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r46m4-0003Bf-1G;
	Fri, 17 Nov 2023 21:53:16 +0000
Date: Sat, 18 Nov 2023 05:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 2/3] drm/panel-edp: Add auo_b116xa3_mode
Message-ID: <ZVfgteWalvTIXj0r@6473735b5665>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117215056.1883314-3-hsinyi@chromium.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v7 2/3] drm/panel-edp: Add auo_b116xa3_mode
Link: https://lore.kernel.org/stable/20231117215056.1883314-3-hsinyi%40chromium.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



