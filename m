Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2293F243397
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 02:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739066982; cv=none; b=n56V6H26zZ0pF8MCX1x2RwAxl0uYWWnvLtDGF3cOSP6mB2PXYxNVtZkZpVCe8o0D2C928KQHlcyboPnpBm9HQXo9JCSJ4MbO2UdDpP3WSJDLy0TSr7GqWD+S5MUXADcOVHlNUgSO3p9kyCSpZFDu5lftebXRVxldS6CPhbE6xhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739066982; c=relaxed/simple;
	bh=1OkANyzpTfJkErwvvGPyVmH5ZdEE9uQE9+U+dc7EUnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OSAAF8Spr3Vzv7P4vSj7TyWmlth7HjrCRuPtsfBJniVPKiwSmOZ3gbgGxZKZEDiBZsbNHdwOgEfJPeunLVf57WedHAxPIEusTewPjtf8cjkQHL8+YQUIneZ/U8ZcRxr8tX3Lfh8siF2/vW/4yp4C7AlkcjgNv7d392e7XDrApLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THlKxD87; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THlKxD87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739066981; x=1770602981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1OkANyzpTfJkErwvvGPyVmH5ZdEE9uQE9+U+dc7EUnY=;
  b=THlKxD87Zhe609AomUyAqsj5y1fv4aimtmcI6l245sQjabOG23TeUgvx
   g1Y4dAuRDY8xrC13loleqIc1EkYF2rFBHC7618cZesp7MP9/YxYzDrnpU
   a06T5T1QFb6rhV/WkyTfFOY/nrsitCPu0DWbjwjzzEGIsquT2NfPTWn6J
   IIOwFysIrIYpr9KIsJEk7qND8UmBfBloOwVyDlOFyHdX6Jj2KcTwNAqvV
   UwDunZE1tlq5xGKgu4vcfFrWc+w0iWHG3V9V3u6Zrt08srP5M2kLxQc42
   NkbYamxfdT6Rub9I8R7uOVzV5/IcqZ+g98D89nm9WdsWTkxyyLiZNP3i+
   A==;
X-CSE-ConnectionGUID: GkjmOIIgTRucsDMNbamMGw==
X-CSE-MsgGUID: ZX4FT3xMS4i7mO01GJ0vfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50314411"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="50314411"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 18:09:38 -0800
X-CSE-ConnectionGUID: Hnt063nITeGPT3r6fHq62Q==
X-CSE-MsgGUID: uARxAiAqQLqVbmGXAdCV6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111697658"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2025 18:09:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgwlK-0010vv-1q;
	Sun, 09 Feb 2025 02:09:34 +0000
Date: Sun, 9 Feb 2025 10:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Subject: [hid:for-6.15/logitech 1/1] ERROR: modpost:
 "led_mc_calc_color_components" [drivers/hid/hid-lg-g15.ko] undefined!
Message-ID: <202502091019.kF3R3Jjc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.15/logitech
head:   a3a064146c507ee5207dcf7223cd7a3d7864e085
commit: a3a064146c507ee5207dcf7223cd7a3d7864e085 [1/1] HID: hid-lg-g15: Use standard multicolor LED API
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250209/202502091019.kF3R3Jjc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091019.kF3R3Jjc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091019.kF3R3Jjc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "led_mc_calc_color_components" [drivers/hid/hid-lg-g15.ko] undefined!
>> ERROR: modpost: "devm_led_classdev_multicolor_register_ext" [drivers/hid/hid-lg-g15.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
