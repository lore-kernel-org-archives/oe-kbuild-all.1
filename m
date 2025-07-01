Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A24927E7CF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 18:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396278; cv=none; b=Soig7Q/7UPx1/pOFo3M2fcntv/LhU/PU27pe3THC23Ij7SQHs8HbfQYOkeW6UWjxYh7t4OyU3N3C0P++S2VR+KkMo5JGUqQiDZM19MFezALU2RmbtRZmBwDOdTOn9jd0HP2KCMnoLIG89OFDO1iabXcYEs4tiibOfCq9oiHFGpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396278; c=relaxed/simple;
	bh=mf2FTyxHIye3PgS3EgdfyB99WmXBck5O/EsZyNxFZmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFDUr/e8ot3RrTeL4wxDTr3lqvFXiCpvmzXuZ5uhzZP+y3rbcwxJwwkF2wH244g2X2Qgu7gNKmI6T6vS7Es1fxpr2Im3CGPaXihAITF4jTlsBVQ7fiBkYQWPWDM4WA+3ZJNAO9N8BF6LRx9PG8iamO4zCp7JsHYhqO0squ4AyTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+nkycWm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+nkycWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751396277; x=1782932277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mf2FTyxHIye3PgS3EgdfyB99WmXBck5O/EsZyNxFZmQ=;
  b=R+nkycWmlnY8niqtE+qLcZSBZSdnBm1lroGUCbo5yEO1ON3xGzYK/z6J
   05Ph4DrcM6+SbLOiy7hoE9WBN6LFG+g2IUIXCEFhCYzAKU0SUpMmAL4NV
   wYoqCoXeyZ4BrwB1ERZ3ccEKDBRslc3+c1SCRcVOTBk6fXuC7OEAqT/pp
   IrE9qrjwt0vbltUF+L+/TzeBgngCMSb6MV3AMhRuLPRsgNspBM45uvcB5
   bGp9P2C32G7WRcZ7oXRM1dNszQETNvKBvmw7vSFoNlmruyp5q6YSsH0zE
   0umgQBuTq1APzNGhBwqMkEk3+4RTJY3Da1iX1hugHQlOScb/slXJ3kkKx
   g==;
X-CSE-ConnectionGUID: 3N1j4GlpS5mcUe3blRpwJw==
X-CSE-MsgGUID: ioPWvjHLQn26/qFmM4IqGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53611112"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53611112"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 11:57:56 -0700
X-CSE-ConnectionGUID: jDbBbPEKTuSK924hK41v9A==
X-CSE-MsgGUID: 32AdnrsuS1mYxtf0e9o2AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="154343701"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Jul 2025 11:57:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWgAx-000aZ0-2c;
	Tue, 01 Jul 2025 18:57:51 +0000
Date: Wed, 2 Jul 2025 02:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, zack.rusin@broadcom.com,
	martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: Re: [PATCH 2/2] drm/vmwgfx: Implement DRIVER_SYNCOBJ
Message-ID: <202507020238.3SA3i5sA-lkp@intel.com>
References: <20250626201153.1714590-2-ian.forbes@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626201153.1714590-2-ian.forbes@broadcom.com>

Hi Ian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next next-20250701]
[cannot apply to linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Forbes/drm-vmwgfx-Implement-DRIVER_SYNCOBJ/20250627-041356
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250626201153.1714590-2-ian.forbes%40broadcom.com
patch subject: [PATCH 2/2] drm/vmwgfx: Implement DRIVER_SYNCOBJ
config: x86_64-buildonly-randconfig-001-20250702 (https://download.01.org/0day-ci/archive/20250702/202507020238.3SA3i5sA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020238.3SA3i5sA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020238.3SA3i5sA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3866 function parameter 'file_priv' not described in 'vmw_execbuf_copy_fence_user'
>> Warning: drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:3866 Excess function parameter 'vmw_fp' description in 'vmw_execbuf_copy_fence_user'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
