Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79213C73E5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778256076; cv=none; b=f02zrl2ih9VPRJ5WMDMLSMJj2JaFy0YOLBAfX52Y9/6ZIdzsj5+53mFqi/5w/WMJGQvDRTYeZVbJ+wP2y0sDwCwHTAkwAnCdbFNiHq6pi26CAwCGdBv1gqHMxU51vnHlAaobmqTgO2jVppAoalDvD56favn2nckzdAEJq3LKoBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778256076; c=relaxed/simple;
	bh=mEUsR6dbqElNdZ0s9pHovgOveWc5SVshtMqS6OwG8qs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J3ahNzdUK7I7Nkqv7hXX6vrCbLsCte7kqIVt5qjVp2FJbfhv0kpWt6YYvnJeas001KMMVz6rYIOEPKC4Or0EGuOEHyckRWU1WYXpJxlYDE/UWVpKCjQSoYW9eSxCPZRXRh0B4WIHTQ3mKdyx+kOSrwtN1L20PVcsaHhGnOwvAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U91pE1bs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U91pE1bs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778256075; x=1809792075;
  h=date:from:to:cc:subject:message-id;
  bh=mEUsR6dbqElNdZ0s9pHovgOveWc5SVshtMqS6OwG8qs=;
  b=U91pE1bsbQIkofaYmem/SytwbKTE3nVWlLRIdkoBfnQf4xGzzC9zq5vP
   /FIK9rNM7obO8fiHyYK5y4iprJXOUrN9tmnxjHssG8XpzGnuNM1DGc/bM
   VxzUCBAIhcyIBsFe0OXHqBUATejTJnUv/X/7RqnwPdhnzaVs0QAw88eO4
   72F4w1uGxidAu8Dmjw6+kVwtR96HD/sPj187FU5mhBWF/xj4Uvhd1VBqc
   fHVSPsLr9V/eRBCv6D1ruCYcxQqwkTd5F4oyd1NLwSgKwnIy7fsORBJNe
   PEcDSf3feAfHZAyOIrF312TiBywuLiwyNztUKe5J6xGY/DsDXfyPboqUO
   Q==;
X-CSE-ConnectionGUID: IhtOCbzTTQqfXrDprJv2Fw==
X-CSE-MsgGUID: XmpwfXRJRwqS5MIG7ifHwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="101901724"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="101901724"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 09:01:15 -0700
X-CSE-ConnectionGUID: 6f2ajUV5STOKj0gxwlowQA==
X-CSE-MsgGUID: DwLDuXW1TbaKUXTRSwVhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="260244298"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2026 09:01:13 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLNdW-000000000FP-2tKv;
	Fri, 08 May 2026 16:01:10 +0000
Date: Sat, 09 May 2026 00:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-io-slots 7/13] io_uring/rw.c:1265:24: error:
 implicit declaration of function 'io_slot_iopoll'; did you mean
 'io_do_iopoll'?
Message-ID: <202605082320.yVp5eQnB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-io-slots
head:   2bbc5f014e3a6c148a49af38c5f288ee510ca57b
commit: a143f9f1815d2e2ec524f2b18ecbe48b9d8bd008 [7/13] io_uring: add IORING_OP_SLOT_RW and wire up slot completion
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20260508/202605082320.yVp5eQnB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605082320.yVp5eQnB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605082320.yVp5eQnB-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/rw.c: In function 'io_uring_classic_poll':
>> io_uring/rw.c:1265:24: error: implicit declaration of function 'io_slot_iopoll'; did you mean 'io_do_iopoll'? [-Wimplicit-function-declaration]
    1265 |                 return io_slot_iopoll(req, iob, poll_flags);
         |                        ^~~~~~~~~~~~~~
         |                        io_do_iopoll


vim +1265 io_uring/rw.c

  1252	
  1253	static int io_uring_classic_poll(struct io_kiocb *req, struct io_comp_batch *iob,
  1254					unsigned int poll_flags)
  1255	{
  1256		struct file *file = req->file;
  1257	
  1258		if (io_is_uring_cmd(req)) {
  1259			struct io_uring_cmd *ioucmd;
  1260	
  1261			ioucmd = io_kiocb_to_cmd(req, struct io_uring_cmd);
  1262			return file->f_op->uring_cmd_iopoll(ioucmd, iob, poll_flags);
  1263		} else if (io_is_slot_op(req)) {
  1264			/* slot ops have no file assigned, use private poll handler */
> 1265			return io_slot_iopoll(req, iob, poll_flags);
  1266		} else {
  1267			struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
  1268	
  1269			return file->f_op->iopoll(&rw->kiocb, iob, poll_flags);
  1270		}
  1271	}
  1272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
