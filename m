Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E22227B9A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 23:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747438903; cv=none; b=D6tvddD0n6s0IiIq0yn91OPPlJ87OmT918qRIfFbcqyVnhtas/uDfJdCvVtT/lAFejHJJo8nvGMp4eCMDd7f/dkps+P3mZphqkamBvvZxYSCvDuYdDZEvUrEebUi1lPeyCcr3Wjd0Gz8Ku2RlTr6xBJHBa8VYU0jFTD8o8ADjso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747438903; c=relaxed/simple;
	bh=FlrvhHyuZ1kTzHOi+cDbxgdGyJ/4lq8tt53WCTzPGog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mb5dNOBSz+emGNsxWmtNtUAmcyXbNVDV3gNknKJtJIK6tGlCJVJB6Q0VufgL32d1kLbR5KfP3jf6tUPZEf5K3ASbKGgJH86Z4TkcEbrlRqLh6gZwVg/p8OGNrOLpJ5hNkJZiy0VDiGi0m48pcl7frM7u1bQlm5eTmvnQ20nOmVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oj76HwUm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oj76HwUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747438902; x=1778974902;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FlrvhHyuZ1kTzHOi+cDbxgdGyJ/4lq8tt53WCTzPGog=;
  b=Oj76HwUmsPOlnFuNPUcIDRRLwCMiTqo8Hig6JmEx1yILY4m6ukSMvwK8
   QEAUMoWFXctF5YT1zy+PfeUWggLwMnvr+pcyS22OODGnpncELixkSFUzd
   bHGs5VLrbtRPGacUpox/ZcP9RmkPtew2O8QYPHSD8tkNLwSiFbW/6UQga
   Wtnt4fXqFRduB18objmJIHzvafVu4CxtC35hi1+pGkPUNfM3pUPsz/tzx
   sEHs5Jwl1mnqqrDVjQ8QyWwooWoHpGOkSDSL1DdpiPXFxHuYXbn64WOvX
   PiQ/mdSXGZY+TPXK2NZqDlrvoiifJf9csujHJjuF9lxXIkF0uHunOEOK0
   w==;
X-CSE-ConnectionGUID: W+kag7dcRuOFgSbzSX6H1w==
X-CSE-MsgGUID: ge4j6YNvSya6f6FliU5bBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="74821612"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="74821612"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 16:41:41 -0700
X-CSE-ConnectionGUID: YE8Vx7kkSeCku5JumEXcNQ==
X-CSE-MsgGUID: uFxi5iaRQOi7XVENeOL0jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="139721612"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 May 2025 16:41:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG4gL-000Jnb-0e;
	Fri, 16 May 2025 23:41:37 +0000
Date: Sat, 17 May 2025 07:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 66/90] include/linux/tty.h:356:20: error: static
 declaration of 'tty_kref_put' follows non-static declaration
Message-ID: <202505170700.hrLKJ1LL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   210d0b4d713eac3aee26524e64f86f1e4df08bbb
commit: 4291f2fa0107489c93871b44b32444310a93a8bc [66/90] tty_port_tty guard()
config: arc-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170700.hrLKJ1LL-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170700.hrLKJ1LL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170700.hrLKJ1LL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/char_dev.c:24:
>> include/linux/tty.h:356:20: error: static declaration of 'tty_kref_put' follows non-static declaration
     356 | static inline void tty_kref_put(struct tty_struct *tty)
         |                    ^~~~~~~~~~~~
   In file included from include/linux/tty.h:12:
   include/linux/tty_port.h:254:6: note: previous declaration of 'tty_kref_put' with type 'void(struct tty_struct *)'
     254 | void tty_kref_put(struct tty_struct *tty);
         |      ^~~~~~~~~~~~


vim +/tty_kref_put +356 include/linux/tty.h

