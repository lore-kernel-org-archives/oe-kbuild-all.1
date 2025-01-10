Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5DE206F0C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 05:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736487721; cv=none; b=K5KbywKxM1vThBseKGejAvDqm/MgKHAn7/SrzR9ycQC2mQ5fIoZ+IlmgG7bFH5kejb18HV/SB9d32UJU3jmxgGNzc41OFn/EpipL1/oeIf+lxtUIan7rke2Tcuc8HxXE01pzdue67MPvPzN5qaSH5lEUzyug8ccd368CgZLlw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736487721; c=relaxed/simple;
	bh=EcbcBtrOOaOP+WAelRi0mRLAmceeBn03exoqXi+Hl7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hDQXU6B2evSFghM3Kq5O++GOtpYuOYDxa8CsX6PXwYpo5e4a1hB7Qg3RLPhriNYgZxPqoIdzsU/4nqqLqBxTfqKTOkx2ja/tYN54PxIyiODLL4TPvckTTOVOFtjAyW5QbAI0vXjjBvSHWfu1fJrxun3IalsjrVx5dnSR/UnDKq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQY0EqWG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQY0EqWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736487720; x=1768023720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EcbcBtrOOaOP+WAelRi0mRLAmceeBn03exoqXi+Hl7U=;
  b=PQY0EqWG6KT1v01alzXa582JRhJmRgGZmKKfz+5u8ZdktK37PWnfxo0s
   G361WO3faaqomiBn3Hv2I0gtvXgUaP7i53VDYgdj9mby5X8A3v7/pUKOo
   HZWN43/2eWJkIDq/QavS3pN+4aZvjeZ6b6e5CeHo+wagfe6CQBfN+c8xI
   vhXm5oqe8zFbgrJYqmc52OS0otZKtXHYrN5OP5EV6VH+pRf5y/FRF+eo+
   zo3zfJX8PNAlGAMgv/wV/Gh+s9COXJg8BoKZMBai45EODTe2c2mDcH9wF
   x43aSBNj6XjrdQixe/e+3ve0F2rraclTI53E4M0hrfT2RZ2slwNm+AqR/
   A==;
X-CSE-ConnectionGUID: 4aN+kzp2RKOrDIYZ3FlySg==
X-CSE-MsgGUID: wjmpCuC6QT6YuZUF0e5mNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47766176"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47766176"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 21:41:59 -0800
X-CSE-ConnectionGUID: llhR4GJoREazetZgJv3CqA==
X-CSE-MsgGUID: LoTTFzFAQwCivRR9nh/ybQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103820955"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Jan 2025 21:41:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW7mN-000Ib1-10;
	Fri, 10 Jan 2025 05:41:55 +0000
