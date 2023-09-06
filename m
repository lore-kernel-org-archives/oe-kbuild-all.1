Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E23AED6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694002870; x=1725538870;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=fHYfpkIsS+BNTwBAGWqNHnu7ZNRge45RP0BTI0HTUWk=;
  b=QvTqhmIWA+gJRZmARoHCo1cnTjCA/0bTMRHyjczyHDCEf/94Q2eIAJ/D
   5X+XxIePEKqfsk7hAPeWiR66CAN6Hlf/iHf6J9Prce2aqo0YGC8jtl3Nt
   hMBJVbKzS5ZTZsH5Bi03p+XY2bIOFm4YLzQdBWyj9mWgEFLHdvibj5t2S
   pMtLJYLcz6YxL99MTH3eFHTD6/ILg4qoX2ptUZThSHb6gHNY6OZQXRd8E
   rq8DkLs8pufTmIF9w7gDIBPl7ZOOFp52WnVO/6xeHsnWfzR3WAdXSDwOk
   r8O2ns/AikhXcCLBbsDKtiYYXoDCNwu42yQfDco3JQj08a5Kb7I/d12jr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356536362"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="356536362"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 05:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="806985490"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="806985490"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Sep 2023 05:21:03 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdrWn-0000CF-11;
	Wed, 06 Sep 2023 12:21:01 +0000
Date: Wed, 6 Sep 2023 20:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Rathore <deeratho@cisco.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [v6.1.52][PATCH] Bluetooth: btsdio: fix use after free bug in
 btsdio_remove due to race condition
Message-ID: <ZPhuqHNxhF8AhdL4@0091dd92274c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906121525.3946250-1-deeratho@cisco.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [v6.1.52][PATCH] Bluetooth: btsdio: fix use after free bug in btsdio_remove due to race condition
Link: https://lore.kernel.org/stable/20230906121525.3946250-1-deeratho%40cisco.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



