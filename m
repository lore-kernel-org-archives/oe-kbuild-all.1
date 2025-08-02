Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC86D2E3707
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 19:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754162986; cv=none; b=LvRy/chZnCpsUDfjXQMU910Q7KOgqOmD8+SW3v3uGtRBn1RrMscFeOeFm77mvHZ3I9zG68DSbzjaXnK42VSKKI9gE+VKITdvVCDznqIbHnMyPM85/ysrKS1MD/oNlnTbVloZ0wh0KNSumQxvxD95iCgFN+DbLeq1auKa0FnICh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754162986; c=relaxed/simple;
	bh=+/QTWzxfNBauGebD1CBaPSVGBChyhYoPS3yVXv7eySA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dv9GKkOgb/jlWJrrfKxMcuBDkHcdyw6a+EyUid6kgkLNBftCb+4eQGy1Kk/wDvhZgSPeL2u+2k5j04j9sTqFlx0I1OnC5wR1YAKqiLoIeli+qDIoP1DnTNKplgLrE/VnNmYQ+bJNIYCnAVLNYpBE7nQl/U+7XKJdyalRJ9/q9tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOJvPPd7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOJvPPd7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754162985; x=1785698985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+/QTWzxfNBauGebD1CBaPSVGBChyhYoPS3yVXv7eySA=;
  b=YOJvPPd7ZqOu+OlXRU09BZg5bTywEe4yxkvRHOh0GcwvEgQbiMph/QzV
   XeyEaqhqosCPeAeG9z6f7AJW2oJxZUCRZAQldbzaYhky++vAULy7QRXAh
   sIChvLGk8B3QnvrDM4QE+tO1kQpB5nsto/5fWwvdKgBCn2mvRE0SGk1VQ
   b/pkA8u4hzsP9BSce+nBdJ5VXzN4Ybaj8XDsDj3FI0DI7nSsTGIachNNR
   SMW+kD5/7SfEZpavyVOqII1o0Lag4kBvCmfS3Yn1iac+s7Li+lSSuy12Y
   MFxh6WNzHpG256BGcQA3oqs3i9fjQ2ov3YTwq2rT5v0lHuE+JdSeQSVgY
   g==;
X-CSE-ConnectionGUID: dF5/kiR3RreJvz64KeAZHg==
X-CSE-MsgGUID: YnjxCQ9sQ32hxq7qr6BoEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="73938171"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="73938171"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 12:29:44 -0700
X-CSE-ConnectionGUID: g5ktq/l+S1i7+WHT3x0oYQ==
X-CSE-MsgGUID: l0rOYgA3Q0Sj1pVRlJBunA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168086287"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 02 Aug 2025 12:29:43 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiHvI-0001TL-2v;
	Sat, 02 Aug 2025 19:29:40 +0000
Date: Sat, 2 Aug 2025 21:29:33 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2630/2630]
 drivers/crypto/ccp/hygon/hct.c:1730:51: error: 'struct device' has no member
 named 'numa_node'
Message-ID: <202508022114.U6JGKku3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8fa27fba5fd9db50ef3d03358c9abd371dcbdd99
commit: c74ae2c5da57becf3f41c596d79b3dd30fa1baa6 [2630/2630] hct: add mediated ccp driver support for hygon crypto technology.
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250802/202508022114.U6JGKku3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508022114.U6JGKku3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508022114.U6JGKku3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/hct.c:1333:15: warning: no previous prototype for 'hct_pin_memory' [-Wmissing-prototypes]
    1333 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/hct.c: In function 'hct_get_page':
>> drivers/crypto/ccp/hygon/hct.c:1730:51: error: 'struct device' has no member named 'numa_node'
    1730 |         *node = hct_data.iommu[page_idx].pdev->dev.numa_node;
         |                                                   ^


vim +1730 drivers/crypto/ccp/hygon/hct.c

  1713	
  1714	static struct page *hct_get_page(pgoff_t page_idx)
  1715	{
  1716		u64 *node;
  1717	
  1718		mutex_lock(&hct_share.lock);
  1719		if (!hct_share.pages[page_idx]) {
  1720			hct_share.pages[page_idx] =
  1721				alloc_pages(GFP_HIGHUSER | __GFP_ZERO, 0);
  1722			if (!hct_share.pages[page_idx]) {
  1723				mutex_unlock(&hct_share.lock);
  1724				return NULL;
  1725			}
  1726		}
  1727		get_page(hct_share.pages[page_idx]);
  1728	
  1729		node = page_to_virt(hct_share.pages[page_idx]) + PAGE_SIZE - 8;
> 1730		*node = hct_data.iommu[page_idx].pdev->dev.numa_node;
  1731		mutex_unlock(&hct_share.lock);
  1732	
  1733		return hct_share.pages[page_idx];
  1734	}
  1735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
