Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ACB19454
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 20:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695328401; x=1726864401;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=iLjy9nWYiDfEjO8IDkKLFjNEHW4QIXVu6B9F4PvQ0jA=;
  b=JH8vWxH1OQCW/lr56SZ+K35tsJPpG3YAPWZQYWXZCEkdpRHper5IIA1G
   ZV/ybeacHxglpvt0wmuc05phLLlPxQXIcMILShfnR2B/ko4LZ5ctvAhXW
   1y8ngI5lRn6+8yA75xnbvFRgdcSRtx0X5DiItxgiGD8z8DDqyHd30SQUQ
   V74z6XONL4kNFIgRYL5iCRjIqmTrbWtczR4A8ioL0dW2rOAWe4aa6fVIy
   EBmxJ1cTKINwH0XDdR+AXthkRFgy4XTDUCyOnWSYOi7dtQuYhFU2lH7kF
   U+H4Zm4KkFaE68DXNiyhuaHrQhBxbaNTXnv5PCkNx9ozYVBc8dxRYTg24
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="384496512"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="384496512"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 13:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="994237709"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="994237709"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Sep 2023 13:33:19 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjQMP-0000NP-0Z;
	Thu, 21 Sep 2023 20:33:17 +0000
Date: Fri, 22 Sep 2023 04:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Saranya Muruganandam <saranyamohan@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] block: fix use-after-free of q->q_usage_counter
Message-ID: <ZQyoUx9NpWfL4ED4@a36b5d0e9c41>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921182012.3965572-1-saranyamohan@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] block: fix use-after-free of q->q_usage_counter
Link: https://lore.kernel.org/stable/20230921182012.3965572-1-saranyamohan%40google.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



