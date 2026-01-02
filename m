Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7482C221542
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jan 2026 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767366801; cv=none; b=q5FXGm8Il6AE5ePYXvIlrInuBc4AD6+xAzj6I4xjod2nR8geG4EC6EtQx4Wx6N5lT/DZwWaet3tOemwJXqVnP+SrcZteJ2byGqllGxvUUjIMeA2tIkyqNSDQNIpKbCumQNxuHOVDG/olbPCV5tx//TZN5Ocmvvsy538TSgF9cFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767366801; c=relaxed/simple;
	bh=z7ie/EnZoeH7EjE8H6aevBXgR6F2p76ThYZWqAS+5ds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OCUmuqZjUCe7S3IF4puMkmzljJLOH3l4U9x3gURZfSV3sKOD0hqMz2/8ucq4SYMeDHrN7JJugGZoxxB1nPUzPn60Bu6FbPs2S+/+rOM50QV84/w88ytCJ1uCEvuYeAB4y9oEPvz+lJ7M6G2lmTPVoaEpwcK/3bjnx9oiD329iHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jck8UJgY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jck8UJgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767366800; x=1798902800;
  h=date:from:to:cc:subject:message-id;
  bh=z7ie/EnZoeH7EjE8H6aevBXgR6F2p76ThYZWqAS+5ds=;
  b=jck8UJgYS+0tJf5yDXntZ//UCDTdjGyd8DANz8hkF8gtYjsE+Y3SK9+O
   A2NxWYEUiIGdLLGIdmFHYsgfkeuq3RFbIvJOAAwMOKjoPs0h8Yy3Ot8rI
   peZ870QILD/fcmWhre1f3IEht9963CZ0LbRW4p1R0gY1PO53YR+eaNExu
   ektXxCQFinZGlqSAJwlq/3C6INBDMg6vJs1qMuO8omVoa6OjQk4Oixy1N
   oJOyiSfYXzuWesL+ehFcCaOR7N5Ckz+vKKgs24GM2+9fQqpgzpPwa2fCV
   3LmuXHNed26bWmyhjJwgakZrDkwyGmxgSi06NrfWO/z8uaTgRdzhSGrbM
   Q==;
X-CSE-ConnectionGUID: PqD2QeeqRBOqEOTdui+OVg==
X-CSE-MsgGUID: TBSNJb5MRqCEcbOSct6TsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="72487472"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="72487472"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 07:13:15 -0800
X-CSE-ConnectionGUID: KjgeUp0eQWeM5+fN697cCA==
X-CSE-MsgGUID: iwLNjtX5Qa6zDnUdpLd2gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="201718119"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jan 2026 07:13:08 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbgps-000000000Rd-3D6U;
	Fri, 02 Jan 2026 15:13:04 +0000
Date: Fri, 02 Jan 2026 16:13:02 +0100
From: kernel test robot <lkp@intel.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org
Subject: [asahilinux:bits/110-smc 6/16] htmldocs:
 Documentation/hwmon/macsmc-hwmon.rst: WARNING: document isn't included in any
 toctree [toc.not_included]
Message-ID: <202601021633.yfBKd2ik-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/110-smc
head:   fe39760be35ca7bbb9018ad840d97f6a2dd4179d
commit: d33e6a701bd26fadd63f260c9b1dbdee36ce8e2b [6/16] hwmon: Add Apple Silicon SMC hwmon driver
reproduce: (https://download.01.org/0day-ci/archive/20260102/202601021633.yfBKd2ik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601021633.yfBKd2ik-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/hwmon/macsmc-hwmon.rst: WARNING: document isn't included in any toctree [toc.not_included]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
