Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF09714F6C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725121396; cv=none; b=eIJccarw6ZeBRz/ZZju2f47PGeOnRTU4g91QMqqz+8GInLxiFeEgTKIM79m3VWO9v48KhyjEPNfppbnfTnGO3HOOe0o1iSxDPSHuJZ9lTfXtp1OlCOAMjP8T15ScFepZp2lBpI3T3e/p8T7Nyg5T/L69tANrklU5H3f1sk2V40M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725121396; c=relaxed/simple;
	bh=v3cJ3fLlBMyG7ZgXpRf/kzx2vRRu24evEETeiIw1Voc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Azjzf7koFBgOu9Le0m8ObZHiuZuvDv1XdzeM/FgXOFQs5uzxKqlBg2+5fQvelJhplz8J3zgc9A6mJKg+Ow0miEGfQATAi3CJQhkNJA5s58cZ3VdLnJ/UBmGmD4ttCYBVolVSjJbn+03mOhzxDhcVmGvHBcWZIbuqomwjM91a944=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JONE8Z65; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JONE8Z65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725121394; x=1756657394;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=v3cJ3fLlBMyG7ZgXpRf/kzx2vRRu24evEETeiIw1Voc=;
  b=JONE8Z65HEN5xu6A3BhoFsCJzjj4Ia3TL9LMPcaKAVVCE0loNS5zKAw3
   LX2Lom+mbFBPVsNeWNlz+v7s5NgDq5CAeikBfEo2GhcWq8112F7fzZDst
   PBQcsBXUkLy/IODiSJ+1ZxQJ3GfKcSyR2TV+vqx7q4+Z+xYh6JMDw1APg
   ZYe1DHOF6AKO2d6DlF6APY+FiOH6YtxvHF/Qo1E4d7mcSmuSDMxark6AD
   1pF/uUsxjSMY7hk6MW/EZzXfeg1FS1mndxIEuqWvm73T6KICl7tL9+GDf
   m2f8RK3XB0V2WtPK0qtc6I8BjNK4o2GNF2c5QXKfCPOgE7iYUUu4bwFav
   Q==;
X-CSE-ConnectionGUID: H7MlfHaBR0K7GNT8a42JoQ==
X-CSE-MsgGUID: z/70AivESiCDXmhc2o0gEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23934556"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23934556"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 09:23:13 -0700
X-CSE-ConnectionGUID: Vb8kX+PZTze8e60TPs/OZA==
X-CSE-MsgGUID: z6gGYx7oTfWoaMiLjchEzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64682935"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Aug 2024 09:23:12 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skQsY-0002uq-0T;
	Sat, 31 Aug 2024 16:23:10 +0000
Date: Sun, 1 Sep 2024 00:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:debug-stream-debugfs 4/4] sound/soc/sof/ipc4.c:18:10: fatal
 error: ipc4-telemetry.h: No such file or directory
Message-ID: <202409010030.lN9A7Y6z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/jsarha/linux debug-stream-debugfs
head:   68be79a50fc5b8f83378bdd48de9abf9eb9baa66
commit: 68be79a50fc5b8f83378bdd48de9abf9eb9baa66 [4/4] ASoC: SOF: ipc4: Use generic function for mapping "exception" debugfs file
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240901/202409010030.lN9A7Y6z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010030.lN9A7Y6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010030.lN9A7Y6z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/ipc4.c:18:10: fatal error: ipc4-telemetry.h: No such file or directory
      18 | #include "ipc4-telemetry.h"
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from sound/soc/sof/intel/hda-ipc.c:23:
>> sound/soc/sof/intel/telemetry.h:14:10: fatal error: ../ipc4-telemetry.h: No such file or directory
      14 | #include "../ipc4-telemetry.h"
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +18 sound/soc/sof/ipc4.c

4605af81399c136 Rander Wang    2023-05-30 @18  #include "ipc4-telemetry.h"
b2501c3d236e230 Peter Ujfalusi 2022-02-16  19  #include "ops.h"
b2501c3d236e230 Peter Ujfalusi 2022-02-16  20  

:::::: The code at line 18 was first introduced by commit
:::::: 4605af81399c13687f3837f976a946e4ca5083a0 ASoC: SOF: ipc4: add exception node in sof debugfs directory

:::::: TO: Rander Wang <rander.wang@intel.com>
:::::: CC: Péter Ujfalusi <peter.ujfalusi@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
