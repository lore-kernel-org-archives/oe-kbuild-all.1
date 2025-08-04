Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B5C548EE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754293598; cv=none; b=biEqJfnBCHXDth0eSeJ1cXW4KalwZhShsTKw0TnyraFqM+aRIDgC6/ojssrIzP3Rv41HEwiY0i1uGoKg8VOK5EtRGNP2nxRvFw24HSNvpCsWWIBBKK8A7VJNETOJytbKBwaQ3sl2XIziFiswfnnIBl+ByR8snyTq3c7nQgogzjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754293598; c=relaxed/simple;
	bh=S1Fkxwa08/peQCDByZGdBW52IbHmiLYjcVuzr2F/3y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fZDG8z/zg+Gh6pG9WF1TiqrVKlr3sV5GGxEbbRsuGSZIlAc1tF0ar791Snr+oudY9i9xFlhg1K2/Z+3NpW3Vy6dktBloGuuDzwQMUIBwQ/LIHFl1kYCH3eMhmzB4MnGf0piixvFCWSxfmYsX7O5SqNLR4yyTdpYi+FRsQaO0/OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N21ZzicH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N21ZzicH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754293595; x=1785829595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S1Fkxwa08/peQCDByZGdBW52IbHmiLYjcVuzr2F/3y0=;
  b=N21ZzicHbM2VQNXt9Cbc53v9AJpICmIig1VhfXmXpjU4YvcA5D9RHGkG
   Pd/+Q5rqyfXWMIbzoWoP5Pm+sGldLax/bF8vx78WWiNOukqwkp8wUQyxk
   dkvaOIDId/gOCyTWO3lfor4ycp3Aq2UJVdT4UP+/L1VrdAqmZd89zY8ol
   gSPEFytVGQ6n5/wPxPLz5+2L6RLeURV5qPKbWl+B15JIebQNO2lnkYOcy
   w7rgGOKEBLfwKl2YHtuTEKKLu/C7yyqDXaHeaNBONtNB6L3hoBrKKi5MZ
   5fYU+4qCh8bu8c/q4k8kbRDSqt/LrP08saSxRAfyoEKZPfyE25VsdbQx5
   w==;
X-CSE-ConnectionGUID: vxUkexc5RomhlJE7xy4C2Q==
X-CSE-MsgGUID: Toqu8VcwR6KOP95a0YgH4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="67996493"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67996493"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 00:46:35 -0700
X-CSE-ConnectionGUID: Brx+Ou91RSWZdJpngTFCNg==
X-CSE-MsgGUID: Xfud8xwHQ5SV8vwVTk/AxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194928044"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Aug 2025 00:46:33 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiptv-0006s0-1G;
	Mon, 04 Aug 2025 07:46:31 +0000
Date: Mon, 4 Aug 2025 15:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/170-atcphy 9/12]
 include/uapi/asm-generic/errno.h:7:9: warning: 'EDEADLK' redefined
Message-ID: <202508041518.8MQYaPP0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   fee8161505a063a24659ac6541eeeb6f88cec31d
commit: 6a77f98a69e5661299271e70a03bcabf9a1f9f55 [9/12] phy: apple: atc: support mode switches in atcphy_dpphy_set_mode()
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250804/202508041518.8MQYaPP0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041518.8MQYaPP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041518.8MQYaPP0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/phy/apple/atc.c:12:
>> include/uapi/asm-generic/errno.h:7:9: warning: 'EDEADLK' redefined
       7 | #define EDEADLK         35      /* Resource deadlock would occur */
         |         ^~~~~~~
   In file included from include/uapi/linux/errno.h:1,
                    from include/linux/errno.h:5,
                    from include/linux/thread_info.h:15,
                    from arch/sparc/include/asm/current.h:15,
                    from include/linux/mutex.h:14,
                    from drivers/phy/apple/atc.h:12,
                    from drivers/phy/apple/atc.c:9:
   arch/sparc/include/uapi/asm/errno.h:52:9: note: this is the location of the previous definition
      52 | #define EDEADLK         78      /* Resource deadlock would occur */
         |         ^~~~~~~
