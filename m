Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFC8191F98
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 22:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737411491; cv=none; b=IlTdsZYid5b/iu8TFP9xrBcICdbdS0XwRyv6GVSoOu6+SqJRcMoGGwVLyScEBEGPfr+DtQ5bBGZkf/+8XoI6CnB3/SQSWBIl0/BZP0Uxmd+JYbhDhSi4TA+Z8jOgEQIICLkPFjXK73kpb7WzZA5r/uGn8z9CQ7EwvxeQQrCyvl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737411491; c=relaxed/simple;
	bh=Gi6DhsSoVRUDIUKWSrq+zN1+Q9ZyMihQHCCjAhK5GLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mDBkafNlKVvZGedb9t8Zz5EnVtlkueE3aHLinPZOfb9OuISBgBsrRX4uhSEXQZsjSxA38aTxVCnt7TWfVuqLauvSUDdBrOJfOqxGGTriW/mm0vv6bi8jeMy01cAdLW0g+Nj9FvDTpdXUeC9VOn+q0TJ8ifKVgh2ELB2OGQTPghY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XstzOnvQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XstzOnvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737411489; x=1768947489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gi6DhsSoVRUDIUKWSrq+zN1+Q9ZyMihQHCCjAhK5GLw=;
  b=XstzOnvQXfKB+1vVicYAK7O6WMwllhCtR48pUE4nEY5MLSYuBvAKbENO
   tCCqAtIx6ODGLpeCPk6Sy2km5w4uIrX6DQSMKe+6ngIHd5nELHwS/yCKz
   DLtG/wXeMuNkDU5MJKwMXybxSDdwPqzK8A/v9eVeXlRG/rIzAQJvAl72i
   lKIdXXm6LB2thY3Xjx5uN5Dg0IDqkfoTnSZQ8K48Z5fiJDnPnxG+38tCO
   jRC0koJ4Jqb0SZXCe6dudJM/PO98Doj35mKNWP6XD7h0XAf2uqi5q22pU
   7mKiH98w+YY6rhl5FfMLaJQMjSx0DjIVwE7xPF64aiwR6WVw4p5RnOYVB
   g==;
X-CSE-ConnectionGUID: 79H5JQ4JRSGTp7jxe5lsPA==
X-CSE-MsgGUID: oxBD3NS3RxSSGKsFN8Qexw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37086958"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="37086958"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 14:18:08 -0800
X-CSE-ConnectionGUID: sYoyps/4TdaLkkG6XUyUlQ==
X-CSE-MsgGUID: Zy42K8kURKaeBFMBIyRHEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111255784"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jan 2025 14:18:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta05t-000XHm-12;
	Mon, 20 Jan 2025 22:18:05 +0000
Date: Tue, 21 Jan 2025 06:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/mv_ctltables 10/10] arch/x86/kernel/nmi.c:237:13:
 error: 'panic_on_unrecovered_nmi' undeclared
Message-ID: <202501210620.dRFI2i3Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/mv_ctltables
head:   18654655ca1b5e5bc57b89c5e88645cd3284764c
commit: 18654655ca1b5e5bc57b89c5e88645cd3284764c [10/10] x86: Move sysctls into arch/x86
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20250121/202501210620.dRFI2i3Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210620.dRFI2i3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210620.dRFI2i3Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/nmi.c: In function 'pci_serr_error':
>> arch/x86/kernel/nmi.c:237:13: error: 'panic_on_unrecovered_nmi' undeclared (first use in this function)
     237 |         if (panic_on_unrecovered_nmi)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/nmi.c:237:13: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/nmi.c: In function 'io_check_error':
