Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561FE2EAEF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnlRgWDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697570996; x=1729106996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/gy7s6+ikiZBYFK+wJp+MtFghR0bDhOg1U07pjla7Lk=;
  b=nnlRgWDA1/sqne690rYq5fVkj/uHKI0YPXMoWqhoQoG57UxU5qBUUORm
   S76wN4DUwKDDZQ8lCrBftLsadoCi+RnNxxwlObdpLChkoQ4vxQqhIkVQe
   FkdPBbOdbm0pjWiDHRshKDdrg7Ib5BcniY/rpuoHrt1mtRCWq3oWpX3pB
   I0zMWkKF7PtYI0VrupwU5wUEikuIl3te4I+6voEtHqdc1DESyp/kKop7Z
   tA6Aop5pp2Rr1dnlc+PKyRez/iW7GOwzEooP9iB0Qb1/ypiCGoqx0qKS3
   utGZnjpc2v4ef/LZgB3AGweJqNkmKh34e8xPFPs1E9ZnmWVwlzggvg9h4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="450087258"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="450087258"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 12:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="872711422"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="872711422"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Oct 2023 12:29:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsplI-000A0U-07;
	Tue, 17 Oct 2023 19:29:52 +0000
Date: Wed, 18 Oct 2023 03:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: madvenka@linux.microsoft.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 02/10] mm/prmem: Reserve metadata and persistent
 regions in early boot after kexec
Message-ID: <202310180358.7NmPpExl-lkp@intel.com>
References: <20231016233215.13090-3-madvenka@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016233215.13090-3-madvenka@linux.microsoft.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 2dde18cd1d8fac735875f2e4987f11817cc0bc2c]

