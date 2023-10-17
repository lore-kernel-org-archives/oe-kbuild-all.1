Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF03B450DE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 16:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOZ6q3z3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697559223; x=1729095223;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=6BUDwsOstiX6bA6rzmLlBk+HBj1WAjDr5Rz9qX+KMws=;
  b=GOZ6q3z3vdXlbBzOACA3J4BGonRva1u/GjvWJDhOI6HGr05vyhBVeL8r
   rDdc0GC8jqAyi/RQh9wOpQSggvszm77rbDrNVcYSGVmXMrVWImcik527o
   FzidL+Zp7Q/PKnzolo7EVXj76r9vfF6hMv1S+9o18O1cufkUj13dF7M9X
   hi6C+JasWfyjFhkY66SQi3r1K/l3MIuQfdAUvMAM7iw2/p0QdyCRFPHI6
   wOl3m5kaLjkZlcr5XiWAovs4408260mk+KZE4n7mvzXRZdGpbDWMRlF9H
   UFnIYDtPmc2TpVakH2Ku5xNaBr7qKOnFqyD27d5aBKL0/jsNppnoMsdtF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="472042576"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="472042576"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 09:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="756175115"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="756175115"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Oct 2023 09:13:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsmhO-0009nD-2V;
	Tue, 17 Oct 2023 16:13:38 +0000
Date: Wed, 18 Oct 2023 00:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] soundwire: bus: introduce controller_id
Message-ID: <ZS6yhIG6G8SlkN01@36731e0f0762>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017160933.12624-2-pierre-louis.bossart@linux.intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [RFC PATCH 1/2] soundwire: bus: introduce controller_id
Link: https://lore.kernel.org/stable/20231017160933.12624-2-pierre-louis.bossart%40linux.intel.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