>> include/uapi/asm-generic/errno.h:8:9: warning: 'ENAMETOOLONG' redefined
       8 | #define ENAMETOOLONG    36      /* File name too long */
         |         ^~~~~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:37:9: note: this is the location of the previous definition
      37 | #define ENAMETOOLONG    63      /* File name too long */
         |         ^~~~~~~~~~~~
>> include/uapi/asm-generic/errno.h:9:9: warning: 'ENOLCK' redefined
       9 | #define ENOLCK          37      /* No record locks available */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:53:9: note: this is the location of the previous definition
      53 | #define ENOLCK          79      /* No record locks available */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:18:9: warning: 'ENOSYS' redefined
      18 | #define ENOSYS          38      /* Invalid system call number */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:64:9: note: this is the location of the previous definition
      64 | #define ENOSYS          90      /* Function not implemented */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:20:9: warning: 'ENOTEMPTY' redefined
      20 | #define ENOTEMPTY       39      /* Directory not empty */
         |         ^~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:40:9: note: this is the location of the previous definition
      40 | #define ENOTEMPTY       66      /* Directory not empty */
         |         ^~~~~~~~~
>> include/uapi/asm-generic/errno.h:21:9: warning: 'ELOOP' redefined
      21 | #define ELOOP           40      /* Too many symbolic links encountered */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:36:9: note: this is the location of the previous definition
      36 | #define ELOOP           62      /* Too many symbolic links encountered */
         |         ^~~~~
>> include/uapi/asm-generic/errno.h:23:9: warning: 'ENOMSG' redefined
      23 | #define ENOMSG          42      /* No message of desired type */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:49:9: note: this is the location of the previous definition
      49 | #define ENOMSG          75      /* No message of desired type */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:24:9: warning: 'EIDRM' redefined
      24 | #define EIDRM           43      /* Identifier removed */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:51:9: note: this is the location of the previous definition
      51 | #define EIDRM           77      /* Identifier removed */
         |         ^~~~~
>> include/uapi/asm-generic/errno.h:25:9: warning: 'ECHRNG' redefined
      25 | #define ECHRNG          44      /* Channel number out of range */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:70:9: note: this is the location of the previous definition
      70 | #define ECHRNG          94      /* Channel number out of range */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:26:9: warning: 'EL2NSYNC' redefined
      26 | #define EL2NSYNC        45      /* Level 2 not synchronized */
         |         ^~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:71:9: note: this is the location of the previous definition
      71 | #define EL2NSYNC        95      /* Level 2 not synchronized */
         |         ^~~~~~~~
>> include/uapi/asm-generic/errno.h:27:9: warning: 'EL3HLT' redefined
      27 | #define EL3HLT          46      /* Level 3 halted */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:72:9: note: this is the location of the previous definition
      72 | #define EL3HLT          96      /* Level 3 halted */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:28:9: warning: 'EL3RST' redefined
      28 | #define EL3RST          47      /* Level 3 reset */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:73:9: note: this is the location of the previous definition
      73 | #define EL3RST          97      /* Level 3 reset */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:29:9: warning: 'ELNRNG' redefined
      29 | #define ELNRNG          48      /* Link number out of range */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:74:9: note: this is the location of the previous definition
      74 | #define ELNRNG          98      /* Link number out of range */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:30:9: warning: 'EUNATCH' redefined
      30 | #define EUNATCH         49      /* Protocol driver not attached */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:75:9: note: this is the location of the previous definition
      75 | #define EUNATCH         99      /* Protocol driver not attached */
         |         ^~~~~~~
