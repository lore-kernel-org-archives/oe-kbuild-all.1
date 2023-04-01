Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2D98F66
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 22:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680387642; x=1711923642;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=4kuqPSh49FMYTQBRKaeb1OXc9xcn/MeEKSO5jhTpOxo=;
  b=h9MNQ4vF/lYe+bJP7gLwXsOOchzirzVqIY1Oi4fXtFysHlBXPT3GcwbW
   NvWSAn9wBDNzBH4Ia/pria+85IMc3DtEz+kAvbdonQDBsRJBMZasOqhzK
   SNMkVv3vw87lq8gE0DU7amuBzg9Fj+u/RV5JjUxSX1OOoFZcTa8gXinnD
   7HL5d0jkUB7xiJRcekYTl/ENi+Zc7YKuwJwk6s2aNbTLqTbBc1neosBE1
   IuoPvY1UYcpzRMua43+UhyffKJY3/CbZF62c9cwXG5VpbI5XUeRRL9Vhx
   ZBU6USD2gvm/I7V4BzI1caKMrJyS2siJe5Nx4OZYsaMmyl6bjaKGq8m5Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="404436021"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="404436021"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 15:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="685512484"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="685512484"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Apr 2023 15:20:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pijaS-000N4t-0u;
	Sat, 01 Apr 2023 22:20:40 +0000
Date: Sun, 2 Apr 2023 06:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Rongwei Wang <rongwei.wang@linux.alibaba.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm/swap: fix swap_info_struct race between swapoff and
 get_swap_pages()
Message-ID: <ZCiuGEkyk/1Afisk@ec83ac1404bb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230401221920.57986-1-rongwei.wang@linux.alibaba.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] mm/swap: fix swap_info_struct race between swapoff and get_swap_pages()
Link: https://lore.kernel.org/stable/20230401221920.57986-1-rongwei.wang%40linux.alibaba.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



