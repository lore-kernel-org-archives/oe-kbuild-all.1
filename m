Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1510724E4CF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740158543; cv=none; b=osBby7/Pl+I4d/9iY4mxZTUCEATBUFrL9cgdhxI85XO+PSI4IUuhOs/gzNpOkh2vlPlLzbYs869W++VyiTIZbX/LdYeGFrn+32I2LUGSfmYejYadiCeVl3NQDsmYjTG0x7+5oZU8Ix4OO3OxenGaBwZCs+HnWt2Sj3q5tbArlb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740158543; c=relaxed/simple;
	bh=PaQScplsDhMfU4x+kswxe2iQRqo3UYRKMrM28KXni8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q8FK0dB5er1TmBGEFEl85MjZl34MT2+G0KTL2tFPifJagu4Xvx94j2O20RZ3NWrQvnPt+jSXxW3bBEXwtNG7ysiaxhXWPL/W86YOqQZgW0F7ls0aru680rP4yXDqWyZrXzamojiGBwA3ZEjsP3ToqRyC57cKzIjL6Cylw+D9muo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkK7Yxh4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkK7Yxh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740158542; x=1771694542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PaQScplsDhMfU4x+kswxe2iQRqo3UYRKMrM28KXni8k=;
  b=CkK7Yxh438dZG5/N877EfLgKeoevA2rTwI31ncN8MQOH7CWtSeH4Ct0u
   FfL9fR8hARgA00MvA+DJ6vHm2esM/595RnyKr7D4vkkHmWAwR7+Rgyu1N
   H7t/D63pkfM4DCXIg+REzRZA9VBgpcZlb9oU4S6eZlK1a0aP6Dgn1nQz4
   +mIMF5s0eZBqROyEL8zUFuAw9j0qs5kyPFeAb4BWptxnRJ6sWHuVFnVCw
   W0tVaFqYaLyIgcG0MoAl1xu0+w6i5+88c1QVcuXMmdO3bP3vH+H+gmxge
   BHp7qmx2qlhit73Y/RDmNGByULsh3ZRwsn/OwWlEp0bZy4WvXYpKZIwE7
   Q==;
X-CSE-ConnectionGUID: hUESI6XjQiqNH6QJMy0KMw==
X-CSE-MsgGUID: pYAvf88BQmSEPg2JT0yeKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="28582634"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="28582634"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 09:22:21 -0800
X-CSE-ConnectionGUID: sm9/84LnTQ6hKdVG48dPeA==
X-CSE-MsgGUID: vRf5yMMURca8DiisxX62jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="116064444"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Feb 2025 09:22:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlWjB-0005oJ-2u;
	Fri, 21 Feb 2025 17:22:17 +0000
Date: Sat, 22 Feb 2025 01:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 4334/5524] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_SOF_AMD_COMMON when selected by
 SND_SOC_SOF_AMD_ACP63
Message-ID: <202502220104.a8P6ApQN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
commit: f120cf33d2325fd95d063eccbff2e86ffc7f493a [4334/5524] ASoC: SOF: amd: Use AMD_NODE
config: um-kismet-CONFIG_SND_SOC_SOF_AMD_COMMON-CONFIG_SND_SOC_SOF_AMD_ACP63-0-0 (https://download.01.org/0day-ci/archive/20250222/202502220104.a8P6ApQN-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250222/202502220104.a8P6ApQN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220104.a8P6ApQN-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON when selected by SND_SOC_SOF_AMD_ACP63
   WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && AMD_NODE
     Selected by [y]:
     - SND_SOC_SOF_AMD_ACP63 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=y] && SND_SOC_SOF_PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
