Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE813624B7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 17:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766761; cv=none; b=Zq4J/wFu3mVefFbBPHJwwwZUighjOQ6A1bcwZUMOk/pQsupsaVwWXzzTHDBR4q/vcpAteAsgqNiM6h+Rq100Acoi/ow5LHtJE+QiX1JOQGbGcQdh3FeC59EDNvgeZQivSEyWprs893/uJu2stns3mBiauxDJYj3I0/9JT/YpfZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766761; c=relaxed/simple;
	bh=kIA5VFk/IM7+TjrXZbU18YQ4m10B0wjr+qkzTO8jICs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RqgFEspcD6cO224e4rAUEHtXLiWvOHcpMDvN8yrNAW6RTJTLqthczDLBirS2Muz+XNNJFuk7HwspFV2rCJMRYC27QDP2aMe+cAaGi4PDkDza1nwVko1KDoT/yTMjZpe76mBP+wzp+5Cc0cFqL5dFaNkWH9ZjFJm6vmIkcpKPyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eelGZ31H; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eelGZ31H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787766757; x=1819302757;
  h=date:from:to:cc:subject:message-id;
  bh=kIA5VFk/IM7+TjrXZbU18YQ4m10B0wjr+qkzTO8jICs=;
  b=eelGZ31HMgb6Knaz0eVQlGjlNImzv3f2jcWWK0OJMmY2kOXk+n7tfHlm
   nfPyMWrzudmTe1dwAX865WJaFr5UcCSKmlGuzyQ75IwctVUWegVjosyQo
   nZTojFGxNDThtaO/+xBg5ABbBqo6Y3ji+BAMJ65cOwC3hq6ZPUNFopJWN
   ne4OtpNAiKULSSHi/s8iNA3d8PG1mQiHWWM56qg4E1fi0GV/QS9lAmfGu
   OtamVHuhbyk+L+LSPYgkY1ysZygMa49doBYx/VMNzTz+q6mqbmy5jBK4n
   fSmISHlC5A1u2Pc4NSw4g7lzUw27/qWkSZ5q6w6BFGRXhfvAa7aSoHjOM
   A==;
X-CSE-ConnectionGUID: 2iU+B2X7RTqr2/dS4+YQLA==
X-CSE-MsgGUID: Wu2EQyMGRI+ZuIgxp0Wk6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88276026"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="88276026"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 10:52:28 -0700
X-CSE-ConnectionGUID: TCmsEinhSj+HtifhRBxMRg==
X-CSE-MsgGUID: 1F4cK9ZrSzy1TRqGp8pw1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="271840807"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Aug 2026 10:52:27 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzHnU-000000000YH-2KpC;
	Wed, 26 Aug 2026 17:52:24 +0000
Date: Wed, 26 Aug 2026 19:52:08 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202608261926.Z2DYudTc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   97c6de407fa22bc729802f8a67bf88699953bcc1
commit: 4bb372791d1e195cad530dce5005509564c27cc7 [6/6] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260826/202608261926.Z2DYudTc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608261926.Z2DYudTc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261926.Z2DYudTc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=y]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y] && ACPI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
