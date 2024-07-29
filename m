Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0B148826
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722257934; cv=none; b=Kl9zmWbcKWgbVFvI71/VqbbW8Y+U+QK5NNOAK3iR+iAyI24aKWggNrDmvNBjjZFTVmTwxXAAWcNgG3WqA9G88cTCWsXBRAF/OaxSQdmW9GMonUeBGxx2/nlxCr2yrp/YVRwWPntuI2BWpGhJFt62fxTTk6N9JdNyLOeUTpHBPv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722257934; c=relaxed/simple;
	bh=aYhGPqvjLQMpBkwCBxX7Mf+DXfazriB/TXGZUzvpGCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=onGHozHmv443LsAQJ61T+FEvqgRQOrq5kqI/eF892TfiTjyLwfRX8axBL9Nm1B16dNFJXAhZ0ALeMSC6Ga6hkMHVSYmvSUGU5ZJ73T0+y7m3v11jAGuLJvGrsG5vfD9oglZl972Mu6a+eu4IG8tGa5VgSm2DxoivfEyUG/9LQXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZxVLJb9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZxVLJb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722257933; x=1753793933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aYhGPqvjLQMpBkwCBxX7Mf+DXfazriB/TXGZUzvpGCc=;
  b=ZZxVLJb9nFV9M3M5GmoGTBtjuM1d/bdEenO4cY+nU15hTq2k2rCldJQ/
   Hh1JGETGWlCh4Z/ei2rbHj3jSloDlItw3SkGx+kIXof462OHWuRbanIpf
   Jz248tJr7qXhfmJejJh8dRVAEr2Ui0xcafwdGv0n1dwqOpV4JAmsZuSTS
   pjejI2CjLPwS4aJJyyVHUy7uUUAqfDsQs1KajB3sfu0n4iSuRWVptkkty
   Zkpcb50DnNPEnAcrK5R+o1IIvyIggDYj1vCoR7OoOraGvgX8uH+ujNDZk
   xB4jQ3T9CuZB+OtYzFSIguLr4aThekCBGGDc/bvRlzOeQkwL3r5/cgom9
   w==;
X-CSE-ConnectionGUID: ObaNZo+LTUufuEjM84G6VA==
X-CSE-MsgGUID: AddJZBDuQHGcShr2/jXHZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19609145"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="19609145"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 05:58:48 -0700
X-CSE-ConnectionGUID: SXAmiG1oQuG2tnsYPy4AdA==
X-CSE-MsgGUID: sSEaeiehSguwmPQYIGhMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="54060800"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2024 05:58:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYPxd-000riC-0l;
	Mon, 29 Jul 2024 12:58:45 +0000
Date: Mon, 29 Jul 2024 20:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1064/1162] tick-broadcast.c:(.rodata.cst4+0x0):
 undefined reference to `tick_broadcast'
Message-ID: <202407292010.VpKddqRR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   931a3b3bccc96e7708c82b30b2b5fa82dfd04890
commit: b8db38274b21f6c3579261f4309c37beafcff56f [1064/1162] parisc: Enable GENERIC_CLOCKEVENTS_BROADCAST
config: parisc-randconfig-r023-20230628 (https://download.01.org/0day-ci/archive/20240729/202407292010.VpKddqRR-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240729/202407292010.VpKddqRR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407292010.VpKddqRR-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/time/tick-broadcast.o: in function `.LC0':
>> tick-broadcast.c:(.rodata.cst4+0x0): undefined reference to `tick_broadcast'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
