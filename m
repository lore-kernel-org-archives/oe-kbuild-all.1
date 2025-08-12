Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2D22E173E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 08:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986517; cv=none; b=dC8dAVqrh46sDq3YI6C3khoLyTRIgZrlhdOcE/yqCu/ILrETNrvgXe4fbKn3GQgMn4SddCVm94MEktYuJdEVfyiuAALy1CNBxtcSRyXSnBRnCx5P1wXRpzK0Ba5X1M4NMJqMq097UjU8j+E4X6MOWcUawqdFiMlcU002EY0i9PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986517; c=relaxed/simple;
	bh=MmMHjVhd2PO4/c0VIYrUtoXLFFvTZR6wxf+vnQ/6tBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MuHlkPRy+PHA3B1uQOvhCWEmN7Fd2x/QVChuaW9reLQCSYrMlsOq4/WWB5b+kgjKM5e0O4gEW/7Bw5OCgijyFJF3rnvhmCuKJ8SUwrYY5wMTDeZEakWy4Tr6xjmER+sm6q6hIu3Ko3Gr3678Q0Bn+lkUl7eBuAYxqQaA8IREAkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yjkle58X; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yjkle58X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754986515; x=1786522515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MmMHjVhd2PO4/c0VIYrUtoXLFFvTZR6wxf+vnQ/6tBE=;
  b=Yjkle58X3cyBr6b3bzsrKiUSUp11T+h0c+C8AE9P+XW23xTQeLvGyVBZ
   UZD56d8zZ+0KBXrTj/xCPDmjWU1bn/HHigw9IZkxbsU0xracBIVcH16OJ
   WcVIVRfsnZ0vcv/HHi7zwX+FpZU/TbdDxZAuhJFzssz47K3GtEwJe7UDq
   Sy/11I1/U6sITsbZuJjz9ouRyNgLYXoGsRjgIPPa4ACQjQ1XJe/2aiu6Q
   A+o0GYnVMpHFZbcP16TkB2MWfTNX4tc+s4O/Y6oiD8KDoayJc1I+EpAGE
   SHKosIGKgQ/arTqTp718tAfEX2KrENvX+cRKCl7hsKsCicJZBUDNB1xEj
   g==;
X-CSE-ConnectionGUID: eJVUh7nMQpCuITvxhC/VCg==
X-CSE-MsgGUID: NO9g8uZCR5K/5EYQ4tDDVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57331908"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57331908"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 01:15:14 -0700
X-CSE-ConnectionGUID: 9egNtS6zR4iC9Y4rOBJ8Nw==
X-CSE-MsgGUID: RD7XvojwSeaNdzgwmbENsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="189816545"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2025 01:15:12 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulkA2-0003GV-0t;
	Tue, 12 Aug 2025 08:15:10 +0000
Date: Tue, 12 Aug 2025 10:14:21 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1750/1750]
 drivers/i2c/busses/.tmp_i2c-zhaoxin.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202508121006.nLfkti1W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a7892155ca524e224cb2da85c85cc1bd4303179d
commit: 735c81b4d33c46ea097f6437f63ea624ccf6dee1 [1750/1750] i2c: Add Zhaoxin I2C driver
config: x86_64-buildonly-randconfig-2004-20250805 (https://download.01.org/0day-ci/archive/20250812/202508121006.nLfkti1W-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121006.nLfkti1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121006.nLfkti1W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/.tmp_i2c-zhaoxin.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