Date: Fri, 10 Jan 2025 13:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/tty/mips_ejtag_fdc.c:343:32: error: incompatible pointer
 types passing 'const char **' to parameter of type 'const u8 **' (aka 'const
 unsigned char **')
Message-ID: <202501101327.oGdWbmuk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiri,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2144da25584eb10b84252230319b5783f6a83041
commit: ce7cbd9a6c81b5fc899bbc730072a1bddeae5d0d tty: mips_ejtag_fdc: use u8 for character pointers
date:   1 year, 1 month ago
config: mips-randconfig-r054-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101327.oGdWbmuk-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101327.oGdWbmuk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101327.oGdWbmuk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/mips_ejtag_fdc.c:343:32: error: incompatible pointer types passing 'const char **' to parameter of type 'const u8 **' (aka 'const unsigned char **') [-Werror,-Wincompatible-pointer-types]
     343 |                 word = mips_ejtag_fdc_encode(&buf_ptr, &buf_len, 1);
         |                                              ^~~~~~~~
   drivers/tty/mips_ejtag_fdc.c:216:57: note: passing argument to parameter 'ptrs' here
     216 | static struct fdc_word mips_ejtag_fdc_encode(const u8 **ptrs,
         |                                                         ^
   drivers/tty/mips_ejtag_fdc.c:1224:31: error: incompatible pointer types passing 'const char *[1]' to parameter of type 'const u8 **' (aka 'const unsigned char **') [-Werror,-Wincompatible-pointer-types]
    1224 |         word = mips_ejtag_fdc_encode(bufs, &kgdbfdc_wbuflen, 1);
         |                                      ^~~~
   drivers/tty/mips_ejtag_fdc.c:216:57: note: passing argument to parameter 'ptrs' here
     216 | static struct fdc_word mips_ejtag_fdc_encode(const u8 **ptrs,
         |                                                         ^
   2 errors generated.


vim +343 drivers/tty/mips_ejtag_fdc.c

4cebec609aea6d James Hogan 2015-01-29  299  
4cebec609aea6d James Hogan 2015-01-29  300  /* Low level console write shared by early console and normal console */
4cebec609aea6d James Hogan 2015-01-29  301  static void mips_ejtag_fdc_console_write(struct console *c, const char *s,
4cebec609aea6d James Hogan 2015-01-29  302  					 unsigned int count)
4cebec609aea6d James Hogan 2015-01-29  303  {
4cebec609aea6d James Hogan 2015-01-29  304  	struct mips_ejtag_fdc_console *cons =
4cebec609aea6d James Hogan 2015-01-29  305  		container_of(c, struct mips_ejtag_fdc_console, cons);
4cebec609aea6d James Hogan 2015-01-29  306  	void __iomem *regs;
4cebec609aea6d James Hogan 2015-01-29  307  	struct fdc_word word;
4cebec609aea6d James Hogan 2015-01-29  308  	unsigned long flags;
4cebec609aea6d James Hogan 2015-01-29  309  	unsigned int i, buf_len, cpu;
4cebec609aea6d James Hogan 2015-01-29  310  	bool done_cr = false;
4cebec609aea6d James Hogan 2015-01-29  311  	char buf[4];
4cebec609aea6d James Hogan 2015-01-29  312  	const char *buf_ptr = buf;
4cebec609aea6d James Hogan 2015-01-29  313  	/* Number of bytes of input data encoded up to each byte in buf */
4cebec609aea6d James Hogan 2015-01-29  314  	u8 inc[4];
4cebec609aea6d James Hogan 2015-01-29  315  
4cebec609aea6d James Hogan 2015-01-29  316  	local_irq_save(flags);
4cebec609aea6d James Hogan 2015-01-29  317  	cpu = smp_processor_id();
4cebec609aea6d James Hogan 2015-01-29  318  	regs = cons->regs[cpu];
4cebec609aea6d James Hogan 2015-01-29  319  	/* First console output on this CPU? */
4cebec609aea6d James Hogan 2015-01-29  320  	if (!regs) {
4cebec609aea6d James Hogan 2015-01-29  321  		regs = mips_cdmm_early_probe(0xfd);
4cebec609aea6d James Hogan 2015-01-29  322  		cons->regs[cpu] = regs;
4cebec609aea6d James Hogan 2015-01-29  323  	}
4cebec609aea6d James Hogan 2015-01-29  324  	/* Already tried and failed to find FDC on this CPU? */
4cebec609aea6d James Hogan 2015-01-29  325  	if (IS_ERR(regs))
4cebec609aea6d James Hogan 2015-01-29  326  		goto out;
4cebec609aea6d James Hogan 2015-01-29  327  	while (count) {
4cebec609aea6d James Hogan 2015-01-29  328  		/*
4cebec609aea6d James Hogan 2015-01-29  329  		 * Copy the next few characters to a buffer so we can inject
4cebec609aea6d James Hogan 2015-01-29  330  		 * carriage returns before newlines.
4cebec609aea6d James Hogan 2015-01-29  331  		 */
4cebec609aea6d James Hogan 2015-01-29  332  		for (buf_len = 0, i = 0; buf_len < 4 && i < count; ++buf_len) {
4cebec609aea6d James Hogan 2015-01-29  333  			if (s[i] == '\n' && !done_cr) {
4cebec609aea6d James Hogan 2015-01-29  334  				buf[buf_len] = '\r';
4cebec609aea6d James Hogan 2015-01-29  335  				done_cr = true;
4cebec609aea6d James Hogan 2015-01-29  336  			} else {
4cebec609aea6d James Hogan 2015-01-29  337  				buf[buf_len] = s[i];
4cebec609aea6d James Hogan 2015-01-29  338  				done_cr = false;
4cebec609aea6d James Hogan 2015-01-29  339  				++i;
4cebec609aea6d James Hogan 2015-01-29  340  			}
4cebec609aea6d James Hogan 2015-01-29  341  			inc[buf_len] = i;
4cebec609aea6d James Hogan 2015-01-29  342  		}
4cebec609aea6d James Hogan 2015-01-29 @343  		word = mips_ejtag_fdc_encode(&buf_ptr, &buf_len, 1);
4cebec609aea6d James Hogan 2015-01-29  344  		count -= inc[word.bytes - 1];
4cebec609aea6d James Hogan 2015-01-29  345  		s += inc[word.bytes - 1];
4cebec609aea6d James Hogan 2015-01-29  346  
4cebec609aea6d James Hogan 2015-01-29  347  		/* Busy wait until there's space in fifo */
70f041b6e1ff50 James Hogan 2015-04-28  348  		while (__raw_readl(regs + REG_FDSTAT) & REG_FDSTAT_TXF)
4cebec609aea6d James Hogan 2015-01-29  349  			;
70f041b6e1ff50 James Hogan 2015-04-28  350  		__raw_writel(word.word, regs + REG_FDTX(c->index));
4cebec609aea6d James Hogan 2015-01-29  351  	}
4cebec609aea6d James Hogan 2015-01-29  352  out:
4cebec609aea6d James Hogan 2015-01-29  353  	local_irq_restore(flags);
4cebec609aea6d James Hogan 2015-01-29  354  }
4cebec609aea6d James Hogan 2015-01-29  355  

:::::: The code at line 343 was first introduced by commit
:::::: 4cebec609aea6dff23e67a42b6516d852fa87d07 TTY: Add MIPS EJTAG Fast Debug Channel TTY driver

:::::: TO: James Hogan <james.hogan@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
