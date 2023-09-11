Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE6E3C00
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 21:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694466707; x=1726002707;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=mWgtCVmKPqA2E8zQpkjF3rRyXTVHC18ScxYxOWRMjd8=;
  b=cjp3Fj7kCHmc5iJfuphQzyXfiaQ7Jl5WP7pHJQ+1LhbC7LvpyGAbNfuY
   E39ljKbY27GudIGK5y/H8kvrRWk9E9lvjUMSUUaNCSFJ2YlIGDijvblnC
   vyiimNCgsLBEQuVq7CgqQhz6QJS2PYuXFm1T6Fkx4Ek3pxHmb+HV3Rwt1
   SBqe1z81tSIADdxts1IWwLJ03tOLbS25T5Slvyn4jyWs+UsnB94CJqv7W
   Bvz9nE0ZRbZwOKYki3mb9asaAd9h9xqKWI+ksXJYIf681IFUcKPgQLa8n
   1CkQ/FDyOOfogzep1o6+NzH41Y1epnBld67hgRXnKMyuKofzamg+/pli7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="363239070"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="363239070"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 14:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="736904137"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="736904137"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Sep 2023 14:11:42 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfoC3-0006jY-32;
	Mon, 11 Sep 2023 21:11:39 +0000
Date: Tue, 12 Sep 2023 05:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] Documentation: stable: clarify patch series
 prerequisites
Message-ID: <ZP+CgXGAN+Rbdrnh@0091dd92274c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911203628.20068-1-hugo@hugovil.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] Documentation: stable: clarify patch series prerequisites
Link: https://lore.kernel.org/stable/20230911203628.20068-1-hugo%40hugovil.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



