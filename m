Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795152854;
	b=spRJkNKIInm/+vl4pwvqv9eQa1Pq6Add2+DjtjBmb7749HVff3F5CT9kAWOIst5GqxIf
	 B9TGW0HD2dbU2VepmieiUxg7D+t6hXvwGN0uqnD5MTcYjXi3baAlDvWurqUBlw/kShGe2
	 57rVXbe2XuPG4bdzpgsjrQfV4ncjyvBLiYLIn3HWqOR9auxhonM+fWLK7YIDEyt+rWFSh
	 BrSR9IPGNuT3ZrxC5Ck5j6YxLrlcHx3OmScgVAU0IC7I9QPkaxBdPD8YNjkCXz0EG17dV
	 3PDn93f6e8YtWTQu3JWAHuP+7ssE5qyLOYW37NlYHFfTQejyuKJD0Z6TIt2gaPTKC9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152854;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gzHY8FQ+NrEVRH2IMQxm2M/u6YGcUwpzTFex5Db/fio=;
	b=xFSf5cj/mLSNwjc9sTkdMo6x62pCSPBcIecdGj3FWti9O5EILEzmlH3OE7DEK3ZHQUjG
	 3uUF7HW0OrU+YIRw8SfNrp9/K/3dVbMHazmiaimPW5gDTeEhY4Hqx+O/oQ2UbVGvLRqd6
	 OM06N0RgRj7xr7J5HTIVKxGTpOzmopdQDOZ1ypjYh6fe8RHJ5WXe6k/l2yx0kjcgN/6Gq
	 tTLwbrEU1ZEd6awhIyc3Q3z9EMX82BX3vx9CH13hJQn7qmVCxa3FoVBIzcH98PG4nP5xg
	 bCX6q9CmpAeKAgvxArQTOYhhKfZh+KzNqJfcZODi5HX3dYQlW2JLygGvkdjT1JV42CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Se+8VKle;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C3C606A320
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 05:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C3C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Se+8VKle
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795152854; x=1826688854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OCVdDxMr1t8M6dHp++0c2NOjv52F3+0v0dMULJONneI=;
  b=Se+8VKledSyLPsq8TRDNBJGaVjJpmt6hPIVSnQLXmuDdDbf/QWALMxU0
   B6r8/btG4At5XhdVPQ4JSg9h1DRf9W4elT6sdJfIlrfTwjmwM/dLyASWS
   roBcWRdUrh4ZGMqjSeRWoI/LxgqMiHe8ZpopFcvRjVmdRh8I98XDqFOcY
   3Z+UoWvKfMepyRx+HvpVw0zATKUWkiJ/smAW18D5fnx3HMTiqzMDrqoCS
   euBKnPK+zFkVSeeyG+U3ykOex+JgSD5ZAH0JozOL9crNcisqQxSBGmAR8
   Z0pStrSCHN4AXPRmWS97+DIywPmq6R7kmHbrnQS5OMpN/p0I1AVtLHDSG
   g==;
X-CSE-ConnectionGUID: vlLyNNTPQ0O6JXAuujTZlg==
X-CSE-MsgGUID: s+4PIWV1T6q4Z6Z6wanYxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4032000"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4032000"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 21:34:13 -0800
X-CSE-ConnectionGUID: hAI4nHgNSKCbgnGuJPNlMA==
X-CSE-MsgGUID: +H9SVWYHQuKgfc2f9usO8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10612149"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Nov 2026 21:34:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUHGC-00000001HAZ-3rSc;
	Fri, 20 Nov 2026 05:34:08 +0000
Date: Fri, 20 Nov 2026 13:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 19/20] drm/nouveau: Allow platform driver build with
 COMPILE_TEST=y
Message-ID: <202611201357.plofVxy6-lkp@intel.com>
References: <20261118214518.29317-20-ville.syrjala@linux.intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118214518.29317-20-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20261116]
[cannot apply to linus/master v7.4-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-tilcdc-Allow-build-without-__iowmb/20261118-234458
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261118214518.29317-20-ville.syrjala%40linux.intel.com
patch subject: [PATCH v4 19/20] drm/nouveau: Allow platform driver build with COMPILE_TEST=y
config: i386-buildonly-randconfig-1002-20261120 (https://download.01.org/0day-ci/archive/20261120/202611201357.plofVxy6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611201357.plofVxy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611201357.plofVxy6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nouveau_platform.c: In function 'nouveau_platform_resume':
>> drivers/gpu/drm/nouveau/nouveau_platform.c:53:37: error: incompatible type for argument 1 of 'gk20a_devfreq_resume'
      53 |         return gk20a_devfreq_resume(dev);
         |                                     ^~~
         |                                     |
         |                                     struct device *
   In file included from drivers/gpu/drm/nouveau/nouveau_platform.c:24:
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h:20:54: note: expected 'struct device' but argument is of type 'struct device *'
      20 | static inline int gk20a_devfreq_resume(struct device dev) { return 0; }
         |                                        ~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/nouveau/nouveau_platform.c:54:1: warning: control reaches end of non-void function [-Wreturn-type]
      54 | }
         | ^


vim +/gk20a_devfreq_resume +53 drivers/gpu/drm/nouveau/nouveau_platform.c

6ca1701cecdb2de Aaron Kling 2025-09-06  50  
6ca1701cecdb2de Aaron Kling 2025-09-06  51  static int nouveau_platform_resume(struct device *dev)
6ca1701cecdb2de Aaron Kling 2025-09-06  52  {
6ca1701cecdb2de Aaron Kling 2025-09-06 @53  	return gk20a_devfreq_resume(dev);
6ca1701cecdb2de Aaron Kling 2025-09-06 @54  }
6ca1701cecdb2de Aaron Kling 2025-09-06  55  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