>> include/uapi/asm-generic/errno.h:31:9: warning: 'ENOCSI' redefined
      31 | #define ENOCSI          50      /* No CSI structure available */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:76:9: note: this is the location of the previous definition
      76 | #define ENOCSI          100     /* No CSI structure available */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:32:9: warning: 'EL2HLT' redefined
      32 | #define EL2HLT          51      /* Level 2 halted */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:77:9: note: this is the location of the previous definition
      77 | #define EL2HLT          101     /* Level 2 halted */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:33:9: warning: 'EBADE' redefined
      33 | #define EBADE           52      /* Invalid exchange */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:78:9: note: this is the location of the previous definition
      78 | #define EBADE           102     /* Invalid exchange */
         |         ^~~~~
>> include/uapi/asm-generic/errno.h:34:9: warning: 'EBADR' redefined
      34 | #define EBADR           53      /* Invalid request descriptor */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:79:9: note: this is the location of the previous definition
      79 | #define EBADR           103     /* Invalid request descriptor */
         |         ^~~~~
>> include/uapi/asm-generic/errno.h:35:9: warning: 'EXFULL' redefined
      35 | #define EXFULL          54      /* Exchange full */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:80:9: note: this is the location of the previous definition
      80 | #define EXFULL          104     /* Exchange full */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:36:9: warning: 'ENOANO' redefined
      36 | #define ENOANO          55      /* No anode */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:81:9: note: this is the location of the previous definition
      81 | #define ENOANO          105     /* No anode */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:37:9: warning: 'EBADRQC' redefined
      37 | #define EBADRQC         56      /* Invalid request code */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:82:9: note: this is the location of the previous definition
      82 | #define EBADRQC         106     /* Invalid request code */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:38:9: warning: 'EBADSLT' redefined
      38 | #define EBADSLT         57      /* Invalid slot */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:83:9: note: this is the location of the previous definition
      83 | #define EBADSLT         107     /* Invalid slot */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:40:9: warning: 'EDEADLOCK' redefined
      40 | #define EDEADLOCK       EDEADLK
         |         ^~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:84:9: note: this is the location of the previous definition
      84 | #define EDEADLOCK       108     /* File locking deadlock error */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:42:9: warning: 'EBFONT' redefined
      42 | #define EBFONT          59      /* Bad font file format */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:85:9: note: this is the location of the previous definition
      85 | #define EBFONT          109     /* Bad font file format */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:43:9: warning: 'ENOSTR' redefined
      43 | #define ENOSTR          60      /* Device not a stream */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:46:9: note: this is the location of the previous definition
      46 | #define ENOSTR          72      /* Device not a stream */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:44:9: warning: 'ENODATA' redefined
      44 | #define ENODATA         61      /* No data available */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:87:9: note: this is the location of the previous definition
      87 | #define ENODATA         111     /* No data available */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:45:9: warning: 'ETIME' redefined
      45 | #define ETIME           62      /* Timer expired */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:47:9: note: this is the location of the previous definition
      47 | #define ETIME           73      /* Timer expired */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:46:9: warning: 'ENOSR' redefined
      46 | #define ENOSR           63      /* Out of streams resources */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:48:9: note: this is the location of the previous definition
      48 | #define ENOSR           74      /* Out of streams resources */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:47:9: warning: 'ENONET' redefined
      47 | #define ENONET          64      /* Machine is not on the network */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:54:9: note: this is the location of the previous definition
      54 | #define ENONET          80      /* Machine is not on the network */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:48:9: warning: 'ENOPKG' redefined
      48 | #define ENOPKG          65      /* Package not installed */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:89:9: note: this is the location of the previous definition
      89 | #define ENOPKG          113     /* Package not installed */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:49:9: warning: 'EREMOTE' redefined
      49 | #define EREMOTE         66      /* Object is remote */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:45:9: note: this is the location of the previous definition
      45 | #define EREMOTE         71      /* Object is remote */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:50:9: warning: 'ENOLINK' redefined
      50 | #define ENOLINK         67      /* Link has been severed */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:56:9: note: this is the location of the previous definition
      56 | #define ENOLINK         82      /* Link has been severed */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:51:9: warning: 'EADV' redefined
      51 | #define EADV            68      /* Advertise error */
         |         ^~~~
   arch/sparc/include/uapi/asm/errno.h:57:9: note: this is the location of the previous definition
      57 | #define EADV            83      /* Advertise error */
         |         ^~~~
   include/uapi/asm-generic/errno.h:52:9: warning: 'ESRMNT' redefined
      52 | #define ESRMNT          69      /* Srmount error */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:58:9: note: this is the location of the previous definition
      58 | #define ESRMNT          84      /* Srmount error */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:53:9: warning: 'ECOMM' redefined
      53 | #define ECOMM           70      /* Communication error on send */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:59:9: note: this is the location of the previous definition
      59 | #define ECOMM           85      /* Communication error on send */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:54:9: warning: 'EPROTO' redefined
      54 | #define EPROTO          71      /* Protocol error */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:60:9: note: this is the location of the previous definition
      60 | #define EPROTO          86      /* Protocol error */
