Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA42D4C66
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733037985; cv=none; b=NgvGnDAUCBWLX6n5hotOI3znJ6OpiwyKzBem9cTcEMdBem8ZMuKE0dtYBIJu26DVO5XBLMpoQcE9iSEAIayTNqyr7djux44vLzQld/CK2zNDaKsfkSjsch1GPAh7/gb5dIEPI9yUZQoqoViqEOwt3D28cTDS0yOCRqn5oGZeg3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733037985; c=relaxed/simple;
	bh=0L8MR/NAQvztIMNw0sR/rVBFx3rsMt8weqYYdB3grG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iwktYafnXQgM+Lm7iwiiODVDbGT49BBmyxNWQRjZY2E1HDy0S7c4/ciyQx9/rFLEGbB41VdihntHloBLafM7yafYpUQilSI5wPENyzS/khxGV3K97VQLEhWoKQXBqZ5b8q8bOZLsdmB5p8Ows6Aep0sal9lUOY+QZsUrNaS+y/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWWPDsQW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWWPDsQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733037983; x=1764573983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0L8MR/NAQvztIMNw0sR/rVBFx3rsMt8weqYYdB3grG8=;
  b=dWWPDsQWmZgvXe0BZWApIitzlX4XX1N57R4ymSBk86YQodr2G0/w0SMY
   coyeOO/Ox2ttOQg26W6VpB1EEgA3modHGrTOyPIylamyuArsuYSRaY8jA
   MfnQykCgMqJeBx45Cx3iCEIHXhpQP96mVjDaGGs3SqiCS/0cuFcpdD9Z2
   AXk6NrPI8pCB+YwcRy9IrZBNIsPJlBwSIweuCa/+QVOPfBdsEAZuA0uZf
   eLklZSqign6gEryN1/k+72NmLlfSVwXLZLf+WZsqJvut9kFfMMNRSopfY
   S8Ija+TtmoJHPCuS3OyV/Ju4M5jdojkUTJhPO1TP1+eHrN3QTjNm4fd01
   Q==;
X-CSE-ConnectionGUID: 6NZh3wHsQNq+0qD10rQSjA==
X-CSE-MsgGUID: 4wVGlgyOTYObyga2BxFv3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="20802636"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="20802636"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 23:26:23 -0800
X-CSE-ConnectionGUID: pCsCMlD2TH2632Uojl+HeQ==
X-CSE-MsgGUID: wIPldqbPQQOSJ0samlGjVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97835071"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Nov 2024 23:26:22 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHeKx-0001L3-1t;
	Sun, 01 Dec 2024 07:25:54 +0000
Date: Sun, 1 Dec 2024 15:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2430/2430] arch/arm64/mm/quick_kexec.c:21:13:
 warning: no previous prototype for 'reserve_quick_kexec'
Message-ID: <202412011507.pSC7pXCi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kefeng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a2b4d661a5ca59dd7cf972c1cce8b98422102ab7
commit: d61f4ca086e99bb481961b1120e10e7a4296c392 [2430/2430] arm64: quick_kexec: Move to stand-alone file
config: arm64-randconfig-003-20241114 (https://download.01.org/0day-ci/archive/20241201/202412011507.pSC7pXCi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011507.pSC7pXCi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011507.pSC7pXCi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/quick_kexec.c:21:13: warning: no previous prototype for 'reserve_quick_kexec' [-Wmissing-prototypes]
      21 | void __init reserve_quick_kexec(void)
         |             ^~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/quick_kexec.c:47:13: warning: no previous prototype for 'request_quick_kexec_res' [-Wmissing-prototypes]
      47 | void __init request_quick_kexec_res(struct resource *res)
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/reserve_quick_kexec +21 arch/arm64/mm/quick_kexec.c

    20	
  > 21	void __init reserve_quick_kexec(void)
    22	{
    23		unsigned long long mem_start, mem_len;
    24	
    25		mem_len = quick_kexec_res.end;
    26		if (mem_len == 0)
    27			return;
    28	
    29		/* Current arm64 boot protocol requires 2MB alignment */
    30		mem_start = memblock_find_in_range(0, arm64_dma_phys_limit,
    31				mem_len, SZ_2M);
    32		if (mem_start == 0) {
    33			pr_warn("cannot allocate quick kexec mem (size:0x%llx)\n",
    34				mem_len);
    35			quick_kexec_res.end = 0;
    36			return;
    37		}
    38	
    39		memblock_reserve(mem_start, mem_len);
    40		pr_info("quick kexec mem reserved: 0x%016llx - 0x%016llx (%lld MB)\n",
    41			mem_start, mem_start + mem_len,	mem_len >> 20);
    42	
    43		quick_kexec_res.start = mem_start;
    44		quick_kexec_res.end = mem_start + mem_len - 1;
    45	}
    46	
  > 47	void __init request_quick_kexec_res(struct resource *res)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
