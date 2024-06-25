Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2102F56
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 03:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719286925; cv=none; b=lVaFfj6KBnhKN96hbijzAJdJvG15Aufj5tfE59dSyoKxfXDYumx1ESi681gSGLO9knfLd5UrvFPcBrthOZF3VbjNpCAGteZ50qS18usQLxrRrMf+ZVU8Y/4ai87f5eQzfcLNDhWx8bs0j/2hlrrGcfaZloHewMJ6UCeT9UlnS3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719286925; c=relaxed/simple;
	bh=L7CT13NEEX9Sr/9egiGI/BsDJdz2Tqu257CnHBTL4Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G9KpF1kDw7eaHp2E06izPWTkYqoADe9lsBicrIGFIwebl5kZaRc1gB1TtxeGjE1ly7vYlhRiiyBXFNyiciageATbqnNeXq2mGP+MgowOqF+Qu4qtlubYRhsbh+nf4ApqdaTjnBdRlnGHnu0O0jYpP9nb3odsWWkjBuDaMtdtNDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2HkLGYN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2HkLGYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719286923; x=1750822923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L7CT13NEEX9Sr/9egiGI/BsDJdz2Tqu257CnHBTL4Dg=;
  b=C2HkLGYN7C0uLRBBX6cWjakDt4QyuO1FD/jCyG2PtkFdEWL3XZrnTTtT
   LwtWhulJpNBKAFMXco4cWhxfoY2IxtYSLrGONALUDqgMAk9O0tlMa6kYJ
   qSE6IyNQ6M2ohCG8kixZsEuR2BreIhJXkTuEkJBxY+8Dr/ZHcWrQmFDnT
   ++RPJ9nEou4OqMcdfaPaZVx4aKokr5lGi2kHRBoAwPOcZPaUXRAkbZP7r
   kfM6ArbC33tNVZfjJeGm94gZ2aO5KUqt+matS+18fG1L7uQTRivCGJfp9
   hlOnz+2rzbACKEGvRlUhqbn/TrsFUoDfryTGhzimMza65zGozwehOUzYF
   A==;
X-CSE-ConnectionGUID: l9MNFtZiTGOAanLPicVtHA==
X-CSE-MsgGUID: 4wSWvMLhTHa+vqVE8uSvpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="33740248"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="33740248"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 20:42:03 -0700
X-CSE-ConnectionGUID: T5X0PSlqTPOwNDXDU+t84w==
X-CSE-MsgGUID: e7z315CITdi3bs1Fpu1Mzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="66726877"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jun 2024 20:42:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLx4B-000E02-2w;
	Tue, 25 Jun 2024 03:41:59 +0000
Date: Tue, 25 Jun 2024 11:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next-6.10-rebase 26/35] ld.lld: error: undefined
 symbol: tcp_recvmsg
Message-ID: <202406251110.6Q5luVZj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next-6.10-rebase
head:   1bc9807cd5e670cbc5f1a650daf7470d33fb94d7
commit: f9ab1c1cb8fd3a6c38b23531928b8e1ff43c60e9 [26/35] io_uring: add io_recvzc request
config: i386-buildonly-randconfig-003-20240625 (https://download.01.org/0day-ci/archive/20240625/202406251110.6Q5luVZj-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406251110.6Q5luVZj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406251110.6Q5luVZj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: tcp_recvmsg
   >>> referenced by zcrx.c
   >>>               io_uring/zcrx.o:(io_zcrx_recv) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tcp_read_sock
   >>> referenced by zcrx.c
   >>>               io_uring/zcrx.o:(io_zcrx_recv) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
