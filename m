Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398AF7344C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 23:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579464; cv=none; b=N9e6jaSWOixPx2Tive1OjRrVT4lfNMXYs0jHXRWW6qgfbI78DQGsOIXlImPv7P0U4pDIpYswg6XDcvkVALxRSwwReg07Fkl4roiHrCVQb/8kyZk0Yly7ifzP2VLyJ/+8MkN1qSNshE5h4BkUs89XkZleKPp4+niodiUckFwgBBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579464; c=relaxed/simple;
	bh=kiJ5EIGClrXHrM1eGznIeYjyxqgXT0POFZivmUkpMXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMEZKEVQ4ccsXa3DgEbJnNH9sqcd4rLUxp3I8GGz6XMyNQTjg1WNxMhT5hmiREd4Y4lqdh7QGd1TJIGhppuosidS5A/mbKOkSoExa58cKlRCf6Vp4DN0IlSpt6bMGJMaR0nPKf41qhuSRX9N6rfeGxHGB4tftXdE8hJwtQW5NlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7bkup2X; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7bkup2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718579461; x=1750115461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kiJ5EIGClrXHrM1eGznIeYjyxqgXT0POFZivmUkpMXA=;
  b=W7bkup2X+tWWtyGzE2G2GMxmy4wvdKWTVrHSzMnUQMqlkJZvjzT02fMg
   KigP5L1XTpoaw4VvrJRChtOmH0m2lWk7t2IH1EOXujUWMm8XmXqSdq05u
   Jxt7lWsD+I98aV4t71SXWARlS/CjAob9bIKTk9zeKtcrkN/OWMTCqzEzW
   Skk8RFXWiyH9BrL5eccUrPxPKD4Jzfh0Vqd13ycCkDYiuJG3Vec9vVWtm
   ex734WF67fAFZEmPb/o/19mUYWEj/xyw//pBhU3s+mulvvS83GwoGAm/1
   XStQogdHNVJt+SNahO0yIeHg0zp45WVGst+hI3WDL9p1agEZVYMs7wOZL
   A==;
X-CSE-ConnectionGUID: kjW0/z6XSSqSPELhNiT8GA==
X-CSE-MsgGUID: N/8sSCydQpa/jVgf0r5YnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26794704"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="26794704"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 16:11:00 -0700
X-CSE-ConnectionGUID: oXTleuhGQOaPOFVzz3WhRw==
X-CSE-MsgGUID: rEslq/9nRjmd64uvoExcXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="41747756"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jun 2024 16:10:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIz1T-0003SX-0v;
	Sun, 16 Jun 2024 23:10:55 +0000
Date: Mon, 17 Jun 2024 07:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Wang <charles.goodix@gmail.com>, dmitry.torokhov@gmail.com,
	dan.carpenter@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dianders@chromium.org, robh@kernel.org,
	krzk+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
	hbarnor@chromium.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: Re: [PATCH v4 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <202406170607.MJX7Ze54-lkp@intel.com>
References: <20240614121538.236727-2-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614121538.236727-2-charles.goodix@gmail.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on dtor-input/next dtor-input/for-linus robh/for-next linus/master v6.10-rc4 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Wang/HID-hid-goodix-Add-Goodix-HID-over-SPI-driver/20240614-201949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240614121538.236727-2-charles.goodix%40gmail.com
patch subject: [PATCH v4 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
config: i386-randconfig-r122-20240617 (https://download.01.org/0day-ci/archive/20240617/202406170607.MJX7Ze54-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170607.MJX7Ze54-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170607.MJX7Ze54-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-goodix-spi.c:771:1: sparse: sparse: symbol 'goodix_spi_pm_ops' was not declared. Should it be static?

vim +/goodix_spi_pm_ops +771 drivers/hid/hid-goodix-spi.c

   770	
 > 771	EXPORT_GPL_SIMPLE_DEV_PM_OPS(goodix_spi_pm_ops,
   772				     goodix_spi_suspend, goodix_spi_resume);
   773	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
