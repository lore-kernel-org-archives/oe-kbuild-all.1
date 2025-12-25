Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E9D225A38
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 03:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766632712; cv=none; b=sD4mKunWioiT7s2ZqZcEVIox+3l5jFLjTog6J8iU76joDyw/PFpKQ1D7DNw5kroRLy1Lcxg4gWqXu2XBOYZ6VLnfEdZO9j3H/wlIx36NDoBIB9yr6KbnCcx451yFR3rskmfPPgV6H5+ly4z1Pw3l6LhZLysbo2x7beTxUT6td70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766632712; c=relaxed/simple;
	bh=AZL2lgPTNfnwSfgewGSkAbjlrTijPZr90r/aXsY7tYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3V3MLjWZNK9NLZcd2fLlYCFI1zjm8gf2/Q0/6q7SXDOhsEd25qA5Yk9bhhoP8BCfuvumbTsriuGczbzTYMrPg67E4oxXx2c1bheYV3R1tjDlDvQggM9++ZTlsnGpK5O9iEx4K10jQy7qMc16aWpmkmNXsWOx0xVS1HdiVH0qOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duhEV6og; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duhEV6og"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766632711; x=1798168711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AZL2lgPTNfnwSfgewGSkAbjlrTijPZr90r/aXsY7tYQ=;
  b=duhEV6og8L9zDlHxw5Of9nrfkC16A3IhOwSStSRCyfxvVIflzqjgRcTl
   H2lrZB7puTrRILofAsQU6Xjz8tLGDteKVF+TBUwPzHMs2ZOj0zyIeP79q
   2GbxOuEl5lPRYY5tkrCKs40Md4jOU0v4Uh/7H2AlpVJP5/PUs7gs43U3U
   6q6rrbVtrrvZzLv60qvXepPNy8R+vhS+W2YdLfsGaetImMTDSj8g14BJB
   qlucNwYDq/k1a/sL8YQuWImBrmDe68hlJPQRkrBR8GS82CQ391eN/yI7b
   hGajVYeF6wkcF+smt1ss3GihW7jFPHcC75YB949TwlUMNGXICatjF8kLC
   Q==;
X-CSE-ConnectionGUID: G9eFkWMVSbS3k+3duhF8Xg==
X-CSE-MsgGUID: nbi3ds6AQJyFSyBC8FQL4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="78755735"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="78755735"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 19:18:29 -0800
X-CSE-ConnectionGUID: Y9xQVFbHSEytpJORjCYWeA==
X-CSE-MsgGUID: c4QSPJ4sSDS43gnBY+b7pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200165301"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Dec 2025 19:18:27 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYbrs-000000003gr-3UtX;
	Thu, 25 Dec 2025 03:18:24 +0000
Date: Thu, 25 Dec 2025 11:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, adrian.hunter@intel.com,
	quic_asutoshd@quicinc.com, ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, ebiggers@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_mdalam@quicinc.com
Subject: Re: [PATCH] mmc: sdhci-msm: Add quirk to disable CQE for ICE legacy
 mode
Message-ID: <202512251043.unAN2IJ5-lkp@intel.com>
References: <20251224101050.3497746-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224101050.3497746-1-quic_mdalam@quicinc.com>

Hi Md,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on ulf-hansson-mmc-mirror/next v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/mmc-sdhci-msm-Add-quirk-to-disable-CQE-for-ICE-legacy-mode/20251224-181537
base:   linus/master
patch link:    https://lore.kernel.org/r/20251224101050.3497746-1-quic_mdalam%40quicinc.com
patch subject: [PATCH] mmc: sdhci-msm: Add quirk to disable CQE for ICE legacy mode
config: arc-randconfig-002-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251043.unAN2IJ5-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251043.unAN2IJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251043.unAN2IJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-msm.c:2121:36: warning: 'sdhci_msm_cqhci_ops' defined but not used [-Wunused-const-variable=]
    2121 | static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
         |                                    ^~~~~~~~~~~~~~~~~~~


vim +/sdhci_msm_cqhci_ops +2121 drivers/mmc/host/sdhci-msm.c

67b13f3e221ed8 Shaik Sajida Bhanu 2021-07-16  2120  
87a8df0dce6ad0 Ritesh Harjani     2020-01-16 @2121  static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
c93767cf64ebf4 Eric Biggers       2021-01-25  2122  	.enable		= sdhci_msm_cqe_enable,
87a8df0dce6ad0 Ritesh Harjani     2020-01-16  2123  	.disable	= sdhci_msm_cqe_disable,
c93767cf64ebf4 Eric Biggers       2021-01-25  2124  #ifdef CONFIG_MMC_CRYPTO
741521fa273fdd Eric Biggers       2024-12-12  2125  	.uses_custom_crypto_profile = true,
c93767cf64ebf4 Eric Biggers       2021-01-25  2126  #endif
87a8df0dce6ad0 Ritesh Harjani     2020-01-16  2127  };
87a8df0dce6ad0 Ritesh Harjani     2020-01-16  2128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
