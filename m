Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFED535AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711461574; cv=none; b=PKnQ4ytL/fAhkRX8gdWskP5dVbca+XANH5A2fJpOdhR570jZ334owalOHxEVXAr3q8Y98NUiNejlidTVQ2PW5fO5HFbwxOgxMJEGpdRPeZc+AyELPxd8yrF3JUczsj2uth1EjcgA0O6AOzUBOJVFpPM06C3c1PYgxNT/eFUPK8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711461574; c=relaxed/simple;
	bh=FZOTvftF970Uif19MCfgf/yVnxhepM/1UFdK6kV9rDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHCjAcMd2AdzRZY6mwrI61bKlMEiCBF7kez9BnzSP7DUpRVn7EFkpuvdcpTxUo17rQAoHiVR+rbFHapX1edw2erem5Iu2rJfzfXp8acWhAS2WSVvkC7KfUq+kmiohtX/RIgQcu0Msjtsxh8ETT9JuNjsKtWcsEtt2khoSS9GJH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMCNAntR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMCNAntR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711461573; x=1742997573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FZOTvftF970Uif19MCfgf/yVnxhepM/1UFdK6kV9rDQ=;
  b=IMCNAntRSiQwra8aQuX0BAfUu9zetMsDLKhILa2tMwvqRhrHRx543ghs
   FjY4WvUIdVghlywzr9NKuRFJ/1CwGLBflRpar9/WWrl7przgba7N1wSim
   sQ5ISobJ9tQ7uh2/qL6Q/55vmi8Fd88NFs7PKR5K1OwkJQbRsZc+ubHoi
   ApxDHwCmQEjQ4cJQhViKtoBTnNq0EGyYJedjmnGQJHyeBtsqbkiBiYOC+
   cTN7XF52MNPntv0MYs/h3H3WJrUjg3ZGzNtaHdXPcHSDVNZpR6dhf4mRw
   H9sG969a0gqizXsU8pwXbtruII1HJ2bNhzGk+9htHclKaZk2y/DXenvQ0
   Q==;
X-CSE-ConnectionGUID: VVAo60hDSOCNaUFVuyzPrg==
X-CSE-MsgGUID: IrHKs5mbQLSgrJ0b1NDxRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17055650"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17055650"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 06:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="914881254"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="914881254"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 06:59:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rp7Kp-0000000GJqV-2aZz;
	Tue, 26 Mar 2024 15:59:27 +0200
Date: Tue, 26 Mar 2024 15:59:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: Re: [broonie-ci:filepKh54x 1/4] drivers/spi/spi-rspi.c:27:10: fatal
 error: linux/spi/rspi.h: No such file or directory
Message-ID: <ZgLUvyhWm_UODuY-@smile.fi.intel.com>
References: <202403260548.Q7Uyjo07-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403260548.Q7Uyjo07-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 26, 2024 at 05:24:28AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filepKh54x
> head:   a283629ddd86c38aacfda153f0faa7f3bd4419a5
> commit: e7b3c4623c421b1243a73e9e8ca7fd838f88b776 [1/4] spi: rspi: Get rid of unused struct rspi_plat_data
> config: i386-buildonly-randconfig-002-20240325 (https://download.01.org/0day-ci/archive/20240326/202403260548.Q7Uyjo07-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403260548.Q7Uyjo07-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403260548.Q7Uyjo07-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

Already fixed, thanks.

-- 
With Best Regards,
Andy Shevchenko


