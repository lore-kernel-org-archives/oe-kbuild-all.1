Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A8420468D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 06:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762756029; cv=none; b=YMrLaSybruNz6AwUMfZsJWqvg6tVxYubkX6Q76rAl6XdMPabio+VfPl7eq1UI6fRDIIBGm9fgylia9xZ6Z03aXE2uonQVB7oUqdaNPeSD54gqUE33RyypnFKslOM64dWTuzgB6hZ0hGxjLihi3zFrsNigGEwzFkTWcWLp7y2HHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762756029; c=relaxed/simple;
	bh=HWzC7zpraGIpTCNuY/j0kH9Pr9vt8PHVS5TX6e66vZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=aHYzHGRsokdwlgpUNtjS39ZCsFel0zJs8dRPD1SshGD/0FzzuQpt6yvpFDLi7OOTRS7JUBTsOijeMBKmcUpM7Xm3681LPw9+G6m7SD1Xh2qkRYbLTbJYfFADCGClQT/+DyYLKjpQ/VVbaf3xEPAB4ePPTS4bNHB13r6ipZ2MJvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVs0FWFw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVs0FWFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762756028; x=1794292028;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=HWzC7zpraGIpTCNuY/j0kH9Pr9vt8PHVS5TX6e66vZI=;
  b=RVs0FWFwlZQJM+lKZfmXqs6pMJ/IygTC5aAP1QPter6RVVT5oswMnsV7
   BmErhOC7wCDSOrjBHht052RZmnlrdzu3g+Dhz1j537NPHH11ftZvVPr4Z
   VhnZc6b6ELYzYQ68fXMRVNxXPJdTxXjrDKHoqCNIB9wx3vkhzYQYv2p+i
   Cdz8rat9DCqNPPxnrYuv5kTlDuE9Xx8s7gZPz1518PFbVNGoSei9NwAyK
   g/pcrS2cK9cGOkh/UzoBK78PZBg+oAZv5oWWb21Y711Z8IWzYttROI1iD
   H41iiM+AelWWOZBEgDRlm9vEOoWKGAG7Sy9BgioBvB13nREh47wSKPQiP
   w==;
X-CSE-ConnectionGUID: YT8C41myTjyUPf4GoHHs3A==
X-CSE-MsgGUID: 4RxpZzq7R/eiMXlou2Ex+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64842900"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64842900"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 22:27:06 -0800
X-CSE-ConnectionGUID: y72OW6nsQSuWgDW+Gf42zA==
X-CSE-MsgGUID: IbuKepxeThqPXJCng2iACg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188236098"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Nov 2025 22:27:04 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vILMk-00005f-11;
	Mon, 10 Nov 2025 06:27:02 +0000
Date: Mon, 10 Nov 2025 14:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable Bluetooth support
Message-ID: <aRGFsvTZ4y5RmTwu@8d1a9004a541>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110055709.319587-1-wei.deng@oss.qualcomm.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] arm64: dts: qcom: lemans-evk: Enable Bluetooth support
Link: https://lore.kernel.org/stable/20251110055709.319587-1-wei.deng%40oss.qualcomm.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



