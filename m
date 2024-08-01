Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F32F13D617
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 04:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722487585; cv=none; b=k31S5k66cnOvd13nnGjlTBVCgmV6YcNqPAM14tIwGXYTptkfvTI3/RqtvQ7ibMqZhgYksuZ+vOPGbZlgTByz3BiEJZI8vyk6y3FrBZE3iBLyq24w7lqBZboO9eNIAMrNA6DsmztWdtDeKHEos9rl7DkUSBaKz4PeRAMWS5w2UAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722487585; c=relaxed/simple;
	bh=o987AoqJ9ztC3Cc9/FfvRos/1iBqBLnPf2Nyf6ri9IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ibTX25nVFJPv0yCVhlnV5wv4c1ra5ciuEKqh5StLydYQakYrlrCCd8P54s9MZiRidOKiRqWDIAxQrWntecz32sgUcLqAN74TZCKgBGhRZpkMEG+kQxV/l9/4HBTWdOJ/0PF63bCgpbWdHpUQHGysbVbNakWk4MMzH9SEPdQVh5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mydewSfh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mydewSfh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722487584; x=1754023584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o987AoqJ9ztC3Cc9/FfvRos/1iBqBLnPf2Nyf6ri9IQ=;
  b=mydewSfh9ZuU/IzoCMR2F9R53SdVLKuX8yC7VZAvg/RsJ4YeZtu5Xxea
   3TxVdMKpg6cD1BygABPCpqxeQbaxiF3QRn/PQv2fkMUM/vKx2ztmGWEmP
   Hwv37RKNU0XQNb1pArEx/9VBx4+mC4D8o/vs4UxJTlNsE996K9ru5K/62
   Phhyhxnz5WrH7jISlMQdMY0HvhLtK4Yv5nQU1dMPo0iOePw/L8HB0wyWq
   wJrgcEPVWDfztza4MuYoStdtOFSUhXmK5qinF6aMT3B7dSIcHexbKoABT
   ktGFG8eqPC4aknZCLNJPsFZWF1i1OIr6F7XbfRSJxzPEjI1PwEbd9j5Wk
   A==;
X-CSE-ConnectionGUID: +s3wsb9ZRoC3GlAXv0Mj7A==
X-CSE-MsgGUID: StU+IfrGQMO9bCPlWec7Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20100829"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="20100829"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 21:46:17 -0700
X-CSE-ConnectionGUID: wbdNBGGLTtm3FlIOIhI+Vg==
X-CSE-MsgGUID: zcWvG2pcRmOueVH806HBgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="59555445"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jul 2024 21:46:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZNhd-000vCs-1p;
	Thu, 01 Aug 2024 04:46:13 +0000
Date: Thu, 1 Aug 2024 12:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>
Subject: [brauner-vfs:work.procfs 2/2] ERROR: modpost: "proc_self_symlink"
 [fs/nfs/nfs.ko] undefined!
Message-ID: <202408011241.6Q28rmv8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.procfs
head:   168c8d86d8ac87a04878717d8d13d6b63339db8d
commit: 168c8d86d8ac87a04878717d8d13d6b63339db8d [2/2] [DRAFT & RFC]: proc: restrict overmounting of ephemeral entities
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240801/202408011241.6Q28rmv8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011241.6Q28rmv8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011241.6Q28rmv8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o
>> ERROR: modpost: "proc_self_symlink" [fs/nfs/nfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
