Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58219ABC2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 09:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239242; cv=none; b=mCowRjPV26yN644k6oGwLidw9qk5T7y5NvdoDyea7rLCYF5qz+AEcDo8L5h8UEvGx3gwepcIOA/DHltSSGbCIELuasWkRSaoEHJKTBVeDiErjUIzheAIj8dUkNiu3ChSj8A7WfvtsIFAcLMXDosmqjtsVwmOU1tWhZ7d4eeU45w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239242; c=relaxed/simple;
	bh=IfGFl06bLrHYGlDhyzZsyVg4PLaDg2Bk7TOPMpO9I/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NNCjWXaOX29s90hajIRENuf0qSSrgmytJARBzgPYDq84MDjt7wgMwN9THYUoymh/0HlrEaFj0m2BhChQvFGlvllALg6kTs9SwUEMyk20oV8HIXv9D8+ND23jrpTeC27ovYtND/3YxS4dVBh+WqEP14quOFasL/SVAKGme9tCop4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8FoEYHN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8FoEYHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750239241; x=1781775241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IfGFl06bLrHYGlDhyzZsyVg4PLaDg2Bk7TOPMpO9I/o=;
  b=n8FoEYHNE9ewjwXBA6lIBgT7HvllzavBI0ezojZEtZC4IrwwhqzA1Hvf
   BlnDt1wjgi/jyn/dCLFfXxVAZXNWdx49VmlGc6+9tTW2wXWgPYUC3QJ7J
   xOAzc6+Jycbr6wUs27EYFzSHqQMVqjz9W1JFUnlI4SC9nnujLj10QIhV7
   4J+hIndE0UbREWM2snm69P95WeiSAJVtx7oD6DJevwGaBMNOCNRy+cVKO
   JNUFzVySbWUDoaTgeTqyQGZ3jbp70Rf6+Y0/wwcJCZzPhPaXoqbGQX1JZ
   3O8NsHmnFJ9U6OwjQmjLymTjLk1wnMw6iA+jTvllW0zhMwY0eQ0azo4vP
   Q==;
X-CSE-ConnectionGUID: I7cRXARwR8+av2VQSqwx/g==
X-CSE-MsgGUID: J9BNPJM3R0e9GTQ45DwZ6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52367982"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52367982"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 02:34:00 -0700
X-CSE-ConnectionGUID: 6yAK0t6EQomT14ApKXquiQ==
X-CSE-MsgGUID: NHOBK8g8QuuBHDuCs6nEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="180402294"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jun 2025 02:33:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRpAY-000Jbm-0R;
	Wed, 18 Jun 2025 09:33:22 +0000
Date: Wed, 18 Jun 2025 17:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] kismet: WARNING: unmet direct
 dependencies detected for SND_COMPRESS_ACCEL when selected by
 GKI_HIDDEN_SND_CONFIGS
Message-ID: <202506181745.ibqJDc1W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0697e85aef2e6a986214cc886be423fee63ae0e2
commit: f66d18f3df7aad300250cf1b23b95c181f31c39d [2/2] ANDROID: GKI: Enable SND_COMPRESS_ACCEL
config: x86_64-kismet-CONFIG_SND_COMPRESS_ACCEL-CONFIG_GKI_HIDDEN_SND_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250618/202506181745.ibqJDc1W-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250618/202506181745.ibqJDc1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181745.ibqJDc1W-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL when selected by GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for PHYLINK
     Depends on [n]: NETDEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
     Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y] && ACPI [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
