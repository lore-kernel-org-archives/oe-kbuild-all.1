Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CECA7464
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 00:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749514473; cv=none; b=QeuHqRppwGUTh6J8Kd/LUctQ5NeVnWSEa10tHFhu9t/A6Jrl/2skWbZ7cmlg897yXn/HuuLGWcCLhxPtKhL6wuTHMT9n158+/6a1lrZD6Uv2e05kwaGgo26GRb4r+XSCImLgBVeU0b/dyK/zNE1pTQKw4K3e55FNEOcI91TTFvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749514473; c=relaxed/simple;
	bh=f8sTrdY+VcdH6zfgMXk0X44FX1UbsrMn8SKnqW7S4Zs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYqNKQ25VT4a+krCVAsI5ShFZioiPtyosWMGNxkA0f8Y7HgWOA77NeVRgBGQ2G5okH3VQoeI7an1Fm+D2wPc/4dzu8aEX08MluDkd3ZCtztA1DLTDXVJCmprteWXkPwjmu4TTdGNqdp+sw57MglJaRmCgPwk3RO0fqTrL1ZTPis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWL7n0Bd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWL7n0Bd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749514472; x=1781050472;
  h=date:from:cc:subject:message-id:mime-version;
  bh=f8sTrdY+VcdH6zfgMXk0X44FX1UbsrMn8SKnqW7S4Zs=;
  b=aWL7n0BdilRqbJQ5qis68L/yYjyaoNyPCWSClInf4YLjuHdEw5LBzuiO
   1cElywvGfFuCsQEvg7pN67I11L+AbHEx9jSB1RPhrLTFzVbln/Vmtw+ig
   giA+Cowumy5rFH/kRPC4VWXqYzXWCchVw0tRKFLvp0EpGEep8F/jA8oPH
   xIy3H6Y7s2KHMpYZrV1zaBo7DUYOjLXa7TD6DN+PJuoSw1TU+1/hwaDwV
   v44FPSEzpsAXHTO4EY//DnM27iGYEUi9uKGDv9BAI35ME5ZZmHPkce76J
   7GuRhXWpu47zKMn8zNRBzxZDtcNHayc5lu0gSBl4FQdg/7j1JxLfSr4cm
   w==;
X-CSE-ConnectionGUID: BQti10a2T1ej+vgmSWGzMw==
X-CSE-MsgGUID: 1r+/YFfoTneys7Db5PX87w==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51751570"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="51751570"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 17:14:31 -0700
X-CSE-ConnectionGUID: 1SJ/ouBmSF+ss6/HCzBPyQ==
X-CSE-MsgGUID: 3hj3XdPASB+YYXWFSU00nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="146579855"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jun 2025 17:14:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOmdI-0007ZJ-2l
	for oe-kbuild-all@lists.linux.dev;
	Tue, 10 Jun 2025 00:14:28 +0000
Date: Tue, 10 Jun 2025 08:13:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/dovetail-xenomai 11/11] drivers/clocksource/mmio.c:
 linux/slab.h is included more than once.
Message-ID: <202506100808.Ui8FqqaF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/dovetail-xenomai
head:   42cd032408f34e5fc3e2416eaefb6467c7421631
commit: 367e3f6c781809ad7a2c0bea5e9d3b332d0e0e9a [11/11] clocksource: mmio: add user-mappable mmio clocksources
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100808.Ui8FqqaF-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/clocksource/mmio.c: linux/slab.h is included more than once.

vim +8 drivers/clocksource/mmio.c

   > 8	#include <linux/slab.h>
     9	#include <linux/spinlock.h>
    10	#include <linux/uaccess.h>
    11	#include <linux/miscdevice.h>
    12	#include <linux/list.h>
  > 13	#include <linux/slab.h>
    14	#include <linux/fs.h>
    15	#include <linux/mm.h>
    16	#include <linux/mman.h>
    17	#include <linux/cdev.h>
    18	#include <linux/vmalloc.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
