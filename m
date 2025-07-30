Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBFC13AD38
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 01:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753838506; cv=none; b=UZQg8FBUhNUFwoNRUboIirPBRcCGczNd9AE1rK5jtr3Qmh+BJ3Je/U+Ngy9gisW3Lna2FJqhjy3FpSigKXnVCb6ewx9bX1bfA40L0UQPZTVF4HzUXRcreI5+jlUguMcOph8KclW49Ct2+G7ggafptCwVkYC6EiMJxINjohsV7pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753838506; c=relaxed/simple;
	bh=R3gNrYHdzITclnyfSxGCADKRFKhKabrpaqBPEsl8dm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAmVJ5EagGReal1M4o4S9+L61yQwBe/B5vL+GEVhPi2lD12rglQPr4Nbh/sVcL+oXHy4w8kIHXRaGXxwdPur9zEuD5KHcbYfAsln6C4KLJZsqyL/IwwrRYfcM6K2C6BLV3S+IsbFhGcaaXcL/4RVUNmmpUC5K2++w7aOq+k6XqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnUP3TNF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnUP3TNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753838505; x=1785374505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R3gNrYHdzITclnyfSxGCADKRFKhKabrpaqBPEsl8dm4=;
  b=QnUP3TNFznjRT0biJOT0IHpdnvfEBBcL/0LsT77fWi5feApSSq9VsxUb
   lXAPmfhJ84lzyOus0YgKXTBpaLZVHKfzBSmACYYM+dQ24+q3MaJrZToGa
   zi9S9z55aHkIZIO3jcL0ZPELF1dMTyCBTgLq7bmIpNcHS2U0aUNQ1IPOq
   HS1P/uIy7MNzM7jc2nU2yNndaIVF8Edc6k0s3vqxpFRrwvWNs/36htJ4H
   7EpjyTzuWFAriEPp5XzQ47LI51cHYgtE73w2prffPsPnsAR6M6rZA9aTx
   KLSWPTbj1Ykt2O7kQyZbJyrLIARvCtJW5RdY5ZYohY3m+L5oPQmMeljYc
   g==;
X-CSE-ConnectionGUID: 4BV48/chTZauk029jyyHEw==
X-CSE-MsgGUID: H5jKAGQXSVKlz24RJsZb9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="73718077"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="73718077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 18:21:44 -0700
X-CSE-ConnectionGUID: Q6wtiKLiRPmPSk9HtS+pqQ==
X-CSE-MsgGUID: RQue8dXSTO611nOM40iAyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="193703742"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2025 18:21:43 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugvVk-0001qZ-2k;
	Wed, 30 Jul 2025 01:21:40 +0000
Date: Wed, 30 Jul 2025 09:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 02/10] ftrace: Add register_ftrace_direct_hash function
Message-ID: <202507300902.9wBNUWc5-lkp@intel.com>
References: <20250729102813.1531457-3-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729102813.1531457-3-jolsa@kernel.org>

Hi Jiri,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]
[also build test ERROR on bpf-next/net bpf-next/master bpf/master linus/master v6.16 next-20250729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/ftrace-Make-alloc_and_copy_ftrace_hash-direct-friendly/20250729-183143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20250729102813.1531457-3-jolsa%40kernel.org
patch subject: [RFC 02/10] ftrace: Add register_ftrace_direct_hash function
config: arc-randconfig-001-20250730 (https://download.01.org/0day-ci/archive/20250730/202507300902.9wBNUWc5-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300902.9wBNUWc5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300902.9wBNUWc5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/i2c/i2c-core-smbus.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/i2c/i2c-core-base.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/i2c/i2c-core-slave.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/i2c/i2c-core-base.o:include/linux/ftrace.h:560: first defined here
--
   arc-linux-ld: drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/renesas/rcar-du/rcar_du_group.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.o:include/linux/ftrace.h:560: first defined here
--
   arc-linux-ld: drivers/gpu/drm/meson/meson_plane.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/meson/meson_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/meson/meson_crtc.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/meson/meson_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/meson/meson_encoder_cvbs.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/meson/meson_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/meson/meson_venc.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/meson/meson_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/meson/meson_vclk.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/meson/meson_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/meson/meson_overlay.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/meson/meson_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/meson/meson_encoder_hdmi.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/meson/meson_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/meson/meson_encoder_dsi.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/meson/meson_drv.o:include/linux/ftrace.h:560: first defined here
--
   arc-linux-ld: drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.o:include/linux/ftrace.h:560: first defined here
--
   arc-linux-ld: drivers/gpu/drm/exynos/exynos_drm_crtc.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/exynos/exynos_drm_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/exynos/exynos_drm_fb.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/exynos/exynos_drm_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/exynos/exynos_drm_gem.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/exynos/exynos_drm_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/exynos/exynos_drm_plane.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/exynos/exynos_drm_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/exynos/exynos_drm_dma.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/exynos/exynos_drm_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/exynos/exynos_drm_fimd.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/exynos/exynos_drm_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/exynos/exynos_dp.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/exynos/exynos_drm_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/exynos/exynos_mixer.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/exynos/exynos_drm_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/exynos/exynos_drm_vidi.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/exynos/exynos_drm_drv.o:include/linux/ftrace.h:560: first defined here
--
   arc-linux-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/pl111/pl111_drv.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/pl111/pl111_debugfs.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/pl111/pl111_display.o:include/linux/ftrace.h:560: first defined here
--
   arc-linux-ld: drivers/gpu/drm/logicvc/logicvc_drm.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/logicvc/logicvc_crtc.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/logicvc/logicvc_interface.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/logicvc/logicvc_crtc.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/logicvc/logicvc_layer.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/logicvc/logicvc_crtc.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/logicvc/logicvc_mode.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/logicvc/logicvc_crtc.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/logicvc/logicvc_of.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/logicvc/logicvc_crtc.o:include/linux/ftrace.h:560: first defined here
--
   arc-linux-ld: drivers/gpu/drm/arm/malidp_hw.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/arm/malidp_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/arm/malidp_planes.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/arm/malidp_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/arm/malidp_crtc.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/arm/malidp_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/arm/malidp_mw.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/arm/malidp_drv.o:include/linux/ftrace.h:560: first defined here
--
   arc-linux-ld: drivers/gpu/drm/mxsfb/lcdif_kms.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/mxsfb/lcdif_drv.o:include/linux/ftrace.h:560: first defined here
--
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_kms.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_gem.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_vram.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_fence.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_object.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_debugfs.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_plane.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_ioctl.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_prime.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_trace_points.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/virtio/virtgpu_submit.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/virtio/virtgpu_drv.o:include/linux/ftrace.h:560: first defined here
--
   arc-linux-ld: drivers/gpu/drm/kmb/kmb_drv.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/kmb/kmb_crtc.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/kmb/kmb_plane.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/kmb/kmb_crtc.o:include/linux/ftrace.h:560: first defined here
   arc-linux-ld: drivers/gpu/drm/kmb/kmb_dsi.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:560: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/kmb/kmb_crtc.o:include/linux/ftrace.h:560: first defined here
..


vim +560 include/linux/ftrace.h

   556	
   557	int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   558	{
   559		return -ENODEV;
 > 560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
