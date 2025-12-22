Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E23314A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 23:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766445276; cv=none; b=r1VqrqlPyTpk7UFRJKarNWO5NDmzdiPU8hM1OqhWi+w/tH5HeDHxWlT3pn2BbEySjOF+7Kh3+DCizGR21d2L5K2pjDh4/SPz7jMW0k5JMdgU9Vy0GepHYhroZg7ZnQnK8NMO3FAJFi9bdwEmBM5jGmVbseDkYltEWxktwMEqJQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766445276; c=relaxed/simple;
	bh=gNlLZ5nOeoUzeuq4K/SxKHWJSYmyPmdCkyNhtbZvdOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2W9uVLJuzSQvo6M9aaq+4nOjIfAqPTkVEx3WFDgu85cXCifuRnIbeTbOY543D+8MO50RpVSWVwPXydFA2Mmi79iJtRJhewwj+LkwFqXTBQ5PqUkKUQW19OiuyFxUL1Us8hgLU/lOb5XF//dqdwtmcgbqs7o34uBdfWDCU3/H+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLDvjaFE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLDvjaFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766445274; x=1797981274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gNlLZ5nOeoUzeuq4K/SxKHWJSYmyPmdCkyNhtbZvdOU=;
  b=FLDvjaFEkm1tedn18irkFhs2tIZWN7jsH6h8e2UtFeIo9RlkzZKbu9FQ
   K9x6goa5C1aiklPC1gcHkL4TA+Wt4wOM69Si5t1ICAILiHYswNqFdigex
   H/79QuqcOK+CIjvOWDAVOmJZWGhOwa3fSBNgIoXzJw+HFo4lYUk9Fk6Qc
   ASt2cbT4R1dZT3LYHJwJnxV0RxW8vqwxY4KJNFHyHXbNyIQ0+1WGmA/0U
   97itDvkI/dh5WwX/RdCgbCkWs7nx6vMlE48jGkRDlpCurBT5yueuowIP7
   G0OsbRAq7slvJ4UhVzc7iLVjCBiYNNeHKhVmIugxUD2AEyPR298WgdNqz
   w==;
X-CSE-ConnectionGUID: kU0PpQTSSFiIYhaqRYMvLg==
X-CSE-MsgGUID: TbNg+/hoTl2dKHpAq9xuYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68284289"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68284289"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:14:33 -0800
X-CSE-ConnectionGUID: YQjmy6IhR2CJ08GerPwzXw==
X-CSE-MsgGUID: fHY8B+FaQYKhC32W+AnbJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="204120079"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Dec 2025 15:14:30 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXp6O-000000001Co-3RkE;
	Mon, 22 Dec 2025 23:14:13 +0000
Date: Tue, 23 Dec 2025 07:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, victoria@system76.com,
	sebastian.wick@redhat.com, thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
Message-ID: <202512230638.scAuFLVV-lkp@intel.com>
References: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8e7460eac786c72f48c4e04ce9be692b939428ce]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/Documentation-ABI-vkms-Add-current-VKMS-ABI-documentation/20251222-181426
base:   8e7460eac786c72f48c4e04ce9be692b939428ce
patch link:    https://lore.kernel.org/r/20251222-vkms-all-config-v3-18-ba42dc3fb9ff%40bootlin.com
patch subject: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
config: i386-randconfig-141-20251223 (https://download.01.org/0day-ci/archive/20251223/202512230638.scAuFLVV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230638.scAuFLVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230638.scAuFLVV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vkms/vkms_configfs.c:676 expecting prototype for parse_next_format(). Prototype was for vkms_configfs_parse_next_format() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
