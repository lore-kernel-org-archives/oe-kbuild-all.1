Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E377EC3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 07:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qr2Odr8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699945837; x=1731481837;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Wsd1dNobSgH5+Vj4kvT0DqHCzxu1TzV1I8J+rJSJoZM=;
  b=Qr2Odr8dZFlvYxo5U9phV88mQZpARpNU/snG9Gi9b+Vche0UdDH9qCQH
   KVB72Rl4SF8mT2lBr8Aq4sp03uL/CCDEu+hbvmO38ZZ3Z87zJ6AiKu0vi
   Fl10d4MV5qCN+WEOt6BihTIt8OxHLTmbOe9Fdhg1ZqUmL0jZyqZd6pewO
   ZBdLg5zuq5qAyxCr1tAUPZkyJgBQhk29Xgve1WL+HbmBPLNg5r5L/dvrF
   9R7ll6P9KkPsiHmsFQ8jLSr7xHIDiil3zVs5j1fkvD53RPf7riJ4kaYnW
   L0Cxaxh1xxP0jBWikx0tYoNBKai/2YQ6M3d3sZACkAT2Z4iUGrvYP+u4k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="380995766"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="380995766"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 23:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="12704609"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2023 23:10:35 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2nZA-000CzG-2j;
	Tue, 14 Nov 2023 07:10:32 +0000
Date: Tue, 14 Nov 2023 15:10:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] PM: hibernate: use acquire/release ordering when
 compress/decompress image
Message-ID: <ZVMdS0CPNHC3lMhL@a0c8cbd5f24d>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114070553.1568212-1-zhanghongchen@loongson.cn>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] PM: hibernate: use acquire/release ordering when compress/decompress image
Link: https://lore.kernel.org/stable/20231114070553.1568212-1-zhanghongchen%40loongson.cn

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



