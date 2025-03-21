Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1541519BE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 22:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742596159; cv=none; b=Kcpd56ZhlwEZn1sXRUzY7efGAxTCDX7aUodTtr5lT7ed1f4VTh5epuqcHI+KPy7QjJqQgL9dGn9FG0QQxl2F3vakSALsKsY7HrEVgECQ8prhUnb/M0cqgH0/TbFIWglu1k39FhCUe1r3f8E8tkFHz6oby0y5Z1ULEKTwL2884KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742596159; c=relaxed/simple;
	bh=lDV26Albg1AcTr/4mrQGLIGKk7RdFuSdlHXKHzmbHcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JDx3TdpbF467Yl52onfypz7AX5K7x7bKbTABRKPvExtrqpYjw6nk4LsWBuluvCJTcgceuPfO4/yhl58Y3tRc5u0o+1SST4XRQNMJQnG7kAvOGU69975AkeqGIskje6KY7cyCSclU5o0CrAOs+qIhz/hqWD3W6r++WvUcCj+hxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nN4/3A9y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nN4/3A9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742596158; x=1774132158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lDV26Albg1AcTr/4mrQGLIGKk7RdFuSdlHXKHzmbHcc=;
  b=nN4/3A9ydbCJweuXL11uK/Q2DLKQmDJ1hc9qWierTzLkKu1S7mjzatHu
   xO0it7hcuQYqRru8zEXqu0dln+RPZoGwOgYKaQfbK/KI/iliFNq9V5e2Y
   A5GBGo2KjNrrp1egOxCAkiVFRK0JZ9kAExfD3rxTCwUxqz8bdB3njOb0W
   VO008HMVtv6oJfDOkjwHMFcy8OKCYzh8wyUeE5aZ6gtNW0gqSxgkGBmHB
   DVzJe4aay4rIM7st1VaiHdKRREDoiY3tpX+2EEHMldo8q0j2971+gjbkK
   jU2a+DFACHO85VR0nmrcq698FZToGMmpowPywjOGa35+IZnvhfx/p89vn
   A==;
X-CSE-ConnectionGUID: BtHcw0Y4S8u9G564m4Svwg==
X-CSE-MsgGUID: LMu7KpwdTvKFeTpynY9j4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="69228471"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="69228471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 15:29:16 -0700
X-CSE-ConnectionGUID: NAtU9PSoSBGlr8w2pmWhJg==
X-CSE-MsgGUID: aBzDt4K0SjWTPLfWDiM1NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="124040794"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Mar 2025 15:29:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvkrX-0001jn-2S;
	Fri, 21 Mar 2025 22:29:11 +0000
Date: Sat, 22 Mar 2025 06:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Roman Kisel <romank@linux.microsoft.com>
Subject: [linux-next:master 11267/12769] arch/x86/include/asm/mshyperv.h:157
 _hv_do_fast_hypercall8() warn: inconsistent indenting
Message-ID: <202503220640.hjiacW2C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9388ec571cb1adba59d1cded2300eeb11827679c
commit: 15e33b0abf4170a9a36e713bfd8a4a4f836a413c [11267/12769] arm64/hyperv: Add some missing functions to arm64
config: x86_64-randconfig-161-20250320 (https://download.01.org/0day-ci/archive/20250322/202503220640.hjiacW2C-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220640.hjiacW2C-lkp@intel.com/

smatch warnings:
arch/x86/include/asm/mshyperv.h:157 _hv_do_fast_hypercall8() warn: inconsistent indenting

vim +157 arch/x86/include/asm/mshyperv.h

f0d2f5c2c000c0 Jinank Jain      2023-01-02  119  
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  120  /* Fast hypercall with 8 bytes of input and no output */
f0d2f5c2c000c0 Jinank Jain      2023-01-02  121  static inline u64 _hv_do_fast_hypercall8(u64 control, u64 input1)
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  122  {
f0d2f5c2c000c0 Jinank Jain      2023-01-02  123  	u64 hv_status;
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  124  
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  125  #ifdef CONFIG_X86_64
d3a9d7e49d1531 Dexuan Cui       2023-08-24  126  	if (hv_isolation_type_tdx() && !hyperv_paravisor_present)
d6e0228d265f29 Dexuan Cui       2023-08-24  127  		return hv_tdx_hypercall(control, input1, 0);
d6e0228d265f29 Dexuan Cui       2023-08-24  128  
e3131f1c81448a Dexuan Cui       2023-08-24  129  	if (hv_isolation_type_snp() && !hyperv_paravisor_present) {
48b1f68372ca93 Tianyu Lan       2023-08-18  130  		__asm__ __volatile__(
48b1f68372ca93 Tianyu Lan       2023-08-18  131  				"vmmcall"
48b1f68372ca93 Tianyu Lan       2023-08-18  132  				: "=a" (hv_status), ASM_CALL_CONSTRAINT,
48b1f68372ca93 Tianyu Lan       2023-08-18  133  				"+c" (control), "+d" (input1)
48b1f68372ca93 Tianyu Lan       2023-08-18  134  				:: "cc", "r8", "r9", "r10", "r11");
48b1f68372ca93 Tianyu Lan       2023-08-18  135  	} else {
e70e5892b28c18 David Woodhouse  2018-01-11  136  		__asm__ __volatile__(CALL_NOSPEC
f5caf621ee3572 Josh Poimboeuf   2017-09-20  137  				     : "=a" (hv_status), ASM_CALL_CONSTRAINT,
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  138  				       "+c" (control), "+d" (input1)
e70e5892b28c18 David Woodhouse  2018-01-11  139  				     : THUNK_TARGET(hv_hypercall_pg)
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  140  				     : "cc", "r8", "r9", "r10", "r11");
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  141  	}
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  142  #else
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  143  	{
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  144  		u32 input1_hi = upper_32_bits(input1);
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  145  		u32 input1_lo = lower_32_bits(input1);
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  146  
e70e5892b28c18 David Woodhouse  2018-01-11  147  		__asm__ __volatile__ (CALL_NOSPEC
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  148  				      : "=A"(hv_status),
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  149  					"+c"(input1_lo),
f5caf621ee3572 Josh Poimboeuf   2017-09-20  150  					ASM_CALL_CONSTRAINT
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  151  				      :	"A" (control),
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  152  					"b" (input1_hi),
e70e5892b28c18 David Woodhouse  2018-01-11  153  					THUNK_TARGET(hv_hypercall_pg)
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  154  				      : "cc", "edi", "esi");
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  155  	}
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  156  #endif
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02 @157  		return hv_status;
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  158  }
6a8edbd0c54ae2 Vitaly Kuznetsov 2017-08-02  159  

:::::: The code at line 157 was first introduced by commit
:::::: 6a8edbd0c54ae266b12f4f63e406313481c9d4bc x86/hyper-v: Introduce fast hypercall implementation

:::::: TO: Vitaly Kuznetsov <vkuznets@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
