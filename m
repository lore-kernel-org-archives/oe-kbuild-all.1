Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455161;
	b=s9/MD7ZanZmgBi/o5tbk50RoEO8ctppikDN20mGaSgJL++ipbXAi8W/URuXrtAvG3l/5
	 X5VaAau8hArPEWqatOeCf5lblPSpwhTMVwfpQXvPEESYEy5xKfPUG6T5BtPdf3VJYoW3X
	 TVpnf32f2NGx3yWQvkqkGf/p/KWCBvSxsaP/0z4YNHVuWTIb3Cr71TOI34U49hqFDkLCy
	 bu8kKD7ckGgyu0jsSp2NOxwRa6BrmCjXC9dpS12AaBjrYkvUwBsPgRg1RepXweKYFGlr0
	 GRbOm4DHWs23PlbsYXlXFCr2t3bmp60u7qA4hDa1ksLWrBZO6R9CQOJfe7JA5pBfNrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455161;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=T71zTQdYnZXq7DUgDQcxfbIuAa8ZFL8vMtv/Qum/S1U=;
	b=U1L2l0JRhiUAP5Ah2oC9Af9AQzp0jmqlQd1OaZ6bYAjYZIUI9nza6eRNflu8JfqW1HUN
	 7z5uUkqp6lPg0rgZjXAhAWeHJ4WCORoAptln1o+rTHTnK+v+H3RAW9WH6Otqd5q3obg1b
	 0zo6elC3FpMiJWn+kwGhcBkNhwoaf0sfmkZzSDZgkDo/O0145C1S+K0IKAWvIzYZpKLeB
	 OhlnZC4SHT/Xz7z2fKK2aBKMaKMb1wfusiw60odyL1E3RjnbMz0DgaU7qvuehmbhem1P7
	 bjFuv6Sr/cjIr5xbc0JKrt3jpM/rMCFjINMoOFdSaaicZFc5eOXg1wJTtGbpBTL8d4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VqX2aO6D;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95142606A31B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 00:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95142606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VqX2aO6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792455161; x=1823991161;
  h=date:from:to:cc:subject:message-id;
  bh=5ARHy5BVGyYDCMvGDlLcjdOnQDYd0Y36sdaqSr8MyP8=;
  b=VqX2aO6DHDx9PsrxpMlXghAbsMkjZhMH1R8FI+a/b3t9AtFEngmQ+19U
   UN4KRx92ShBNo86/y08cT5fFKUNC5sd7ZEYzbOL/VoFIjUkNQcLA56VdQ
   0DIB45gz0FF1gTlYsw9a+C8UfEKi+lk9T4Y/rgEyADpiPihGmEYL2aeLL
   0R235oNfDKnbXSQUmKYb4w57vVvN/xwLwux4dKTZuW8TU4pcAXn/EEaea
   Y1uQ7ImoaWGGxuXQnylc/jrdGZZEoSjebjvR+Xqxk2yjs6O8CtiBf5hqE
   XpexElyduLeHZFFn+wHdTbB2vBzkxnvg1JSQKX8bPrIk/Ji1t91GpSMNX
   g==;
X-CSE-ConnectionGUID: WanCzNEKTsuCxdqBGVONSw==
X-CSE-MsgGUID: fqGWsdvARTu+t+ZBKE5OFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1036626"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1036626"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 17:12:40 -0700
X-CSE-ConnectionGUID: Yi5DZvhbS5GgRzu+vjTyWQ==
X-CSE-MsgGUID: paIKAmRZRYaW1+8OblgW4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3026341"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 Oct 2026 17:12:39 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIxT2-000000005zm-3CDB;
	Tue, 20 Oct 2026 00:12:36 +0000
Date: Tue, 20 Oct 2026 02:11:38 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations 25/34] kernel/bpf/core.c:3577:22:
 warning: 'bpf_prog_report_may_goto_violation' defined but not used
Message-ID: <202610200225.QHojnMjH-lkp@intel.com>
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
commit: cbd0277ca8d0c1bd206c9f7f9f908d07b24dc3e8 [25/34] bpf: Let the timed may_goto slow path cancel the program
config: arc-randconfig-2000-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200225.QHojnMjH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200225.QHojnMjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200225.QHojnMjH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.c:3577:22: warning: 'bpf_prog_report_may_goto_violation' defined but not used [-Wunused-function]
    static noinline void bpf_prog_report_may_goto_violation(struct bpf_prog *prog, bool cancel)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_prog_report_may_goto_violation +3577 kernel/bpf/core.c

  3576	
> 3577	static noinline void bpf_prog_report_may_goto_violation(struct bpf_prog *prog, bool cancel)
  3578	{
  3579	#ifdef CONFIG_BPF_SYSCALL
  3580		struct bpf_stream_stage ss;
  3581	
  3582		bpf_stream_stage(ss, prog, BPF_STDERR, ({
  3583			bpf_stream_printk(ss, "ERROR: Timeout detected for may_goto instruction%s\n",
  3584					  cancel ? ", cancelling program" : "");
  3585			bpf_stream_dump_stack(ss);
  3586		}));
  3587	#endif
  3588	}
  3589	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
