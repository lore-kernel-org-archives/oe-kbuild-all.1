Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D463CF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 01:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750381451; cv=none; b=dPqBrehv6ktRUS29pxGXJiQGjHyqNfHRb6cELv+mFyL6uJo8IZT7+4PMB6/6TRVKsyrj/Dm0KB2UUc2GZaznsnG98iGtrqcS4PA1HN4jo29cxKHEZ1l53xsDC1casG+Rsv5OhzMK61HtiiC2MyUJR9y3J73LyUBzVpshMx5BgHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750381451; c=relaxed/simple;
	bh=kmdm6mk3TFNj4zb7AKCkRuSXwITo9jDnrXLuFiMdoyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoWrDzQeEtC9Py7qd/XK42rF1wD6VqfX/plTZqkEum23iiUAoAqGOVoKhQOFURAI8CxK5wHpdi7lyZJE8yk/ev6YDC12AtWUUG8oU6psXeSf5kTy+c2mEd4n/8xTECDl8L5w5fByD1ATa7MqikU3/074qK9BJngWB+PRNtz8Pw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQv6zsef; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQv6zsef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750381448; x=1781917448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kmdm6mk3TFNj4zb7AKCkRuSXwITo9jDnrXLuFiMdoyE=;
  b=iQv6zsefw6Cc9IltiDNxxmMMv2mYTKhtd5di9y39HEBhqLOsff4FdJJ0
   d+RZdAFX+3MSSvfm2ESg4+SAoiK4bhMHtIJE9ZiUgmJBF4Q2XVhjoZtNx
   CKq9Sfau1S0WkZVaGgikUp8IHmEAVCSpDuManzbW7A7QvU4o8W/k8CHtr
   XUCyWtRq7/oiL+z5efkE/dfCC8mEw23VSpm1Rul25xR88BTfoyebXVpHv
   WFN1wOsb7mQIVgTCQqJWz6BgIjcDpxaiZv4uzDDo9g/h4IsJVjz+G1Ebv
   Ny223gMdy7cgcH62D0uJ2tN1eNYvLqITGQ0bxxABngCjd11ALoaupUmB6
   Q==;
X-CSE-ConnectionGUID: Xw8CXBdhQti3eW/QxIOjUw==
X-CSE-MsgGUID: 4T+Unv1pQe6r9Nucm1yO7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70202811"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="70202811"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 18:04:08 -0700
X-CSE-ConnectionGUID: KSj2M76GR0eofUIcdAdsNA==
X-CSE-MsgGUID: itbOam2KQ6Sz08FoBNt3Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="150979298"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jun 2025 18:04:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSQAm-000LEo-2J;
	Fri, 20 Jun 2025 01:04:04 +0000
Date: Fri, 20 Jun 2025 09:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: Erni Sri Satya Vennela <ernis@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next v3 2/4] net: mana: Add support for net_shaper_ops
Message-ID: <202506200821.PCKoFC9H-lkp@intel.com>
References: <1750144656-2021-3-git-send-email-ernis@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1750144656-2021-3-git-send-email-ernis@linux.microsoft.com>

Hi Erni,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Erni-Sri-Satya-Vennela/net-mana-Fix-potential-deadlocks-in-mana-napi-ops/20250617-152001
base:   net-next/main
patch link:    https://lore.kernel.org/r/1750144656-2021-3-git-send-email-ernis%40linux.microsoft.com
patch subject: [PATCH net-next v3 2/4] net: mana: Add support for net_shaper_ops
config: x86_64-randconfig-104-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200821.PCKoFC9H-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200821.PCKoFC9H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200821.PCKoFC9H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/microsoft/mana/mana_en.c:804:3: error: field designator 'net_shaper_ops' does not refer to any field in type 'const struct net_device_ops'
     804 |         .net_shaper_ops         = &mana_shaper_ops,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +804 drivers/net/ethernet/microsoft/mana/mana_en.c

   793	
   794	static const struct net_device_ops mana_devops = {
   795		.ndo_open		= mana_open,
   796		.ndo_stop		= mana_close,
   797		.ndo_select_queue	= mana_select_queue,
   798		.ndo_start_xmit		= mana_start_xmit,
   799		.ndo_validate_addr	= eth_validate_addr,
   800		.ndo_get_stats64	= mana_get_stats64,
   801		.ndo_bpf		= mana_bpf,
   802		.ndo_xdp_xmit		= mana_xdp_xmit,
   803		.ndo_change_mtu		= mana_change_mtu,
 > 804		.net_shaper_ops         = &mana_shaper_ops,
   805	};
   806	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
