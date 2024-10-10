Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477B11E00AC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728592600; cv=none; b=QGlepZa3YIbuQGtVqjIglEsUeFtMCIAhtaAh1xR+rLwA9qh6OPPBuWmCxjuHdoIRknCNBoPzVxRRaoJzA+wo1tvs3qqXcmPiM+06+JMRm8lUrGsTmgB6DQr76JooW0OQ/35k4n+4eMf6EYVaVA2XQdSEmTz3IrY033I/rq8eUKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728592600; c=relaxed/simple;
	bh=PEOrMed0XoOGSxfnnHoSuxxB2fcADkrYpaZ2gR/BVCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4CdGVnOup6326D8FCFYOPw8CFoTgNRMVeskvSywgkPIXiU40Of2vwOpnaQKh6sV2rrLEOMQcZA5JkFXwj6IAuKbKTdVnxlW4cIEatQpvss5Zcnlh+j+i7Ti5BGSFB88njm+1oELLNNShBqiZ/kttsa3z4gem3g6pFS7mUArimo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJeVJQBo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJeVJQBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728592599; x=1760128599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PEOrMed0XoOGSxfnnHoSuxxB2fcADkrYpaZ2gR/BVCE=;
  b=NJeVJQBoM+m/SMtPOs5VxF/2nGDkZS8PCvuanjIRxWgCCe5CLVQE915F
   3w1VbwzOWXUFTZsnYJ4qQs4a03sXAJCiKZNp/h+G5E9ghb1NxKE3sVwqC
   cS/tv4VRIvPejF6Jeh0P3BNiPnHZpO3JHSgd7W5PLo7zFGeZU1ReoW1r4
   UuF/Yq2ai/vfiD1RMR4NH57fJffVQLuiJMchLWfeHIXDA/TBoLC/sotb/
   pBuQpzEAPWdLNWLqRaQHqN07Y7XfF9yn6H2YVO8XeiIq1rkBa4omfPRJq
   ipGNUid6q+KWtap8PCp3ToXR7gRuM5YHIJKga7MoanprYEvAAOh1iPXQS
   w==;
X-CSE-ConnectionGUID: zS6vvpjnT9SoYPVDZCqMng==
X-CSE-MsgGUID: AbxPVffTRcSdx/reWE2pCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39373347"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="39373347"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 13:36:38 -0700
X-CSE-ConnectionGUID: zsUJwG1uSc2QB6hgk5nb5Q==
X-CSE-MsgGUID: Mv/wsEi3Qfy8gL8addNwnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="81508557"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2024 13:36:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syztd-000BEl-1o;
	Thu, 10 Oct 2024 20:36:29 +0000
Date: Fri, 11 Oct 2024 04:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
	arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
	miquel.raynal@bootlin.com, seanpaul@google.com, marcheu@google.com,
	nicolejadeyee@google.com,
	Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v12 13/15] drm/vkms: Create KUnit tests for YUV
 conversions
Message-ID: <202410110407.EHvadSaF-lkp@intel.com>
References: <20241007-yuv-v12-13-01c1ada6fec8@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007-yuv-v12-13-01c1ada6fec8@bootlin.com>

Hi Louis,

kernel test robot noticed the following build errors:

[auto build test ERROR on 82fe69e63d2b5a5e86ea94c7361c833d3848ab69]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-vkms-Code-formatting/20241008-001316
base:   82fe69e63d2b5a5e86ea94c7361c833d3848ab69
patch link:    https://lore.kernel.org/r/20241007-yuv-v12-13-01c1ada6fec8%40bootlin.com
patch subject: [PATCH v12 13/15] drm/vkms: Create KUnit tests for YUV conversions
config: i386-randconfig-013-20241010 (https://download.01.org/0day-ci/archive/20241011/202410110407.EHvadSaF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110407.EHvadSaF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110407.EHvadSaF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
>> ERROR: modpost: "drm_get_color_range_name" [drivers/gpu/drm/vkms/tests/vkms_format_test.ko] undefined!
>> ERROR: modpost: "drm_get_color_encoding_name" [drivers/gpu/drm/vkms/tests/vkms_format_test.ko] undefined!
>> ERROR: modpost: "get_conversion_matrix_to_argb_u16" [drivers/gpu/drm/vkms/tests/vkms_format_test.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
