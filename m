Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CF828376
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722670196; cv=none; b=hFheQElp6OIVrGylaGKEbJiZG0AScJ+lNCdUDc4HMGiSShxXMWUM81R5lXGCfT0CJydiU0HvO4vROi6W1KXEK7r4BXTLZrJgPZEvSB94HeAtdDBU2rduXF7wayEzv6ecbfMo37qi923/Rt7ApkL3YY7G1AwKS9BK/AaesGETJuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722670196; c=relaxed/simple;
	bh=XTYTOC7cCPSdcTzrbUtDV7Q/khL4meh43s+9//R09sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJRQagFUOoWEA22e2SKc7roCm+AZCrPcFDKxy3urjWHthK6BDhWqsXnQpDBX+KFkn5eUMJzYPQktytO1oPSGi4SY1YUQmdVxv4LCGzE0eIqH95bK4/HaTV83unYamxPXBsAbKXvEPfNiqwYevV04Xa7fV+BmY1BPD5hyCicJUuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOoTQDf0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOoTQDf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722670195; x=1754206195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XTYTOC7cCPSdcTzrbUtDV7Q/khL4meh43s+9//R09sw=;
  b=NOoTQDf0x/7nUKvPWla3MK+3ZAKYmCxK9+LhOtwvCw+eygruOMEaN2Ze
   YCaVokvTSuE3IsY9W+y6B/In8fWik8smQjGZvd//ULcmtTimxs3TnG2JW
   Xk6WKXWZKm5oH+GV0p842VunPfhEFKkA6CYx5V/lkHTloNDKHBmHcHL+3
   pozqNki5UfmmaYWGtQCwpHW04vPBchc/rpKhPfrItKg6Sqb3XUomOZGi0
   XUjX7htAgmfZpxnckVYdAdmcwXpjuo/x1R+n5tB+wIZNDh1QPID9EeLmr
   CK3kB1fpI+eD9TEUxBEKR9lb0MS+pqfCW1xuRRh0Jt7D3/f9Md7nVnEMj
   g==;
X-CSE-ConnectionGUID: cdJJurlVTg6H7ANMizmVxg==
X-CSE-MsgGUID: npXN6wtbRKWn5p+nsN8o5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="43215885"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="43215885"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 00:29:54 -0700
X-CSE-ConnectionGUID: eRzOxe2aRZy3iG6kmSm1GA==
X-CSE-MsgGUID: qm6WptYUTU23MnLaTxwJrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60658330"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Aug 2024 00:29:53 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa9Cl-0000Go-2W;
	Sat, 03 Aug 2024 07:29:34 +0000
Date: Sat, 3 Aug 2024 15:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] usb: misc: onboard_usb_dev: add Microchip usb5744
 SMBus programming support
Message-ID: <202408031522.0gVAPj3W-lkp@intel.com>
References: <1722440548-107682-3-git-send-email-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1722440548-107682-3-git-send-email-radhey.shyam.pandey@amd.com>

Hi Radhey,

kernel test robot noticed the following build errors:

[auto build test ERROR on e4fc196f5ba36eb7b9758cf2c73df49a44199895]

url:    https://github.com/intel-lab-lkp/linux/commits/Radhey-Shyam-Pandey/usb-misc-onboard_dev-extend-platform-data-to-add-power-on-delay-field/20240802-073632
base:   e4fc196f5ba36eb7b9758cf2c73df49a44199895
patch link:    https://lore.kernel.org/r/1722440548-107682-3-git-send-email-radhey.shyam.pandey%40amd.com
patch subject: [PATCH v3 2/2] usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support
config: loongarch-randconfig-002-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031522.0gVAPj3W-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031522.0gVAPj3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031522.0gVAPj3W-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/usb/misc/onboard_usb_dev.o: in function `onboard_dev_probe':
>> onboard_usb_dev.c:(.text+0xfe8): undefined reference to `i2c_find_device_by_fwnode'
>> loongarch64-linux-ld: onboard_usb_dev.c:(.text+0x10f4): undefined reference to `i2c_smbus_write_block_data'
>> loongarch64-linux-ld: onboard_usb_dev.c:(.text+0x1108): undefined reference to `i2c_smbus_write_word_data'
   loongarch64-linux-ld: onboard_usb_dev.c:(.text+0x111c): undefined reference to `i2c_smbus_write_word_data'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
