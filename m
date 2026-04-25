Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4C71FCF41
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Apr 2026 01:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777082291; cv=none; b=fRkVtYCw/fmU4xvD4L1WNzTT8bInn5vbZvI6aK0QTsFEPYr4KUjSpy+FzOpX26+QyzLSHqJNnlBE8L1J69vRTp0r3aT2nAQkECJ0LftXrgxQJUvhnIQ/2L3oHb7rwPvwPHCZ1663On9kVxHgS/0kCAWvcJG88ngpT6mLHm7oqho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777082291; c=relaxed/simple;
	bh=ibzvjYDxRz5GqXnycgULQoJGobfFxE7gMWtMf6LPKms=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j7kTVRKSTYsyRaviQKSVoVBliMYYkUI1/YgWrtEzwpzUNMzRFUAW6J/ms3IVsfHj9Llvx6f8sFqg+E6B7ReSV0iAxfRSzdtZQGlnjRrQG8e+JYtDYxPqRrz7qAdP0RsBr+s+x/LszNBFVXN1Qs6q26C7oKayln5iyo6IZ6LUDIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmyK4eUx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmyK4eUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777082290; x=1808618290;
  h=date:from:to:cc:subject:message-id;
  bh=ibzvjYDxRz5GqXnycgULQoJGobfFxE7gMWtMf6LPKms=;
  b=XmyK4eUx/LXOj2se1ywjs3ySUW0kE3Dgggkr+ek11tSgLTzMLaMW3N3b
   x4lU58TKs8QnTau6QA7j/vw7SyCiparzYFz8gyZUQJrOQB/LT8Cl/ugGs
   JYWfzl7N+CWIzTcjEvJwB3g3FDfNUdaTMENodgEUD4BU5jAdeLBLLtWmW
   73U2rD0RICtIswtQ+3QAUM08vPckh0SLg6q8gTceZSYN9ngzcE0yHHtmV
   5YZcIHXDkZxteHXBq44UVf2R/2Qv/LMWgam+w0R+3D1qMr+s2+pQ0T54c
   DcWiEVhiNPRobbBlSr6Q6uOtmQ5JsMEweAoDy8oPoTzgCjSGcAfSFjMKH
   w==;
X-CSE-ConnectionGUID: VGtARzQ7RfCzGKZp87O51g==
X-CSE-MsgGUID: zoFozEklQEeU5mV6t1HiGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="78050683"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="78050683"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 18:58:10 -0700
X-CSE-ConnectionGUID: vBd/yAc8QW2zHQHeRghttg==
X-CSE-MsgGUID: 0BduQGo4TKqziqEE8dBIzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="256615613"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 24 Apr 2026 18:58:08 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGSHW-000000003L7-0aZf;
	Sat, 25 Apr 2026 01:58:06 +0000
Date: Sat, 25 Apr 2026 03:57:47 +0200
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/gpu/drm/vkms/vkms_configfs.c:685:5: warning:
 'vkms_configfs_parse_next_format' defined but not used
Message-ID: <202604250326.1jlK2uXR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-drm_mode_config-Add-helper-to-get-plane-type-name/20260424-152519
head:   177e00894c9e43673e9a7be1793cc3eadad851be
commit: f42d76109a7f0b9d570292ca3771bc42a4224351 drm/vkms: Introduce configfs for plane format
date:   18 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260425/202604250326.1jlK2uXR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260425/202604250326.1jlK2uXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604250326.1jlK2uXR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vkms/vkms_configfs.c:685:5: warning: 'vkms_configfs_parse_next_format' defined but not used [-Wunused-function]
     685 | int vkms_configfs_parse_next_format(const char *page, const char *page_end, char **out)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vkms/vkms_configfs.c: In function 'plane_name_store':
   drivers/gpu/drm/vkms/vkms_configfs.c:402:1: warning: the frame size of 4104 bytes is larger than 2048 bytes [-Wframe-larger-than=]
     402 | }
         | ^


vim +/vkms_configfs_parse_next_format +685 drivers/gpu/drm/vkms/vkms_configfs.c

   674	
   675	/**
   676	 * vkms_configfs_parse_next_format() - Parse the next format in page,
   677	 *				       skipping all non fourcc-related characters
   678	 * @page: page to search into
   679	 * @page_end: last character of the page
   680	 * @out: Output pointer, will point inside page
   681	 *
   682	 * Returns: size of the matched format, @out will point to the + or -
   683	 */
   684	VISIBLE_IF_KUNIT
 > 685	int vkms_configfs_parse_next_format(const char *page, const char *page_end, char **out)
   686	{
   687		int count = page - page_end;
   688		char *tmp_plus = strnchr(page, count, '+');
   689		char *tmp_minus = strnchr(page, count, '-');
   690	
   691		if (!tmp_plus && !tmp_minus)
   692			return 0;
   693		if (!tmp_plus)
   694			*out = tmp_minus;
   695		else if (!tmp_minus)
   696			*out = tmp_plus;
   697		else
   698			*out = min(tmp_plus, tmp_minus);
   699	
   700		char *end = *out + 1;
   701	
   702		while (end < page_end) {
   703			if (!isalnum(*end) && *end != '*')
   704				break;
   705			end++;
   706		}
   707	
   708		return end - *out;
   709	}
   710	EXPORT_SYMBOL_IF_KUNIT(vkms_configfs_parse_next_format);
   711	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
