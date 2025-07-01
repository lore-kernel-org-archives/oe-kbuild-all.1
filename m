Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFCA1E4A4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 01:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751332417; cv=none; b=ZiKxGspz/HZKF1hrjIQLSS+rzKj2Kh441M0MqB0p+kFOScJv19MN3/T3TB57GQ/jFVAACYjTeI3FrnzSQsuWRMgvvG8q4C8nPDnDXdBb4MfVVLXXqqLwBT/83XSk86LWqG7O4g6Wt9we6l4BeUlhmxqbNg4Lq5n63AReZETes3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751332417; c=relaxed/simple;
	bh=TV1hRJ8N0SY1siwLAsf5fWlnHskQC14ChHqLMNWmb5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IgLIwMmOYEmuyWn9Ii+4bfDs8huQ3fGOFO6MDb6toWPqOzj1bnIjrgRKCaRDuQzn3n78GqeoE97jZCX/FxAAhgF8Nigbg1JA/VBEyqmsfRaZyNgwQU+i2Z/hbsfH/fVCsIcnS1oYyOtabpZp79roEdDQxdhQV2ywK5SYSjYvt4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyKboTxC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyKboTxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751332415; x=1782868415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TV1hRJ8N0SY1siwLAsf5fWlnHskQC14ChHqLMNWmb5Q=;
  b=SyKboTxCOz4uIT8sS/RUBE0kVHcyhaN4Bljmq5RlqLKJ7pgPoNLMVsVz
   EY9HLSj6eNZluH18lfVOUfHVhdvg2/Prax8v/h0wBm+wjFbAtpkuFZE30
   ToVtOMJTO0UIk1uOXHaVq7ltgvHQPCJqFdrKjKqpt8vttJ1oT/2pkH3sb
   QP5vAWPZ2KHCko8xfaDshnlIkR25l/JaOKReeZMAX37sd6tFnupr+3Oyf
   x1V/Njn2G+e2CGfHXyvx98H8OTY6XRaa7WDAqrVWKpC46HbC2ygxhS9lt
   weDoFKIWQenUKRjfrtRqyMWtdzVcBy0grCU7akYQluNzd6CxAe+DGTeBY
   Q==;
X-CSE-ConnectionGUID: jdI+9dIkR4W/o6U+hkVXbw==
X-CSE-MsgGUID: MZpJcqSASV6e7mw2Om9zLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64930879"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="64930879"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:33 -0700
X-CSE-ConnectionGUID: aQSS5fbWTkyMBJGLrw82bQ==
X-CSE-MsgGUID: y56UnQskSNG8gGdzYMPYhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="159323818"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Jun 2025 18:13:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWPYw-000ZUo-1z;
	Tue, 01 Jul 2025 01:13:30 +0000
Date: Tue, 1 Jul 2025 09:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 440/440] kismet: WARNING: unmet
 direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by
 INCREMENTAL_FS
Message-ID: <202507010949.er2Gsi7L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   9262077f7dda6a5ced992027f566118fd18e154f
commit: 1be052b20ba04b635cf87bcff80de5314697953e [440/440] ANDROID: Initial commit of Incremental FS
config: x86_64-kismet-CONFIG_ASYMMETRIC_KEY_TYPE-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20250701/202507010949.er2Gsi7L-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250701/202507010949.er2Gsi7L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010949.er2Gsi7L-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
     Depends on [n]: CRYPTO [=y] && KEYS [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
