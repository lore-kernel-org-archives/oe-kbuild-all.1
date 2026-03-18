Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5773536C9D1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 08:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821687; cv=none; b=oUkn4Psx/rNTKRugrBVNjVglTumzCD8WmTDjQ9BabX6hbTvTa6+DsBCKxQW+2X0y8luO8d+4DW5I88HoQY0BnHgJbip0dF6zZtW3aPiULcogUPpR+Hv9KEwZqlL61E/ycoCgxGq21N/4SqKqYpd5sJo44BZ9FixOiYuHF+TNfss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821687; c=relaxed/simple;
	bh=KnJQnAwoUMsLr/BjQ2p+6cnCTXVLGYccKQ2pW1Askdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nATgv/NyN1WVcgb387kSnaZBj4rtv4ghmj1g1zSe+djVdYQYtVzS5ykFHhOw3bS5do4NARkglXOnCYYXKu58PD2bz+Sybo8c2g4dNdat46Nzcztd0HYBN+wMVzHrf6eEtIuFSdvc6/NzJpn5iQscIH/7eaykmKXW8EFBj4rtp0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MK1CPFM9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MK1CPFM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773821687; x=1805357687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KnJQnAwoUMsLr/BjQ2p+6cnCTXVLGYccKQ2pW1Askdk=;
  b=MK1CPFM9jx3JeB2n2P2VRXL27h7/qDevkr2Qxnn8HxMbGpYbhxlmaJeN
   3orzQRW9MedhLAk4RFBRBw9Q23VFc3hB4urC+yndKQq20K6GI/IisxrhX
   OsNAG/b4H+3WS3VuNKFTJGXhCra0Ehaj8brUZYj9YpE8fhLG/zIY0eVx3
   DuBpsqk2x0dDg7IgQ6+cu+HKD232eWHdAmWPbkMnAhm6B41OMLJDQwZYQ
   Gg0iAacMMLCmVfl92eG0Ji+fMZ2nOkxvkkLl+3VqtuoY4dB9JG03Ij0Sb
   4zBAiYulOsj/XaszhEZ7CIKKd8Uhx/Nb+dxOM+LATceuGrtRfIyiL5jVd
   Q==;
X-CSE-ConnectionGUID: 3AU9UpAYRX2YffT422GZaQ==
X-CSE-MsgGUID: 6Jp5aXYsQreSPEC1cARSEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="75051374"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="75051374"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 01:14:46 -0700
X-CSE-ConnectionGUID: 2h8ZQetNT3CK/+F1r6g9MA==
X-CSE-MsgGUID: soGT5hiJSj2k7sFnrbUVvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="253026050"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Mar 2026 01:14:42 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2m34-000000002i9-3nhJ;
	Wed, 18 Mar 2026 08:14:38 +0000
Date: Wed, 18 Mar 2026 16:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Leno Hou via B4 Relay <devnull+lenohou.gmail.com@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Jialing Wang <wjl.linux@gmail.com>,
	Yafang Shao <laoar.shao@gmail.com>, Yu Zhao <yuzhao@google.com>,
	Kairui Song <ryncsn@gmail.com>, Bingfang Guo <bfguo@icloud.com>,
	Barry Song <baohua@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Leno Hou <lenohou@gmail.com>
Subject: Re: [PATCH v3 2/2] mm/mglru: maintain workingset refault context
 across state transitions
Message-ID: <202603181625.6juiPMws-lkp@intel.com>
References: <20260316-b4-switch-mglru-v2-v3-2-c846ce9a2321@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-b4-switch-mglru-v2-v3-2-c846ce9a2321@gmail.com>

Hi Leno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c5a81ff6071bcf42531426e6336b5cc424df6e3d]

url:    https://github.com/intel-lab-lkp/linux/commits/Leno-Hou-via-B4-Relay/mm-mglru-fix-cgroup-OOM-during-MGLRU-state-switching/20260316-140702
base:   c5a81ff6071bcf42531426e6336b5cc424df6e3d
patch link:    https://lore.kernel.org/r/20260316-b4-switch-mglru-v2-v3-2-c846ce9a2321%40gmail.com
patch subject: [PATCH v3 2/2] mm/mglru: maintain workingset refault context across state transitions
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20260318/202603181625.6juiPMws-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181625.6juiPMws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181625.6juiPMws-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/workingset.c:395 function parameter 'lru_gen' not described in 'workingset_eviction'
>> Warning: mm/workingset.c:395 function parameter 'lru_gen' not described in 'workingset_eviction'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
