Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB99361DAB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 03:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787886058; cv=none; b=uy7r+COZtvvHZcfyUw/z+Q3WkoF7K3bW7JzSMX8tqHxBs3dkPz0YS5+/kEjQfbikXQZMSQEebfPImv3WVxUEPexK19pFnpCqbB8E6wzIgxeoOaMs7BrTfBevP+hVi3MTCsakV0qxjNvxxKuu0wHZBEj7/L5ANFWuueK1K89rDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787886058; c=relaxed/simple;
	bh=atZy+thgzzF/wLgEOD6jvvEx0tMGdRbm605k2pbncpw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KHWJrX9S+cJ1YZrrOznn3/EPzG59+Q1H5jqsiHVhg+BbuEFfa1EwAm3OzOMCMEgbFgsS5gLz1UVwLKCnyQY5HMXY10dqUB2QTpGbgjpqo83GpNr8beav2ATd1y8u5I1l9pQDkmOpJjOK4ZAufwofmtkfJtpP12E2TyZ0rxZWpjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPd2IjMK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPd2IjMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787886056; x=1819422056;
  h=date:from:to:cc:subject:message-id;
  bh=atZy+thgzzF/wLgEOD6jvvEx0tMGdRbm605k2pbncpw=;
  b=kPd2IjMKfYDxqltg61ZnnoGKYESPWPH9MQC9RnWTEvvcTCKvW0KKe+xS
   M4ZpkpW3fK/ubK4Wh52z8z8HWl+xQFb5kpgKsoz+hvuydzotwfObOLse5
   UkQaD0ap7leqDoUfnunZB+Hi2WBTTLERVfhBgGrUR6W7Hb8eGC1MmuQPl
   Pqe4yQhD3TvmmdhAOLkSc5oPQQdB6pzYd3fMMBDPGwuep1meY33bqOkkO
   moe1anEf01wCTr/ZM/KexfstL0NaIZdMI5hmduhmsznbnKuBfaz/S6aQj
   6LtUGqtOmi1B2X3UOnmd5OWRzJIhJ4yg2wTLmCBjOANzt6mWR6lzmxvtr
   Q==;
X-CSE-ConnectionGUID: cubghzV4TzGlmtyPWibUvw==
X-CSE-MsgGUID: JEgibGONTY6TAM6YTrTeyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="90907276"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="90907276"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 20:00:55 -0700
X-CSE-ConnectionGUID: 6JZ8/y+FRlGGceYJlihDBQ==
X-CSE-MsgGUID: n9NrCTrcQiupGoHMsXkMBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="266736122"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 27 Aug 2026 20:00:54 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzmpn-000000000wn-3NsB;
	Fri, 28 Aug 2026 03:00:51 +0000
Date: Fri, 28 Aug 2026 05:00:07 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202608280419.1X2KpcFk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   9331e8caf0b91bc59e1c69068a59bf93d5e8a31a
commit: 4bb372791d1e195cad530dce5005509564c27cc7 [6/6] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260828/202608280419.1X2KpcFk-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260828/202608280419.1X2KpcFk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608280419.1X2KpcFk-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y] && ACPI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
