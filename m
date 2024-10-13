Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5434B231C8D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728838081; cv=none; b=TpgezDAQZuq5J4r8FyvdgD4q9oDs2pcz5uT8aalApSKqU4u9IpUT0qy1zalJ77Z9qymbe1+2v9qLlb6lnvLHUyzP8usJrdb+XTlsQXPpzO9xq9RuhbYczHZULKx3GRsjhBb20hkhQiMvFRC4UzVcESiEtOhr4RhXcxJK6pmR3I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728838081; c=relaxed/simple;
	bh=qdkPOgBkkp94n8cYUSiUbySpcYofcySP/bXX7PvR8i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyS5/1X5CZFUEexN6oGIe4du24cHfvkYEVoqV4tdENIMlmgGuB/MuuIPQpC2ExCFTtOFI59QvJgabr+3sCenq+EWJYVJo3vpf7NsX5UWQMuOSUDLqGwVdMokdIuTw34Oec10JwCQ9DKXOyyPIg+UMj5lNOxpiDcwq8uTUdrLr8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjFQ+WSO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjFQ+WSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728838079; x=1760374079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qdkPOgBkkp94n8cYUSiUbySpcYofcySP/bXX7PvR8i8=;
  b=TjFQ+WSO10fcZbQoIpiafalX7DEyt4V/tXZBPyyqXuoPBmQ2cXdrx/Pv
   hz6z5Xc+/mtqrunc/NjcpdQfate9MKOyVaZQOjMFs3QumnCRWSLSkNAs1
   ok7UB5bcBYSxPVYVXC4PswDWkfusNx4j9Hle+Pu7a2Oy05CG+FCQLLLZp
   S3a+xtufDhm3GXa+hbg2wVtvsKs6rd8SvVrebpeM0wtETt567enMo4mDJ
   4m4SQ91+dQvnoyUnfYMucy2QM7ydBCkeZVcBFTxcV+Caje0gsrO+WNwjb
   +9vZITrHGl+/Ee34WnjQEdiLv/R1lhhssJr7vcnMh+z175/30K8z2k4sC
   Q==;
X-CSE-ConnectionGUID: DKhAiienRwGyvoCmhzvLSQ==
X-CSE-MsgGUID: 4hSiI2KgQHyD2fpK/ApnHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39569565"
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="39569565"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 09:47:58 -0700
X-CSE-ConnectionGUID: MbYjmn4cSYakkGmpHeNhpw==
X-CSE-MsgGUID: E5id5zy2TGeaS78c8ZW8mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="76989344"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Oct 2024 09:47:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t01l5-000EXU-2c;
	Sun, 13 Oct 2024 16:47:55 +0000
Date: Mon, 14 Oct 2024 00:47:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] crypto: Add Mediatek EIP-93 crypto engine support
Message-ID: <202410140056.ODffSy4g-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master robh/for-next linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/crypto-Add-Mediatek-EIP-93-crypto-engine-support/20241010-011532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241009171223.12695-2-ansuelsmth%40gmail.com
patch subject: [RFC PATCH 2/2] crypto: Add Mediatek EIP-93 crypto engine support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241014/202410140056.ODffSy4g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410140056.ODffSy4g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410140056.ODffSy4g-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/crypto/mtk-eip93/eip93-main.c:483:34: error: array type has incomplete element type 'struct of_device_id'
     483 | static const struct of_device_id mtk_crypto_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~
>> drivers/crypto/mtk-eip93/eip93-main.c:492:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
     492 |         .remove = mtk_crypto_remove,
         |                   ^~~~~~~~~~~~~~~~~
   drivers/crypto/mtk-eip93/eip93-main.c:492:19: note: (near initialization for 'mtk_crypto_driver.<anonymous>.remove')
   cc1: some warnings being treated as errors
--
   drivers/crypto/mtk-eip93/eip93-common.c: In function 'mtk_send_req':
>> drivers/crypto/mtk-eip93/eip93-common.c:637:1: warning: label 'send_err' defined but not used [-Wunused-label]
     637 | send_err:
         | ^~~~~~~~
--
   drivers/crypto/mtk-eip93/eip93-hash.c: In function 'mtk_send_hash_req':
>> drivers/crypto/mtk-eip93/eip93-hash.c:231:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     231 |         int ret;
         |             ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +483 drivers/crypto/mtk-eip93/eip93-main.c

   482	
 > 483	static const struct of_device_id mtk_crypto_of_match[] = {
   484		{ .compatible = "mediatek,mtk-eip93", },
   485		{ .compatible = "airoha,mtk-eip93", },
   486		{}
   487	};
   488	MODULE_DEVICE_TABLE(of, mtk_crypto_of_match);
   489	
   490	static struct platform_driver mtk_crypto_driver = {
   491		.probe = mtk_crypto_probe,
 > 492		.remove = mtk_crypto_remove,
   493		.driver = {
   494			.name = "mtk-eip93",
   495			.of_match_table = mtk_crypto_of_match,
   496		},
   497	};
   498	module_platform_driver(mtk_crypto_driver);
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
