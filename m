Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6274936923F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792242522; cv=none; b=o6/YG4MeOZBVJSO9JMuQurFjD0wS9jp18PEcakBQuy6LJVOot+AHm5fxjDFb5qoGdgFgxYFk16EkOaCVDpkvLt+CT43KhxZXZAWdliRKCyZnqpBCO4+VNmp8oojINzZzPlDlqTqBfq0Z2mnskGlNpew5y5jeUTXoBfm32FdLt0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792242522; c=relaxed/simple;
	bh=meDYCYUL61vvAOi4LYd5YcMPi7Tcbb8gJHx8gXggyTA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dIMUou3XeuqO2hQdnDmKr9ydk0CVdkOwoblowfOe/XSdiYRGr78K7rxkHlx25rVkdnsPrfv6NlpqsWnzhQkcxd/Q+CR7CY5p5bX9OYl9OXaxyiRau+/a1fQSM04C5Gd06ne23NGmC5r7gB35SEq19NLruI8iolHcKVz8UD8fpcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1pGa1vu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1pGa1vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792242510; x=1823778510;
  h=date:from:to:cc:subject:message-id;
  bh=meDYCYUL61vvAOi4LYd5YcMPi7Tcbb8gJHx8gXggyTA=;
  b=k1pGa1vu1hUfibe9NSjVbgqEo7OL9Cy8hznber1AkJ02M3UU/SbTX4nb
   om7h+VSu7Fe3FDmVeLnqC47UB+Mtusivv8Oy5kyFYQhN4Sff56eLXFYdt
   qtMtnqhQOvuNUTrdvAnU0rCus3g77uJtfhetjUQg7cyxykW9OVEhp9rRN
   KWpFW3x465/pMuZInDK220wnbUVC19OWV1ktTLThoNnnCl5SCcRh2akom
   +veNo0S7VGJtqe4YePt6ECatdS17GH9OdygdxszvavJbIM3J7kRQptRmo
   h5gLAuCxQXRs0Tu8Zj3Pmqwxky5dnHyk0WusAJAOmZVMWM3RiYWegu6Cs
   g==;
X-CSE-ConnectionGUID: H4+IkHfoRmGfD4XpFHYcmQ==
X-CSE-MsgGUID: Yeu7yP7iRC6x0bCBd5sYzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1015460"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1015460"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 06:08:29 -0700
X-CSE-ConnectionGUID: +WPE9R31R/+582kyYPQA6w==
X-CSE-MsgGUID: SqYL8yFkTp2diN5BJ0zXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2137826"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Oct 2026 06:08:26 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI499-00000000JNm-25mO;
	Sat, 17 Oct 2026 13:08:23 +0000
Date: Sat, 17 Oct 2026 21:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: Lachlan Hodges <lachlan.hodges@morsemicro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Pope <andrew.pope@morsemicro.com>,
 Arien Judge <arien.judge@morsemicro.com>,
 Ayman Grais <ayman.grais@morsemicro.com>,
 Bassem Dawood <bassem@morsemicro.com>,
 Chetan Mistry <chetan.mistry@morsemicro.com>,
 Dan Callaghan <dan.callaghan@morsemicro.com>,
 James Herbert <james.herbert@morsemicro.com>,
 Sahand Maleki <sahand.maleki@morsemicro.com>,
 Simon Wadsworth <simon@morsemicro.com>
Subject: {standard input}:188: Error: Insn b has an instruction mpyuw
 with limm in its delay slot.
Message-ID: <202610172039.rcazXh2l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lachlan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90201351a862182bdabfc1ad1c97b1e1b6ed5931
commit: b1906cea00b021acea22460225401d5b27bc7c36 wifi: mm81x: add mm81x Wi-Fi HaLow driver
date:   3 months ago
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20261017/202610172039.rcazXh2l-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610172039.rcazXh2l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b1906cea00b0 ("wifi: mm81x: add mm81x Wi-Fi HaLow driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610172039.rcazXh2l-lkp@intel.com/

All errors (new ones prefixed by >>):

   Assembler messages:
>> {standard input}:188: Error: Insn b has an instruction mpyuw with limm in its delay slot.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
