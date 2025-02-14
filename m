Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631C01C84A3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 19:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739562848; cv=none; b=szL8tERf+iJZnJ//eDQOHeqjjdiT2SQXxp/oVuhGCdYB7X9IV1nx4z/mX7pDEHKf9j0IDzS6tDN4tvu4ocQmxom2ALT1VwHGJrQ7JZQnQNEJNZvYZjpmueTYnn3TeBEjXoWcKKBUxK0Rh2TtpPWQ3wBFiS8RSyzEqOcp0j1qPv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739562848; c=relaxed/simple;
	bh=p/dhPlZV+5Ulc+6i1RgsFoi/8UPt2O0+cgIcWrFl8EA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JHt2kL8Gxz9v1Dci4n7fmf8pgUM+sWrwXWAQ52uRUB7n7lpsT4VElsXU7zehhuS+1iFvRhdGscFqrqhFiNoXhMajfOWCcBUJhx+pfWUibhkcUfexazNMSHz3931H6n2IcZdLArOZXaaTCaF+P8Vosf1STCvgO8Z+4tuWzbjMr/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5/2saVo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5/2saVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739562847; x=1771098847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p/dhPlZV+5Ulc+6i1RgsFoi/8UPt2O0+cgIcWrFl8EA=;
  b=g5/2saVo9uiNlt/Gy2ACVSpLH1Zk7AlVPSFN1h+++jMLq+itkPsMFkvp
   vjXAkm/ul+mvDKVchBw0ZpFgIjR9Zfswlu4PCm+HngqYxbw9V0Jlo1+Rh
   mI2yTq3Uqvq8QHoV2Eueg9idWPeuzLsc6cQIy2nw/U4zDRufBmlx7ilOy
   qN+RPiYDi8mlm0FOrZQdVMuj3egKzowAPafRdpp7PGna03REq5yxlophn
   TWry4d31Z9DLHdeJr/zIPiLtjHnpegDipAZaGnXvdqm9h9/6zjJPYdNZz
   mTcNktIX0puV0EHB1UebcgT/n9d8Ync4cO1ld+Eoth50qS+gOGYjpEeUc
   g==;
X-CSE-ConnectionGUID: 4F1j1Y1pTCa89fx41SNjwA==
X-CSE-MsgGUID: y7mBUBkVTBKWfwVBxlheoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40463775"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40463775"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 11:54:06 -0800
X-CSE-ConnectionGUID: glWNJBU+S0yY5ZLdQ839aA==
X-CSE-MsgGUID: FqRqebcsQHSL1EO2p+jMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113272598"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Feb 2025 11:54:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj1lD-001A65-1N;
	Fri, 14 Feb 2025 19:54:03 +0000
Date: Sat, 15 Feb 2025 03:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zctx/sg-iter-ops 3/4] or1k-linux-ld:
 io_uring/notif.o:undefined reference to `io_sg_from_iter'
Message-ID: <202502150341.4MxWPUMy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zctx/sg-iter-ops
head:   2c44968c915f2b63fe7199a8a13496ec554e1cd6
commit: 80d41ad4211efa00ef21828a41a81d7372441c29 [3/4] net: move ->sg_from_iter into ubuf_info_ops
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250215/202502150341.4MxWPUMy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150341.4MxWPUMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150341.4MxWPUMy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> or1k-linux-ld: io_uring/notif.o:(.rodata+0x4): undefined reference to `io_sg_from_iter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
