Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808274;
	b=qEVoKjHACtO8+08JUZ1Vk4D5kK/28ut+dTa9ciDZRQNIwNefp1tZZU0XpY/8SIzQnq2Z
	 /gTeuHIolv2kTGdFNx92jJYkf6Qtbo28gwzz1nuh3kmsWk9+67vc4sEUaJjhYVGxwJDrv
	 3liKKh/r0AcSfQH5oxIvZe3JzupNsJDM8MnrHqhNV5MwatZdTRC/E1FAXuVWFnPXzYeVx
	 9ClnYIwRf5tT7j2yGvh++7W8UYze9aS/AgcC3jHq0k/eYNU0AMFr/luf7pJ3VPf2oNIwi
	 J8nEbBHiTYHn8KrFFf18/fYIIZDQmUGCzHNPA3WDrhZOV3S2fMYfRqQRTiJ3+a6PNNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808274;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=w4DCdH1N8UX2GtBtVnpn1DIaJ2/ES0rCVlhlxaDS3QI=;
	b=0RFmEqrRbN0FoM+STbvmUgye4RjYFTJdhZUgPas4i0kCQilTSIZOikT0Bt3rD8wLQPgH
	 jjhh2fqvg4te0sM86wEyVEdXGGukzGkEYJvP2lB00XUujS0uZcLo7AX0/wV3i5C7eeBF3
	 ZpjyEmFeB0oyL5AtM5Qe0dGeijQ2rlO3PvgMySS/o4UG7GtXdHQnUKc8V/ujf1FxYnw3D
	 w0EZ99e0aD4flM8iloyI2gSSyf4zRBnk7aEyK8C7VdvbTxNMmHVc+qQzcD5naE+s5JzZe
	 rwvriTlPPTpD+m6PrgfXn27aVzJpS2te/Kc0VlL0+AYiU2WmHAmQoxaonBoMba9e4tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bAlhb+iz;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FBF606A31E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 19:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80FBF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bAlhb+iz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795808274; x=1827344274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zE+2E/0tKXQ7uwcDPT37wQcSd57BL3umH2kOyf1J+i4=;
  b=bAlhb+iziAkVsuGwvQPOcebXpacqpdxC9S83KGxilhaS/xqlnc+7wQZ9
   UXZ1RkYDIHRImezCR8uvdCeY7i6ZP14ZAIGC/POztBvSdYN1xqBzAHK8d
   GvHns7alfO6bD2D+Vt1ZvYlmVuaTXoQCSZiCeppAAhBunQjeSQakQIcwY
   W9l/ylF3YSJfWsA4BbAi3HTvoMnnV9I7w8HY8fWOsmyDAPupxzW7lwB1H
   +s3SJW2+Lu3l15vi5au4Sqc9910UvvXPBDxTilvPMvOLscbYUz91iDgp3
   lPsum2bm+ZTbxQEA7cecw8Uzi+vjLrBnxdt6IBbc2Eieu9koXm5v3ktmt
   g==;
X-CSE-ConnectionGUID: +k+iMbRIQNOPR2ATottGGw==
X-CSE-MsgGUID: DWaOvVXNQJOqeWyLmYrEKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4628015"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4628015"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 11:37:53 -0800
X-CSE-ConnectionGUID: DVB8FTOOQ5GNP2Nufelj7g==
X-CSE-MsgGUID: SBA8Mns1SkGxD8bxpMD/Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="14219744"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 27 Nov 2026 11:37:48 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX1lS-000000000Ks-1jDf;
	Fri, 27 Nov 2026 19:37:46 +0000
Date: Fri, 27 Nov 2026 20:36:54 +0100
From: kernel test robot <lkp@intel.com>
To: Alexandru Dadu <alexandru.dadu@imgtec.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org,
	Alexandru Dadu <alexandru.dadu@imgtec.com>,
	Matt Coster <opensource@mtcoster.net>
Subject: Re: [PATCH 3/6] drm/imagination: Save metadata from firmware
Message-ID: <20261127203348.WkidhfEf-lkp@intel.com>
References: <20261125-b4-commonize-fw-segment-loading-v1-3-69657fa52ac3@imgtec.com>
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
In-Reply-To: <20261125-b4-commonize-fw-segment-loading-v1-3-69657fa52ac3@imgtec.com>

Hi Alexandru,

kernel test robot noticed the following build errors:

[auto build test ERROR on c88084027d0e922dd925b96e5a0d184ba04a8f43]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Dadu/drm-imagination-Remove-get_fw_obj_gpu_addr/20261125-134829
base:   c88084027d0e922dd925b96e5a0d184ba04a8f43
patch link:    https://lore.kernel.org/r/20261125-b4-commonize-fw-segment-loading-v1-3-69657fa52ac3%40imgtec.com
patch subject: [PATCH 3/6] drm/imagination: Save metadata from firmware
config: arm64-randconfig-r2102-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127203348.WkidhfEf-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127203348.WkidhfEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127203348.WkidhfEf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pvr_exp_fw_support
   >>> referenced by pvr_fw_info.c:150 (drivers/gpu/drm/imagination/pvr_fw_info.c:150)
   >>>               drivers/gpu/drm/imagination/pvr_fw_info.o:(pvr_fw_load_metadata_and_device_info) in archive vmlinux.a
   >>> referenced by pvr_fw_info.c:150 (drivers/gpu/drm/imagination/pvr_fw_info.c:150)
   >>>               drivers/gpu/drm/imagination/pvr_fw_info.o:(pvr_fw_load_metadata_and_device_info) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
