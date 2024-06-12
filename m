Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC2716C85B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718196713; cv=none; b=XXTkPnuopYy3kO7akTwmkDNIVE1nQH3fkzz8zkQ5Z3zyxTGbL0EaQVicRp0++ZdG3MF0H/w62fgSjwb3sL9a9C6Ie2rx0eQx4yLVUHT5PrtYbq/CPECgzIHtJQo+zOC0RP1Oc4loO53fTi4qj4Plul3JRSOuqWpo46Xq4gEuDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718196713; c=relaxed/simple;
	bh=96AqxT/QkGQVZmvKVT8l9e/Ic/Ha4DrHgKCuQXbQrGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=tUoVGfMIZvlKpaY5ypgRD6DUn7rtKQOnfn+/Foh4CzaY3+dkwB0vJTXYbjLpk2KKr7p/1fdYkQ5GXG0KXKmBSnj4vjxQcmXrUSTvNbeg5PO+IK4r6b8pSAT3pYnyPruvO40ybZXxkkw9EJl2bWxy2WNtHjIUmKeYAqpKSBK8nRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4piLhcC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4piLhcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718196711; x=1749732711;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=96AqxT/QkGQVZmvKVT8l9e/Ic/Ha4DrHgKCuQXbQrGQ=;
  b=T4piLhcCccvZaISbY3FojWllr98KK4JLg0+exflXtlp7ZFXWp2M2TiGW
   U7TaqR/NSh9ag+B8WR3fP469KIRONYB+ZKGmR/2Y49l0Xcsy3c/bZx/Vi
   WPTU+/XJmXndGPMKCXaZdnoaHKl6zWzXNAb6rui/UDd6r7fzZn5kuUUbk
   htqGNmAw3LYlhRcj/W6dKnDxb6b2Sc7pNZ4/6qFuTiB4adZla4GOkSvap
   uFjOTT9M4iLuHQkmYJMI90GttiPWDGuF8WxVqQ9x2TQSCyN89hTMiE+vm
   ZNzm7I7+sbqCD2nBVvHTqPyY3x2kGZi5zDya/+JCAhJ5mUiHjRNeB7A5F
   w==;
X-CSE-ConnectionGUID: i4q5HutjQxSOcrKyE7zO+w==
X-CSE-MsgGUID: uHxgznLFQhGjMtIXQs0cew==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25584362"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="25584362"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 05:51:50 -0700
X-CSE-ConnectionGUID: m+Oa4GXFTNm3jFE218HjSw==
X-CSE-MsgGUID: glBrvhc/R0eNQJcykyk3fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="40249253"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2024 05:51:50 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHNS7-0001XO-0c;
	Wed, 12 Jun 2024 12:51:47 +0000
Date: Wed, 12 Jun 2024 20:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] usb: ucsi: stm32: fix command completion handling
Message-ID: <ZmmZ3Qbr3GdZNnFw@67627e7c46f4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612124656.2305603-1-fabrice.gasnier@foss.st.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] usb: ucsi: stm32: fix command completion handling
Link: https://lore.kernel.org/stable/20240612124656.2305603-1-fabrice.gasnier%40foss.st.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



