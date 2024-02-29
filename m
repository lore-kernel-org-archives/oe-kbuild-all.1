Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274A813A877
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 15:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709220901; cv=none; b=gVsXvzCsPAXR3BcZJComPZisF+FCtf6vuzxQOXL1kbfwlibO5uMHxsbZkAJnTuJJ2bq4cjA418zYnpUl1JFTgGCjcnvzU42mB92ozoXRa4+CtVZq+06Zwjgky0rhlSwhH3jiUf3mLmAYfI11ZvbwC/yJhKk9+PjYWbGgd4nf+OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709220901; c=relaxed/simple;
	bh=xGt4W1weRlVubb//QNg/phXdaKhMJzsqYMzju4sz+1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S50W5dhpqJqfOJKwRq9eR4pY8sFJl/ZhtgzSCos82jVWkAPyGAp7LmeXyrETLXQ30ZsCfZyE/mCg8518SI6GOnlLpLv+NY53OSGy9pB+psGJQphu49sFZpNOfs+kCZ8Cm/UEkIsaq8ZN3Z7SJDEwnNimiquV+rpnc4rDUuFBZwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3ZZVRzJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3ZZVRzJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709220900; x=1740756900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xGt4W1weRlVubb//QNg/phXdaKhMJzsqYMzju4sz+1k=;
  b=S3ZZVRzJtq8PzZvybcKM8DjnNyAnmMGSZbdoib0u98vrHONKK3uq8hEo
   HSWdVuZz8lYv4bT/bQHhQKyqf7bDBcTq0IyZmog8M8u+ylmj1Dx2gObqd
   RM04rxYcn1a7v0LNTJOBzC4ASZWoPyicdopqmvaZA0Gr3jx4OvJKaE393
   O/1it5OnxCxL+JeQ63qNa9rMCqO1hY+rk6DxQkKU8j3WAiPIxRiSfqMFL
   xS7ihuROyTV/OGr/1llqfIzgD6mCWewfwcdEZ59j5GW49pAtTEakjDUxA
   HthK9Pgalhre8Mfm4FjtOnV/Cu91uxbg43Dbr7OByHzXs6Y8I6mO704xJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7476959"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7476959"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:34:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8103636"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Feb 2024 07:34:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfiQc-000D27-2T;
	Thu, 29 Feb 2024 15:34:44 +0000
Date: Thu, 29 Feb 2024 23:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [drm-misc:drm-misc-next 4/5] sun4i_hdmi_enc.c:undefined reference to
 `__udivdi3'
Message-ID: <202402292334.oZSzMUrP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   be318d01a90366029e181068e8857c6252e1fadc
commit: 358e76fd613a762bdba18b6b9fb0469a481de3a3 [4/5] drm/sun4i: hdmi: Consolidate atomic_check and mode_valid
config: xtensa-randconfig-r052-20240229 (https://download.01.org/0day-ci/archive/20240229/202402292334.oZSzMUrP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292334.oZSzMUrP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292334.oZSzMUrP-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/gpu/drm/sun4i/sun4i_hdmi_enc.o: in function `sun4i_hdmi_probe':
>> sun4i_hdmi_enc.c:(.text+0x304): undefined reference to `__udivdi3'
   xtensa-linux-ld: drivers/gpu/drm/sun4i/sun4i_hdmi_enc.o: in function `sun4i_hdmi_get_ddc':
   sun4i_hdmi_enc.c:(.text+0x3f6): undefined reference to `__udivdi3'
   xtensa-linux-ld: drivers/gpu/drm/sun4i/sun4i_hdmi_enc.o: in function `sun4i_hdmi_connector_atomic_check':
   sun4i_hdmi_enc.c:(.text+0x4af): undefined reference to `__udivdi3'
   `.exit.text' referenced in section `__jump_table' of drivers/scsi/cxgbi/libcxgbi.o: defined in discarded section `.exit.text' of drivers/scsi/cxgbi/libcxgbi.o
   `.exit.text' referenced in section `__jump_table' of drivers/scsi/cxgbi/libcxgbi.o: defined in discarded section `.exit.text' of drivers/scsi/cxgbi/libcxgbi.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
