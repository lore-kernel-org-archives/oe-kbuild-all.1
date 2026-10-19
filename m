Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426376;
	b=2JKIShFox5fErJqmt4WDw6edFyn450b8LJb0bhJhJG4TOTtdEgWWavhIbSvwXLH0prDh
	 tey5+DjjWH91fMjp1obi0QrOjoE/rqvGNZzPNtc/ta+i6XtBl26E/Ja5F6cfJ8SfVbT+2
	 VPtfodzEF4H6IUrQaGLG4zP/6LfEATXbnIRGVFdytCKTu6VbL0noJhJaSUk0K7sV15fk5
	 KHIWMzL1zNM5C2TDmpK2xbjbDEWBc0lf5H//TOtDpA0LVwE7WuTW8uYdP6JPhy0x9OTe0
	 1cHXSmZCFHbSn7V3vOunE/wEUuVUjkHfNvY5sOVCNihIYJcXu2YUqloWXiCzjdk9L7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426376;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zUHLp/D7KvNSmWFw20lryk0A9hqlD/+BLv7dxqqAivo=;
	b=r26Ml47JXvQ05Al9+aUJTnfEAlwszro3gZuVkXoXCk1tcSsMTlO2IP9Q6K0vvseguKHe
	 EZqaYMXtZyrhGN5L/DrMup9czMm69Tlt8U1OaWEOM0X2yoxZEohVNp8vYdEsEGzuRUuTz
	 UGnNZDU7r6MKyEJK+mUDJ40iSA3HtvfKJg0NFFv0gOrgoLew2eBlM56TQrOFP++Nree5q
	 a1DsLJNVEpW9gc8XV8yuFEhCC77TvGkeFeWYkWmo7c8K2rAaweiEaPDCuDlAH49cNiOKV
	 K7Ssdf8O9Gh4+5TbVMh8AOKzqzMyBfmvOvPO/3b+AuEj9Yh00SxloHm7fbQmMbgRcMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KL7KZBxV;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53239606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 16:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53239606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KL7KZBxV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792426376; x=1823962376;
  h=date:from:to:cc:subject:message-id;
  bh=DEBKeBsqpf9yTYDHWsMBLOoPSfgXT3HkQCqnyXdKwWM=;
  b=KL7KZBxVE4OsHy+P/E/1gOCb3w9NjiKo8cKzitVPeijM9ZG13qiKwTu8
   uUqGYXTrf22cKML8wKSLXPKh+ODgP/sgwrIhll3tTHuiV9JnHLgM86Vov
   jrtJMlQsLJQLpPi7y/wHBlj9VInhEFn6yNy7RdMF5D6qJngaQR3ER8DEZ
   8JTNTiuZ5QJCsclbCtl9F5G5BNe/a+SDKraUlusLIzBmTMqLaFZKiGBF7
   RfBnbrezDDUqX4mZKvQIpoCJexdl/DB6xsbRiZLMvsLp2CgqAxlKfc1KY
   N2U542cuWQZyPJ1vMwj3SSWggIs2ZyRC244PsxqjoEB4gBIMQ+WID6fjz
   Q==;
X-CSE-ConnectionGUID: 9E5ejZCoShKUkgsMUpjlmw==
X-CSE-MsgGUID: /Jc4auhvQ4a/N8Kk/N0oXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1115946"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1115946"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 09:12:55 -0700
X-CSE-ConnectionGUID: MXs6KdLNSNOQe6Z5KIMQcg==
X-CSE-MsgGUID: dAvLK4miQ++R6tVggspCEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2454997"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 19 Oct 2026 09:12:54 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIpyj-000000005gb-3uOQ;
	Mon, 19 Oct 2026 16:12:49 +0000
Date: Mon, 19 Oct 2026 18:12:19 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-rm-ldmxcsr 54/55]
 lib/raid/xor/x86/xor-sse.c:435:9: error: implicit declaration of function
 'kernel_fpu_begin_mask'; did you mean 'kernel_fpu_begin'?
Message-ID: <202610191833.dBDeTobl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-rm-ldmxcsr
head:   bfbfcfc62eeabb32ed80c920f158a9262aadeb89
commit: a86e2a52063aaf13992ddd8ba68a42798d6d1faf [54/55] raid: Opt out of initializing MXCSR and 387 state
config: um-randconfig-r2307-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191833.dBDeTobl-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191833.dBDeTobl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191833.dBDeTobl-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/raid/xor/x86/xor-sse.c: In function 'xor_gen_sse':
>> lib/raid/xor/x86/xor-sse.c:435:9: error: implicit declaration of function 'kernel_fpu_begin_mask'; did you mean 'kernel_fpu_begin'? [-Werror=implicit-function-declaration]
     435 |         kernel_fpu_begin_mask(0);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         kernel_fpu_begin
   cc1: some warnings being treated as errors
--
   lib/raid/xor/x86/xor-avx.c: In function 'xor_gen_avx':
>> lib/raid/xor/x86/xor-avx.c:148:9: error: implicit declaration of function 'kernel_fpu_begin_mask'; did you mean 'kernel_fpu_begin'? [-Werror=implicit-function-declaration]
     148 |         kernel_fpu_begin_mask(0);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         kernel_fpu_begin
   cc1: some warnings being treated as errors


vim +435 lib/raid/xor/x86/xor-sse.c

   431	
   432	static void xor_gen_sse(void *dest, void **srcs, unsigned int src_cnt,
   433				unsigned int bytes)
   434	{
 > 435		kernel_fpu_begin_mask(0);
   436		xor_gen_sse_inner(dest, srcs, src_cnt, bytes);
   437		kernel_fpu_end();
   438	}
   439	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
