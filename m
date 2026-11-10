Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338911;
	b=cUqq4xxCoEAuppMSbfHfLdb8+s7PkSu5+2uhzI5GJmaBDf5xyZET3dhcoXA06VIx5Jk1
	 vLQTq0MtxnEdGcIUewNEFDvsF0mVMMP11kUp1yVKm6HzkUMGUzMXbxOaeho/b555R4uhm
	 7hk12gs8/HwqoECaloVnLtLlsFxnzUp3zUCYmhCdNyMbZqBU0898W18wT1fvpesZzc1Ng
	 v6ahgsLkF6asAYlmj97bg49yrgPf1YRgpM1GbxFla+UETdCb6bZu8zvuBHzoDCge3gsSl
	 HsIK5BCJSr6fnRalWGXYVlAdve4OvZFALydC2NmeMJo8gJeXNEx6CyYD5lI5mSp/MGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338911;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=EDczDu9PpZahfkOMrhLdk5HNzfoUmOxWNYMtOjpT2nc=;
	b=w+C+Wi4Q2zfp8aVbOTgaPdjYYPWDZhEIby8z0+nAA1tXkUhTAv4A9bnNS4gXXnH6q5hX
	 yl3i90a+ceCWbRiXnJVhp3f2L9WbiQMlGlYGNy+ua4FROq3R47eNiY7yTWWPL2E5WoyRs
	 RnkFLh/dycOTCOas7epkX+9Y8kFGB5oKHAKnnI7boChn/kTMNkjg/QotstzBuoPTT5w72
	 mBmHpjB7D8o5GauL6odW9LSkosXN23UV4CGxnpCJiGta4ck90jQPx2oci0vxQZigNss+z
	 AC0k1pd4aVuTpB/2kC//q238G9QkhQFfMwOPAeyixhj2Xb7Bp2QuEc2tuTFJeDycjBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gSJOD0N6;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C765606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 19:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C765606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gSJOD0N6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794338910; x=1825874910;
  h=date:from:to:cc:subject:message-id;
  bh=EhIBNc5L6LarAPgbuH0iQdw8UFrCwbowKQo5YBo3P1c=;
  b=gSJOD0N6j2/MlMPVjsSEczJ+E4Z8qQuFVVvyGdOSkQh1mFgbZ6hWXlsz
   UxS5PZbzyVs9uE4v6CWAGNIyPx5dl0ajLA7lpWE3BRoxO5xhPiFVAQ5+B
   2JgF8Q0VfcZzEngru87iUiQwVKyF4h1Qps7YiE4SebZ7KTZw5lXRMGOEz
   afeV1EC05vZIWlgRkHzdGXELWKmqwqxRB9ht9Ti7TUjAAFc9Kc4xcTHFS
   yZjzNM5FuAX3RUkKx6yu42zXF+zooMmoQ4cDMfKstWIJBu1YbTRZdQbWl
   LDQ51zxpyXfKq+wsW8wWzTcUgTNYvkJcdF9ZXuOjh/eKPnnu/qQQy2gqF
   g==;
X-CSE-ConnectionGUID: zIukXth7ShO7EtVKc/cEHA==
X-CSE-MsgGUID: VeYm5lqFQjyUcxIdlJVprQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3141360"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3141360"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 11:28:30 -0800
X-CSE-ConnectionGUID: qpMO5TSfQH2urfg5TVaKRw==
X-CSE-MsgGUID: 2WcfxQiTSXutP4L2z4ir4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8207549"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Nov 2026 11:28:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQrW5-000000000L9-3BTI;
	Tue, 10 Nov 2026 19:28:25 +0000
Date: Tue, 10 Nov 2026 20:28:20 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations 26/40] sparc-linux-ld:
 kernel/bpf/unwind.c:120:undefined reference to `bpf_sk_release_proto'
Message-ID: <202611102017.NhV8nV5h-lkp@intel.com>
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
head:   cebd6c9fc9adb0f84623f6e93f543666457c22cd
commit: 5b4b4bea5a56b8a366601921eebec6cc6ae26343 [26/40] bpf: Add frame descriptor tables and release what they list when unwinding
config: sparc-randconfig-r2311-20261110 (https://download.01.org/0day-ci/archive/20261110/202611102017.NhV8nV5h-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611102017.NhV8nV5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611102017.NhV8nV5h-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: kernel/bpf/unwind.o: in function `bpf_unwind_release':
   kernel/bpf/unwind.c:120:(.text+0x20c): undefined reference to `bpf_sk_release_proto'
>> sparc-linux-ld: kernel/bpf/unwind.c:120:(.text+0x234): undefined reference to `bpf_sk_release_proto'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
