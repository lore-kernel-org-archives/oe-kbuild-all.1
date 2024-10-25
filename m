Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D0A18A93F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 03:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729827105; cv=none; b=TCZo2n1ogpN9P7fD03CcRMXjAuQFtNtexP8tmoqsplWXxPGVwOZ1t+AJ6hcE/kTH3GFj3eXPC2u4g4uHxEZJK/ktAYmLb8QAZai2wFY1HSdHW1m0eeX6rWa6WeLM/Lcq35hHWRewETuWMwPGeJqGDGkbdXRG/J1NVv+lpr3Fv3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729827105; c=relaxed/simple;
	bh=yKWhaHoKwMvKgUCvzoCF4HnRBfeVm1f1O/hBJcEF5YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQGhblVGMwLA0tI3RmTz9GNJfAJ9TBE+7tk2wf0RJ+5Kz5NH6N56Q4tQlyrRukvZOTYG21xkz8G6LDULVIdpmsoyLt8xAhln62c6hmZZDZcGSWi1PA+0ZV9/EWlmEIyv5MPbb+cTpV0aw9h1xR3N+E9p445TcJQQnzeYNJ5e8cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaqF4XzV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaqF4XzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729827103; x=1761363103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yKWhaHoKwMvKgUCvzoCF4HnRBfeVm1f1O/hBJcEF5YI=;
  b=kaqF4XzVtGfN8UeayiYw0IYK0OFdmWQhkFvx7VnMrDTRlYmArdzcqob/
   NHlCBeImh1rMwdtdKSU/z0GWfyYyDAnstKq3crqv85YxU6iCCNf+IaB6u
   RXTE/Gtif5YfBUR6x8qKYhJONo8QH+lNGCwmDT4z1jzIaxKksP6GAShKG
   IApx14cDFSy/oxsDaMyeSwpBGGeGMPQsKUlrvfSzZTmpnErZmP1iDi43Q
   oTsxUl3+CDuP6IWUl+zKaG4r0JrJcxxXdBfH6vVuOvD2i2NYrKihQ3qU1
   vzPC89maaDAxzs5o3diK5xWJJhsEdCVQglmYNDWSP0myf8hgQ5tKQo53g
   w==;
X-CSE-ConnectionGUID: EpRokBe2THi7r3sJYNIKjg==
X-CSE-MsgGUID: 9NSEDmYSQVybGQqLDyFQfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40031844"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40031844"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 20:31:43 -0700
X-CSE-ConnectionGUID: EIGL+UZNTIOmbDWB+69qkQ==
X-CSE-MsgGUID: xYWNKBsnTZeV8O9mUQFEhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="118257848"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Oct 2024 20:31:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4B31-000XXC-3D;
	Fri, 25 Oct 2024 03:31:35 +0000
Date: Fri, 25 Oct 2024 11:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org,
	tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	daniel@ffwll.ch, kong.kongxinwei@hisilicon.com
Cc: oe-kbuild-all@lists.linux.dev, liangjian010@huawei.com,
	chenjianmin@huawei.com, lidongming5@huawei.com,
	shiyongbang@huawei.com, libaihan@huawei.com, shenjian15@huawei.com,
	shaojijie@huawei.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 drm-dp 4/4] drm/hisilicon/hibmc: add dp module in hibmc
Message-ID: <202410251136.1m7BlR68-lkp@intel.com>
References: <20241022124148.1952761-5-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022124148.1952761-5-shiyongbang@huawei.com>

Hi Yongbang,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.12-rc4 next-20241024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yongbang-Shi/drm-hisilicon-hibmc-add-dp-aux-in-hibmc/20241022-204925
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241022124148.1952761-5-shiyongbang%40huawei.com
patch subject: [PATCH V2 drm-dp 4/4] drm/hisilicon/hibmc: add dp module in hibmc
config: powerpc-randconfig-003-20241024 (https://download.01.org/0day-ci/archive/20241025/202410251136.1m7BlR68-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251136.1m7BlR68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251136.1m7BlR68-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.o: in function `dp_link_cfg':
>> dp_hw.c:(.text.dp_link_cfg+0x250): undefined reference to `__udivdi3'
>> powerpc-linux-ld: dp_hw.c:(.text.dp_link_cfg+0x340): undefined reference to `__udivdi3'
   powerpc-linux-ld: dp_hw.c:(.text.dp_link_cfg+0x384): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
