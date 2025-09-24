Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54F62FF140
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 12:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715548; cv=none; b=tpHHKWSG71ScXp4/dB1JrKIt0j8J4Nx7FMI1pSNGAbwHPaj/cEqpH72xLmKzU4gDUnJGHcnSQn2n68k7tnVV2lVrjXeHXFaTsnQfllk+AKIIumns1UiVYwEj8do3gCwvb2Kmzd4Fh9xv7EXvdM/l2qWwPl49aZ0fowH4TSH6kX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715548; c=relaxed/simple;
	bh=68IQ4FrRPsz3bY1pAcUSrZwRXLdD31aIPnDFe/lu+3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GS3FZO6mlBgZmhIHPpnPrclmWqNfYMkGlfPAzEWSF+KcvMhsdglc+3e3gHu4miKX9CNFKI7HD01j/fyjduqVYNNLBDrCDEGFI4ibB3N18Xg3Lt7PsUIyLYodT+1ApZvIk3YaTD6AWMW3kWpZNUao4//T61rdi3z5BplLcRy18g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGU5Ydy7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGU5Ydy7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758715547; x=1790251547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=68IQ4FrRPsz3bY1pAcUSrZwRXLdD31aIPnDFe/lu+3Y=;
  b=UGU5Ydy7JZnrbmYGwlnfxwwp4dZ3YYI4ix0uwFYPn9+4a8778NAruQMG
   SM0VBDwM3B06Ka6xU/e1MHc1lmlYnDu2ebx4WwsYeEGFTMJIQYf5EUoF+
   VVae/SqdEO1nuuhAlxKB8FBB/a41Vl3W81+yuw5A7KNOsMSwm0+skp+op
   vABbee3E5ecpmOhpk94UBOjGGiZaM5RusbKBpHolWdBR6ie//IA2P5aYV
   K+YkzS8H9AwRKQtSjaaJ0OKmu5iyCABC5hWTkkiLM9GI+iEH05geTXxMD
   jjBzB7FhW5obmQ4OH9xCLyi3Wg65WZW8rP0K55kNzuVgglMOov+2NeYTI
   g==;
X-CSE-ConnectionGUID: 64b4Rfh2Q8msv2kRI5JyvQ==
X-CSE-MsgGUID: x+ijJYYWTXaTZIg0v2RbKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61122041"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="61122041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 05:05:46 -0700
X-CSE-ConnectionGUID: pz0FWlU5RZKgOdyPv+6K1g==
X-CSE-MsgGUID: eaMjggc0Q2q0BiLkznbf9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="176141533"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Sep 2025 05:05:43 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1OFh-00047V-0V;
	Wed, 24 Sep 2025 12:05:41 +0000
Date: Wed, 24 Sep 2025 20:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>,
	dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	=?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>
Subject: Re: [PATCH] drm/shmem-helper: Add huge page fault handler
Message-ID: <202509241920.PtSEkfd4-lkp@intel.com>
References: <20250923095634.50051-1-loic.molinari@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923095634.50051-1-loic.molinari@collabora.com>

Hi Loïc,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.17-rc7 next-20250923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lo-c-Molinari/drm-shmem-helper-Add-huge-page-fault-handler/20250923-175753
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250923095634.50051-1-loic.molinari%40collabora.com
patch subject: [PATCH] drm/shmem-helper: Add huge page fault handler
config: arm64-randconfig-r111-20250924 (https://download.01.org/0day-ci/archive/20250924/202509241920.PtSEkfd4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241920.PtSEkfd4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241920.PtSEkfd4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_gem_shmem_helper.c:595:9: sparse: sparse: statement expected after case label

vim +595 drivers/gpu/drm/drm_gem_shmem_helper.c

2194a63a818db7 Noralf Trønnes  2019-03-12  593  
16bf6748ef6aaf Loïc Molinari   2025-09-23  594  	default:
d611b4a0907cec Neil Roberts    2021-02-23 @595  	}
d611b4a0907cec Neil Roberts    2021-02-23  596  
16bf6748ef6aaf Loïc Molinari   2025-09-23  597   out:
21aa27ddc58269 Dmitry Osipenko 2023-05-30  598  	dma_resv_unlock(shmem->base.resv);
d611b4a0907cec Neil Roberts    2021-02-23  599  
d611b4a0907cec Neil Roberts    2021-02-23  600  	return ret;
2194a63a818db7 Noralf Trønnes  2019-03-12  601  }
2194a63a818db7 Noralf Trønnes  2019-03-12  602  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
