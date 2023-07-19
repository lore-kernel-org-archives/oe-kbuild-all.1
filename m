Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A9E14A86
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 15:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689779976; x=1721315976;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=KLEyJTGbljkQ49lNNTsC1Gi2wbimOnnXCv1PmewCm3g=;
  b=YjX0iq9OLMjEtNuCtQyI3cCVizMCsCEOhsVge25nJd1LydRrgD6633Ze
   3vrfUAi1ktQcT/ww9YmWDSx1XtlG4dt9MKfJ/w2WLmoEa5pAKf/yJQ2UA
   keNxWtpVcfdn1GLma13tDlwenrMAnB0eyocYLXesYdrMJGdwo3C7kyH9O
   cmWY7cAUaoKxjIUcP2rxXi5lfRByTWKZk09kIjrsuE81ejngg1M/VcDAo
   rfDj+6Ge6pqCTwc58UK6FdKk/JM6K+uCODFiJKubjul4y1X3f3NHLfxfO
   od7kTEKtV4ApKD72mIU/7PDfDAHjAbewXli2lNe797/B4AoY23NxD0ywe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="356451845"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="356451845"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 08:19:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="848085208"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="848085208"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Jul 2023 08:19:35 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM8xe-00053H-0s;
	Wed, 19 Jul 2023 15:19:32 +0000
Date: Wed, 19 Jul 2023 23:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Van Hensbergen <ericvh@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/4] fs/9p: remove unnecessary and overrestrictive
 check
Message-ID: <ZLf+wZaouYvQCGaS@c507f7d2ae6a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230716-fixes-overly-restrictive-mmap-v3-1-769791f474fd@kernel.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v3 1/4] fs/9p: remove unnecessary and overrestrictive check
Link: https://lore.kernel.org/stable/20230716-fixes-overly-restrictive-mmap-v3-1-769791f474fd%40kernel.org

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



