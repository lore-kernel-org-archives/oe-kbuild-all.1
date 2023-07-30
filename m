Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE127380
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 01:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690680797; x=1722216797;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=gy8t2VvZzhoSFIgkjth9Vc54fK/BhJChXX8gCqxm1WQ=;
  b=h1NvlUULuOqJ9S1OYdvNBItfrbCNuH2mEFhMNbm74T7KKURlIh9yHSnQ
   P/Xydu9AbkQCbUuakPZAIwx619N9teTw2fwmAEwAOyIKJvONYfue7FuKt
   TfeI+A3ZpdkkWqLg2ZIuPH7wZRK5itCII2WyBls7y0oJaW4qIY8GbZOnH
   JWRaQ7IYMGH2mAdmQKKPlkEqzKxV+dsWwlPxrQgYObPdMM1NYx3zaYMAy
   6V+wdq/1YS0vvVeuAuCy0q/ntUp11NsCgT0VEQ3Sm7Lld89mEGcmXB4tk
   L1fsSHdhkyp9Pzu56PXSNcd9jZ3ANFaNdGBTJfo5xSQz/i8qfu6fPlcIn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="455164583"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="455164583"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 18:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="727859919"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="727859919"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Jul 2023 18:33:14 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPvIr-0004N7-2V;
	Sun, 30 Jul 2023 01:33:03 +0000
Date: Sun, 30 Jul 2023 09:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] rust: allocator: Use krealloc_aligned() in
 KernelAllocator::alloc
Message-ID: <ZMW9qB3Bw6KFCUdM@c507f7d2ae6a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230730012905.643822-3-boqun.feng@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 2/3] rust: allocator: Use krealloc_aligned() in KernelAllocator::alloc
Link: https://lore.kernel.org/stable/20230730012905.643822-3-boqun.feng%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