>> arch/x86/kernel/nmi.c:262:13: error: 'panic_on_io_nmi' undeclared (first use in this function); did you mean 'panic_on_taint'?
     262 |         if (panic_on_io_nmi) {
         |             ^~~~~~~~~~~~~~~
         |             panic_on_taint
   arch/x86/kernel/nmi.c: In function 'unknown_nmi_error':
   arch/x86/kernel/nmi.c:310:34: error: 'panic_on_unrecovered_nmi' undeclared (first use in this function)
     310 |         if (unknown_nmi_panic || panic_on_unrecovered_nmi)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> arch/x86/kernel/setup.c:153:36: error: 'panic_on_unrecovered_nmi' undeclared here (not in a function)
     153 |                 .data           = &panic_on_unrecovered_nmi,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/setup.c:160:36: error: 'panic_on_io_nmi' undeclared here (not in a function); did you mean 'panic_on_taint'?
     160 |                 .data           = &panic_on_io_nmi,
         |                                    ^~~~~~~~~~~~~~~
         |                                    panic_on_taint


vim +/panic_on_unrecovered_nmi +237 arch/x86/kernel/nmi.c

c9126b2ee8adb9 Don Zickus       2011-09-30  226  
9326638cbee2d3 Masami Hiramatsu 2014-04-17  227  static void
1d48922c14b636 Don Zickus       2011-09-30  228  pci_serr_error(unsigned char reason, struct pt_regs *regs)
1d48922c14b636 Don Zickus       2011-09-30  229  {
553222f3e81f18 Don Zickus       2012-03-29  230  	/* check to see if anyone registered against these types of errors */
bf9f2ee28d475a Andy Lutomirski  2015-07-20  231  	if (nmi_handle(NMI_SERR, regs))
553222f3e81f18 Don Zickus       2012-03-29  232  		return;
553222f3e81f18 Don Zickus       2012-03-29  233  
1d48922c14b636 Don Zickus       2011-09-30  234  	pr_emerg("NMI: PCI system error (SERR) for reason %02x on CPU %d.\n",
1d48922c14b636 Don Zickus       2011-09-30  235  		 reason, smp_processor_id());
1d48922c14b636 Don Zickus       2011-09-30  236  
1d48922c14b636 Don Zickus       2011-09-30 @237  	if (panic_on_unrecovered_nmi)
58c5661f2144c0 Hidehiro Kawai   2015-12-14  238  		nmi_panic(regs, "NMI: Not continuing");
1d48922c14b636 Don Zickus       2011-09-30  239  
1d48922c14b636 Don Zickus       2011-09-30  240  	pr_emerg("Dazed and confused, but trying to continue\n");
1d48922c14b636 Don Zickus       2011-09-30  241  
1d48922c14b636 Don Zickus       2011-09-30  242  	/* Clear and disable the PCI SERR error line. */
1d48922c14b636 Don Zickus       2011-09-30  243  	reason = (reason & NMI_REASON_CLEAR_MASK) | NMI_REASON_CLEAR_SERR;
1d48922c14b636 Don Zickus       2011-09-30  244  	outb(reason, NMI_REASON_PORT);
1d48922c14b636 Don Zickus       2011-09-30  245  }
9326638cbee2d3 Masami Hiramatsu 2014-04-17  246  NOKPROBE_SYMBOL(pci_serr_error);
1d48922c14b636 Don Zickus       2011-09-30  247  
9326638cbee2d3 Masami Hiramatsu 2014-04-17  248  static void
1d48922c14b636 Don Zickus       2011-09-30  249  io_check_error(unsigned char reason, struct pt_regs *regs)
1d48922c14b636 Don Zickus       2011-09-30  250  {
1d48922c14b636 Don Zickus       2011-09-30  251  	unsigned long i;
1d48922c14b636 Don Zickus       2011-09-30  252  
553222f3e81f18 Don Zickus       2012-03-29  253  	/* check to see if anyone registered against these types of errors */
bf9f2ee28d475a Andy Lutomirski  2015-07-20  254  	if (nmi_handle(NMI_IO_CHECK, regs))
553222f3e81f18 Don Zickus       2012-03-29  255  		return;
553222f3e81f18 Don Zickus       2012-03-29  256  
1d48922c14b636 Don Zickus       2011-09-30  257  	pr_emerg(
1d48922c14b636 Don Zickus       2011-09-30  258  	"NMI: IOCK error (debug interrupt?) for reason %02x on CPU %d.\n",
1d48922c14b636 Don Zickus       2011-09-30  259  		 reason, smp_processor_id());
57da8b960b9a25 Jan Beulich      2012-05-09  260  	show_regs(regs);
1d48922c14b636 Don Zickus       2011-09-30  261  
1717f2096b543c Hidehiro Kawai   2015-12-14 @262  	if (panic_on_io_nmi) {
58c5661f2144c0 Hidehiro Kawai   2015-12-14  263  		nmi_panic(regs, "NMI IOCK error: Not continuing");
1717f2096b543c Hidehiro Kawai   2015-12-14  264  
1717f2096b543c Hidehiro Kawai   2015-12-14  265  		/*
1717f2096b543c Hidehiro Kawai   2015-12-14  266  		 * If we end up here, it means we have received an NMI while
1717f2096b543c Hidehiro Kawai   2015-12-14  267  		 * processing panic(). Simply return without delaying and
1717f2096b543c Hidehiro Kawai   2015-12-14  268  		 * re-enabling NMIs.
1717f2096b543c Hidehiro Kawai   2015-12-14  269  		 */
1717f2096b543c Hidehiro Kawai   2015-12-14  270  		return;
1717f2096b543c Hidehiro Kawai   2015-12-14  271  	}
1d48922c14b636 Don Zickus       2011-09-30  272  
1d48922c14b636 Don Zickus       2011-09-30  273  	/* Re-enable the IOCK line, wait for a few seconds */
1d48922c14b636 Don Zickus       2011-09-30  274  	reason = (reason & NMI_REASON_CLEAR_MASK) | NMI_REASON_CLEAR_IOCHK;
1d48922c14b636 Don Zickus       2011-09-30  275  	outb(reason, NMI_REASON_PORT);
1d48922c14b636 Don Zickus       2011-09-30  276  
1d48922c14b636 Don Zickus       2011-09-30  277  	i = 20000;
1d48922c14b636 Don Zickus       2011-09-30  278  	while (--i) {
1d48922c14b636 Don Zickus       2011-09-30  279  		touch_nmi_watchdog();
1d48922c14b636 Don Zickus       2011-09-30  280  		udelay(100);
1d48922c14b636 Don Zickus       2011-09-30  281  	}
1d48922c14b636 Don Zickus       2011-09-30  282  
1d48922c14b636 Don Zickus       2011-09-30  283  	reason &= ~NMI_REASON_CLEAR_IOCHK;
1d48922c14b636 Don Zickus       2011-09-30  284  	outb(reason, NMI_REASON_PORT);
1d48922c14b636 Don Zickus       2011-09-30  285  }
9326638cbee2d3 Masami Hiramatsu 2014-04-17  286  NOKPROBE_SYMBOL(io_check_error);
1d48922c14b636 Don Zickus       2011-09-30  287  

:::::: The code at line 237 was first introduced by commit
:::::: 1d48922c14b6363f6d5febb12464d804bb5cc53f x86, nmi: Split out nmi from traps.c

:::::: TO: Don Zickus <dzickus@redhat.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
