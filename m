Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BF1293468
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750161448; cv=none; b=dsleH2xuDiudCI1kB94VnJf3g0UIXo62i/ADB2Whk8RLInZPc0aKzDahTusyhlO3Omwban4UwA6+HREBF3aVZTyioymQZCB25ks2U4xTQGqfFZ1vMYKOeQaG+46UhgZgMJDJyYNrbedE7iHkQgRpaYG9xTjagvCOaMTljer3U+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750161448; c=relaxed/simple;
	bh=YRo67G+a7HwV5fQTZonAJYIKkW/JPtmw+RsWtoYLWkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fFQzldW6ev+ezgKaKFp7NKKCw/TNBAPwHF0M+lMbcLLsDm/GSu4knAWvZm4Yz6bp7sdFvfl0SRYnWhmsIUtC4qQvml9J8pjVmXQ8B4wvLTXtMvF0R5BG9ZyZl4co5CjtuY525LxaTyEmzDUky+W4hKh9pX08DfsN7UBX9wyNIbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWnSkcIX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWnSkcIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750161447; x=1781697447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YRo67G+a7HwV5fQTZonAJYIKkW/JPtmw+RsWtoYLWkE=;
  b=UWnSkcIXhH9Iuc4pBFo3Swb0WmMhY8Z17GO63oQIYxV2YnIOevpKirre
   XPpQnlcUYwBULSMF+6l7mpsnaEfJRgSuZ07GDp/ytbtXyd/NMHcrdZvXi
   zgK9ceVs+wtHWJ1Y8/hSW2N4+K3d/9ip3JlG1zejXlbnTuje2FdPDcM66
   CfAyVyMVyAWOBA3gwcrLT9NKU0rXaF/+KxW1bZLYNUr6sjIi29m5wREP+
   WGDeMuXAILeW//RTQus0Ux/N/Ut5mZW3YaEGBU9tNVRT6t5G9H9WU+hw2
   vUHxq4CGy02rGGt1Yj0gznsdV+J6aHBIQs2L6S/Rp0jamnWybp4wFXTN2
   g==;
X-CSE-ConnectionGUID: /IeeCttNSkWx1yZ8quXDOQ==
X-CSE-MsgGUID: en2Ydzl0Qw2tO2WNIa3Xkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63688884"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="63688884"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 04:57:26 -0700
X-CSE-ConnectionGUID: GBskWZ/5RHK6LXlEggcPKA==
X-CSE-MsgGUID: RRLQk8vhS+6+KEFJht5VCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="149294320"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jun 2025 04:57:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRUwM-000FwY-0E;
	Tue, 17 Jun 2025 11:57:22 +0000
Date: Tue, 17 Jun 2025 19:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/module-hashes 10/10] <command-line>: warning:
 missing terminating " character
Message-ID: <202506171923.bxJKs3tD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/module-hashes
head:   648d8ee53095f775b2b1e38b64ba0575793b9248
commit: 648d8ee53095f775b2b1e38b64ba0575793b9248 [10/10] module: Introduce hash-based integrity checking
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20250617/202506171923.bxJKs3tD-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171923.bxJKs3tD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171923.bxJKs3tD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <command-line>: warning: missing terminating " character
>> <command-line>: warning: missing terminating " character

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