--
   In file included from atc.c:12:
>> include/uapi/asm-generic/errno.h:7:9: warning: 'EDEADLK' redefined
       7 | #define EDEADLK         35      /* Resource deadlock would occur */
         |         ^~~~~~~
   In file included from include/uapi/linux/errno.h:1,
                    from include/linux/errno.h:5,
                    from include/linux/thread_info.h:15,
                    from arch/sparc/include/asm/current.h:15,
                    from include/linux/mutex.h:14,
                    from atc.h:12,
                    from atc.c:9:
   arch/sparc/include/uapi/asm/errno.h:52:9: note: this is the location of the previous definition
      52 | #define EDEADLK         78      /* Resource deadlock would occur */
         |         ^~~~~~~
>> include/uapi/asm-generic/errno.h:8:9: warning: 'ENAMETOOLONG' redefined
       8 | #define ENAMETOOLONG    36      /* File name too long */
         |         ^~~~~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:37:9: note: this is the location of the previous definition
      37 | #define ENAMETOOLONG    63      /* File name too long */
         |         ^~~~~~~~~~~~
>> include/uapi/asm-generic/errno.h:9:9: warning: 'ENOLCK' redefined
       9 | #define ENOLCK          37      /* No record locks available */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:53:9: note: this is the location of the previous definition
      53 | #define ENOLCK          79      /* No record locks available */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:18:9: warning: 'ENOSYS' redefined
      18 | #define ENOSYS          38      /* Invalid system call number */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:64:9: note: this is the location of the previous definition
      64 | #define ENOSYS          90      /* Function not implemented */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:20:9: warning: 'ENOTEMPTY' redefined
      20 | #define ENOTEMPTY       39      /* Directory not empty */
         |         ^~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:40:9: note: this is the location of the previous definition
      40 | #define ENOTEMPTY       66      /* Directory not empty */
         |         ^~~~~~~~~
>> include/uapi/asm-generic/errno.h:21:9: warning: 'ELOOP' redefined
      21 | #define ELOOP           40      /* Too many symbolic links encountered */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:36:9: note: this is the location of the previous definition
      36 | #define ELOOP           62      /* Too many symbolic links encountered */
         |         ^~~~~
>> include/uapi/asm-generic/errno.h:23:9: warning: 'ENOMSG' redefined
      23 | #define ENOMSG          42      /* No message of desired type */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:49:9: note: this is the location of the previous definition
      49 | #define ENOMSG          75      /* No message of desired type */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:24:9: warning: 'EIDRM' redefined
      24 | #define EIDRM           43      /* Identifier removed */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:51:9: note: this is the location of the previous definition
      51 | #define EIDRM           77      /* Identifier removed */
         |         ^~~~~
