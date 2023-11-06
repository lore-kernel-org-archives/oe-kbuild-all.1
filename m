Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0D1F9EA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDMjitLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699259439; x=1730795439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JYJ3UAqt2LA+9s63D4dixosHg6tgpCCu7wy54TKZmmc=;
  b=iDMjitLZ4TYdU5yd6Z6UqWz7+9fq+RFjZIdyrx9TxOkCs43EhR+vsFpM
   paB7SPLQPvuhLDRdv04akrfLC6hkkeTyj/+7vnmp7A43qZptsagj4OUaY
   1E7UJsKWITyGZCUXFnK7ktHDXjWAPt8BmUdoGenEXgawKTSsF7+4/XYOB
   ykkH85B4ofqjp1Cqa8mNQhz70FwqfZ3xlqulHvJQLVI4mBdQE5v9C7vvG
   ZHUJC8U6fswlVyS9yvU8DLidVjHNwupla0kTWmo6jM61VFnR/6qbbLhm5
   oLVnL7y+Nx25Nq62qbdPBg0vvHQov85UylWax7oW+ICoo+jWOPQJAeoy8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="392098006"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="392098006"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 00:30:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879359698"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="879359698"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2023 00:30:37 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzv0F-0006Gl-2j;
	Mon, 06 Nov 2023 08:30:35 +0000
Date: Mon, 6 Nov 2023 16:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luca Coelho <luciano.coelho@intel.com>, linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING:
 Unknown directive type "c:namespace-pop".
Message-ID: <202311061623.86pTQrie-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jani,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: f6757dfcfde722fdeaee371b66f63d7eb61dd7e4 drm/doc: fix duplicate declaration warning
date:   4 months ago
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061623.86pTQrie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061623.86pTQrie-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING: Unknown directive type "c:namespace-pop".

vim +143 Documentation/gpu/rfc/i915_scheduler.rst

   139	
   140	.. kernel-doc:: include/uapi/drm/i915_drm.h
   141	        :functions: i915_context_engines_parallel_submit
   142	
 > 143	.. c:namespace-pop::
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
