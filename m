Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57D34369A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 04:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771994594; cv=none; b=EeAcktZAffEmvxxPzD/oJMnX1rpgTspHuafCiDacVsozvut1x8KPkiPFXExO/pfY75AGThM8eH7g9q3oRZAgvhufkLJ9DbxL6+acXQBkwW3i1ygpE9DKMbivC92tKlGfSmZP7BH9Ppg/XNvbUbdvJosuUIpiTLxCHdxTXAPn9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771994594; c=relaxed/simple;
	bh=t8D1jQ9ZuCv1Th6BUK3UHEMBCGLUWLXCWP6xRrFdjOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ui9kyWs7GozRjjkLIMvheBwcN46w/X5M5RkSS/2NJXdmjlRTrlL3ftZRH4G0dcTQk9ypD3KuXIkXZPDnnqYtLwe8gtYbO3v15b7KALMQ7iwxiKz6+axG8EFfuSFGPOHyCKEMCC17MpIKz6QzQdr8lm28NCYDUDQPUuPTX7EcISw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuxQVyhP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuxQVyhP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771994593; x=1803530593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t8D1jQ9ZuCv1Th6BUK3UHEMBCGLUWLXCWP6xRrFdjOk=;
  b=EuxQVyhPMy4OYbB5SmiUTcnVma9daepJnEYd2cI/W6vZZpznTiEJmB8m
   ALrcwJoL1fsHkalk56k3bJt/GxzP1IA40g2Y+zrVNgYlIOer3HNKAbWef
   bzz2IYH05mgrvNm2Q+zcQNnqZ5VJSaqYiJv/TDiRCVIsqGm2ihQAB5vNd
   9NOuHvsipoLi5ruZ2eNpe5ztck5cFK16Hs4a1TWMmW7Ach8m72bM9Hxrr
   GUurlofhPmhzS8XXdGMF50eubhYA8mRecOgOsFPcx4JyFplAugmBw5se4
   vS5JTKQuZ+TkhL8rvsfEp4a045z4kl3oTNf6i85W3pzu9z/mvK/TPuOKW
   Q==;
X-CSE-ConnectionGUID: GDBz3HgGTyC8Q8HAeS6NSQ==
X-CSE-MsgGUID: DwOTgtAUSvSPSTEXgp6b5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76631496"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="76631496"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 20:43:13 -0800
X-CSE-ConnectionGUID: gJFov5EqTTK771rDhExCrw==
X-CSE-MsgGUID: xQlg1DhiQgaLy7mOujti4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="253871912"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Feb 2026 20:43:10 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv6jV-000000003vV-0nt6;
	Wed, 25 Feb 2026 04:42:52 +0000
Date: Wed, 25 Feb 2026 12:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Harry.Wentland@amd.com, simona@ffwll.ch,
	airlied@gmail.com, jani.nikula@linux.intel.com,
	ville.syrjala@linux.intel.com, superm1@kernel.org,
	Leo Li <sunpeng.li@amd.com>
Subject: Re: [PATCH 2/5] drm/vblank: Introduce deferred vblank enable/disable
Message-ID: <202602251257.hwgG2w64-lkp@intel.com>
References: <20260224212639.390768-3-sunpeng.li@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224212639.390768-3-sunpeng.li@amd.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.0-rc1 next-20260224]
[cannot apply to drm-i915/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunpeng-li-amd-com/drm-vblank-Add-drm_crtc_vblank_is_off-helper/20260225-052945
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260224212639.390768-3-sunpeng.li%40amd.com
patch subject: [PATCH 2/5] drm/vblank: Introduce deferred vblank enable/disable
config: microblaze-randconfig-r053-20260225 (https://download.01.org/0day-ci/archive/20260225/202602251257.hwgG2w64-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251257.hwgG2w64-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_vblank.c:1402:6-25: WARNING: atomic_dec_and_test variation before object free at line 1409.
   drivers/gpu/drm/drm_vblank.c:1402:6-25: WARNING: atomic_dec_and_test variation before object free at line 1416.

vim +1402 drivers/gpu/drm/drm_vblank.c

  1385	
  1386	void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
  1387	{
  1388		struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
  1389		int vblank_offdelay = vblank->config.offdelay_ms;
  1390		bool needs_deferred_disable;
  1391	
  1392		if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
  1393			return;
  1394	
  1395		if (drm_WARN_ON(dev, atomic_read(&vblank->refcount) == 0))
  1396			return;
  1397	
  1398		needs_deferred_disable =
  1399			drm_crtc_needs_deferred_vblank(drm_crtc_from_index(dev, pipe));
  1400	
  1401		/* Last user schedules interrupt disable */
> 1402		if (!atomic_dec_and_test(&vblank->refcount))
  1403			return;
  1404	
  1405		if (!vblank_offdelay)
  1406			return;
  1407		else if (vblank_offdelay < 0) {
  1408			if (needs_deferred_disable)
> 1409				mod_delayed_work(dev->deferred_vblank_wq,
  1410						 &vblank->disable_work,
  1411						 0);
  1412			else
  1413				vblank_disable_fn(&vblank->disable_timer);
  1414		} else if (!vblank->config.disable_immediate) {
  1415			if (needs_deferred_disable)
  1416				mod_delayed_work(dev->deferred_vblank_wq,
  1417						 &vblank->disable_work,
  1418						 msecs_to_jiffies(vblank_offdelay));
  1419			else
  1420				mod_timer(&vblank->disable_timer,
  1421					  jiffies + ((vblank_offdelay * HZ) / 1000));
  1422		}
  1423	}
  1424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
