Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7CD10F2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 18:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766427387; cv=none; b=kqyA1UkRiVgCaThIiwD8nhj2ZyIMFpWUKR3RN+XuSVYD0ubHs+OTS37wfhgabcFJnHqQcYgQQP5+d0x0nObgCmOm9PqtIr6SUfif1VIjvdhsqmZe3CZHOXECyXqZ5n79skO5W0Tc+mQByvkchMGESBI2m5jD87Oy43GmFbrNxQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766427387; c=relaxed/simple;
	bh=4G63B7NcT350/hI7OLQmxKtNgn/KtaUXOJmbgGt7+U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdOIfyskN8AfjlvsMFYifIbh599duEDL3Ty3hfNGh9W59VpHnZT4ujaHmeENgmtrT5azvfRSAKWl3oqL6tfPgkDHYZ9Jb9zRLuUX1XzutV0YNuaLpOZ0WYhLmzHZdqvrXCqaW630SL6lQqOagavMMluWJU1UMXMRCTwfeRx9TI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBkg4yCv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBkg4yCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766427386; x=1797963386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4G63B7NcT350/hI7OLQmxKtNgn/KtaUXOJmbgGt7+U8=;
  b=gBkg4yCv2zmIYOQ8+Py4yUWWu8qlsBqwt9cx9gdPP/pbmPMQJO+qami2
   1L92vtqtovkIHd9LJlsfhH51Z7/Z2Rb+qgGmmmHddDhkpnmSvKbVrlPsw
   /yq1XRP5j4Ej58tL3Q1MonOyDknOId3qD8eiP9dj9yXJDDgAXKoUdU4QP
   XN6Tc0Z1AVYSUJhjAnzvAGQbzb2p+5s8zwQQ9gLyDzmBDp0M2gkJuvHR4
   pPojxeB/lCTdwsxyCZviJZkHPmvW0oIRSvFSY3tPt4JNOhPDpWv4ioShm
   viIzhoRuidxfVJ+dsKaz+J+I/bXI9hGQTb4Zo46O6TdXengSeHPBggs87
   Q==;
X-CSE-ConnectionGUID: tJvGamGFQ3G4b2k0Nb85XQ==
X-CSE-MsgGUID: T64RvXhHTvOeH3kEOXMgVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68327700"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68327700"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 10:16:26 -0800
X-CSE-ConnectionGUID: dh/ULpo6SPCAtTG1ixUtDw==
X-CSE-MsgGUID: L99Vm9fcS2KzJLqP6Juqqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="200486388"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Dec 2025 10:16:23 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXkSD-000000005Zg-01dx;
	Mon, 22 Dec 2025 18:16:21 +0000
Date: Mon, 22 Dec 2025 19:15:37 +0100
From: kernel test robot <lkp@intel.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	=?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, nd@arm.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Mihail Atanassov <mihail.atanassov@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: Re: [PATCH v6 1/7] drm/panthor: Add performance counter uAPI
Message-ID: <202512221946.gSB6iMCE-lkp@intel.com>
References: <20251215171453.2506348-2-lukas.zapolskas@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215171453.2506348-2-lukas.zapolskas@arm.com>

Hi Lukas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20251219]
[cannot apply to linus/master v6.19-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Zapolskas/drm-panthor-Add-performance-counter-uAPI/20251216-012117
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251215171453.2506348-2-lukas.zapolskas%40arm.com
patch subject: [PATCH v6 1/7] drm/panthor: Add performance counter uAPI
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221946.gSB6iMCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221946.gSB6iMCE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/backlight.h
   ERROR: Cannot find file ./include/linux/backlight.h
   WARNING: No kernel-doc for file ./include/linux/backlight.h
   WARNING: ./include/uapi/drm/panthor_drm.h:381 struct member 'selected_coherency' not described in 'drm_panthor_gpu_info'
   WARNING: ./include/uapi/drm/panthor_drm.h:381 struct member 'selected_coherency' not described in 'drm_panthor_gpu_info'
>> Documentation/gpu/driver-uapi:24: ./include/uapi/drm/panthor_drm.h:1473: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/drm-kms:360: ./drivers/gpu/drm/drm_fourcc.c:397: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35.
   Declaration is '.. c:function:: const struct drm_format_info * drm_format_info (u32 format)'. [duplicate_declaration.c]
   Documentation/gpu/drm-kms:491: ./drivers/gpu/drm/drm_modeset_lock.c:377: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
   Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'. [duplicate_declaration.c]
   ERROR: Cannot find file ./include/linux/hdmi.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
