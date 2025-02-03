Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D752A20E01D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 20:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738616187; cv=none; b=FEB0VYs/1GR1UeNA0HxTBlJGd9SgTX2swNm4e99dUK3Q8ewypgkPxaTbsNKB43AvT1KKqHIh8uvR6ZrYnzoMnVKYlk5Mj007oKkOsWOqunJa94WT/tB8Do+sOMOt+5bgshodHEztgoxMlvxNwBMQGMdqtP6q/p5eEv4qmvhfQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738616187; c=relaxed/simple;
	bh=z29V1F6RAOOnxa+lyoM5B/tREuehsFn+uceNt04SSpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XtVdgCgYlUDrbpa+V0zbVKHeW4LUnEDqdL7o5Akip5AoXQR8Nk2iv9j9D1cHc55aokoQRxQV4O84vmlsz51IxTXeBkTmCIWxIjVZldH0qK22CEugKhs9t1PicKGcO8LHLc9xbHGCoZ4GyGoSIZglwaR6za4oqUtLsyJ1ljBfzv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlAzMVe2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlAzMVe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738616185; x=1770152185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z29V1F6RAOOnxa+lyoM5B/tREuehsFn+uceNt04SSpQ=;
  b=IlAzMVe2Zw/KQ+ej+xrcFYRc46sm4c5Gtxg9rjEGefQv0x0oJqsGcOto
   Y2qwU1zKgbqylRYRtfpSa3XqGuVpnMR314R5v2gqEOmYHY7O65Sa/0FRa
   7ePPHz7IM3mwVakTeFs83bzLB515AfPPO4DU0ZhbI0OR1pVHHmhntEndA
   yYdbZBzYM5RP78zoQF+4OkfN/dPx/jKc0yMnvI0jxzQSQnjmeNycWTsOD
   nMVPOghYaiT9ijji9ScPcEqL1m7fyDMOFb1EactLYHyFFUpy7tv5lxjtC
   TOP54vvjVRdL8uJI9LDeeTeCfCansYZW9myDHeQhtwh26+aeR2Zmjcore
   g==;
X-CSE-ConnectionGUID: +zPYC8OsR5eJ9bPqiji86w==
X-CSE-MsgGUID: WUJfAjrOTkS+KlUHo4QG4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49380166"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="49380166"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 12:56:25 -0800
X-CSE-ConnectionGUID: sLX8HikTQiKWR5V6QR+IFA==
X-CSE-MsgGUID: 6pvlk5GUTemsfCLskT/n0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110282224"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2025 12:56:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf3UT-000rWb-0R;
	Mon, 03 Feb 2025 20:56:21 +0000
Date: Tue, 4 Feb 2025 04:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 169/169]
 drivers/gpu/drm/mediatek/mtk_crtc.c:976:1: warning: unused label
 'update_config_out'
Message-ID: <202502040452.9NOvtxwY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c65c7bbfa145ae7df24f5e9b4de74a7fbaaac6c5
commit: 536e89daf375ca867b9e01405517083763491bc5 [169/169] BACKPORT: FROMLIST: drm/mediatek: Add secure flow support to mediatek-drm
config: i386-buildonly-randconfig-005-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040452.9NOvtxwY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040452.9NOvtxwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040452.9NOvtxwY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_crtc.c:976:1: warning: unused label 'update_config_out' [-Wunused-label]
     976 | update_config_out:
         | ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/update_config_out +976 drivers/gpu/drm/mediatek/mtk_crtc.c

   975	
 > 976	update_config_out:
   977	
   978		if (ret) {
   979			spin_lock_irqsave(&mtk_crtc->config_lock, flags);
   980			mtk_crtc->config_updating = false;
   981			spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
   982		}
   983	
   984		mutex_unlock(&mtk_crtc->hw_lock);
   985	}
   986	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
