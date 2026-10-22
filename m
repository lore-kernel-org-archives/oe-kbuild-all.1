Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664996;
	b=NNkDSO2rGD0UJ1JqBVsGp/h9mOCcONutxUtnuqHwZmtiIGeV0kquU5kZVD27LgR7cGPE
	 wqub+5DZ3iGuAU+1pszdNEHx7nWtp0zKByDJlJECmUbxJnlUCFdeYcxuAbrY0ZHgSU9px
	 xYE2ewNfoOTNgZTcA6nID7CuMoj0iHbndOBhrr6bbc530mHe/1bw6AMolqiJF0JW2T+oK
	 Zm26eHNaVBWSRB3TAQJ0+El36GBToxFt0UobwJ/8oBSBwozjLPwfCY6Hj6Opp/kN2gQq7
	 TTovJh45dLVIlHA4JqDs+g8Er2nX2tpZBK2BAZdB3V+8HeLK9hJW2+g09n0cboVVlpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664996;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=FJb7Uc9++s/miSI0e4keFMbAwp7OaB+jQuhbNgNGzuo=;
	b=oi/qo/zciRQ/WUFKgjecFxzyswkvMNTbdq0QKJBGB63uZxhqQHrzTB/F2Vw8LBOuHOW6
	 HXsljcQZbJq+6TfDAHsIClo/0LF6OKy3/54DuiJyPe0PxOYlwOXHpcFovRlpMX2MNaOVw
	 b8OzuoIsySRRWcsmQCim7HJ2D0aknFr7PGEgseCfam095xXMx4EcXfj7JDRDgw292lXpP
	 6ABlI8XB3XBi9myl8EKEY7ch0u1jDrH/d5F6bZj3Ve0SM39DC6zX3YVZ1Uv1Rn3+earhD
	 QYgQu1XX4vPxddf3/r/cEUzE1AEDWdpJUrQRxrsaMxiMYx46lgWw0S7fh73vU7iomtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W4BozT0F;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C7A606A31F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 10:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43C7A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W4BozT0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792664996; x=1824200996;
  h=date:from:to:cc:subject:message-id;
  bh=Zy/ym+D8HUXeGdQFff5Ibr+3HKj98EsvLpEbchh6aq4=;
  b=W4BozT0FersCvq03iKfjVBXzyb2vbpmon33CReFjj2/q7JwNhKG4YYoc
   5adLN0VQd76qaer+7vZGfzWIMpTcNIiQazzqN0Vj7Tsydz5Y1r0+9ppR8
   QQRibB35RFaWkm6LToqhrGqBzZJXK5kTtLQeroSnzPkgaL62NL/fdJEt/
   qfywMfrvN3KY/GFw7ZPtVJ8eLjN7FUKRupcFC5p7kqt3i/m4VDa2s0v5G
   iyy+WmitxnQ8x4HOxa6JEJkvwoLZlc07xCKxwh9blVst7sJKFS1McOD1O
   mxS/wzliUbZcXSKu2+0eLIPGsrdNFGkR0ZgOUaV6UqRhQa++RHTLfzEHw
   Q==;
X-CSE-ConnectionGUID: 5M1TB3apTuKv1JE8A+f30w==
X-CSE-MsgGUID: L8ykAQJJQBWY/zdrPOgTgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1309782"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1309782"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 03:29:53 -0700
X-CSE-ConnectionGUID: TQMtoUIvT06dxKOs/RwQxA==
X-CSE-MsgGUID: y8HUuIqRS3iXZgFKlOM5fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3260022"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2026 03:29:52 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJq3R-000000000IR-0KzQ;
	Thu, 22 Oct 2026 10:29:49 +0000
Date: Thu, 22 Oct 2026 12:28:53 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 12/12]
 kernel/time/hrtimer.c:120:1: sparse: sparse: symbol
 '__pcpu_scope_hrtimer_base_csd' was not declared. Should it be static?
Message-ID: <202610221237.MmTRtYmx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c8fde724315a24b0a27fea99c8fdf14e0b64f9af
commit: 33f3d212e8d80da8f8fb647de5199976d1fc93dd [12/12] ANDROID: KMI: hrtimers: move out hrtimer csd
config: arm64-randconfig-r2307-20261022 (https://download.01.org/0day-ci/archive/20261022/202610221237.MmTRtYmx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a808f8ea7fdc61ead417bfe55e8ef5f728776aeb)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610221237.MmTRtYmx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610221237.MmTRtYmx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/hrtimer.c:120:1: sparse: sparse: symbol '__pcpu_scope_hrtimer_base_csd' was not declared. Should it be static?

vim +/__pcpu_scope_hrtimer_base_csd +120 kernel/time/hrtimer.c

   119	
 > 120	DEFINE_PER_CPU(call_single_data_t, hrtimer_base_csd) =
   121		CSD_INIT(retrigger_next_event, NULL);
   122	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
