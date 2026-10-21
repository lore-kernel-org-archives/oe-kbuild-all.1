Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548622;
	b=hon9IVJmndbzZ/0dKOBnmuAGujLg/J9IebbSFOuVmpM7qgzba+fL1UxpuQ8MK/LGaaPX
	 iCntY0LonnDt8gbeaY74K8EQM9IFJ6OaHhaRDHnTf2s6QQ5bAXmwmC/Ab5ATR7VGCr77X
	 tZ6xc08nWj9OpfGJSdEYF1JbPaXw0HgYmIC2PVZbf8psNkujJll5Hlla/Db8umRVGlSAv
	 +WUF095Kch+D6bxjOj0ANd432xzNKDO98V5zeGVMbwbG19fC4h8FG9nOliJq9eqg+ynKS
	 ADMMAy248lliVmsWOyKQv1tQ/DnT25gLxMMQ/Z2Zab2OWmBnQ5qqJ3dX3RdQFtGp5Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548622;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9ut0cmwyUibAGid3TVul3jkQOAw4YrdAQyxJBsn4q84=;
	b=TpE+7Hvhlgy3RhEpECle+dt9kretWdSxntg7LTCnU0TbhwcWzVGE+B8KcXnWNfWe1UJS
	 ltbUst60RBYrFpALbIwLKSatnMstlNeBrOQ4kNXEDqNeUeJAMPiikrp+oko6PhFPGPlzR
	 cCi6gPeKm4m/5Lr6ilTLZ48A293MrZoOPEpJ0eksC01nReUCLO/HRcejY37Ky19fHNekV
	 +fVZM/uW8gehzc6ZQBxtXzFzXo3blzBe1gnymu8M/Q1fXdZPpp3DIkwETU0Thw//u/Ynk
	 C2HBIsFAFN1G6TMfMIheSfyaKIby684ezvtgHiZgKaCZGc1AoGeQs/bm70QgxoNiBwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gWwjtsrR;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B2F606A31B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 02:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B2F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gWwjtsrR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792548622; x=1824084622;
  h=date:from:to:cc:subject:message-id;
  bh=MVrZYHBCUXT6WtTFJCusU9/wuBPEz9izhvL3DcO/oqg=;
  b=gWwjtsrRob+64MLoCEwfGFf0aASpc9JA8e/X9GKQWgXwhxM7pBXYPtTh
   qkpAYkyAzey5lZBrpljChaJ/0W4wZS83nDvCabV0HuN0cI+sT8bTLWNKc
   lTdlRDDftc/h9+tcswYlQKOcA5+CEv9y+S3lCDW/xwdb74oDKD1JorbvB
   Eju4rstd1Kd3PJ6nIe51zx97NsP4280Lz54r4qbJco5RKvsrbnRBCtvTO
   rcyvHekz5//BxAHk/oOob7WHEiISReEZY5KcLx9mBfpdV3MMFznQOtT5e
   dcq8uIkdcSFbqnjFc+HgNJl6LIGLmH+bk+q2jnG+HqbW5BpRNcOuMTYpA
   Q==;
X-CSE-ConnectionGUID: 0hYQkOf4R6GwVtJ405SHMw==
X-CSE-MsgGUID: OnQp5cQQQSSczZrSpfCwwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1246598"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1246598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 19:10:21 -0700
X-CSE-ConnectionGUID: 14hEx4nDQNy7J6AKRB6zng==
X-CSE-MsgGUID: bdRjfsIuQ1qbHB/2vaLZsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3067684"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Oct 2026 19:10:19 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJLmS-00000000Op4-2BqA;
	Wed, 21 Oct 2026 02:10:16 +0000
Date: Wed, 21 Oct 2026 10:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations 17/40] fdesc.c:undefined reference
 to `bpf_sk_release_proto'
Message-ID: <202610210917.nPIPoGWv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux cancellations
head:   d3a43c8a05ca2e56ecb592c265a238386f3f1ff3
commit: d5b5e8f94c6af8caf3e43d13671a6bf25dee3759 [17/40] bpf: Release frame descriptor resources from bpf_throw_unwind()
config: loongarch-randconfig-1000-20261021 (https://download.01.org/0day-ci/archive/20261021/202610210917.nPIPoGWv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610210917.nPIPoGWv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210917.nPIPoGWv-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: kernel/bpf/fdesc.o: in function `.L166':
>> fdesc.c:(.text+0xe80): undefined reference to `bpf_sk_release_proto'
>> loongarch64-linux-ld: fdesc.c:(.text+0xe84): undefined reference to `bpf_sk_release_proto'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
