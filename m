Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4EE1E9077
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728491169; cv=none; b=iye9vME64EBYrFtF9c8xfcqm8K5D50h6Xv5emOVnPtKZiZRED/6/7TKbXoxe71x/+XtgZ2uSHbUgmYSxvAXhZ7nzsbhoSstRynFzSX+6W7eUTOipFbn2wPE/65nwwDv33Ig2aKWDirXRNYtD3kPF/VnGowl/ijbYuNL1YY3QrM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728491169; c=relaxed/simple;
	bh=dQrXC6yC46+B3z7XhnaHvhGE213oM7r9KCEoGBx3Ck8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ScwXOJrzcfUQdlOicmYYpMJYwkDbib7vv2yVUx+g6ZodzkCTvWWR9tgasM/QcmqPWvc37fZ2h3OvDz7sWHrv69/RZx++E+Utfi1Ka43Ll16ZWZkHvQGh01nGbQrXBiOlyevAY95EFqA0eaVJ7KvJUad9cMF6soDc+Ebyh2d+/+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzNg8hSp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzNg8hSp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728491167; x=1760027167;
  h=date:from:cc:subject:message-id:mime-version;
  bh=dQrXC6yC46+B3z7XhnaHvhGE213oM7r9KCEoGBx3Ck8=;
  b=mzNg8hSpj1j1iJeJvzZfzpmsF3LCKJSSeQ1jxItEbmjKZ1bfXLLjHkQz
   RL3fB0sJe2Qo0UNPC3pVoLu0WwUked9y03rs/J0iGV+CORXlckwiOBgl3
   M07XpjiPZK9sLaZodObVBbHuu9SRNzNOY/50SFSxbC+ExOywjFv2kFu87
   3pe2WkPcJi1yFi0wz/Tq+khSsmCM+foBKdtk5dK14RTRar+XHLiKcPqr9
   4yJ6klIQWjbNr/JnMTHhgJU8lSBMI+smzM05+zaT5zuTOqNkm54ZRWD/x
   Dd76qpoVRTVufXEowHHr1hSbAo9wihfWFPG7ttZ8QZsxFudgBtBrEGTTx
   g==;
X-CSE-ConnectionGUID: 2xTl/AkFSFmW67rWwguWrw==
X-CSE-MsgGUID: iAAT/DRKSyer66RoJ1Orew==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27616547"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="27616547"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 09:26:07 -0700
X-CSE-ConnectionGUID: b5bsdLM7THGXDQKYhAOIXA==
X-CSE-MsgGUID: LmaIhcXITrOmSdr/7YmPaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="81319936"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Oct 2024 09:26:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syZVj-0009UM-07;
	Wed, 09 Oct 2024 16:26:03 +0000
Date: Thu, 10 Oct 2024 00:25:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 2/5]
 drivers/gpu/drm/bridge/tc358767.c:1587:24: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202410100020.inWmc4M9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   517163f797b81a8277a000d6a1c9dfd89b3711b8
commit: 292f8e11c8737e8631058eed0820e9194306320a [2/5] drm/bridge: tc358767: Fix link properties discovery
config: i386-randconfig-061-20241009 (https://download.01.org/0day-ci/archive/20241010/202410100020.inWmc4M9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100020.inWmc4M9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100020.inWmc4M9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/tc358767.c:1587:24: sparse: sparse: Using plain integer as NULL pointer

vim +1587 drivers/gpu/drm/bridge/tc358767.c

  1577	
  1578	static struct edid *tc_get_edid(struct drm_bridge *bridge,
  1579					struct drm_connector *connector)
  1580	{
  1581		struct tc_data *tc = bridge_to_tc(bridge);
  1582		int ret;
  1583	
  1584		ret = tc_get_display_props(tc);
  1585		if (ret < 0) {
  1586			dev_err(tc->dev, "failed to read display props: %d\n", ret);
> 1587			return 0;
  1588		}
  1589	
  1590		return drm_get_edid(connector, &tc->aux.ddc);
  1591	}
  1592	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
