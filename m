Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEC2171E4B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721891818; cv=none; b=NUZQVFDTIL2/QrhG/IeMrL8Esa9dMAvmepHv6gnHjEPvuMgQU76P8vkAwPK3nW2oP3E48ZF2Hkp28PZ3rsdmTm+8jd9YlaODr+anUHcRXJh1LOAVeDOPuU7Unm5xZN0KKdq+LNbu24sJMm9aK6Cu5VZwjmvX2K82jDWu96qfstA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721891818; c=relaxed/simple;
	bh=MSC5W+q6VGKGp2s6tNlTEFT6oyT1kWGTUgHFLbaIp4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=AH73YTi8jbTMKmMEcbW476MX00YK2+tNcmsnA9WyhV0+bkGkLgBbAf7rC6wKBb09szWvSd1ge05r7IQ2kF4Pr2KHHHyiODKw1c+9x1ZpzkPKB+yVJpPrgghcwp5gqKwpHsv3tjb6P183PzpgMIFqB6mSq8kY+Dje5KMfylB5qjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyVTW0Dz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyVTW0Dz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721891816; x=1753427816;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=MSC5W+q6VGKGp2s6tNlTEFT6oyT1kWGTUgHFLbaIp4o=;
  b=SyVTW0Dz1X4qRr+OMpGui8cAm2Ti6hQck0ZgGJdTJCYDr9zb7afngoNk
   cUqd7aRIyGa/q7PQSIztT9UoHsXsDbWShbL4B/9fn+VulYL49x8zlTEVI
   oWtaPaIPrTdsTui5ZnYIBUwLR5EgjJnfSkLATA230VHiVWYcGXxPMGT3b
   p+DbqDmtit3TJoDMgKJ66IG/GnVfw/AhkKalyRbvqozBYBtNCXUJO1YU+
   Fs55krDqBwiIPMIU9/P0nD1TOZocZolm5drmX+imgyDFKr30RYvEizP3F
   LgWlBi4FvEOCYPrz+3TL0VqA6VbC4xWefcBW4u6DkEy3vMjbZtGQSeTz9
   Q==;
X-CSE-ConnectionGUID: ZVM+ifoGTSKU/EzE4iByUw==
X-CSE-MsgGUID: GknxUumGT7Orrx2UhxbRsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="12705109"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="12705109"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 00:16:55 -0700
X-CSE-ConnectionGUID: PxSWNiH+QrSxwBIWoIRnxg==
X-CSE-MsgGUID: IrvJW+BuTYqFdE4BVSo8lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="57400638"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jul 2024 00:16:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWsia-000ns4-1U;
	Thu, 25 Jul 2024 07:16:52 +0000
Date: Thu, 25 Jul 2024 15:16:11 +0800
From: kernel test robot <lkp@intel.com>
To: Raju Lakkaraju <Raju.Lakkaraju@microchip.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net V1] net: phy: micrel: Fix the KSZ9131 MDI-X status
 issue
Message-ID: <ZqH7u2ZXH3nzqIsn@6724a33121ae>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725071125.13960-1-Raju.Lakkaraju@microchip.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net V1] net: phy: micrel: Fix the KSZ9131 MDI-X status issue
Link: https://lore.kernel.org/stable/20240725071125.13960-1-Raju.Lakkaraju%40microchip.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