>> include/uapi/asm-generic/errno.h:25:9: warning: 'ECHRNG' redefined
      25 | #define ECHRNG          44      /* Channel number out of range */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:70:9: note: this is the location of the previous definition
      70 | #define ECHRNG          94      /* Channel number out of range */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:26:9: warning: 'EL2NSYNC' redefined
      26 | #define EL2NSYNC        45      /* Level 2 not synchronized */
         |         ^~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:71:9: note: this is the location of the previous definition
      71 | #define EL2NSYNC        95      /* Level 2 not synchronized */
         |         ^~~~~~~~
>> include/uapi/asm-generic/errno.h:27:9: warning: 'EL3HLT' redefined
      27 | #define EL3HLT          46      /* Level 3 halted */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:72:9: note: this is the location of the previous definition
      72 | #define EL3HLT          96      /* Level 3 halted */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:28:9: warning: 'EL3RST' redefined
      28 | #define EL3RST          47      /* Level 3 reset */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:73:9: note: this is the location of the previous definition
      73 | #define EL3RST          97      /* Level 3 reset */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:29:9: warning: 'ELNRNG' redefined
      29 | #define ELNRNG          48      /* Link number out of range */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:74:9: note: this is the location of the previous definition
      74 | #define ELNRNG          98      /* Link number out of range */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:30:9: warning: 'EUNATCH' redefined
      30 | #define EUNATCH         49      /* Protocol driver not attached */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:75:9: note: this is the location of the previous definition
      75 | #define EUNATCH         99      /* Protocol driver not attached */
         |         ^~~~~~~
>> include/uapi/asm-generic/errno.h:31:9: warning: 'ENOCSI' redefined
      31 | #define ENOCSI          50      /* No CSI structure available */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:76:9: note: this is the location of the previous definition
      76 | #define ENOCSI          100     /* No CSI structure available */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:32:9: warning: 'EL2HLT' redefined
      32 | #define EL2HLT          51      /* Level 2 halted */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:77:9: note: this is the location of the previous definition
      77 | #define EL2HLT          101     /* Level 2 halted */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:33:9: warning: 'EBADE' redefined
      33 | #define EBADE           52      /* Invalid exchange */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:78:9: note: this is the location of the previous definition
      78 | #define EBADE           102     /* Invalid exchange */
         |         ^~~~~
>> include/uapi/asm-generic/errno.h:34:9: warning: 'EBADR' redefined
      34 | #define EBADR           53      /* Invalid request descriptor */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:79:9: note: this is the location of the previous definition
      79 | #define EBADR           103     /* Invalid request descriptor */
         |         ^~~~~
>> include/uapi/asm-generic/errno.h:35:9: warning: 'EXFULL' redefined
      35 | #define EXFULL          54      /* Exchange full */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:80:9: note: this is the location of the previous definition
      80 | #define EXFULL          104     /* Exchange full */
         |         ^~~~~~
