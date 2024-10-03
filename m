Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC25613664E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727950949; cv=none; b=A296LexoPmdWl9LwZeMkEjctGXKxaKPMC2alAYHn7t7hEgfGSKApvXyLYXaxxrE5B8EvSGeo3yDfULYYPMbm7F6sNLYMTLVzTLTZtQLV6kgtf3RxFEwsKoo1wdTl+aqOnkmbs4nYmmed5xXSFM2Hfl2FLDMi7/IRxufTAnbBj3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727950949; c=relaxed/simple;
	bh=PUe/d/uoUvyHtqc9qqxU8GVE8TfzmWIfGoFUBOUZGC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BA3ae0ygs+JUGemwboW2ELyWS0+AN2rFyNvx++cq6u1zIy5OGYzsm74YXcctyz6k0auygZu7OY7AHXFvNEvfwpr7Fu7xsDtF4Y3kETaIfh53w7RPayjFKXVdGlPg00aPeUjmvRUvFDlulSPs8SAiMMuSvHUVjJb/c6Glcvciy64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hewWxsgj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hewWxsgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727950946; x=1759486946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PUe/d/uoUvyHtqc9qqxU8GVE8TfzmWIfGoFUBOUZGC4=;
  b=hewWxsgjNS/oSUbe9kRc2pST+KtWRWoBELPDy1AmK1p7rUQO0HBmbdsQ
   VgggQIc6qcXWwVidwLB7TkM/LVHDVCiuBauP0Kniz4gNtPmuog38llJsH
   Kq4aZSgfPBRdcd1KdxyXI2jE7HtXvNFhO/gjVd4jjAZEF66J0NuHOVx7I
   asx4F0hh3iRLK7u1Bqws9Nhnwetx8a107iZdBOm7+o1QLssDUG+mP0FNj
   pMU3V/VWW0GRgVEf4BdRvupfrMR36r7suyvox53WzVNEKQX/HYSuFw/3t
   tqd1KU0+TVmYcXNRiPlz6CMLAV6lRgfGFnw3LACweTPp9bVPtzRde/KQK
   Q==;
X-CSE-ConnectionGUID: 6NeWNLGvQnqlG5goW2+34A==
X-CSE-MsgGUID: 4zcJjjIVTGKhYw+4RXHgJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27292079"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27292079"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:22:25 -0700
X-CSE-ConnectionGUID: MAJ8szbkTKyUEGsTDmdTHQ==
X-CSE-MsgGUID: SI9YnEH3Rjmts6WRzIfWIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="79067765"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Oct 2024 03:22:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swIyT-0000HY-2C;
	Thu, 03 Oct 2024 10:22:21 +0000
Date: Thu, 3 Oct 2024 18:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH] media: Add t4ka3 camera sensor driver
Message-ID: <202410031806.jxxP1Fch-lkp@intel.com>
References: <20241002093037.50875-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002093037.50875-1-hpa@redhat.com>

Hi Kate,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master sailus-media-tree/master linus/master v6.12-rc1 next-20241003]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kate-Hsuan/media-Add-t4ka3-camera-sensor-driver/20241002-173303
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20241002093037.50875-1-hpa%40redhat.com
patch subject: [PATCH] media: Add t4ka3 camera sensor driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241003/202410031806.jxxP1Fch-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031806.jxxP1Fch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031806.jxxP1Fch-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/t4ka3.c:1099:30: warning: 't4ka3_acpi_match' defined but not used [-Wunused-variable]
    1099 | static struct acpi_device_id t4ka3_acpi_match[] = {
         |                              ^~~~~~~~~~~~~~~~


vim +/t4ka3_acpi_match +1099 drivers/media/i2c/t4ka3.c

  1098	
> 1099	static struct acpi_device_id t4ka3_acpi_match[] = {
  1100		{ "XMCC0003" },
  1101		{},
  1102	};
  1103	MODULE_DEVICE_TABLE(acpi, t4ka3_acpi_match);
  1104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
