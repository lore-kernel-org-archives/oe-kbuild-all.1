Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B715732B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424244; cv=none; b=UFkO8TqvxOx9eZOhfSF8oghEh9ExJEdRKxY3W6+dKXu71epH/xXBT83lKbYpFywnrXA3B08UNuL2vWsC73kbkNS/xC7G6RjuRaBMAdsbuZdQE3THKgE8uv+obraxM9lbEjqokS/ooBibidAFSDT+ZSUbNHc4BViHREzX5b0AE50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424244; c=relaxed/simple;
	bh=M4cpSKj/g6O6NW9DdFDC5/ic9QUVsv0giSdx9O74mnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cje2AHJbRmUWXobcBAf7ugZB1iR+K7aI9ol+j/gi7+3qbRpJH5UG+/5cmpGtVY5MssugdRZjb6q0VxyU8Oi8X+aORrecHXFKn9ZlBEEn1UMldV4tiSpqXt1n8p2DJzspzPc0LceQOMwoqRAs2GEMZ7EQznBcoFbZPDX5sGjKjQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TiOLHw9Z; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TiOLHw9Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715424243; x=1746960243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M4cpSKj/g6O6NW9DdFDC5/ic9QUVsv0giSdx9O74mnQ=;
  b=TiOLHw9ZeOfk1jIBL7EAPXSQfmPK0DvIoCWhA54/RDCXrBHVcN50iaGa
   42sBbLi1SmVDFIbl4WY8EXlxbqTMVTqGqWtLPZ8JwILnfjm9EM6uGQN8u
   cfOFWLYITIkwM6XGTLfy/yVnjvLsVfmw+qNxg7tp+Cu98qjxcuVMCgScT
   hCpax0wp+deYiycVeVM0csgnblZqF75bnJXYSkCi2vS5/UqvgO/JkdLiE
   iywbX4Vh0oljgstUy/CxojYqW8JeKVYEs8vSQEuOo0FByl70t/iHvfIyu
   zZk8I1Cpvw6EMyf0dbcaRmw2GU7b+vCAeiyVtsAl0Jv4QWcXyg/piBsUW
   g==;
X-CSE-ConnectionGUID: fCsajD4ZQ8K6+7NYrEozzA==
X-CSE-MsgGUID: qm79UpkdRrGPS40Rkdot0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11546098"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="11546098"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 03:44:02 -0700
X-CSE-ConnectionGUID: 7WA9QmVcQgu44uT3ikGI8g==
X-CSE-MsgGUID: mNnu/DkGSdWNd7oYI/E3+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="30440780"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 May 2024 03:44:01 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5kCs-0007GR-0n;
	Sat, 11 May 2024 10:43:58 +0000
Date: Sat, 11 May 2024 18:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 20/20] drm/xe/display: move device_remove over to drmm
Message-ID: <202405111815.TdKOTxKQ-lkp@intel.com>
References: <20240510181212.264622-42-matthew.auld@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510181212.264622-42-matthew.auld@intel.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm-misc/drm-misc-next next-20240510]
[cannot apply to linus/master v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/drm-drm_managed-try-to-improve-the-drmm-DOC/20240511-061452
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240510181212.264622-42-matthew.auld%40intel.com
patch subject: [PATCH 20/20] drm/xe/display: move device_remove over to drmm
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240511/202405111815.TdKOTxKQ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111815.TdKOTxKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111815.TdKOTxKQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_device.c:18:
   drivers/gpu/drm/xe/display/xe_display.h: In function 'xe_display_probe':
>> drivers/gpu/drm/xe/display/xe_display.h:50:43: warning: no return statement in function returning non-void [-Wreturn-type]
      50 | static inline int xe_display_probe(struct xe_device *xe) { }
         |                                           ^~~~~~~~~


vim +50 drivers/gpu/drm/xe/display/xe_display.h

    49	
  > 50	static inline int xe_display_probe(struct xe_device *xe) { }
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
