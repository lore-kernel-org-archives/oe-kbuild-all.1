Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35BF26ACD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738070566; cv=none; b=UE0uxkBVEpPFRuDcE8mPtQusrSfC4+7Can8S5gE/+nxRNatu4vZPjAfhAC8XeJ62CG+mMlpXBmb4j7Yx4UcU6JHg2Yx0GQLTx4srqZeMc37On59ueZEEwo43GHMIOPHqpRsqI6VIyRkOPYX+DoUg/Kn4Mev6jBsZOug8beN0jGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738070566; c=relaxed/simple;
	bh=CqSR10IMoUCoApztQFZnjhPlKhbR5bhPOTCrDHMaOF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b5PscujS4ZnGBXPd1LDgoaDN5XIWXoOXXgYuwX5jp/gxn2VqMNl7raX7n9xhza8igzETo0YHNkFjU+1gta0YK1OBUTE+/C5z58ISrKrGnTSZ+LqFKvD47BDcvWtJUaQQOAP+U4vqxeOrKRFPMKhholgpUfOZR0/8WG1UQXK+W2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUYtFuYi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUYtFuYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738070565; x=1769606565;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CqSR10IMoUCoApztQFZnjhPlKhbR5bhPOTCrDHMaOF4=;
  b=EUYtFuYiqTMW7OiKm1kM2fCJNAmbXmo3lprA0kIEuPYzgiDAys6lpkYD
   MIfNCj2+zjt2I1CM0nJMyYrSG91/+guOralzmR5sMVQCWkRZKMO4/4pYW
   iskHn2Nm9M3+WVfl/8TJ3BlWCHqIHtH+rW3uCSX8rBgxobCkLEMWWu8of
   1lqQEqcjfsG6/4Z10CUMBqWx+mKlnd+mdJl8xt09n+MR8opLk55eEIZj6
   ICAdANOrjueWlnOGkHYeMW/3ES3QSahzKBsXsobHnzvNL47Z3/bYlVx/X
   W7XDIRtxQKSuPH3T4RR4DDFiLFlBSoFnk4/1nWvRMsbrlMpTVWgyCaWPv
   Q==;
X-CSE-ConnectionGUID: lG2Upv+jRUuQTpDz9XLTRQ==
X-CSE-MsgGUID: y9ektMMbRe2PlRdcZLiMpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38462323"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="38462323"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 05:22:43 -0800
X-CSE-ConnectionGUID: +1CUSLJaR2iZ1hnb6fXfRQ==
X-CSE-MsgGUID: 40dIedaxQgWtwdAN5Ur/Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="108548977"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jan 2025 05:22:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tclY7-000hpR-31;
	Tue, 28 Jan 2025 13:22:39 +0000
Date: Tue, 28 Jan 2025 21:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/180-sio 6/6] drivers/dma/apple-sio.c:628:20: error:
 initialization of 'void (*)(void *)' from incompatible pointer type 'void
 (*)(void *, const void *, size_t)' {aka 'void (*)(void *, const void *, long
 unsigned int)'}
Message-ID: <202501282121.0TKzyoU8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/180-sio
head:   4df2e7a34db204bf1e219e825690eec917c0fe9d
commit: 4df2e7a34db204bf1e219e825690eec917c0fe9d [6/6] fixup! dmaengine: apple-sio: Add Apple SIO driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250128/202501282121.0TKzyoU8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501282121.0TKzyoU8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501282121.0TKzyoU8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/apple-sio.c:628:20: error: initialization of 'void (*)(void *)' from incompatible pointer type 'void (*)(void *, const void *, size_t)' {aka 'void (*)(void *, const void *, long unsigned int)'} [-Wincompatible-pointer-types]
     628 |         .crashed = sio_rtk_crashed,
         |                    ^~~~~~~~~~~~~~~
   drivers/dma/apple-sio.c:628:20: note: (near initialization for 'sio_rtkit_ops.crashed')


vim +628 drivers/dma/apple-sio.c

caeeb47c329c349 Martin Povišer 2022-11-28  626  
caeeb47c329c349 Martin Povišer 2022-11-28  627  static const struct apple_rtkit_ops sio_rtkit_ops = {
caeeb47c329c349 Martin Povišer 2022-11-28 @628  	.crashed = sio_rtk_crashed,
caeeb47c329c349 Martin Povišer 2022-11-28  629  	.recv_message = sio_recv_msg,
caeeb47c329c349 Martin Povišer 2022-11-28  630  };
caeeb47c329c349 Martin Povišer 2022-11-28  631  

:::::: The code at line 628 was first introduced by commit
:::::: caeeb47c329c349be087882dfa2dfb67f4a3633f dmaengine: apple-sio: Add Apple SIO driver

:::::: TO: Martin Povišer <povik+lin@cutebit.org>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
