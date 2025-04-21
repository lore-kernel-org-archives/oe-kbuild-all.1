Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D686717E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 06:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745215639; cv=none; b=WhwyNIZo3aVfos2k7XotmkrWfGUQXRSoYDDtZEuJpvc3smq6cREAgEe+iI6OQ47yXWZycEjIi9dXb1XR6ntQRz038JKXkEdDCDkq/qL3rFSItUx5ns10UlPoek8hr3rRlaEVUQmWfgNArTVKL0fYD4uHG/S8a0yNcV5ImVLxQsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745215639; c=relaxed/simple;
	bh=4A7w5MEl2IiAFTYv0/2hv0BbnfIX/S6t4QWDdgdmCWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mh4CMHAS8jlu35nET0VmJzBnfxg+YWt8y3iDgrsr1Uh72Xhciyh13Wbgnf6/QRMkqLJ1CqkC7Wo2hpSRWpL7CJryf5PdTGOTRR5ZT8Xf6RjNGae4sIwykUaa/KuQDmqCFwlIyMjPiIGoy3svfhmLas5n0ln40PzFJMC0uO9GCCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zg69PSnn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zg69PSnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745215638; x=1776751638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4A7w5MEl2IiAFTYv0/2hv0BbnfIX/S6t4QWDdgdmCWQ=;
  b=Zg69PSnnEZY16ulfkJYXSHqjx2zicxGet+kjpo+cfnrVHXDs6lTGMFX8
   oMQqSl3/8PSQPNXPSQFtC3mZs4314wQrf298tgUzhpacfR+33zIJfVrsB
   nhLIx3r9yFMA4ClAY+Osxy9H00kd+Sp34DYG9gT6hZ/PZacZaSG0ug7PV
   17VHCYwLGo0mMUdMaTFhX7QguoV+5T+c+c1YPmQsr1Hf2P5GYHojMnk7W
   +0OcHodomW9bG/jh8lJNbv7ba8u8PZa49Cy9ndw+f2Mpb0pYaqNgY69KE
   tuJyOn+F/7u84PoEQmcdhPMijYRJ5+gHHCN+WcCwVDABks8DZ7jBsaD/o
   g==;
X-CSE-ConnectionGUID: UeSbGApUQRS7o6aCf36YjQ==
X-CSE-MsgGUID: gcpx0u/rQye/mNNz0Mei4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46913986"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="46913986"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 23:07:17 -0700
X-CSE-ConnectionGUID: YsdG6zmSS6WjtkSpiuXlwg==
X-CSE-MsgGUID: YCyRiKxdSfOs5Ez/Thb18Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="135722978"
Received: from lkp-server01.sh.intel.com (HELO 9c2f37e2d822) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Apr 2025 23:07:16 -0700
Received: from kbuild by 9c2f37e2d822 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6kJF-0000BR-22;
	Mon, 21 Apr 2025 06:07:13 +0000
Date: Mon, 21 Apr 2025 14:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yuli Wang <wangyuli@uniontech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Wentao Guan <guanwentao@uniontech.com>
Subject: lib/dhry_1.o: warning: objtool: dhry+0xc60: stack state mismatch:
 reg1[22]=-1+0 reg2[22]=-2-16
Message-ID: <202504211328.qS7Z79wK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d7a0577c9db35c4cc52db90bc415ea248446472
commit: 892a79634196d2729b81bb8e5b029d095704df63 LoongArch: Enable UBSAN (Undefined Behavior Sanitizer)
date:   3 weeks ago
config: loongarch-randconfig-r063-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211328.qS7Z79wK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504211328.qS7Z79wK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211328.qS7Z79wK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dhry_1.o: warning: objtool: dhry+0xc60: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
