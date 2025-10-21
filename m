Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927272F7467
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761045891; cv=none; b=LcpWG4UIvmHlMMa9ajWOTX6vY01BQuCQmbnsjD3/verfkMtmB9E5IBhYQ9Atmi3iVuBXRLNn339MNIqoYaSlXNLW2PQrkvoZu6mynpRf7We1+rt2gQv6p01k7n/fVxsmUslHM8klcqJNonwA93VwptPYI7bQckXIPiiDrKZD3/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761045891; c=relaxed/simple;
	bh=Sty1ZALPCaEfwK/rajeoB27HS4qE0/vWufvb/XsnWS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZwrWZ4e7FIzzStDTazr/YkzAkpQwpEtZiqgF5ATFAaylA3JjrCvg18bCv6X9NXxbVoI3JY/0RoFOIRdObnf3M9o9Pkpx6LX586kAM6U+mYan6Kj0wg4yGHo7TCKu9Z+dYkKmttPVWlbqv30d3IUnw2xwDUS7AS4scNYGQn3W3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJrqJizI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJrqJizI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761045889; x=1792581889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sty1ZALPCaEfwK/rajeoB27HS4qE0/vWufvb/XsnWS4=;
  b=fJrqJizI0aAW6734gg8VO6QC2P6xCYp4MYx2z08Yop91EJXfxn57yZ//
   oRLXpKy7F0dwL3t7lcOOey1CIQakLP2xu8HVvqC08UnTkhrec/Y5DrJfh
   e1h5R6C9//KcksrXohQ3rvNfvbHdaY1KkHAKBYw2nreWB8s68a+PpljpI
   9Rfe9+ml+yfRxlpPhxnvqz25omThRYy4byI4fkosa/oBydbrteZH8Adty
   It1VGgPqJf2lDnIhH6/aPooZgaLaNDQ8o5+0R+bp3n+DOOX1GfkPgPp4g
   6D4foCp7mtOjC3WdnBhfdBiIS2CqRgw7iYA540l3qPyiKbzgflh7LLYMg
   Q==;
X-CSE-ConnectionGUID: BomM0Er+Ql6eSzS86uLbkQ==
X-CSE-MsgGUID: f5wDDttHRjGByHJpPb/nBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74510964"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="74510964"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 04:24:49 -0700
X-CSE-ConnectionGUID: 7bQ+PuQGRY2WA0j2+SFe0A==
X-CSE-MsgGUID: 9CV34olQQomteWNolUF+Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="184049494"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Oct 2025 04:24:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBATk-000AmN-26;
	Tue, 21 Oct 2025 11:24:40 +0000
Date: Tue, 21 Oct 2025 19:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 2917/3056] ERROR: modpost: "__udivdi3"
 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
Message-ID: <202510211913.5a4SfQab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi YiPeng,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
commit: 7169e706c82d7bcb3ba4c8943faa32e26daf3523 [2917/3056] drm/amdgpu: Add ras module ip block to amdgpu discovery
config: i386-buildonly-randconfig-004-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211913.5a4SfQab-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211913.5a4SfQab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211913.5a4SfQab-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__umoddi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>> ERROR: modpost: "__udivdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
