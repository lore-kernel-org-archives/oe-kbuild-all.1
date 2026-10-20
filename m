Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476607;
	b=aQn6bOFGWax+KNudWvndvIV2TbOow4GonVirQyzBXMDq2PspHSmaO8/O50DniyvUn7cK
	 hfRdTfUYPTckVHwsQL7mfxT/a7DtrbZ5cGb4JlkVd1HBUuqtdDYq7lyJPJk8aWgiJ4ZGq
	 Oy2T1txOK+JxuPvnpNX7Y8bRo8p77m6GsMkHjFSLjrlPCFt6TWUcR3JnXvxDM8qUBp4cd
	 8fDyqfSKih4gH+957zpDv4hk7Nf/s4lxYFaw7Qwo7DjnJVGFLnb68dR7qoo/EI2WLSf8v
	 mZ6b2LB9i89MB2829by1V3VBvJdA7gIPczuZTTCfrDDRV/2sIBlXxHuzNtmYOUw7jjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476607;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tUG/HO1/xJc/VV9/fNppvn/GBnG4VpxJG/5GjnMTQVM=;
	b=xRb6vEaBYOMHTSqa/0HleC6QcrVMsDaKaSIcsFeePXvmJjTcBMP+FHc4SM3zq8YsqSIC
	 FVCTJYIgPw1ZnmYGB61yPviy9ZPRkyDmDB6HGtGgH1McrWibovNWGo92/OLOv9qCX9LBw
	 +HKqc33AGlkCqv20sLJ5ChaZj7v/j+NWwIra85pClnsDI7zGdQK6aydTj6/WNy0NA/lNE
	 X+iBpka0CkWzHuZBcp6k/WZgaoY8jkDTCMfIj26G8aFmsG5/emmShe4k5TPGH4yTEonJo
	 u+o46ktAjWLCQ32e6rPiaX6aukr1BO5H13t6dzvp4kphCg899cZjZkV1AE5dNldpTpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QNImA8Fl;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D48606A319
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 06:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D48606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QNImA8Fl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792476605; x=1824012605;
  h=date:from:to:cc:subject:message-id;
  bh=y4ngXtYvkHt8ZYdBIWBWUcVnTHkvpGZnq4wf241UL5A=;
  b=QNImA8FlFY/ZI/jL+45e4FVQKWyqR5xVUueuWzfLt6kBPvWnZCfMy+4q
   5PVbKmNXqdaUWFeS9SR1+vcQLtlWfyPeRttRaBdzKeIvpChYf2hbtBZS/
   I71ar7bTtD4hUrBk5YCC2nhEgz5vuACbrKFOdlvkoCxaYOwAgI2HwuT2k
   Ko2ydIfmvd4R/sKQ9CgeMX7EBgV36mVHpQz32mC8Fso1YmD48huqMmAn8
   g/d5EseySN+6gm8nKrU8f8kUPdJQKDPnOEiSOjmnJ+9Tr1kv1jdy10aBT
   NkLKHx5W0FD/vvlTwIE6+YNmgy0M6Nz8YpCdoNZBaKzuY0B56ncqesg5R
   A==;
X-CSE-ConnectionGUID: a3K4azTySoqUMp4YOUgUdQ==
X-CSE-MsgGUID: rp3Ad8XkTguRuxaFvxQAqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1049004"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1049004"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 23:10:05 -0700
X-CSE-ConnectionGUID: W0tNL9t1RR+PmtYkKEYY/Q==
X-CSE-MsgGUID: 6RWTKRRVR+qlg5mwWYP8sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2685900"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 19 Oct 2026 23:10:04 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ32u-0000000067v-4A8J;
	Tue, 20 Oct 2026 06:10:01 +0000
Date: Tue, 20 Oct 2026 08:09:43 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations 17/40] ld.lld: error: undefined
 symbol: bpf_sk_release_proto
Message-ID: <202610200834.x1cOpPBH-lkp@intel.com>
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
config: hexagon-randconfig-2001-20261020 (https://download.01.org/0day-ci/archive/20261020/202610200834.x1cOpPBH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200834.x1cOpPBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200834.x1cOpPBH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_sk_release_proto
   >>> referenced by fdesc.c:548 (kernel/bpf/fdesc.c:548)
   >>>               kernel/bpf/fdesc.o:(bpf_fdesc_release) in archive vmlinux.a
   >>> referenced by fdesc.c:548 (kernel/bpf/fdesc.c:548)
   >>>               kernel/bpf/fdesc.o:(bpf_fdesc_release) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