url:    https://github.com/intel-lab-lkp/linux/commits/madvenka-linux-microsoft-com/mm-prmem-Allocate-memory-during-boot-for-storing-persistent-data/20231017-194340
base:   2dde18cd1d8fac735875f2e4987f11817cc0bc2c
patch link:    https://lore.kernel.org/r/20231016233215.13090-3-madvenka%40linux.microsoft.com
patch subject: [RFC PATCH v1 02/10] mm/prmem: Reserve metadata and persistent regions in early boot after kexec
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310180358.7NmPpExl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180358.7NmPpExl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180358.7NmPpExl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/alpha/include/uapi/asm/errno.h:41: note: this is the location of the previous definition
      41 | #define EHOSTDOWN       64      /* Host is down */
         | 
   include/uapi/asm-generic/errno.h:96: warning: "EHOSTUNREACH" redefined
      96 | #define EHOSTUNREACH    113     /* No route to host */
         | 
   arch/alpha/include/uapi/asm/errno.h:42: note: this is the location of the previous definition
      42 | #define EHOSTUNREACH    65      /* No route to host */
         | 
   include/uapi/asm-generic/errno.h:97: warning: "EALREADY" redefined
      97 | #define EALREADY        114     /* Operation already in progress */
         | 
   arch/alpha/include/uapi/asm/errno.h:14: note: this is the location of the previous definition
      14 | #define EALREADY        37      /* Operation already in progress */
         | 
   include/uapi/asm-generic/errno.h:98: warning: "EINPROGRESS" redefined
      98 | #define EINPROGRESS     115     /* Operation now in progress */
         | 
   arch/alpha/include/uapi/asm/errno.h:13: note: this is the location of the previous definition
      13 | #define EINPROGRESS     36      /* Operation now in progress */
         | 
   include/uapi/asm-generic/errno.h:99: warning: "ESTALE" redefined
      99 | #define ESTALE          116     /* Stale file handle */
         | 
   arch/alpha/include/uapi/asm/errno.h:47: note: this is the location of the previous definition
      47 | #define ESTALE          70      /* Stale file handle */
         | 
   include/uapi/asm-generic/errno.h:105: warning: "EDQUOT" redefined
     105 | #define EDQUOT          122     /* Quota exceeded */
         | 
   arch/alpha/include/uapi/asm/errno.h:46: note: this is the location of the previous definition
      46 | #define EDQUOT          69      /* Quota exceeded */
         | 
   include/uapi/asm-generic/errno.h:107: warning: "ENOMEDIUM" redefined
     107 | #define ENOMEDIUM       123     /* No medium found */
         | 
   arch/alpha/include/uapi/asm/errno.h:112: note: this is the location of the previous definition
     112 | #define ENOMEDIUM       129     /* No medium found */
         | 
   include/uapi/asm-generic/errno.h:108: warning: "EMEDIUMTYPE" redefined
     108 | #define EMEDIUMTYPE     124     /* Wrong medium type */
         | 
   arch/alpha/include/uapi/asm/errno.h:113: note: this is the location of the previous definition
     113 | #define EMEDIUMTYPE     130     /* Wrong medium type */
         | 
   include/uapi/asm-generic/errno.h:109: warning: "ECANCELED" redefined
     109 | #define ECANCELED       125     /* Operation Canceled */
         | 
   arch/alpha/include/uapi/asm/errno.h:114: note: this is the location of the previous definition
     114 | #define ECANCELED       131     /* Operation Cancelled */
         | 
   include/uapi/asm-generic/errno.h:110: warning: "ENOKEY" redefined
     110 | #define ENOKEY          126     /* Required key not available */
         | 
   arch/alpha/include/uapi/asm/errno.h:115: note: this is the location of the previous definition
     115 | #define ENOKEY          132     /* Required key not available */
         | 
   include/uapi/asm-generic/errno.h:111: warning: "EKEYEXPIRED" redefined
     111 | #define EKEYEXPIRED     127     /* Key has expired */
         | 
   arch/alpha/include/uapi/asm/errno.h:116: note: this is the location of the previous definition
     116 | #define EKEYEXPIRED     133     /* Key has expired */
         | 
   include/uapi/asm-generic/errno.h:112: warning: "EKEYREVOKED" redefined
     112 | #define EKEYREVOKED     128     /* Key has been revoked */
         | 
   arch/alpha/include/uapi/asm/errno.h:117: note: this is the location of the previous definition
     117 | #define EKEYREVOKED     134     /* Key has been revoked */
         | 
   include/uapi/asm-generic/errno.h:113: warning: "EKEYREJECTED" redefined
     113 | #define EKEYREJECTED    129     /* Key was rejected by service */
         | 
   arch/alpha/include/uapi/asm/errno.h:118: note: this is the location of the previous definition
     118 | #define EKEYREJECTED    135     /* Key was rejected by service */
         | 
   include/uapi/asm-generic/errno.h:116: warning: "EOWNERDEAD" redefined
     116 | #define EOWNERDEAD      130     /* Owner died */
         | 
   arch/alpha/include/uapi/asm/errno.h:121: note: this is the location of the previous definition
     121 | #define EOWNERDEAD      136     /* Owner died */
         | 
   include/uapi/asm-generic/errno.h:117: warning: "ENOTRECOVERABLE" redefined
     117 | #define ENOTRECOVERABLE 131     /* State not recoverable */
         | 
   arch/alpha/include/uapi/asm/errno.h:122: note: this is the location of the previous definition
     122 | #define ENOTRECOVERABLE 137     /* State not recoverable */
         | 
   include/uapi/asm-generic/errno.h:119: warning: "ERFKILL" redefined
     119 | #define ERFKILL         132     /* Operation not possible due to RF-kill */
         | 
   arch/alpha/include/uapi/asm/errno.h:124: note: this is the location of the previous definition
     124 | #define ERFKILL         138     /* Operation not possible due to RF-kill */
         | 
   include/uapi/asm-generic/errno.h:121: warning: "EHWPOISON" redefined
     121 | #define EHWPOISON       133     /* Memory page has hardware error */
         | 
   arch/alpha/include/uapi/asm/errno.h:126: note: this is the location of the previous definition
     126 | #define EHWPOISON       139     /* Memory page has hardware error */
         | 
   kernel/prmem/prmem_misc.c: In function 'prmem_cmdline':
>> kernel/prmem/prmem_misc.c:32:17: warning: 'strncpy' output may be truncated copying 30 bytes from a string of length 30 [-Wstringop-truncation]
      32 |                 strncpy(str, meta, MAX_META_LENGTH - 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +32 kernel/prmem/prmem_misc.c

    11	
    12	/*
    13	 * On a kexec, modify the kernel command line to include the boot parameter
    14	 * "prmem_meta=" so that the metadata can be found on the next boot. If the
    15	 * parameter is already present in cmdline, overwrite it. Else, add it.
    16	 */
    17	void prmem_cmdline(char *cmdline)
    18	{
    19		char		meta[MAX_META_LENGTH], *str;
    20		unsigned long	metadata;
    21	
    22		metadata = prmem_inited ? prmem->metadata : 0;
    23		snprintf(meta, MAX_META_LENGTH, " prmem_meta=0x%.16lx", metadata);
    24	
    25		str = strstr(cmdline, " prmem_meta");
    26		if (str) {
    27			/*
    28			 * Boot parameter already exists. Overwrite it. We deliberately
    29			 * use strncpy() and rely on the fact that it will not NULL
    30			 * terminate the copy.
    31			 */
  > 32			strncpy(str, meta, MAX_META_LENGTH - 1);
    33			return;
    34		}
    35		if (prmem_inited) {
    36			/* Boot parameter does not exist. Add it. */
    37			strcat(cmdline, meta);
    38		}
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
