Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A7D632
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 02:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691547263; x=1723083263;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=poQc4ujfbZdGOJ3ZmkcHS2yZqI1dahU1OB5Zoi6d1Ac=;
  b=GEoudtO3QeHBw6EaiZIwlC74LOL9JsH2Ui5nKcIJEm8ye2mNlanwUBoX
   GYLnC0g2HV2aHov9tF6LWy0PSdOq4roWrTFdF/8sK6NlJPZh0KFq06PAt
   bLRibK+PF/A768Wv/prvfyZwIVPc+oHeiNY/zbF0nHU89PR+AHLOY8zUi
   Mz+vAPkK0VnLQS/9tPwhqzXYiqOMINQk5iW1MflIjg9CUqw1R+MSX7/aA
   nqV9f5WOgs+GYYE6nhPf3DP2VioGQu/mMe0nBBPvKmQmhE1HmPzY2jF7b
   CxhXCHDQXqIZunsDYnXWVhcw6eddlLCi9O7HjsFgGo5JwKRLgo0SN11IM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350590550"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="350590550"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 19:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766627299"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="766627299"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Aug 2023 19:14:19 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTYiI-0005jc-2p;
	Wed, 09 Aug 2023 02:14:18 +0000
Date: Wed, 9 Aug 2023 10:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jijie Shao <shaojijie@huawei.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net] net: hns3: fix strscpy causing content truncation
 issue
Message-ID: <ZNL2du77IoeMjMr7@11d7ca01dc46>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809020902.1941471-1-shaojijie@huawei.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH net] net: hns3: fix strscpy causing content truncation issue
Link: https://lore.kernel.org/stable/20230809020902.1941471-1-shaojijie%40huawei.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



