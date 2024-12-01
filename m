Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9282F1D6DA5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 16:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733068916; cv=none; b=ao780Vr7kblm73mPzIFXc5aFEYQhdEXXGPzYaK3ygfr6pTN6/hX6X91NubZATCeiFvaBt5GNjpNKrrgYR+rdiUVYb8qhF9RZRC+m4vcFLL+3mPCyMQkpstqnJYsaK/6lkezI3hgJvExEVo5keg759tMBYeQ5KGcybCU8iBkm1l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733068916; c=relaxed/simple;
	bh=HZrXVLtdwjukpv+HoXeihyi3+cQUHkCLIndf2JMqZjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XoIpBx1ChpvfSZLN4xQ8EFOyVVpGbgXgl/SwsOhwoIPfxdzQTaXtqTByBvyn4R862t3gzPpXYQHRJZ5qaMnysbZ/F4SvZsMd05oJ6fQ+StksHg4zhl15jp7Tr/B0dvXS6JQ77uui4plaQgPuokpts/74k4eM14l1oN0DF1v5HoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCkNQpYx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCkNQpYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733068915; x=1764604915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HZrXVLtdwjukpv+HoXeihyi3+cQUHkCLIndf2JMqZjg=;
  b=cCkNQpYxrZcBu81j9JqvMVG7DUHaEBMLM/37JRQSK9RsWVEP31A+2Ggi
   0kaUd82273uRXQ13NapZjektFdlbAjw2Jg9UsejDHytAZfxyCp7AYJ5H8
   g2EJsf2D9Ke+ChLeaO/Mk4DoSAQsNYSWmaktUcnqdbbp1TNNl6dEN45/S
   qr2KDLSQSkkEWqIqWIGTW8sPRJCot9NHJy8zGuaBDIJehAPtX8wQ33Mar
   xS3hvZ6AS7E07PVLoxGJaK7JhLRIdiWw5TR/OZXMsWSlY1h5jqSEQ3pf2
   FU8dwrkmJyftPP1PpTGI3j8aCD9L+rpQg0JEXmnMcyq05VQ6FoXkxZ7BG
   g==;
X-CSE-ConnectionGUID: MIf/g5CWQQGYgFzlqhb3rQ==
X-CSE-MsgGUID: BUNcxTDWRBu+m068TEG+Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33481922"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="33481922"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 08:01:52 -0800
X-CSE-ConnectionGUID: Xf9sCAMiQxG0E62LF8gytg==
X-CSE-MsgGUID: vDTZSealSAOkZ5n/2J9WCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="93212283"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Dec 2024 08:01:48 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHmOH-0001eF-24;
	Sun, 01 Dec 2024 16:01:45 +0000
Date: Mon, 2 Dec 2024 00:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 869/30000] kismet: WARNING: unmet
 direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by
 INCREMENTAL_FS
Message-ID: <202412012351.2Hjtyn6g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   8ee3ff60103d85ad00366866387645645c52deeb
commit: 1be052b20ba04b635cf87bcff80de5314697953e [869/30000] ANDROID: Initial commit of Incremental FS
config: x86_64-kismet-CONFIG_ASYMMETRIC_KEY_TYPE-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20241201/202412012351.2Hjtyn6g-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241201/202412012351.2Hjtyn6g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412012351.2Hjtyn6g-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
     Depends on [n]: CRYPTO [=y] && KEYS [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
     Selected by [y]:
     - SND_SOC_STORM [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