>> include/uapi/asm-generic/errno.h:36:9: warning: 'ENOANO' redefined
      36 | #define ENOANO          55      /* No anode */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:81:9: note: this is the location of the previous definition
      81 | #define ENOANO          105     /* No anode */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:37:9: warning: 'EBADRQC' redefined
      37 | #define EBADRQC         56      /* Invalid request code */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:82:9: note: this is the location of the previous definition
      82 | #define EBADRQC         106     /* Invalid request code */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:38:9: warning: 'EBADSLT' redefined
      38 | #define EBADSLT         57      /* Invalid slot */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:83:9: note: this is the location of the previous definition
      83 | #define EBADSLT         107     /* Invalid slot */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:40:9: warning: 'EDEADLOCK' redefined
      40 | #define EDEADLOCK       EDEADLK
         |         ^~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:84:9: note: this is the location of the previous definition
      84 | #define EDEADLOCK       108     /* File locking deadlock error */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:42:9: warning: 'EBFONT' redefined
      42 | #define EBFONT          59      /* Bad font file format */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:85:9: note: this is the location of the previous definition
      85 | #define EBFONT          109     /* Bad font file format */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:43:9: warning: 'ENOSTR' redefined
      43 | #define ENOSTR          60      /* Device not a stream */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:46:9: note: this is the location of the previous definition
      46 | #define ENOSTR          72      /* Device not a stream */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:44:9: warning: 'ENODATA' redefined
      44 | #define ENODATA         61      /* No data available */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:87:9: note: this is the location of the previous definition
      87 | #define ENODATA         111     /* No data available */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:45:9: warning: 'ETIME' redefined
      45 | #define ETIME           62      /* Timer expired */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:47:9: note: this is the location of the previous definition
      47 | #define ETIME           73      /* Timer expired */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:46:9: warning: 'ENOSR' redefined
      46 | #define ENOSR           63      /* Out of streams resources */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:48:9: note: this is the location of the previous definition
      48 | #define ENOSR           74      /* Out of streams resources */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:47:9: warning: 'ENONET' redefined
      47 | #define ENONET          64      /* Machine is not on the network */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:54:9: note: this is the location of the previous definition
      54 | #define ENONET          80      /* Machine is not on the network */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:48:9: warning: 'ENOPKG' redefined
      48 | #define ENOPKG          65      /* Package not installed */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:89:9: note: this is the location of the previous definition
      89 | #define ENOPKG          113     /* Package not installed */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:49:9: warning: 'EREMOTE' redefined
      49 | #define EREMOTE         66      /* Object is remote */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:45:9: note: this is the location of the previous definition
      45 | #define EREMOTE         71      /* Object is remote */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:50:9: warning: 'ENOLINK' redefined
      50 | #define ENOLINK         67      /* Link has been severed */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:56:9: note: this is the location of the previous definition
      56 | #define ENOLINK         82      /* Link has been severed */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:51:9: warning: 'EADV' redefined
      51 | #define EADV            68      /* Advertise error */
         |         ^~~~
   arch/sparc/include/uapi/asm/errno.h:57:9: note: this is the location of the previous definition
      57 | #define EADV            83      /* Advertise error */
         |         ^~~~
   include/uapi/asm-generic/errno.h:52:9: warning: 'ESRMNT' redefined
      52 | #define ESRMNT          69      /* Srmount error */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:58:9: note: this is the location of the previous definition
      58 | #define ESRMNT          84      /* Srmount error */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:53:9: warning: 'ECOMM' redefined
      53 | #define ECOMM           70      /* Communication error on send */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:59:9: note: this is the location of the previous definition
      59 | #define ECOMM           85      /* Communication error on send */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:54:9: warning: 'EPROTO' redefined
      54 | #define EPROTO          71      /* Protocol error */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:60:9: note: this is the location of the previous definition
      60 | #define EPROTO          86      /* Protocol error */


vim +/EDEADLK +7 include/uapi/asm-generic/errno.h

