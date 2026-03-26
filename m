Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADA628467D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774530091; cv=none; b=k70QufdpnEF5hN+Qw/5K5ZYeXhfDvGSDYEYOExZrdH49iTdyulvCy3pkPjujo3VQ7w2aQ3Vv84fCwmEcGW1Cx/J2NyG2p7I5khitzt/7YVe4bAgrDarvgzByswOWH1JDtSh+iB0ZiPep+GisZoier58Zv2GIalPPjTxbV1fN5Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774530091; c=relaxed/simple;
	bh=Tm4OFFn11Zj9gWoQZOcuZVzuYa3uAyHzJwqHcR1W1Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BaT2qmLXC6Z6eHUNNWjTfi1VgGg8pIo8InINb7WtCMV9l2cXB0uJAcXxPsW8g/XMYEHBGiv44Rob8+upfEgw1kYK+p8TPSXn0/TMCn9KFpC4hkIBlcwMLUTAq8NFxhUrU/0Fo3/mbJ00D5exAEU5eRxYP3lptKqL+3mtutgiH0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUE61+Md; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUE61+Md"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774530088; x=1806066088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tm4OFFn11Zj9gWoQZOcuZVzuYa3uAyHzJwqHcR1W1Ho=;
  b=FUE61+MdcT4AHMo5YG08IWmikMB472nK6UDzmH5tAHtT26c6QV27zQSD
   5DgfbxoIS3WSu2zcpYSm5fYWYxLLb4hR4uOCu43zOPbygvuGH3B4NMhz6
   W0RiuyGWXLMwQNHHQrJ7EwTHoDorBhPxzWtHfsGhmLjVQAZjnHBYpkadg
   3JKCObtH6Jf1uilsEhB5+niwJ5K8B1GF2smVk+wiIWSeNQa1JWqztIICL
   lA6Ov84wow46svL9T/BySoHjtjIsbr9p6j8syCp8ZK/+hnPkdd4yDY/Kv
   4FCpHJznLWWbX9lN0m8zg0SLT2DzqCG59JpmfIBx7O1vaDzMuKHgQ11r+
   w==;
X-CSE-ConnectionGUID: pUiASNFRSzO7hxBCSvxrmA==
X-CSE-MsgGUID: 27rbshp/Q02vG3y9mK20/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86276895"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="86276895"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 06:01:28 -0700
X-CSE-ConnectionGUID: /zTSiz/HTMyLgBhiJuN6IQ==
X-CSE-MsgGUID: Q36sqiSVRnCWCUmkZzoZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="229941310"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Mar 2026 06:01:27 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5kKx-000000008sH-3TKe;
	Thu, 26 Mar 2026 13:01:23 +0000
Date: Thu, 26 Mar 2026 21:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 3/18]
 arch/nios2/kernel/misaligned.c:66:17: error: no previous prototype for
 'handle_unaligned_c'
Message-ID: <202603262039.UgXuJ7bb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   fb40de0a3d3ef218f63b2eb7698903d2328f3593
commit: 972c95c4ea353a5734cab4fc9a9308b05ceeefe8 [3/18] run-tests
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260326/202603262039.UgXuJ7bb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603262039.UgXuJ7bb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603262039.UgXuJ7bb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/nios2/kernel/misaligned.c:66:17: error: no previous prototype for 'handle_unaligned_c' [-Werror=missing-prototypes]
      66 | asmlinkage void handle_unaligned_c(struct pt_regs *fp, int cause)
         |                 ^~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/device.h:15,
                    from include/linux/input.h:19,
                    from include/linux/input/mt.h:11,
                    from drivers/input/mouse/synaptics.c:26:
   drivers/input/mouse/synaptics.c: In function 'synaptics_init_ps2':
