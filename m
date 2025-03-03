Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC17720102E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002107; cv=none; b=cB5IQYgRY0M508OHYdrXiuOisUPEB/oYQNQIyT0uRqy2dBBiHthPIVdRWtItaQtw4zHmKAlG09v83kfh5HfZjhfb1FrQTiv52zcjL1fjivVZ0ZUGxzopNR3eVOWHnufxMtdHgKginyenPa5/DfYV2taGrZ3EzlQbhCY0HVfwxKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002107; c=relaxed/simple;
	bh=m3JVRfhYnVN9/loW6jXWifnGfw0GZSnZcMWGta6IcNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CL0r15tgBDZ5RRPMyAyN3UabLSwVFcMhapXgqwHDb+oNOLI+XAM+OvPkMGoXAeBNkgkzpfij7oTidwyBiSUAjqR3P8o3w95VpDqam68Xv7DcPdNjN9DXUfWGugjsHBYsHTxaePZ61fnAA+4gvX1vSJ6VQLciRkvaxcmCL0tP/GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/X220o4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/X220o4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741002106; x=1772538106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m3JVRfhYnVN9/loW6jXWifnGfw0GZSnZcMWGta6IcNc=;
  b=i/X220o4jNQoo/jUkIcUtCkrb8kRs1oZw/3JBSWrXYROGCVlIj28N5Vo
   GBvTA18c0rLY1NM7TGXTtfBGxvplXxhxmI9qmuI20tLs0kQZ6mfuJn9gw
   rrleFJyotNdvnD7ZzPVRnq1bxEP3aOuaRm3cyakHqteE88cFIp22mnmBm
   Zn799BBuBaMyRY7/zvxPFGBG/yFEZzeTX0rRPkOYzTjNexECRLPtkn2iL
   nbbwjeGd4VtNpccE2t2Hun0pqu9nZaRWjxh8jMfV1+PL8rb3IoyWqHhyY
   XG0jopw7S9VCwqfK30FNA9Ytt2tDD1laZAovH5N1TmrFALovzrGBHVkkq
   Q==;
X-CSE-ConnectionGUID: SXY6HgN+QO2kSKzz8CAsfg==
X-CSE-MsgGUID: M1QNVdM0S3SJ24v828N5Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41117622"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41117622"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:41:44 -0800
X-CSE-ConnectionGUID: YX4V6IF9SLiyAYi6RpDfwg==
X-CSE-MsgGUID: 8kFlj9zZQf2EFW56kSOpjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122112882"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2025 03:41:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp49v-000IQl-0b;
	Mon, 03 Mar 2025 11:41:00 +0000
Date: Mon, 3 Mar 2025 19:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] kismet: WARNING: unmet direct
 dependencies detected for PHY_DW_DPHY when selected by
 VERISILICON_DW_MIPI_DSI
Message-ID: <202503031902.sY9TGtnp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   413645820de6d715e23ec6200a3e5a469ec69672
commit: 500e70f6113ba8e3d77cbe6c36fb5a5d546e0557 [2/2] anolis: riscv: gpu/drm: add T-HEAD Light support
config: x86_64-kismet-CONFIG_PHY_DW_DPHY-CONFIG_VERISILICON_DW_MIPI_DSI-0-0 (https://download.01.org/0day-ci/archive/20250303/202503031902.sY9TGtnp-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250303/202503031902.sY9TGtnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503031902.sY9TGtnp-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_DW_DPHY when selected by VERISILICON_DW_MIPI_DSI
   WARNING: unmet direct dependencies detected for PHY_DW_DPHY
     Depends on [n]: HAS_IOMEM [=y] && OF [=n]
     Selected by [y]:
     - VERISILICON_DW_MIPI_DSI [=y] && HAS_IOMEM [=y] && DRM_VERISILICON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
