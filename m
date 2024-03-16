Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28091172C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710586609; cv=none; b=RHseyOSnYW4bDk/v3sd55JoQlhY3w2lKdWCSRO2KvxV4B9Bc92Ux3ONR9SB1AvbopWsvW0LoxvbntNbWV7hv/xKu8RGqVMXeSV8HbrpUVCJj5uzVUax4oy6MX+cr1Ho6h304hFrMtTGNvy9fUhhsFkrhGoNtqy2tM7id77qKHc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710586609; c=relaxed/simple;
	bh=FenhF9rT3Nu44V/5/acTeX2T3v3JKzcRl7tD2KsHuds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rC+XhlukUBYqNDC6KYoo9cFLKgXASrVdBSZ8F/jSEgYCEL/pZqU1w1qBIqerFqZS4pA+gPaKvS037a6wIK+g7itc6F3DEUfIPbN3uW5wgLP+dlOeS9bjnQR3dcWBYCbynH+3BlQmUv3cQevY0HSC+1crJWsmx3f+Ek9bDgIu184=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkpV9Nb9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkpV9Nb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710586607; x=1742122607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FenhF9rT3Nu44V/5/acTeX2T3v3JKzcRl7tD2KsHuds=;
  b=bkpV9Nb9uyn7V6CL5wV+xZ9SafR11yZ23majX8oJgTj7l5pCfhYugRVE
   9cBZSHvPL49a4eHdlPdXg4abM3HMCDnpj1JOQ2aGwj+AEDQNTS9f7kTTj
   NQleZw4GDDGHahhj64rOV5FPuioSxMZtaAyJWXhnUcA7uMjaq2blTJRzI
   TFuKcMl9I2owv5jtdNgw9eEaftOW4BOgcZVMrJ8iD3/L78IwrqFRNhJ1R
   mDXeSVTfPz1O+BXWTi/VSZo6NYCTYs3bTc9lIbHensoCxqIkfC+SsF0GQ
   CRZjcQfjAAIRtJs5pNwmaWhK6qu9eceLTQk2IIY6KYTv1bgrlPD4mbbeL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5314064"
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="5314064"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 03:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="13022929"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Mar 2024 03:56:43 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlRiS-000FKn-3D;
	Sat, 16 Mar 2024 10:56:40 +0000
Date: Sat, 16 Mar 2024 18:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, David Airlie <airlied@gmail.com>,
	linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
	linux-arm-kernel@lists.infradead.org,
	Daniel Vetter <daniel@ffwll.ch>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance
 testing
Message-ID: <202403161837.76okceZN-lkp@intel.com>
References: <20240315230916.1759060-7-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315230916.1759060-7-sean.anderson@linux.dev>

Hi Sean,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.8]
[cannot apply to drm-misc/drm-misc-next linus/master next-20240315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/drm-zynqmp_dp-Downgrade-log-level-for-aux-retries-message/20240316-071208
base:   v6.8
patch link:    https://lore.kernel.org/r/20240315230916.1759060-7-sean.anderson%40linux.dev
patch subject: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance testing
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240316/202403161837.76okceZN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161837.76okceZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161837.76okceZN-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp.o: in function `zynqmp_dp_rate_set':
>> zynqmp_dp.c:(.text+0x1a7a): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