>> include/linux/dev_printk.h:160:31: error: '%s' directive argument is null [-Werror=format-overflow=]
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                               ^
   include/linux/dev_printk.h:110:17: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                 ^~~~~~~
   drivers/input/mouse/psmouse.h:204:9: note: in expansion of macro 'dev_info'
     204 |         dev_info(&(psmouse)->ps2dev.serio->dev,         \
         |         ^~~~~~~~
   drivers/input/mouse/synaptics.c:1675:17: note: in expansion of macro 'psmouse_info'
    1675 |                 psmouse_info(psmouse,
         |                 ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/device.h:15,
                    from include/linux/input.h:19,
                    from include/linux/input/mt.h:11,
                    from synaptics.c:26:
   synaptics.c: In function 'synaptics_init_ps2':
>> include/linux/dev_printk.h:160:31: error: '%s' directive argument is null [-Werror=format-overflow=]
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                               ^
   include/linux/dev_printk.h:110:17: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                 ^~~~~~~
   psmouse.h:204:9: note: in expansion of macro 'dev_info'
     204 |         dev_info(&(psmouse)->ps2dev.serio->dev,         \
         |         ^~~~~~~~
   synaptics.c:1675:17: note: in expansion of macro 'psmouse_info'
    1675 |                 psmouse_info(psmouse,
         |                 ^~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/handle_unaligned_c +66 arch/nios2/kernel/misaligned.c

82ed08dd1b0e0e Ley Foon Tan  2014-11-06   62  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   63  /*
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   64   * (mis)alignment handler
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   65   */
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  @66  asmlinkage void handle_unaligned_c(struct pt_regs *fp, int cause)
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   67  {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   68  	u32 isn, addr, val;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   69  	int in_kernel;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   70  	u8 a, b, d0, d1, d2, d3;
db5a7e55468147 Bernd Weiberg 2015-09-04   71  	s16 imm16;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   72  	unsigned int fault;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   73  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   74  	/* back up one instruction */
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   75  	fp->ea -= 4;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   76  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   77  	if (fixup_exception(fp)) {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   78  		return;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   79  	}
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   80  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   81  	in_kernel = !user_mode(fp);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   82  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   83  	isn = *(unsigned long *)(fp->ea);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   84  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   85  	fault = 0;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   86  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   87  	/* do fixup if in kernel or mode turned on */
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   88  	if (in_kernel || (ma_usermode & UM_FIXUP)) {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   89  		/* decompose instruction */
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   90  		a = (isn >> 27) & 0x1f;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   91  		b = (isn >> 22) & 0x1f;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   92  		imm16 = (isn >> 6) & 0xffff;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   93  		addr = get_reg_val(fp, a) + imm16;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   94  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   95  		/* do fixup to saved registers */
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   96  		switch (isn & 0x3f) {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   97  		case INST_LDHU:
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   98  			fault |= __get_user(d0, (u8 *)(addr+0));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06   99  			fault |= __get_user(d1, (u8 *)(addr+1));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  100  			val = (d1 << 8) | d0;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  101  			put_reg_val(fp, b, val);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  102  			break;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  103  		case INST_STH:
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  104  			val = get_reg_val(fp, b);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  105  			d1 = val >> 8;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  106  			d0 = val >> 0;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  107  			if (in_kernel) {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  108  				*(u8 *)(addr+0) = d0;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  109  				*(u8 *)(addr+1) = d1;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  110  			} else {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  111  				fault |= __put_user(d0, (u8 *)(addr+0));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  112  				fault |= __put_user(d1, (u8 *)(addr+1));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  113  			}
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  114  			break;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  115  		case INST_LDH:
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  116  			fault |= __get_user(d0, (u8 *)(addr+0));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  117  			fault |= __get_user(d1, (u8 *)(addr+1));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  118  			val = (short)((d1 << 8) | d0);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  119  			put_reg_val(fp, b, val);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  120  			break;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  121  		case INST_STW:
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  122  			val = get_reg_val(fp, b);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  123  			d3 = val >> 24;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  124  			d2 = val >> 16;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  125  			d1 = val >> 8;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  126  			d0 = val >> 0;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  127  			if (in_kernel) {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  128  				*(u8 *)(addr+0) = d0;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  129  				*(u8 *)(addr+1) = d1;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  130  				*(u8 *)(addr+2) = d2;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  131  				*(u8 *)(addr+3) = d3;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  132  			} else {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  133  				fault |= __put_user(d0, (u8 *)(addr+0));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  134  				fault |= __put_user(d1, (u8 *)(addr+1));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  135  				fault |= __put_user(d2, (u8 *)(addr+2));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  136  				fault |= __put_user(d3, (u8 *)(addr+3));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  137  			}
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  138  			break;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  139  		case INST_LDW:
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  140  			fault |= __get_user(d0, (u8 *)(addr+0));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  141  			fault |= __get_user(d1, (u8 *)(addr+1));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  142  			fault |= __get_user(d2, (u8 *)(addr+2));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  143  			fault |= __get_user(d3, (u8 *)(addr+3));
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  144  			val = (d3 << 24) | (d2 << 16) | (d1 << 8) | d0;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  145  			put_reg_val(fp, b, val);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  146  			break;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  147  		}
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  148  	}
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  149  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  150  	addr = RDCTL(CTL_BADADDR);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  151  	cause >>= 2;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  152  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  153  	if (fault) {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  154  		if (in_kernel) {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  155  			pr_err("fault during kernel misaligned fixup @ %#lx; addr 0x%08x; isn=0x%08x\n",
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  156  				fp->ea, (unsigned int)addr,
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  157  				(unsigned int)isn);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  158  		} else {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  159  			pr_err("fault during user misaligned fixup @ %#lx; isn=%08x addr=0x%08x sp=0x%08lx pid=%d\n",
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  160  				fp->ea,
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  161  				(unsigned int)isn, addr, fp->sp,
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  162  				current->pid);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  163  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  164  			_exception(SIGSEGV, fp, SEGV_MAPERR, fp->ea);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  165  			return;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  166  		}
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  167  	}
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  168  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  169  	/*
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  170  	 * kernel mode -
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  171  	 *  note exception and skip bad instruction (return)
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  172  	 */
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  173  	if (in_kernel) {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  174  		fp->ea += 4;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  175  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  176  		if (ma_usermode & KM_WARN) {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  177  			pr_err("kernel unaligned access @ %#lx; BADADDR 0x%08x; cause=%d, isn=0x%08x\n",
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  178  				fp->ea,
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  179  				(unsigned int)addr, cause,
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  180  				(unsigned int)isn);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  181  			/* show_regs(fp); */
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  182  		}
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  183  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  184  		return;
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  185  	}
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  186  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  187  	/*
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  188  	 * user mode -
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  189  	 *  possibly warn,
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  190  	 *  possibly send SIGBUS signal to process
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  191  	 */
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  192  	if (ma_usermode & UM_WARN) {
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  193  		pr_err("user unaligned access @ %#lx; isn=0x%08lx ea=0x%08lx ra=0x%08lx sp=0x%08lx\n",
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  194  			(unsigned long)addr, (unsigned long)isn,
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  195  			fp->ea, fp->ra, fp->sp);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  196  	}
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  197  
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  198  	if (ma_usermode & UM_SIGNAL)
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  199  		_exception(SIGBUS, fp, BUS_ADRALN, fp->ea);
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  200  	else
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  201  		fp->ea += 4;	/* else advance */
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  202  }
82ed08dd1b0e0e Ley Foon Tan  2014-11-06  203  

:::::: The code at line 66 was first introduced by commit
:::::: 82ed08dd1b0e0e0728f9188f66795c49dffe437d nios2: Exception handling

:::::: TO: Ley Foon Tan <lftan@altera.com>
:::::: CC: Ley Foon Tan <lftan@altera.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
