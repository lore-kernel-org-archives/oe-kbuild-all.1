Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B36145A11
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728838681; cv=none; b=YYSVVOS4ht+1Dw9mNodqyRlLlvsPTeRkGJcLMGHL8yZGF+ZprQfqOtxrIv/5F8E7dZ14mqvQRZ/3GHTAIZ1IhhAjCk3nCjQoFp9roBxR298qPvf6DwBjA5/w+KWVDKJ++K6NP82f8hfGtj0puVET5QKzJUXyBIiN7jAJIxKxSBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728838681; c=relaxed/simple;
	bh=TbR168Sj7CS7YA2Ooa78XEKAPlfs1gJ0em1iD5I1ZRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYSxa5KThFJwdtto9plNy2dHy4nVDi+fWkdhzorMbyYg6Bcaa20l2re28wykZLSgYtYn//9GFdlBzH392yWRClvlAX+ArIcbM85jm+MrX1j2BmPst4llZXGWhgaca++Ge5ULCUpt02P3P9DPH8LOCkld5gLMOr1F/rKR6rkev5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpgQ17jD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpgQ17jD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728838679; x=1760374679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TbR168Sj7CS7YA2Ooa78XEKAPlfs1gJ0em1iD5I1ZRg=;
  b=XpgQ17jDNqB8z1C3xKTGR7n2fIPQRX7kDZ/QWvqahDtEDI6F6ddLIivV
   WgLXclJiGgO0xLAOPLmG2f7yEZTrrrQq0yxK/H59S3Aiik4j2zrq3XzNz
   Z22g7k7MXIjYqfeBbeqypgAwHPgm3ZU14JIZuWDybXWMKtLNSPNED1JcB
   mG2AB+5jFAWnbrjcMUxM/mjOP0sNS1y+dUbv/b0LIeppeqtpsBh5BdzfS
   ax2ju8o4Ye54uOb6HXFY1CaWX5XoqzwWfT9hZcRQGS5An9nJ4q2Fb5GPa
   NF0aaOOLnmLkOxXQjkZZdBR8S02bFY4F41TaWNikO4pEBSi+J5kSiNkrU
   Q==;
X-CSE-ConnectionGUID: WKBU/djGS9GxAfZY2Afw0w==
X-CSE-MsgGUID: JZrQV9OtRbOHdkXMOkqexg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27669127"
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="27669127"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 09:57:59 -0700
X-CSE-ConnectionGUID: oPLb9zCKRkudCpKwnKs4og==
X-CSE-MsgGUID: OIlbCakXTOiZl8R/YMDZHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="77458432"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Oct 2024 09:57:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t01um-000EY7-0W;
	Sun, 13 Oct 2024 16:57:56 +0000
Date: Mon, 14 Oct 2024 00:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] crypto: Add Mediatek EIP-93 crypto engine support
Message-ID: <202410140040.rNiSs887-lkp@intel.com>
References: <20241009171223.12695-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009171223.12695-2-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master robh/for-next linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/crypto-Add-Mediatek-EIP-93-crypto-engine-support/20241010-011532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241009171223.12695-2-ansuelsmth%40gmail.com
patch subject: [RFC PATCH 2/2] crypto: Add Mediatek EIP-93 crypto engine support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241014/202410140040.rNiSs887-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410140040.rNiSs887-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410140040.rNiSs887-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/mtk-eip93/eip93-main.c:483:34: error: array type has incomplete element type 'struct of_device_id'
     483 | static const struct of_device_id mtk_crypto_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~
   drivers/crypto/mtk-eip93/eip93-main.c:492:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
     492 |         .remove = mtk_crypto_remove,
         |                   ^~~~~~~~~~~~~~~~~
   drivers/crypto/mtk-eip93/eip93-main.c:492:19: note: (near initialization for 'mtk_crypto_driver.<anonymous>.remove')
>> drivers/crypto/mtk-eip93/eip93-main.c:483:34: warning: 'mtk_crypto_of_match' defined but not used [-Wunused-variable]
     483 | static const struct of_device_id mtk_crypto_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/mtk_crypto_of_match +483 drivers/crypto/mtk-eip93/eip93-main.c

   482	
 > 483	static const struct of_device_id mtk_crypto_of_match[] = {
   484		{ .compatible = "mediatek,mtk-eip93", },
   485		{ .compatible = "airoha,mtk-eip93", },
   486		{}
   487	};
   488	MODULE_DEVICE_TABLE(of, mtk_crypto_of_match);
   489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
