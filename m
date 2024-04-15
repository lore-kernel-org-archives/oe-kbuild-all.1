Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559CF1E4AE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 19:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713211102; cv=none; b=sDkY9dJGQSWxRngw/ReoFr90f358WbZylRMKTVP9zy92MO4hf1wVAFCpMkn2yR63doc27eC3MUKW8X4AyTldOM5itPq5cm4Dy5atQSaNKrCoTfeas0dsFT70E4KSN84LuzgJLy2JCiigSRcHuRY8yCa+Kzh5eZySj3TH9LpWreE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713211102; c=relaxed/simple;
	bh=2Z5MzbUQJ7rsbpRkHQipW3lsfTsDB355UQ4TqHy5aZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugD6CEFfI3+1MJSkoL51JatxCvYIw9FGuyPBfUXiNXo5i7fqtQ3DfI8I1D+RHbbigIo7I0ioNKw/E+wiaZgn0eM3gxcz+l2v1PGydgkdOvxPNjRSFXmzRbRU3ITsWx3YZObk9UzZJwzhjFIdOHEq6udDusnxMKvk4Cbwph5HDVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dF4fNdzF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dF4fNdzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713211102; x=1744747102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Z5MzbUQJ7rsbpRkHQipW3lsfTsDB355UQ4TqHy5aZA=;
  b=dF4fNdzFwlkutzr/9si6efxS7dk4Jv7o19AnGGuY1F4VfRUe6cA6tUjN
   Ft08G2Xgv8nNFzHcIJu9LDr5BNGcx84cDpiWfzKSn1S2dFbVeQOm3z/jm
   se5tGfU6TPuKfO/PkhYAy7RCd76e+NMj+u5XnNzbIIkfacaVfn7V5/LTh
   iMnuAZzaZkLSdjY4te28Z5fYhEwtx0Kdl8tjqMFyXJl0cQ97m8qgOEcYo
   a+tCn/rA2ui6qAYf55DkT/mRpwwdiTPOhW9w6T+QRjSGXmB8jtNPh3xRU
   lS6qyqZgRqqS1Q7dn6+3TAdfhXxBJddjAo21nL9ACMfSNoXA75m3ZuFL7
   g==;
X-CSE-ConnectionGUID: B7OLWVN1TWKbVe2LX8A4Qw==
X-CSE-MsgGUID: N2tsZtibTUejgU0iiyjnaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8786719"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8786719"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 12:58:21 -0700
X-CSE-ConnectionGUID: uYtAU3MWRFmhwyFNgInzdA==
X-CSE-MsgGUID: Mly1Gvt/Ty66pHFvXGY+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="53217201"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 12:58:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rwST2-00000004W5y-2F9J;
	Mon, 15 Apr 2024 22:58:16 +0300
Date: Mon, 15 Apr 2024 22:58:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	oe-kbuild-all@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [pdx86-platform-drivers-x86:review-hans 40/59]
 drivers/platform/x86/amd/pmc/mp2_stb.c:94:9: error: implicit declaration of
 function 'writeq'; did you mean 'writel'?
Message-ID: <Zh2G2CauM_rrQ8CS@smile.fi.intel.com>
References: <202404160320.QAHyZ0c3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404160320.QAHyZ0c3-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 16, 2024 at 03:54:35AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-hans
> head:   0aae4c44b032b5ede39405dfc62900adc467f362
> commit: 2dc77993cb5eb311d6bb5584d30c3d1d42d9fa4a [40/59] platform/x86/amd/pmc: Add AMD MP2 STB functionality
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240416/202404160320.QAHyZ0c3-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160320.QAHyZ0c3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404160320.QAHyZ0c3-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/platform/x86/amd/pmc/mp2_stb.c: In function 'amd_mp2_stb_send_cmd':
> >> drivers/platform/x86/amd/pmc/mp2_stb.c:94:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
>       94 |         writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
>          |         ^~~~~~
>          |         writel
>    cc1: some warnings being treated as errors

Either depend on X86_64 or include one of io-64-nonatomic-hi-lo.h,
io-64-nonatomic-lo-hi.h to fix.

-- 
With Best Regards,
Andy Shevchenko


