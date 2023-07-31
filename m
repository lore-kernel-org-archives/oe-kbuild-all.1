Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE811D2EE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690823772; x=1722359772;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=t/kOQoyzK3nu1Futg8B7/Dv6FaL89RylOYNnhboqiCg=;
  b=PCYJQaQgi9C5AWItjsIZkVazOyFlAas2dSkuSdKV9ECS/iT0vDWpQ1qs
   2CsNLMEqTWeQcIz3a28MzSHpO9CZ4K+07PJSTyZF/27/MNVhyowm7LMK0
   bcy9IuzV2M+tC6CzF2uBh440SnntJC6Ffn/qvZOBn0MBbyPwJAJXXK8f0
   kEcFFnOw5GnT1tNL4zcjOEUSwtsFhW6IxWNf2IfJ8etEGE2u/07AVZkof
   S0RYrh7nE90p9f71qx3JBRemyeT4nA6TQSjAY95yX3kWt37g0sFzVzceu
   xxqHBCkNSFfZv1LdNvh5g3p0K5VQ1dvgtPcQYWnpUuBLQy7W5bsom/X2y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="432902161"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="432902161"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 10:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="902217006"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="902217006"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 31 Jul 2023 10:16:10 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQWV8-0005Fh-0I;
	Mon, 31 Jul 2023 17:16:10 +0000
Date: Tue, 1 Aug 2023 01:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/6] mm: for !CONFIG_PER_VMA_LOCK equate write lock
 assertion for vma and mmap
Message-ID: <ZMfsESOmBdOl6v8L@c507f7d2ae6a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731171233.1098105-3-surenb@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 2/6] mm: for !CONFIG_PER_VMA_LOCK equate write lock assertion for vma and mmap
Link: https://lore.kernel.org/stable/20230731171233.1098105-3-surenb%40google.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



