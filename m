Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAA42FF641
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009426; cv=none; b=HsC/vVEi3iv7uns3M7KlceCDpWMBVyC8VnGCV290cOmjKmD38QRgQveZTpsQBsNOo95ZhUkA+GZtP2EwpCYaquReCeJisAeIHOXLNjA9E/NDrukD2sMfOrY58iMmO4mYf5e7PvvY/JIEENcq0tepi6zk9jECPkc65Y7uv9InCQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009426; c=relaxed/simple;
	bh=DyxEJnt7hGfRUHFRxWE3TsxFAEJhCfiQqKSgP3BY8bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXYqTUDqjhzUMjZ/KIuMsa+yUXNDMeWNrvb7Z8iWk2bFkNK751wByWDDGg7aGxBrw6PDKMTik4toY2h11ZjdIVIH0jiJzYLAcPK2HnhMvG+eA5xPOnvIt79VSXPGnYqjqraStvTYraTgKBYPr9lwFeg0licMCAGvjg2buY/hhsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jM9z2igi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jM9z2igi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009425; x=1794545425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DyxEJnt7hGfRUHFRxWE3TsxFAEJhCfiQqKSgP3BY8bk=;
  b=jM9z2igiXQXoN8W03LJe9aeXBIVmttwkiZcfZmLh+6aFoD1Zr9D2gutq
   cFrRchxWcc69c4/MZs9tvCO1nLEVnyOcIZkX2syp5PDMGwyETFqTOd3by
   gU3klDzt9v4UW5T8zQkPTXZWl++KVMXErkcwDfAqw2WUModh646AyyP03
   7LOV/dKLZTmsC2FaBJR33apA5oVnNRPkCG//s9a11XSjCrTWSn2C2goR7
   LkKgvUSMGCPJFVwqa4MFEQcbYYCguB6Ik5jzr40UmlmBDMvZ5L77SJIxl
   mL/BxMEtT0XfABKbSHFXP/+45aG/MAmBhbMrJmJYRrAHh2qy8YVtl5BoV
   Q==;
X-CSE-ConnectionGUID: C0pL7idZRxqYpkZ89SE8bA==
X-CSE-MsgGUID: iG2gScNNRTiLZXYN+72V1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68947827"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="68947827"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:50:23 -0800
X-CSE-ConnectionGUID: kEo0kvAcQ46jKs8mQWCSBg==
X-CSE-MsgGUID: 6x+313VITBubqMkzTEnNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="212789108"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2025 20:50:20 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPHm-0004sn-2S;
	Thu, 13 Nov 2025 04:50:18 +0000
Date: Thu, 13 Nov 2025 12:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Denose <jdenose@google.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Denose <jdenose@google.com>
Subject: Re: [PATCH v2 2/2] HID: multitouch: Toggle touch surface on Elan
 touchpad on lid event
Message-ID: <202511122158.oyGRoKNz-lkp@intel.com>
References: <20251111-lid-switch-notifier-v2-2-789723d78d89@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-lid-switch-notifier-v2-2-789723d78d89@google.com>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Denose/Input-Add-lid-switch-notifier/20251112-053559
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251111-lid-switch-notifier-v2-2-789723d78d89%40google.com
patch subject: [PATCH v2 2/2] HID: multitouch: Toggle touch surface on Elan touchpad on lid event
config: parisc-randconfig-002-20251112 (https://download.01.org/0day-ci/archive/20251112/202511122158.oyGRoKNz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511122158.oyGRoKNz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511122158.oyGRoKNz-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "register_lid_notifier" [drivers/hid/hid-multitouch.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
