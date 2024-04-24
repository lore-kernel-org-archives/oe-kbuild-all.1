Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C4C15687F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 22:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713997176; cv=none; b=Y2nG7abUET2Y+WJ6DvRuqIWEAWFIHqoVVOkTdMvp8KKaFOpCjO6/IZfWxrB5kMw3WpwJVobS6Rt2Wcj1XyQL5JlqJpBB1BJdOIM1OXkkYHd5vQenDISI1dL1jkOnGHdhIlZTQ1k6nPKSJ0QO6AtDZaB7YP59/FejZH36wa3Vw6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713997176; c=relaxed/simple;
	bh=iY32VNR3FniELqgUqAUQSBrjStcUYSFhfcGemW/H/js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=a9b/UHq7AnMkf3qkuG3AoRZjKrA5pfNisoxMVY2A7IZ9uQY+sF5/Z2NR54U3SxQQxfruS2GYVv2hC19znjJlTVxFM075VavKcc3rOnzcrRPSXlIgZFY/TE+ZCecaJlsb+ReU8GWnBKkVJdpsuf4kdTYDPoIAFiHu5HPhaZdjMd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCpoewUM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCpoewUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713997174; x=1745533174;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=iY32VNR3FniELqgUqAUQSBrjStcUYSFhfcGemW/H/js=;
  b=DCpoewUMS7NNTn04kt+PpIFyCvauhbq0s0t70UoxSThd+LcaNg985Wmh
   c8tWgJQXOuRj2BzSeJHXP1TMYusNf2vCh+UwUAEWRWVJsyPg6UA0X/qpF
   Q8/rVqLP80xIAx7YJPrvesKdhC77FogwROm0UO2rwPgCgR1cs8+p/4xM/
   xrsMQ0BsoD92qSPnU80Rl5L6/atREenwZRIe1DCp2bF+ocEFH0W3ldXjt
   5fVL21IxRHUdGy5eq3Sy1ZGsivgnKBGrYe5NnJYiAvZBLAGrS0sFcIY9R
   J52Y+SCU59q5oSYEhpryddUFTKUUNEviyK3PVlpqA/iA5Syow8pG/apzJ
   w==;
X-CSE-ConnectionGUID: 7lSSCvzbTgKJWvq3ULZ4GA==
X-CSE-MsgGUID: iPk9DBsnTZGVR6X6zwtL9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="10191113"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="10191113"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 15:19:33 -0700
X-CSE-ConnectionGUID: 4/okPmo0Sbabqo9LB4OUmQ==
X-CSE-MsgGUID: i9o2xlLgQlihtR1iIAWK9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="29319394"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Apr 2024 15:19:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzkxe-0001iq-1J;
	Wed, 24 Apr 2024 22:19:30 +0000
Date: Thu, 25 Apr 2024 06:18:53 +0800
From: kernel test robot <lkp@intel.com>
To: Doug Berger <opendmb@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] serial: 8250_bcm7271: use default_mux_rate if possible
Message-ID: <ZimFTZqdBFDWlwUE@c8dd4cee2bb9>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424221619.1840014-1-opendmb@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] serial: 8250_bcm7271: use default_mux_rate if possible
Link: https://lore.kernel.org/stable/20240424221619.1840014-1-opendmb%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



