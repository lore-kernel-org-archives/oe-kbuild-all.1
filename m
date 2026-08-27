Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BEF231C91
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 03:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787801023; cv=none; b=c8VU/ZlxwNw9AhZ4PYyqf5Mztlk2fRKCZR1zDcRHcwysC9XJvyasA/0/8CRVmt0h1LeCYETvDhkRC42JWjzhNwxKQmhhF3/lxxI/QgbyEn6YqrX2Uh7H96aXP/GkOCQPLMPDQwdAD+3dNSkumNIdgRvUYWeoV9vsHfFALMAGeUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787801023; c=relaxed/simple;
	bh=u6MXVL5rODDrDkVTGFGcoH0yjO81GvhfQfLvm46kq7k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M40ZOGOfYyeflAQYnBOE2IJBYC1o/eh6Pb231jVZ+vSsNLC80W5KqLIkMhEoZnqpAiXeQz4EZHcyj0s6qImLpkCjZgiAZRKv7VLGzxnt83ck6UjTUdHas6Q/t/TU/v4aRWiCMyj1FNzJAIo4H2EHNwpI56rUIinyzClwA6ktQGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfI6sDFJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfI6sDFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787801022; x=1819337022;
  h=date:from:to:cc:subject:message-id;
  bh=u6MXVL5rODDrDkVTGFGcoH0yjO81GvhfQfLvm46kq7k=;
  b=YfI6sDFJErYOhUsBKrUF4n/pZAhEfFlufr4q+iKpj++/6kyOv/zXMYKt
   AmBtozrWv8tJrmRx4ARinu3KnrO9TkwUbQdlt37YiKNHRlasza26BE10X
   rqpnBKNYZJoPtORssUStgRni/pCN9cn6OpEmy0RxQkGS9lR1G6fMDmoKf
   tfDKbQSBGMMjhjQUxegbLuHPIrYRJD5R5jtGAozQxeRALt1tIjdoKNy1b
   6+nd2bTOKjinVPBH/ggXQpKTW/qrTlgfzMDQsYVZAqayig5LT7oPIwoQW
   cPckPP3iBSIkGZemvKVKpeq26ghXJY9EgrTATSVzxy/kSZYqbwHH+TLwG
   A==;
X-CSE-ConnectionGUID: UgXSOOwqQzaEh7AM3jvjLQ==
X-CSE-MsgGUID: FEPTFKZOS/yUmEKeeuFA8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88501314"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="88501314"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 20:23:39 -0700
X-CSE-ConnectionGUID: Vf3gWfkWS2aA8z4yYaBfBQ==
X-CSE-MsgGUID: EytQaFw8TqGmNXXqrffabg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="297628448"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2026 20:23:38 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzQiF-000000000gn-34Bq;
	Thu, 27 Aug 2026 03:23:35 +0000
Date: Thu, 27 Aug 2026 05:22:48 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for INTEL_TCC when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202608270516.T18ADSjS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   3b090ab3bf57f3728e7cd0cca1e5e0461d9a79a9
commit: 8f5b5565305bb4a90b9e398d224aa7a48af1c5bc [6/6] ANDROID: GKI: x86: Enable Intel TCC lib as x86 hidden
config: x86_64-kismet-CONFIG_INTEL_TCC-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260827/202608270516.T18ADSjS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260827/202608270516.T18ADSjS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608270516.T18ADSjS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_TCC when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=y]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
