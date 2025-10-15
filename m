Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCAA314D37
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 23:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760571165; cv=none; b=rgKri5oYofMAQJWHTLe85oQRMc4VVeFP9lJ2unAaZ01uyu+cIQVWLCKSXDByeOeROORFWcdW0REmU4cOWjqyVRjIuG588i6jFdHrdyeikZRC7M605wOIsviXg0hY8Q25BAxqtqHPztMyONrNhb5IcWhDF78zmOq09ggWD/jpm6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760571165; c=relaxed/simple;
	bh=s/196UpE6+FTVY7l0Bk4VHdEKYVfiGWt9eR9z9SSoT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kTae9Y+twbRpzv2S7b1L3tNYAQAsMXVJAbb030dCkN0pkPI39TSose7SjzZgu1QnEMhp/D2xAE0l135zeiS4AjAIVGaYZDT161MYzWhyIPBW9nrX+i3HxUF0CAAf+LgzXgvPY7gfkX8ZmbEo6X2cUyqRCWq5EA0qojjSJcXxCps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4XkjFFC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4XkjFFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760571164; x=1792107164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/196UpE6+FTVY7l0Bk4VHdEKYVfiGWt9eR9z9SSoT0=;
  b=k4XkjFFCn/2E6izNpOCZYD1xlsdYhoRGT8pqV0TdDNRDBQNhE5Ura26T
   EV5ZJUv/xg+I191oOo2nbwMD46ShwXXuFpzthHMs3uoX3/ifU+cOC0K3C
   g1hTaA0VglA5kmvSK8qGmN2uG8ZR2DVLVoEpW2WIohiXHSrPls3kYDHRb
   7atKJCz/d2a3tEPXUmTL02YnFwJakpnqLZavSzrvT2FMPSkYJUC5hoosW
   Fxhti+3xl2GuwhJ0byoBy0D7QGMsMgbbW/E2bNNBjo74VBGybCCHuTW8K
   ZgjfjA/tUFhlbc0rx0DN72qVLh2JWq4tU1igNKurHTj73yvaGisazYtUt
   w==;
X-CSE-ConnectionGUID: y3D/1E83SFWeM9JpUWTa5g==
X-CSE-MsgGUID: vCuCW1L2R7OBkRhLNXEoug==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="85374489"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="85374489"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 16:32:43 -0700
X-CSE-ConnectionGUID: pYC9QVplQuG6ux0XMuJT8Q==
X-CSE-MsgGUID: o7/bmHn9R0e+Im1uWhH8Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="182705589"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2025 16:32:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Az1-0004I7-38;
	Wed, 15 Oct 2025 23:32:39 +0000
Date: Thu, 16 Oct 2025 07:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.3 17/19] powerpc64-linux-ld:
 mm/oom_kill.o:undefined reference to `bpf_psi_bpf_ops'
Message-ID: <202510160721.PrNJAiuE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2.3
head:   900c780ff14a9c789a7b06ee8aaa608a4e461171
commit: 6020a833d42e1b742616caaee76125414fb26a0f [17/19] sched: psi: implement bpf_psi struct ops
config: powerpc64-randconfig-003-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160721.PrNJAiuE-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160721.PrNJAiuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160721.PrNJAiuE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc64-linux-ld: mm/oom_kill.o:(.toc+0x0): undefined reference to `bpf_psi_bpf_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
