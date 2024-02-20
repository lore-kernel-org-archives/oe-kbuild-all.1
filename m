Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ADD5A4E5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708414168; cv=none; b=LLKNCSWtXQj9QBZc0PsWSbMwYLgMc+HiNGPBZmozarnHv+mekFv6TJ570K18703B6rfckNIrN91pAF6OFTLblf/40ik39B+1jBnuWJYFnjC7W6wy9srs/29V7l3QClyJsR6FjFKDpmiROoj6bfQKnJ+qtDm3tbsOAsWrt3AxjWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708414168; c=relaxed/simple;
	bh=L+xCfLH7AkOkuK4iNE/kLslacvHnxxekoL5U7vcudso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUOIxsrZ6ZgZrRRhPXPOAMcTQU6ic/tp1RUZCJ7YJsp0LYk+1Uz5mpQmLl5fOA7EJJAdud4ZlGhig5LGdcp+8BM7I0Bc/F3KBVP6sbsOmCtZjSY+C8FbXaTkWsWaKYo1v4gDXxqXtDRiJ0hKRrBc80S8Ra2MkVn34sa83a0hPW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JP2uSyV4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JP2uSyV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708414167; x=1739950167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L+xCfLH7AkOkuK4iNE/kLslacvHnxxekoL5U7vcudso=;
  b=JP2uSyV4AIbIpVHrxFAKzU4hMPT3XR13KLGSpu5oESu3ROoxBrfc7f6N
   TOqrIAO/UkBIqby2cSZvrzwy0AsOSZ+7SjNttCRlDK3meN1ADvQfvzKjF
   9lutPdYuAdhCuGX6vDV8MVC3F83UwhiFCbkBpqLDi7hPdVVdMtvzlm59U
   QOs0IphA/XDd33KfjtTZvlvIN56cNOaIqSkWqmk02WNwr0TZvSZ0gXwO9
   KTxHk2xTzewLZl4nDN/1hEBmfyPToEH/dC7NNSsqKdiQHymABBqpRb06G
   AEnkmnAXAwVa/xkUvVROS3cdS1YpDwc7cV8PsfP6NUkeNxXMVBMI3XgL1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2369707"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2369707"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 23:29:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="913026221"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="913026221"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2024 23:29:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcKYi-0004JP-0K;
	Tue, 20 Feb 2024 07:29:02 +0000
Date: Tue, 20 Feb 2024 15:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 3/5] crypto: tegra: Add Tegra Security Engine driver
Message-ID: <202402201510.Wu3nDngd-lkp@intel.com>
References: <20240219172530.20517-4-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219172530.20517-4-akhilrajeev@nvidia.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master tegra/for-next linus/master v6.8-rc5 next-20240219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-crypto-Add-Tegra-Security-Engine/20240220-012954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20240219172530.20517-4-akhilrajeev%40nvidia.com
patch subject: [PATCH v5 3/5] crypto: tegra: Add Tegra Security Engine driver
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240220/202402201510.Wu3nDngd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402201510.Wu3nDngd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402201510.Wu3nDngd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/tegra/tegra-se-hash.c: In function 'tegra_sha_export':
>> drivers/crypto/tegra/tegra-se-hash.c:619:13: warning: unused variable 'i' [-Wunused-variable]
     619 |         int i;
         |             ^
   drivers/crypto/tegra/tegra-se-hash.c: In function 'tegra_sha_import':
   drivers/crypto/tegra/tegra-se-hash.c:634:13: warning: unused variable 'i' [-Wunused-variable]
     634 |         int i;
         |             ^


vim +/i +619 drivers/crypto/tegra/tegra-se-hash.c

   613	
   614	static int tegra_sha_export(struct ahash_request *req, void *out)
   615	{
   616		struct tegra_sha_reqctx *rctx = ahash_request_ctx(req);
   617		struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
   618		struct tegra_sha_ctx *ctx = crypto_ahash_ctx(tfm);
 > 619		int i;
   620	
   621		if (ctx->fallback)
   622			return tegra_sha_fallback_export(req, out);
   623	
   624		memcpy(out, rctx, sizeof(*rctx));
   625	
   626		return 0;
   627	}
   628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
