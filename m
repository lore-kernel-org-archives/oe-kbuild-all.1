Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB25328E32
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVzmhC5R"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696516524; x=1728052524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pAVSAkcc6HMK40giTswxHGXDEx3wtp5E0BQaJCeAZx4=;
  b=CVzmhC5RnYSCdZPOxdtejgJhGeRL7mPIkrbqp5YwxXn583f9Kt2mHbrm
   DTT++VU/FW3+qGRVrIZk6pLpVkmsNBy5qlme2ZP/sm4WYsW3iS6TssvIU
   tTdhpf6n5ZzCL5b46F6hGNlqhGKvawyRwDESi3tCmBSFIfshkRZy7USIH
   gRcnLw2wvz7Nsmz6FVL3hx0WFG99cUcSfgHyhHUw7twdjDICsYUMX9z/D
   W6yeWJFoSPvdDfcO/TydZKUSYjTEFdlduKMN42KKkvtBGBDP71rvjUY4Z
   d/qG4Y3T6R9gzTwVlzxNTZW3URmMnBRzqYYnNbP6je4yuh8SbWVVzh+bh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="383416686"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="383416686"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 07:34:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="895470039"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="895470039"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Oct 2023 07:33:14 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoPR3-000LVy-03;
	Thu, 05 Oct 2023 14:34:41 +0000
Date: Thu, 5 Oct 2023 22:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Uma Shankar <uma.shankar@intel.com>
Subject: [linux-next:master 7648/9984]
 drivers/gpu/drm/i915/display/intel_dsb.c:363 _intel_dsb_commit() warn:
 always true condition '(dewake_scanline >= 0) => (0-u32max >= 0)'
Message-ID: <202310052201.AnVbpgPr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d730f1bf6f39ece2d9f3ae682f12e5b593d534d
commit: f83b94d23770c234cdc51a1468b3ce9d7e42f20e [7648/9984] drm/i915/dsb: Use DEwake to combat PkgC latency
config: x86_64-randconfig-161-20231005 (https://download.01.org/0day-ci/archive/20231005/202310052201.AnVbpgPr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310052201.AnVbpgPr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310052201.AnVbpgPr-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_dsb.c:363 _intel_dsb_commit() warn: always true condition '(dewake_scanline >= 0) => (0-u32max >= 0)'

vim +363 drivers/gpu/drm/i915/display/intel_dsb.c

   338	
   339	static void _intel_dsb_commit(struct intel_dsb *dsb, u32 ctrl,
   340				      unsigned int dewake_scanline)
   341	{
   342		struct intel_crtc *crtc = dsb->crtc;
   343		struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
   344		enum pipe pipe = crtc->pipe;
   345		u32 tail;
   346	
   347		tail = dsb->free_pos * 4;
   348		if (drm_WARN_ON(&dev_priv->drm, !IS_ALIGNED(tail, CACHELINE_BYTES)))
   349			return;
   350	
   351		if (is_dsb_busy(dev_priv, pipe, dsb->id)) {
   352			drm_err(&dev_priv->drm, "[CRTC:%d:%s] DSB %d is busy\n",
   353				crtc->base.base.id, crtc->base.name, dsb->id);
   354			return;
   355		}
   356	
   357		intel_de_write_fw(dev_priv, DSB_CTRL(pipe, dsb->id),
   358				  ctrl | DSB_ENABLE);
   359	
   360		intel_de_write_fw(dev_priv, DSB_HEAD(pipe, dsb->id),
   361				  i915_ggtt_offset(dsb->vma));
   362	
 > 363		if (dewake_scanline >= 0) {
   364			int diff, hw_dewake_scanline;
   365	
   366			hw_dewake_scanline = intel_crtc_scanline_to_hw(crtc, dewake_scanline);
   367	
   368			intel_de_write_fw(dev_priv, DSB_PMCTRL(pipe, dsb->id),
   369					  DSB_ENABLE_DEWAKE |
   370					  DSB_SCANLINE_FOR_DEWAKE(hw_dewake_scanline));
   371	
   372			/*
   373			 * Force DEwake immediately if we're already past
   374			 * or close to racing past the target scanline.
   375			 */
   376			diff = dewake_scanline - intel_get_crtc_scanline(crtc);
   377			intel_de_write_fw(dev_priv, DSB_PMCTRL_2(pipe, dsb->id),
   378					  (diff >= 0 && diff < 5 ? DSB_FORCE_DEWAKE : 0) |
   379					  DSB_BLOCK_DEWAKE_EXTENSION);
   380		}
   381	
   382		intel_de_write_fw(dev_priv, DSB_TAIL(pipe, dsb->id),
   383				  i915_ggtt_offset(dsb->vma) + tail);
   384	}
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
