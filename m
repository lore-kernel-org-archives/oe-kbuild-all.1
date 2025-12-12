Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA6A28F5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765557139; cv=none; b=Tc71eNRDNNbCdtI1CkSGpvxbIIeRQaWp5XuS7kaarnnh9TLKXkRCWiOT5t8x4+PhDIFNhsl6YrnlTVS9YOE+GeAPVzzSXpPVuYEPLARvUDGybGT8fkc3hD5DgGX8xMGDSMg4pVIbjUEM/8/Ul+JPqZfDzLhQezOTOr7Y5ooxO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765557139; c=relaxed/simple;
	bh=fVN31KedTu+6UnEpDFUokhejwaCY1nen4NyXuq4h9iE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gK52fpHZrSlRhk0j5+SRN8kDTdI1YnsChMrWPmg0BLVcunc/8e/BgIuh4fU8pbz98Qn+mPfb+pfFd34NyfSJScJNKeseta9DrfycVM2gVms9ej3/hZlmDMk7WE8GjkXMW0ibEz+G43Umhk8IMAXSLe3hZxgQrd2ZTxpi64As30w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7w6ZDF5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7w6ZDF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765557138; x=1797093138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fVN31KedTu+6UnEpDFUokhejwaCY1nen4NyXuq4h9iE=;
  b=n7w6ZDF5/eRlVVPYSvO6BoJRS8M01FqPrNTlv6rfTOt9MTsA52i6KKYp
   TbIPWGcMTDrza+vqsf2gOS8IOTh5xh+IY7ME9S4+I3zzI0XZwE3ZlGMNO
   OX3r1kMdcHERnorQeY0dPGzySBF5ckPRNsKJVHkYveehWUQfnTfwi7+Yt
   Lm0oObs6RLBVCGkM/AuL8AhIdQvsb93cZBPNI+Zy7nekOVxNvc9AYNa+d
   cIBm+vu6CX0azo4bXfz6DzWnTjPneD0wl80kb8VeppYbtqBy5/O6DrkoR
   B8r5IdLIPfJ6tUILxfNpeWJ3cPrgJD+TM0DnOElJAFy74EQROeRpyJ99p
   w==;
X-CSE-ConnectionGUID: +AhW9CtZRK2yV+y/CRlZWA==
X-CSE-MsgGUID: Rcufp2Y3Roe6TWUyrV8kOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78266923"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78266923"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 08:32:17 -0800
X-CSE-ConnectionGUID: DDSXhehwTq6FVFlnRoNuYw==
X-CSE-MsgGUID: ZuQYtx3lREKpMKf7iyp/kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="197949358"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 08:32:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU63x-000000001lQ-3Mvf;
	Fri, 12 Dec 2025 16:32:13 +0000
Date: Fri, 12 Dec 2025 17:31:37 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 11/11] usr/include/linux/rseq.h:77:8: error:
 redefinition of 'struct rseq_slice_ctrl'
Message-ID: <202512121708.I9jBNYBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   32ea77d4fbbfee4d7fc9747bf8037c42b3fa6c8c
commit: 32ea77d4fbbfee4d7fc9747bf8037c42b3fa6c8c [11/11] selftests/rseq: Implement time slice extension test
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512121708.I9jBNYBg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121708.I9jBNYBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121708.I9jBNYBg-lkp@intel.com/

Note: the tglx-devel/rseq/slice HEAD 32ea77d4fbbfee4d7fc9747bf8037c42b3fa6c8c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from rseq_test.c:24:
>> usr/include/linux/rseq.h:77:8: error: redefinition of 'struct rseq_slice_ctrl'
      77 | struct rseq_slice_ctrl {
         |        ^~~~~~~~~~~~~~~
   In file included from ../rseq/rseq.h:20,
                    from ../rseq/rseq.c:37,
                    from rseq_test.c:8:
   ../rseq/rseq-abi.h:66:8: note: originally defined here
      66 | struct rseq_slice_ctrl {
         |        ^~~~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
