Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7449018EA2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 01:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730768878; cv=none; b=nPPtti+etQ+5EFvBbTyT1OgxRuL1YwjDSDerPLpeZlDu2cD3pSbmvsKYpTIgIkp1H0DPPrgEjuFCNHPDpXWDAHtKuVVuGhcWirI28ierOVO8ipqW0ta5qzx0V8b8l0XX8TbstBYlYgTZXlGUTTDSYAfulw+7N7i2Np+rcMpjKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730768878; c=relaxed/simple;
	bh=aqmO08v9njzPhX0/z7L3pzzDAvIODeeGTFYzHVjinTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pRaY3dRtgKot/RsLf9vLsQj87GPyS85cESun2/AIH1eIt+cMOlAj21xReG3fUD+MSSBOv6KmKmx8zXMoOUygxQH0jKHsugMYP7V0M2QBXi2lv2PQX50/j7DgPxT5XDPqfBn/RWP8zyURuLoLx/h0uJItkHu6ES4BLO68Cww9j50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhbV8YUh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhbV8YUh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730768877; x=1762304877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aqmO08v9njzPhX0/z7L3pzzDAvIODeeGTFYzHVjinTw=;
  b=IhbV8YUhmk+Ptf7fJ0m0oWsWWcxC2WpIaVTlM8HeAvGpqROSf+g3MMgk
   VyQ/a9P9R66EhF2D+h09Zrazhku5wETLX6DqIJQb14GhNcW2FyY+rrzEz
   24CTXKXIVeeUlVQb8kgNa0l1FVQ/FxLyDZFfxELolkdkR+iEiCOIPMhac
   F+60GWNmaWfhAjbNsRB75n1yYbHIuLdpM62QLXPOQoh27RSCPpLpqtPZT
   slRWbDPzwn6wDro945hpJX7IPI5utCUuGWFpa9knRtzcqiOIH6sv1hzX5
   LcvjiTdzX3PR7p6OfqFR8bRwWd6slSLz7LbTs4K4At0KPmwl8qq0EkIy6
   w==;
X-CSE-ConnectionGUID: zuZFQHpKTgK/S+k11DxC+w==
X-CSE-MsgGUID: qunwtkw6T8yn6lMUEKBP9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33331114"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="33331114"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 17:07:56 -0800
X-CSE-ConnectionGUID: ZWpTmjXtRfGB61mX40z/Ww==
X-CSE-MsgGUID: 0WPR4c/xSzSz2awyMlBWLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="114614945"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2024 17:07:55 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t882x-000lSj-28;
	Tue, 05 Nov 2024 01:07:51 +0000
Date: Tue, 5 Nov 2024 09:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 9263/23983]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o:
 warning: objtool: dml1_rq_dlg_get_dlg_params()+0x2efb: unreachable
 instruction
Message-ID: <202411050901.GVulQ30e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d426553bb97ebfcb4ea34e8fd63477a44316644
commit: f25433cb156a967d9b426ebaadf197c2369398e7 [9263/23983] drm/amd/display: readd -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines
config: x86_64-randconfig-071-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050901.GVulQ30e-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050901.GVulQ30e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050901.GVulQ30e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:26:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml_common_defs.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:31:
   In file included from include/drm/drmP.h:62:
   In file included from arch/x86/include/asm/pgalloc.h:7:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o: warning: objtool: dml1_rq_dlg_get_dlg_params()+0x2efb: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
