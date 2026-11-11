Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422401;
	b=2tu+C4mznqvbco7mXZd0XDz0sADZ8mHspfWJI80PqEkWkeZNoBrqd+J0noQxh46PKT8G
	 w98q8RcK5lp2uW2tN6kZ4jqeWJd0DSg9lTaP/3Q6cIUPWs43V5BjTnG6ltQ4R16LOUBfr
	 VHxGjX8nKlb11GT3m58ZqgHRbEs8ynxLYCxuwt9jjENdANC63gDyH0/cgeqTVtIAh5xyX
	 hqYCaTK0xRI7rM8np3Z+yQN+kR/q7rtH7fs7JM/P7n1S2HRfQKiPwkiMGbr431xZtYFct
	 CFs/WV24zYuKtxswDzKXfZ1H6dtT/g2QYoXLT+fWMSiXxvzWKqYeuzpXPxoOxm5QR/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422401;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KcjzcGgraYaTuKatG8KyxPtt5MlOHoM6ppdLzVpSZYE=;
	b=VywmUr0ZvYW5Bzm2jb6XglLYdrPqRGMZBSwtmIGYdIiP07XQ1m8KUUGGgiaAW91NlW58
	 7IXRNIPSjmpqVAUmZlD3lUt/WcXJWpWZCXTjdMxARlPsWqOAPGUphRzHJjGpshwYnAunp
	 R1QkO6RdADb3C4u0L0A8CkwBrI0ZdGYqB1Ybu8H9JO7poC7v1G3OEJAv3XJDtt8YEp+pr
	 j8W4mFLR/tZdNB1BPc3uC1g6me6M+ogto27HrvYjxMq3w6QNwKhEnIKQzxoN/Z1T1/GM6
	 J1q9XiAMHCiTFD1QlNI7szZzWpJxXNh4EhU3gSSW3Jt0dgbCGzFObsAGyeJsRZ7qhxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MmRzEBMW;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19720606A321
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 18:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19720606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MmRzEBMW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794422401; x=1825958401;
  h=date:from:to:cc:subject:message-id;
  bh=5JBe0O/ErYlvY7rB3bQ5YUNGPsuJPffYfSyl2HHSwF0=;
  b=MmRzEBMWkjvBjPkgzMfrloNmHer/tLY8Gt+7NVCa7TIGI0Jg55vuXea6
   +Q1HZT065MXjOusR61YbHbTMMGJ2QiQMh8P+J9BvweyezXwOhQfpziIsq
   qB44c11lFl9JsBqs87IO60KkDjVGgcGjkKtm8OURoq3HV0P3XMaX4AlfF
   xC77VSlLa657N2ZjY6ZTDiyvQ+jAQbe+rUXRqlUKulsXXbHxlRoWeCi7p
   Uslbee1+HboeR9o9Bt1uKjAHG69OxrkVmfjyJYz0CKqmY2xJnbfk83H3V
   CnR4HVVdo5td6FHLpV3wwPGEJaAWSJRXLwZZ3hJPqIgG8PCB7EUuonaWY
   g==;
X-CSE-ConnectionGUID: oGznpe2fQOKCxkNHOZ+3zw==
X-CSE-MsgGUID: +XsPsHk7TPiXfp1umoFPpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3082562"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3082562"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:40:01 -0800
X-CSE-ConnectionGUID: O4EdvjsVQWyaZfizpnMgzA==
X-CSE-MsgGUID: 88gpiBA5Tmq12gUlHp+mTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8622384"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Nov 2026 10:14:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRCqT-000000000dH-45ik;
	Wed, 11 Nov 2026 18:14:53 +0000
Date: Wed, 11 Nov 2026 19:14:22 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations-backup/frame-slots 25/34]
 mm/bpf_memcontrol.c:85:18: sparse: sparse: symbol 'bpf_put_mem_cgroup_dtor'
 was not declared. Should it be static?
Message-ID: <202611111955.u1epnYP3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux cancellations-backup/frame-slots
head:   57f1029f852dc5be270836c5ca820f32cdb62637
commit: c61e4e0ead5c7d7fdf695d60288fa454e7e286a1 [25/34] bpf: Register cleanup destructors for the remaining referenced types
config: arc-randconfig-r2305-20261111 (https://download.01.org/0day-ci/archive/20261111/202611111955.u1epnYP3-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111955.u1epnYP3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611111955.u1epnYP3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/bpf_memcontrol.c:25:31: sparse: sparse: symbol 'bpf_get_root_mem_cgroup' was not declared. Should it be static?
   mm/bpf_memcontrol.c:46:31: sparse: sparse: symbol 'bpf_get_mem_cgroup' was not declared. Should it be static?
   mm/bpf_memcontrol.c:80:18: sparse: sparse: symbol 'bpf_put_mem_cgroup' was not declared. Should it be static?
>> mm/bpf_memcontrol.c:85:18: sparse: sparse: symbol 'bpf_put_mem_cgroup_dtor' was not declared. Should it be static?
   mm/bpf_memcontrol.c:100:27: sparse: sparse: symbol 'bpf_mem_cgroup_vm_events' was not declared. Should it be static?
   mm/bpf_memcontrol.c:121:27: sparse: sparse: symbol 'bpf_mem_cgroup_usage' was not declared. Should it be static?
   mm/bpf_memcontrol.c:133:27: sparse: sparse: symbol 'bpf_mem_cgroup_memory_events' was not declared. Should it be static?
   mm/bpf_memcontrol.c:151:27: sparse: sparse: symbol 'bpf_mem_cgroup_page_state' was not declared. Should it be static?
   mm/bpf_memcontrol.c:165:18: sparse: sparse: symbol 'bpf_mem_cgroup_flush_stats' was not declared. Should it be static?
   mm/bpf_memcontrol.c:190:18: sparse: sparse: symbol 'bpf_proactive_reclaim' was not declared. Should it be static?

vim +/bpf_put_mem_cgroup_dtor +85 mm/bpf_memcontrol.c

    84	
  > 85	__bpf_kfunc void bpf_put_mem_cgroup_dtor(void *memcg)
    86	{
    87		bpf_put_mem_cgroup(memcg);
    88	}
    89	CFI_NOSEAL(bpf_put_mem_cgroup_dtor);
    90	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
