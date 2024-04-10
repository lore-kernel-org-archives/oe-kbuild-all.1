Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838FB16EC15
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 15:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762600; cv=none; b=GaedVl3xpfQL/YipjNg1lG16mK+Pfw6EgEniK/e9v143+jTVxzIynTyxeE7dw8/UOQ1XmnzS1JctsHHI8li+IdTnDE00J0ZJgGuCQBTHfhK/Za4JUqCba1TS/6UDR+r9wGBMi/t7xlOCLk4ums4rvJPA7mPyk3C7RQ03eWdYxVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762600; c=relaxed/simple;
	bh=VQ/GfqrL5AkxSHgXkurKnOzHHPNc6m9XV9Z986Z9VD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p12rvT52OUaUAPWJ09EM9y35Rh7+lV2MsjMUCFejk98GzwsFhREz8jl4bnS7v7TSpnAMGq+C4SQ9PM3aWUgxaLe6oT0sq9/HBUQsQwMHtYHyqY7US6+MMeCfMrVYPIKlrz1YA2Nj5l1Q7OfTZWugFj1eFQL7+EtxCzsyRlKgNEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FegKC3Zk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FegKC3Zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712762599; x=1744298599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VQ/GfqrL5AkxSHgXkurKnOzHHPNc6m9XV9Z986Z9VD8=;
  b=FegKC3Zk/VTuZmbtRa+OAtFaZtGdBa2/VKtuHSzXbEoZZpA9ylyVFJkD
   PphtCP9wxZGdiYSxg8p9qIv2StYm6JQAXniWP37wdu3CQJiivOqD2YV7/
   PHzKJ3fiDBsYxNrGMWRxtEV2ys1xO9Ls0/BfvGhrpnsAcGCClY4jDPZBW
   U1ucP5q1P8MUBjsnVnS1ptxc0PuEv7/ol7m1DZiDP8runHg5FQFq4SgoY
   +ilZSQaZNBjVzXFV/Zt4VCTbnJyZAHeXKgMjTz8CmAXNJcsH73BvkDDy0
   12ar8uAIqpCKroBfaf2ks1QA1TkQ7YXxrXhbpagfrShpHTnbIGBX+iGPS
   w==;
X-CSE-ConnectionGUID: teLH2/ZRQWevbYn2hukHqA==
X-CSE-MsgGUID: /XpJ90McQoWKgMBZfGGWfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19559862"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="19559862"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 08:23:16 -0700
X-CSE-ConnectionGUID: 2uwP0iojTkqWn19aDX7hDw==
X-CSE-MsgGUID: to1heVCeToGWFx305hCQGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="43852820"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2024 08:23:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruZn5-0007WS-2A;
	Wed, 10 Apr 2024 15:23:11 +0000
Date: Wed, 10 Apr 2024 23:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: zijianzhang@bytedance.com, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, edumazet@google.com,
	willemdebruijn.kernel@gmail.com, davem@davemloft.net,
	kuba@kernel.org, cong.wang@bytedance.com, xiaochun.lu@bytedance.com,
	Zijian Zhang <zijianzhang@bytedance.com>
Subject: Re: [PATCH net-next 1/3] sock: add MSG_ZEROCOPY_UARG
Message-ID: <202404102247.qzN9N0Il-lkp@intel.com>
References: <20240409205300.1346681-2-zijianzhang@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409205300.1346681-2-zijianzhang@bytedance.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/zijianzhang-bytedance-com/sock-add-MSG_ZEROCOPY_UARG/20240410-045616
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240409205300.1346681-2-zijianzhang%40bytedance.com
patch subject: [PATCH net-next 1/3] sock: add MSG_ZEROCOPY_UARG
config: x86_64-randconfig-r081-20240410 (https://download.01.org/0day-ci/archive/20240410/202404102247.qzN9N0Il-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404102247.qzN9N0Il-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404102247.qzN9N0Il-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/un.h:5:
>> usr/include/linux/socket.h:45:2: error: unknown type name '__u32'
      45 |         __u32 lo;
         |         ^
   usr/include/linux/socket.h:46:2: error: unknown type name '__u32'
      46 |         __u32 hi;
         |         ^
>> usr/include/linux/socket.h:47:2: error: unknown type name '__u8'
      47 |         __u8 zerocopy;
         |         ^
   3 errors generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/socket.h:45:2: error: unknown type name '__u32'
      45 |         __u32 lo;
         |         ^
   ./usr/include/linux/socket.h:46:2: error: unknown type name '__u32'
      46 |         __u32 hi;
         |         ^
>> ./usr/include/linux/socket.h:47:2: error: unknown type name '__u8'
      47 |         __u8 zerocopy;
         |         ^
   3 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
