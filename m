Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9048615748E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 11:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723290360; cv=none; b=HuYalr8aJ0Hhz8r11F148FlV7CeyXt++v9YjaArr4YRIlP2xHGU7sKnZFXiB2QzqrSxZq+nNCFn47QrWTIyZe3hmFp+heltiA/Ac6Syi5xYMKHDyON1t9tKOFzb6jCTTZHUHuPao/B+bxe84DtXRUze+xOrv+sn8IsZEbD8I3CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723290360; c=relaxed/simple;
	bh=8DIEUv9amZ+E2lCgoLiQtJnnKGQaWds7ILyjPec/rbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBh2R+pfm30y5Xrvs9O7d0rcNhuj7m6tgST3LQTq4gGmgHCF25sneNCUEmWyIcACv0zQA170cIC2mbeJyWN6go0x1+KoZgMo23KjBLyzoRtaNJTQ3MsbobEetrBnP7AgcLS0pKA7hlAqD04Feh3PEAaMWl74Tz7eNwvX8j+OK6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPKA9D16; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPKA9D16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723290359; x=1754826359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8DIEUv9amZ+E2lCgoLiQtJnnKGQaWds7ILyjPec/rbg=;
  b=mPKA9D16RRnP6BlQTv2HZLrbW9LOoR+jF8oR36Z8JkBoXO9qsWS5uFLB
   5QYPggqDkDOR0gQQzfUqjjmWT0UVHz3dzksCAPBh6Hla/mfPDSKtMtUVQ
   KhF6zWi1sRpPe2+4xjDtf/Klx0QphXC6VD+WWQUUQefff+etKIWOViNDe
   GEjMYNQWRuVFqjhngXwntFOu6I3cmRvmYEL6nMWiJYAhKv2q7o82Ots8y
   OvfleoAqHpdLX7rzS3Qn0O4z/h7q+zGylfcEplfqbk8oTJHAjX0csOXHG
   28uOs+HdNNF9r34UNuCtrhyo9+/Sy+97iKfTSN9Y4fgpLA+kHxdxUuVpa
   g==;
X-CSE-ConnectionGUID: LN67eXGfRDmwIzI7ccOkUQ==
X-CSE-MsgGUID: 8XjYd1lZTiyVvO9gqEWtAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21434572"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="21434572"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 04:45:56 -0700
X-CSE-ConnectionGUID: ZE69ZQ+cRkaODyeSfuUf/A==
X-CSE-MsgGUID: 8yfBQNjpRaGLylUsHtViLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="57701445"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Aug 2024 04:45:06 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sckWt-0009tr-0P;
	Sat, 10 Aug 2024 11:45:03 +0000
Date: Sat, 10 Aug 2024 19:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Helge Deller <deller@gmx.de>, Sam Ravnborg <sam@ravnborg.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org
Subject: Re: [PATCH] video/aperture: match the pci device when calling
 sysfb_disable()
Message-ID: <202408101951.tXyqYOzv-lkp@intel.com>
References: <20240809150327.2485848-1-alexander.deucher@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809150327.2485848-1-alexander.deucher@amd.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Deucher/video-aperture-match-the-pci-device-when-calling-sysfb_disable/20240810-021357
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240809150327.2485848-1-alexander.deucher%40amd.com
patch subject: [PATCH] video/aperture: match the pci device when calling sysfb_disable()
config: csky-randconfig-001-20240810 (https://download.01.org/0day-ci/archive/20240810/202408101951.tXyqYOzv-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408101951.tXyqYOzv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408101951.tXyqYOzv-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/video/aperture.o: in function `aperture_remove_conflicting_pci_devices':
>> aperture.c:(.text+0x222): undefined reference to `screen_info_pci_dev'
   csky-linux-ld: drivers/video/aperture.o: in function `devm_aperture_acquire_release':
>> aperture.c:(.text+0x2c0): undefined reference to `screen_info'
>> csky-linux-ld: aperture.c:(.text+0x2c4): undefined reference to `screen_info_pci_dev'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
