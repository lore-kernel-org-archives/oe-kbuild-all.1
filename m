Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D461A9F87
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 04:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766377757; cv=none; b=RP/ZYuv+/IozT6JiUpBmV7HOwYb7XGmUGLz4dn/dez/9qeDVYtZWKk5s3Zu6QHzYnr1/A8O7PA3+D9dpc9TmB9KENsmPWfdu7n4ee3Te3Rhf3nogmJgyD+dvDsj8EaJ7KHYK2f25JnMrrydv36Ix9TzYWqjHlsLrPI1tgt0KbV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766377757; c=relaxed/simple;
	bh=BZyHeJTO2F2PP2tm+yOXwrYNeIxqAlLkFx1ZbahLyLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5ICRU40oiVRJmA7KlPrn3xYRtEWkHuUwymQ7h9ld74/MQKdUogW/xXP2HHEXuqaXGaLwTTuTLdN7iMfkiGqbBoKbnWwTQNlaoEO9JWEZvUjbBWElvCdiwDhRuPv82E7a3MCU99LNxKNTYjd85bt3CyFGDoqtJaP37TGnzTaVOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWJ2eyQE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWJ2eyQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766377756; x=1797913756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BZyHeJTO2F2PP2tm+yOXwrYNeIxqAlLkFx1ZbahLyLU=;
  b=iWJ2eyQEozkfERsZWVPd5/W/W4+l7KC/EJ1RhOVFlzpfII/lGSkCtEUs
   WAwnqO4pn1HXpwPIWw0+Fhr/rkI68leNkXA3vGFkJlIQhkP3KGDCHFwz1
   erRshm2vt1tLsn404NoYZvZOiBkwsV1SuTmryqo+qzBbH9N1Bb27BqNDO
   EPA+YWg7rfxwwLu2afWuKCzNsi48CnflnVP+5SybZRKU9Ajc14/7H/zaF
   lThAHU6XLY5Am8ANPlyQqJ99JiEe+bweim8FQHalJB9Ach9BqFtzQBhP0
   4EUM+Dh+nn0UW53+MrezhltRLFKy9f5g/LAX1/4Vt8w9BfTNrsxzAI+yY
   w==;
X-CSE-ConnectionGUID: wiye+zRsQ0+aUPCLsoeoGA==
X-CSE-MsgGUID: Rm5nUwUIT5aPwPQrWHLFng==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93706691"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="93706691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 20:29:15 -0800
X-CSE-ConnectionGUID: aeFi4s6VRECmcEpfSN7WbQ==
X-CSE-MsgGUID: dSw8pWM1TyeTKnL2wIU4YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199395512"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Dec 2025 20:29:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXXXj-000000005MC-11A8;
	Mon, 22 Dec 2025 04:29:11 +0000
Date: Mon, 22 Dec 2025 05:28:31 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for INT340X_THERMAL when selected by
 INTEL_SOC_DTS_THERMAL
Message-ID: <202512220504.PcQzlN1w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 3d6a1eaf80dc19835f298123ca8c1042012d0856 [12/12] FROMLIST: ACPI: DPTF: Ignore SoC DTS thermal while scanning
config: x86_64-kismet-CONFIG_INT340X_THERMAL-CONFIG_INTEL_SOC_DTS_THERMAL-0-0 (https://download.01.org/0day-ci/archive/20251222/202512220504.PcQzlN1w-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220504.PcQzlN1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220504.PcQzlN1w-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INT340X_THERMAL when selected by INTEL_SOC_DTS_THERMAL
   WARNING: unmet direct dependencies detected for INT340X_THERMAL
     Depends on [n]: THERMAL [=y] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86_64 [=y] && ACPI [=y] && PCI [=y] && NET [=n]
     Selected by [y]:
     - INTEL_SOC_DTS_THERMAL [=y] && THERMAL [=y] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86_64 [=y] && PCI [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