97ef38b8210d74 Peter Hurley     2016-04-09  339  
4f73bc4dd3e856 Joe Millenbach   2013-01-17  340  #ifdef CONFIG_TTY
7894193436b65f Jiri Slaby       2021-09-14  341  void tty_kref_put(struct tty_struct *tty);
7894193436b65f Jiri Slaby       2021-09-14  342  struct pid *tty_get_pgrp(struct tty_struct *tty);
7894193436b65f Jiri Slaby       2021-09-14  343  void tty_vhangup_self(void);
7894193436b65f Jiri Slaby       2021-09-14  344  void disassociate_ctty(int priv);
7894193436b65f Jiri Slaby       2021-09-14  345  dev_t tty_devnum(struct tty_struct *tty);
7894193436b65f Jiri Slaby       2021-09-14  346  void proc_clear_tty(struct task_struct *p);
7894193436b65f Jiri Slaby       2021-09-14  347  struct tty_struct *get_current_tty(void);
4f73bc4dd3e856 Joe Millenbach   2013-01-17  348  /* tty_io.c */
7894193436b65f Jiri Slaby       2021-09-14  349  int __init tty_init(void);
7894193436b65f Jiri Slaby       2021-09-14  350  const char *tty_name(const struct tty_struct *tty);
7894193436b65f Jiri Slaby       2021-09-14  351  struct tty_struct *tty_kopen_exclusive(dev_t device);
7894193436b65f Jiri Slaby       2021-09-14  352  struct tty_struct *tty_kopen_shared(dev_t device);
7894193436b65f Jiri Slaby       2021-09-14  353  void tty_kclose(struct tty_struct *tty);
7894193436b65f Jiri Slaby       2021-09-14  354  int tty_dev_name_to_number(const char *name, dev_t *number);
4f73bc4dd3e856 Joe Millenbach   2013-01-17  355  #else
4f73bc4dd3e856 Joe Millenbach   2013-01-17 @356  static inline void tty_kref_put(struct tty_struct *tty)
4f73bc4dd3e856 Joe Millenbach   2013-01-17  357  { }
4f73bc4dd3e856 Joe Millenbach   2013-01-17  358  static inline struct pid *tty_get_pgrp(struct tty_struct *tty)
4f73bc4dd3e856 Joe Millenbach   2013-01-17  359  { return NULL; }
4f73bc4dd3e856 Joe Millenbach   2013-01-17  360  static inline void tty_vhangup_self(void)
4f73bc4dd3e856 Joe Millenbach   2013-01-17  361  { }
4f73bc4dd3e856 Joe Millenbach   2013-01-17  362  static inline void disassociate_ctty(int priv)
4f73bc4dd3e856 Joe Millenbach   2013-01-17  363  { }
4f73bc4dd3e856 Joe Millenbach   2013-01-17  364  static inline dev_t tty_devnum(struct tty_struct *tty)
4f73bc4dd3e856 Joe Millenbach   2013-01-17  365  { return 0; }
4f73bc4dd3e856 Joe Millenbach   2013-01-17  366  static inline void proc_clear_tty(struct task_struct *p)
4f73bc4dd3e856 Joe Millenbach   2013-01-17  367  { }
4f73bc4dd3e856 Joe Millenbach   2013-01-17  368  static inline struct tty_struct *get_current_tty(void)
4f73bc4dd3e856 Joe Millenbach   2013-01-17  369  { return NULL; }
4f73bc4dd3e856 Joe Millenbach   2013-01-17  370  /* tty_io.c */
4f73bc4dd3e856 Joe Millenbach   2013-01-17  371  static inline int __init tty_init(void)
4f73bc4dd3e856 Joe Millenbach   2013-01-17  372  { return 0; }
188e3c5cd2b672 Arnd Bergmann    2016-04-27  373  static inline const char *tty_name(const struct tty_struct *tty)
188e3c5cd2b672 Arnd Bergmann    2016-04-27  374  { return "(none)"; }
4ea3cd65e0d47c Uwe Kleine-König 2020-12-18  375  static inline struct tty_struct *tty_kopen_exclusive(dev_t device)
a09ac3974d0c0b Okash Khawaja    2017-07-20  376  { return ERR_PTR(-ENODEV); }
a09ac3974d0c0b Okash Khawaja    2017-07-20  377  static inline void tty_kclose(struct tty_struct *tty)
a09ac3974d0c0b Okash Khawaja    2017-07-20  378  { }
fc61ed51270e86 Okash Khawaja    2017-06-25  379  static inline int tty_dev_name_to_number(const char *name, dev_t *number)
fc61ed51270e86 Okash Khawaja    2017-06-25  380  { return -ENOTSUPP; }
4f73bc4dd3e856 Joe Millenbach   2013-01-17  381  #endif
4f73bc4dd3e856 Joe Millenbach   2013-01-17  382  

:::::: The code at line 356 was first introduced by commit
:::::: 4f73bc4dd3e8563ef4109f293a092820dff66d92 tty: Added a CONFIG_TTY option to allow removal of TTY

:::::: TO: Joe Millenbach <jmillenbach@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
