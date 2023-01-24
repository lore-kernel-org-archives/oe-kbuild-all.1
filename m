Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC8B8F63
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 21:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674595102; x=1706131102;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ty7ZTdLDSc2wb8AN+rqi8YHqWURlqUb203Zaw8pYjvQ=;
  b=NmJbFqo1mXrvEzmoJxi9MnczOLBW7YkilGsrd/0Oy9D1VdTRPsTzWRmV
   ulVogAHBSb26YXC79s3AqdcRUWhB0KEMnhpfeFv1Eqnu2OfbW7yX1ldxc
   GSG0eeCB5PJVK1k9zhU0bHX/k8MEltVX2FciilzgDm4IH3Zuw4sHfLpNA
   0lA+pTNJzFcNGfW0CT2biHI+pZo2Z+BCFhSw0MLKMwhM6bgB9lu1jMXTm
   i59gg8AFulb8QsTUS1inh9A6guTQm/3tJYzcuJ0aHWXce3F5jR88GyaTd
   2Bt8GyfIiwfaXz60aoSuzVp1gFDX7qiRlr3cez6sFIqOuKDnMWJl2wtK2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306070306"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="306070306"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 13:18:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="907661348"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="907661348"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jan 2023 13:18:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKQgO-0006mm-1b;
	Tue, 24 Jan 2023 21:18:20 +0000
Date: Wed, 25 Jan 2023 05:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Saeger <tom.saeger@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.4 fix build id for arm64 6/6] sh: define
 RUNTIME_DISCARD_EXIT
Message-ID: <Y9BK+z2pRJHnQ8dd@06a1915e439d>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7301d95edaf5bd0926bc93a67cb0cc1256549c95.1674588616.git.tom.saeger@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 5.4 fix build id for arm64 6/6] sh: define RUNTIME_DISCARD_EXIT
Link: https://lore.kernel.org/stable/7301d95edaf5bd0926bc93a67cb0cc1256549c95.1674588616.git.tom.saeger%40oracle.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