^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16    6  
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   @7  #define	EDEADLK		35	/* Resource deadlock would occur */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   @8  #define	ENAMETOOLONG	36	/* File name too long */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   @9  #define	ENOLCK		37	/* No record locks available */
e15f431fe2d53cd include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   10  
e15f431fe2d53cd include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   11  /*
e15f431fe2d53cd include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   12   * This error code is special: arch syscall entry code will return
e15f431fe2d53cd include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   13   * -ENOSYS if users try to call a syscall that doesn't exist.  To keep
e15f431fe2d53cd include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   14   * failures of syscalls that really do exist distinguishable from
e15f431fe2d53cd include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   15   * failures due to attempts to use a nonexistent syscall, syscall
e15f431fe2d53cd include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   16   * implementations should refrain from returning -ENOSYS.
e15f431fe2d53cd include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   17   */
e15f431fe2d53cd include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16  @18  #define	ENOSYS		38	/* Invalid system call number */
e15f431fe2d53cd include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   19  
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @20  #define	ENOTEMPTY	39	/* Directory not empty */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @21  #define	ELOOP		40	/* Too many symbolic links encountered */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   22  #define	EWOULDBLOCK	EAGAIN	/* Operation would block */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @23  #define	ENOMSG		42	/* No message of desired type */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @24  #define	EIDRM		43	/* Identifier removed */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @25  #define	ECHRNG		44	/* Channel number out of range */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @26  #define	EL2NSYNC	45	/* Level 2 not synchronized */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @27  #define	EL3HLT		46	/* Level 3 halted */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @28  #define	EL3RST		47	/* Level 3 reset */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @29  #define	ELNRNG		48	/* Link number out of range */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @30  #define	EUNATCH		49	/* Protocol driver not attached */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @31  #define	ENOCSI		50	/* No CSI structure available */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @32  #define	EL2HLT		51	/* Level 2 halted */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @33  #define	EBADE		52	/* Invalid exchange */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @34  #define	EBADR		53	/* Invalid request descriptor */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @35  #define	EXFULL		54	/* Exchange full */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @36  #define	ENOANO		55	/* No anode */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @37  #define	EBADRQC		56	/* Invalid request code */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @38  #define	EBADSLT		57	/* Invalid slot */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   39  
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @40  #define	EDEADLOCK	EDEADLK
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   41  
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @42  #define	EBFONT		59	/* Bad font file format */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @43  #define	ENOSTR		60	/* Device not a stream */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @44  #define	ENODATA		61	/* No data available */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @45  #define	ETIME		62	/* Timer expired */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @46  #define	ENOSR		63	/* Out of streams resources */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @47  #define	ENONET		64	/* Machine is not on the network */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @48  #define	ENOPKG		65	/* Package not installed */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @49  #define	EREMOTE		66	/* Object is remote */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @50  #define	ENOLINK		67	/* Link has been severed */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @51  #define	EADV		68	/* Advertise error */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @52  #define	ESRMNT		69	/* Srmount error */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @53  #define	ECOMM		70	/* Communication error on send */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @54  #define	EPROTO		71	/* Protocol error */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @55  #define	EMULTIHOP	72	/* Multihop attempted */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @56  #define	EDOTDOT		73	/* RFS specific error */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @57  #define	EBADMSG		74	/* Not a data message */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @58  #define	EOVERFLOW	75	/* Value too large for defined data type */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @59  #define	ENOTUNIQ	76	/* Name not unique on network */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @60  #define	EBADFD		77	/* File descriptor in bad state */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @61  #define	EREMCHG		78	/* Remote address changed */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @62  #define	ELIBACC		79	/* Can not access a needed shared library */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @63  #define	ELIBBAD		80	/* Accessing a corrupted shared library */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @64  #define	ELIBSCN		81	/* .lib section in a.out corrupted */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @65  #define	ELIBMAX		82	/* Attempting to link in too many shared libraries */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @66  #define	ELIBEXEC	83	/* Cannot exec a shared library directly */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @67  #define	EILSEQ		84	/* Illegal byte sequence */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @68  #define	ERESTART	85	/* Interrupted system call should be restarted */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @69  #define	ESTRPIPE	86	/* Streams pipe error */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @70  #define	EUSERS		87	/* Too many users */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @71  #define	ENOTSOCK	88	/* Socket operation on non-socket */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @72  #define	EDESTADDRREQ	89	/* Destination address required */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @73  #define	EMSGSIZE	90	/* Message too long */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @74  #define	EPROTOTYPE	91	/* Protocol wrong type for socket */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @75  #define	ENOPROTOOPT	92	/* Protocol not available */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @76  #define	EPROTONOSUPPORT	93	/* Protocol not supported */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @77  #define	ESOCKTNOSUPPORT	94	/* Socket type not supported */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @78  #define	EOPNOTSUPP	95	/* Operation not supported on transport endpoint */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @79  #define	EPFNOSUPPORT	96	/* Protocol family not supported */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @80  #define	EAFNOSUPPORT	97	/* Address family not supported by protocol */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @81  #define	EADDRINUSE	98	/* Address already in use */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @82  #define	EADDRNOTAVAIL	99	/* Cannot assign requested address */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @83  #define	ENETDOWN	100	/* Network is down */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @84  #define	ENETUNREACH	101	/* Network is unreachable */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @85  #define	ENETRESET	102	/* Network dropped connection because of reset */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @86  #define	ECONNABORTED	103	/* Software caused connection abort */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @87  #define	ECONNRESET	104	/* Connection reset by peer */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @88  #define	ENOBUFS		105	/* No buffer space available */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @89  #define	EISCONN		106	/* Transport endpoint is already connected */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @90  #define	ENOTCONN	107	/* Transport endpoint is not connected */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @91  #define	ESHUTDOWN	108	/* Cannot send after transport endpoint shutdown */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @92  #define	ETOOMANYREFS	109	/* Too many references: cannot splice */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @93  #define	ETIMEDOUT	110	/* Connection timed out */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @94  #define	ECONNREFUSED	111	/* Connection refused */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @95  #define	EHOSTDOWN	112	/* Host is down */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @96  #define	EHOSTUNREACH	113	/* No route to host */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @97  #define	EALREADY	114	/* Operation already in progress */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @98  #define	EINPROGRESS	115	/* Operation now in progress */
0ca43435188b9f9 include/uapi/asm-generic/errno.h Eric Sandeen    2013-11-12  @99  #define	ESTALE		116	/* Stale file handle */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  100  #define	EUCLEAN		117	/* Structure needs cleaning */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  101  #define	ENOTNAM		118	/* Not a XENIX named type file */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  102  #define	ENAVAIL		119	/* No XENIX semaphores available */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  103  #define	EISNAM		120	/* Is a named type file */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  104  #define	EREMOTEIO	121	/* Remote I/O error */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @105  #define	EDQUOT		122	/* Quota exceeded */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  106  
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @107  #define	ENOMEDIUM	123	/* No medium found */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @108  #define	EMEDIUMTYPE	124	/* Wrong medium type */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @109  #define	ECANCELED	125	/* Operation Canceled */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @110  #define	ENOKEY		126	/* Required key not available */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @111  #define	EKEYEXPIRED	127	/* Key has expired */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @112  #define	EKEYREVOKED	128	/* Key has been revoked */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16 @113  #define	EKEYREJECTED	129	/* Key was rejected by service */
^1da177e4c3f415 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  114  
4750e2c0c59e0c8 include/asm-generic/errno.h      Joe Korty       2005-05-01  115  /* for robust mutexes */
4750e2c0c59e0c8 include/asm-generic/errno.h      Joe Korty       2005-05-01 @116  #define	EOWNERDEAD	130	/* Owner died */
4750e2c0c59e0c8 include/asm-generic/errno.h      Joe Korty       2005-05-01 @117  #define	ENOTRECOVERABLE	131	/* State not recoverable */
4750e2c0c59e0c8 include/asm-generic/errno.h      Joe Korty       2005-05-01  118  
1f87f7d3a3b42b2 include/asm-generic/errno.h      Johannes Berg   2009-06-02 @119  #define ERFKILL		132	/* Operation not possible due to RF-kill */
1f87f7d3a3b42b2 include/asm-generic/errno.h      Johannes Berg   2009-06-02  120  
69ebb83e13e5142 include/asm-generic/errno.h      Ying Huang      2011-01-30 @121  #define EHWPOISON	133	/* Memory page has hardware error */
69ebb83e13e5142 include/asm-generic/errno.h      Ying Huang      2011-01-30  122  

:::::: The code at line 7 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
