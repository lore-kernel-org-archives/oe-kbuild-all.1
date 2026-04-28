Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AF3341660
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407696; cv=none; b=f1nNVz8xESFj/ZB20HI4DRWvrp2Qq6WclD7hNXGfSiw6ufwjGYYBd8a4CF10+KrI2RmwsiVTWcOBHCm0puI3iGKqeApaAX/Q7Q3XvEUqSpwVuzWzzsoE/ZMkTo/qpe/DbPmyOqiy9gmiD2lgFEOhvRk/Z2UHjMqF5xyrhIW48po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407696; c=relaxed/simple;
	bh=vyErizz1xhEirI19hiC5sT+wxLer6YVzfxmhr+IX95Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k3Ytc2it8UIPg7yM8IBzVSEiIjty0uZhPvcaP4sFt5DfdzNXtzHuPcNhvI++pClPfXZ0qmJdqUl0u/ociFBRhQqrm8/FlShf61EeXxisIJrlS0xYIlD0qKT7fsBwuQ21lvUV0XcYWEp7irP8+6uTm0MDOwSRaQclATl2ZCFa/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6/I5laB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6/I5laB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777407693; x=1808943693;
  h=date:from:to:cc:subject:message-id;
  bh=vyErizz1xhEirI19hiC5sT+wxLer6YVzfxmhr+IX95Q=;
  b=k6/I5laBN9/TqYXLcOwTpWII5slMDWvx27VxPhcLBPZNpNZMY1s/WXlE
   njZxeabvbE9Pe9e7jlq0rqOarY5E8o+rKgVQ2KRJyEMZo7ZQ3bVZ9F0uH
   VSn0Mx9p/FSdrdPB7Giepjd7+6lQmAsfQW5hdWWEADRsFvYlWfie3w24z
   yXRrxwHz48ql++DaNo3eHQhWauxtXcrV1sQfHl9j0D74eyll+JxoF/ROB
   TQ315UymJWaOzcFs5kt0hAD9etcwT2M89Ayc/Gi52f/lRDWHNseAjRIPy
   mIZ/Sq2QAKsuPiUuTHEePZYOEsbzz65B/3dD82MDYthFxjitUYIkgAo3t
   g==;
X-CSE-ConnectionGUID: MVnYhMZ4S229Co3QZl32tQ==
X-CSE-MsgGUID: 59+ZzooZQT6YsrLJzVEfvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78205579"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="78205579"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 13:21:31 -0700
X-CSE-ConnectionGUID: 8pX0q1FiQGyihaiiWTfuEg==
X-CSE-MsgGUID: ULLMc2WLSRG4NhcaERCEfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="272196970"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Apr 2026 13:21:31 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHovw-00000000AFc-01JA;
	Tue, 28 Apr 2026 20:21:28 +0000
Date: Wed, 29 Apr 2026 04:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc_new 161/161]
 drivers/net/dsa/yt921x.c:2158:1: error: redefinition of 'dsa_bridge_ports'
Message-ID: <202604290401.RdCdjkfw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc_new
head:   eb4a9ed940dbdc8cca87479b8d46ad985c1dfce8
commit: 6d16083e6f357d5a7fe02dbb49dc9e8258357b0e [161/161] net: dsa: add bridge member iteration macro
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260429/202604290401.RdCdjkfw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604290401.RdCdjkfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604290401.RdCdjkfw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/yt921x.c:2158:1: error: redefinition of 'dsa_bridge_ports'
    2158 | dsa_bridge_ports(struct dsa_switch *ds, const struct net_device *bdev)
         | ^~~~~~~~~~~~~~~~
   In file included from drivers/net/dsa/yt921x.c:24:
   include/net/dsa.h:841:1: note: previous definition of 'dsa_bridge_ports' with type 'u32(struct dsa_switch *, const struct net_device *)' {aka 'unsigned int(struct dsa_switch *, const struct net_device *)'}
     841 | dsa_bridge_ports(struct dsa_switch *ds, const struct net_device *bdev)
         | ^~~~~~~~~~~~~~~~


vim +/dsa_bridge_ports +2158 drivers/net/dsa/yt921x.c

186623f4aa724c David Yang 2025-10-17  2156  
186623f4aa724c David Yang 2025-10-17  2157  static u32
186623f4aa724c David Yang 2025-10-17 @2158  dsa_bridge_ports(struct dsa_switch *ds, const struct net_device *bdev)
186623f4aa724c David Yang 2025-10-17  2159  {
186623f4aa724c David Yang 2025-10-17  2160  	struct dsa_port *dp;
186623f4aa724c David Yang 2025-10-17  2161  	u32 mask = 0;
186623f4aa724c David Yang 2025-10-17  2162  
186623f4aa724c David Yang 2025-10-17  2163  	dsa_switch_for_each_user_port(dp, ds)
186623f4aa724c David Yang 2025-10-17  2164  		if (dsa_port_offloads_bridge_dev(dp, bdev))
186623f4aa724c David Yang 2025-10-17  2165  			mask |= BIT(dp->index);
186623f4aa724c David Yang 2025-10-17  2166  
186623f4aa724c David Yang 2025-10-17  2167  	return mask;
186623f4aa724c David Yang 2025-10-17  2168  }
186623f4aa724c David Yang 2025-10-17  2169  

:::::: The code at line 2158 was first introduced by commit
:::::: 186623f4aa724c46cbb4dbd5235cf6942215f5b5 net: dsa: yt921x: Add support for Motorcomm YT921x

:::::: TO: David Yang <mmyangfl@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
