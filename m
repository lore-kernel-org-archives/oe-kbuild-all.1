Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363EE4424
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 02:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692154599; x=1723690599;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=BpadUsvJXDmAr0q0akrmpXCQ0ANUKEyvprrX6Az8xvY=;
  b=OHsqcBpWWYH8DxxRntHO+rx4BQ+zWVhzJc2uOjsHaQvk8BeOvTjVDuAZ
   ASLVVXXYJxWGOXLqz6pKSjsOql/VbWxr2Ud0ZJSxcOC3kviGmAZB/JmaS
   pruOWgFVZMIVX1Iy6ZPsmWVU0dQVHAw1sPYw4IEgrqQ46eV9+gHzsWEkN
   b5ylS8NZ9PN605DDSLW/DmBZxAa1MNj5iIPKq4alpPKfwv73P99RdfXJH
   1roWorLMvA4wPXTRKj0nxRtJ7BLDT1Q7fBouqHZ8DY3u+wU4DhkZu9Zb1
   gt/TP1oqvuobAWvc5/hsxH2+1g6pHAjLfnYURZtjUBv0W/VhfzasH1JPg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372424104"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="372424104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 19:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763486169"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="763486169"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Aug 2023 19:56:37 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW6i4-0001Qt-1C;
	Wed, 16 Aug 2023 02:56:36 +0000
Date: Wed, 16 Aug 2023 10:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhai <yan@cloudflare.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 bpf 1/4] lwt: fix return values of BPF ops
Message-ID: <ZNw603SSAV0rMiGH@de6b5a1e2688>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28cb906436e87eada712f55e63ae5c420bea0ecb.1692153515.git.yan@cloudflare.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v5 bpf 1/4] lwt: fix return values of BPF ops
Link: https://lore.kernel.org/stable/28cb906436e87eada712f55e63ae5c420bea0ecb.1692153515.git.yan%40cloudflare.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



