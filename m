Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E9A43A8B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 18:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bY+EDN3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697567802; x=1729103802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B0pIfPCIQrEUMJpP4VGicJ7U9I+gHHVSjWleDXvj9jE=;
  b=bY+EDN3YGZXOhhW42M7z/NVHpe9/3qwxoiSLJc4QeU5GB3zjzUIvprSq
   zdOCHxlD+JfKWwEx9UQXtwlQK7w6kQz1YnY4+GT63UmE5N5odCCDB+I1R
   r58iMhh4itKIf4dM64wrwijCXqQzeJmzXc0yUxISQZxkMwEjN9elW0XIf
   NuVXogANdqCuUwwhXXWfd8n43CEy8MmPDihLzKYdcORtajpOy19clDSDo
   hJ4dkfqnh4Jjz/rcFFlqgul0I015JJxtqkMngqWIpiBD8YR7oFbtKC1vN
   J4dqT3gYkH9eeoUHpkYcBpWB2ptlyCGHlrsBeV4MH6F4MN/H49UnRtswr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="4456171"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="4456171"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 11:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="4041921"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Oct 2023 11:35:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsovY-0009wp-34;
	Tue, 17 Oct 2023 18:36:24 +0000
Date: Wed, 18 Oct 2023 02:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: madvenka@linux.microsoft.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 01/10] mm/prmem: Allocate memory during boot for
 storing persistent data
Message-ID: <202310180205.XwQNDqOS-lkp@intel.com>
References: <20231016233215.13090-2-madvenka@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016233215.13090-2-madvenka@linux.microsoft.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 2dde18cd1d8fac735875f2e4987f11817cc0bc2c]

url:    https://github.com/intel-lab-lkp/linux/commits/madvenka-linux-microsoft-com/mm-prmem-Allocate-memory-during-boot-for-storing-persistent-data/20231017-194340
base:   2dde18cd1d8fac735875f2e4987f11817cc0bc2c
patch link:    https://lore.kernel.org/r/20231016233215.13090-2-madvenka%40linux.microsoft.com
patch subject: [RFC PATCH v1 01/10] mm/prmem: Allocate memory during boot for storing persistent data
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310180205.XwQNDqOS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180205.XwQNDqOS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180205.XwQNDqOS-lkp@intel.com/

All warnings (new ones prefixed by >>):

         | 
   arch/alpha/include/uapi/asm/errno.h:39: note: this is the location of the previous definition
      39 | #define ELOOP           62      /* Too many symbolic links encountered */
         | 
   include/uapi/asm-generic/errno.h:23: warning: "ENOMSG" redefined
      23 | #define ENOMSG          42      /* No message of desired type */
         | 
   arch/alpha/include/uapi/asm/errno.h:53: note: this is the location of the previous definition
      53 | #define ENOMSG          80      /* No message of desired type */
         | 
   include/uapi/asm-generic/errno.h:24: warning: "EIDRM" redefined
      24 | #define EIDRM           43      /* Identifier removed */
         | 
   arch/alpha/include/uapi/asm/errno.h:54: note: this is the location of the previous definition
      54 | #define EIDRM           81      /* Identifier removed */
         | 
   include/uapi/asm-generic/errno.h:25: warning: "ECHRNG" redefined
      25 | #define ECHRNG          44      /* Channel number out of range */
         | 
   arch/alpha/include/uapi/asm/errno.h:67: note: this is the location of the previous definition
      67 | #define ECHRNG          88      /* Channel number out of range */
         | 
   include/uapi/asm-generic/errno.h:26: warning: "EL2NSYNC" redefined
      26 | #define EL2NSYNC        45      /* Level 2 not synchronized */
         | 
   arch/alpha/include/uapi/asm/errno.h:68: note: this is the location of the previous definition
      68 | #define EL2NSYNC        89      /* Level 2 not synchronized */
         | 
   include/uapi/asm-generic/errno.h:27: warning: "EL3HLT" redefined
      27 | #define EL3HLT          46      /* Level 3 halted */
         | 
   arch/alpha/include/uapi/asm/errno.h:69: note: this is the location of the previous definition
      69 | #define EL3HLT          90      /* Level 3 halted */
         | 
   include/uapi/asm-generic/errno.h:28: warning: "EL3RST" redefined
      28 | #define EL3RST          47      /* Level 3 reset */
         | 
   arch/alpha/include/uapi/asm/errno.h:70: note: this is the location of the previous definition
      70 | #define EL3RST          91      /* Level 3 reset */
         | 
   include/uapi/asm-generic/errno.h:29: warning: "ELNRNG" redefined
      29 | #define ELNRNG          48      /* Link number out of range */
         | 
   arch/alpha/include/uapi/asm/errno.h:72: note: this is the location of the previous definition
      72 | #define ELNRNG          93      /* Link number out of range */
         | 
   include/uapi/asm-generic/errno.h:30: warning: "EUNATCH" redefined
      30 | #define EUNATCH         49      /* Protocol driver not attached */
         | 
   arch/alpha/include/uapi/asm/errno.h:73: note: this is the location of the previous definition
      73 | #define EUNATCH         94      /* Protocol driver not attached */
         | 
   include/uapi/asm-generic/errno.h:31: warning: "ENOCSI" redefined
      31 | #define ENOCSI          50      /* No CSI structure available */
         | 
   arch/alpha/include/uapi/asm/errno.h:74: note: this is the location of the previous definition
      74 | #define ENOCSI          95      /* No CSI structure available */
         | 
   include/uapi/asm-generic/errno.h:32: warning: "EL2HLT" redefined
      32 | #define EL2HLT          51      /* Level 2 halted */
         | 
   arch/alpha/include/uapi/asm/errno.h:75: note: this is the location of the previous definition
      75 | #define EL2HLT          96      /* Level 2 halted */
         | 
   include/uapi/asm-generic/errno.h:33: warning: "EBADE" redefined
      33 | #define EBADE           52      /* Invalid exchange */
         | 
   arch/alpha/include/uapi/asm/errno.h:76: note: this is the location of the previous definition
      76 | #define EBADE           97      /* Invalid exchange */
         | 
   include/uapi/asm-generic/errno.h:34: warning: "EBADR" redefined
      34 | #define EBADR           53      /* Invalid request descriptor */
         | 
   arch/alpha/include/uapi/asm/errno.h:77: note: this is the location of the previous definition
      77 | #define EBADR           98      /* Invalid request descriptor */
         | 
   include/uapi/asm-generic/errno.h:35: warning: "EXFULL" redefined
      35 | #define EXFULL          54      /* Exchange full */
         | 
   arch/alpha/include/uapi/asm/errno.h:78: note: this is the location of the previous definition
      78 | #define EXFULL          99      /* Exchange full */
         | 
   include/uapi/asm-generic/errno.h:36: warning: "ENOANO" redefined
      36 | #define ENOANO          55      /* No anode */
         | 
   arch/alpha/include/uapi/asm/errno.h:79: note: this is the location of the previous definition
      79 | #define ENOANO          100     /* No anode */
         | 
   include/uapi/asm-generic/errno.h:37: warning: "EBADRQC" redefined
      37 | #define EBADRQC         56      /* Invalid request code */
         | 
   arch/alpha/include/uapi/asm/errno.h:80: note: this is the location of the previous definition
      80 | #define EBADRQC         101     /* Invalid request code */
         | 
   include/uapi/asm-generic/errno.h:38: warning: "EBADSLT" redefined
      38 | #define EBADSLT         57      /* Invalid slot */
         | 
   arch/alpha/include/uapi/asm/errno.h:81: note: this is the location of the previous definition
      81 | #define EBADSLT         102     /* Invalid slot */
         | 
>> include/uapi/asm-generic/errno.h:42: warning: "EBFONT" redefined
      42 | #define EBFONT          59      /* Bad font file format */
         | 
   arch/alpha/include/uapi/asm/errno.h:85: note: this is the location of the previous definition
      85 | #define EBFONT          104     /* Bad font file format */
         | 
>> include/uapi/asm-generic/errno.h:43: warning: "ENOSTR" redefined
      43 | #define ENOSTR          60      /* Device not a stream */
         | 
   arch/alpha/include/uapi/asm/errno.h:60: note: this is the location of the previous definition
      60 | #define ENOSTR          87      /* Device not a stream */
         | 
>> include/uapi/asm-generic/errno.h:44: warning: "ENODATA" redefined
      44 | #define ENODATA         61      /* No data available */
         | 
   arch/alpha/include/uapi/asm/errno.h:59: note: this is the location of the previous definition
      59 | #define ENODATA         86      /* No data available */
         | 
>> include/uapi/asm-generic/errno.h:45: warning: "ETIME" redefined
      45 | #define ETIME           62      /* Timer expired */
         | 
   arch/alpha/include/uapi/asm/errno.h:56: note: this is the location of the previous definition
      56 | #define ETIME           83      /* Timer expired */
         | 
>> include/uapi/asm-generic/errno.h:46: warning: "ENOSR" redefined
      46 | #define ENOSR           63      /* Out of streams resources */
         | 
   arch/alpha/include/uapi/asm/errno.h:55: note: this is the location of the previous definition
      55 | #define ENOSR           82      /* Out of streams resources */
         | 
>> include/uapi/asm-generic/errno.h:47: warning: "ENONET" redefined
      47 | #define ENONET          64      /* Machine is not on the network */
         | 
   arch/alpha/include/uapi/asm/errno.h:86: note: this is the location of the previous definition
      86 | #define ENONET          105     /* Machine is not on the network */
         | 
>> include/uapi/asm-generic/errno.h:48: warning: "ENOPKG" redefined
      48 | #define ENOPKG          65      /* Package not installed */
         | 
   arch/alpha/include/uapi/asm/errno.h:62: note: this is the location of the previous definition
      62 | #define ENOPKG          92      /* Package not installed */
         | 
>> include/uapi/asm-generic/errno.h:49: warning: "EREMOTE" redefined
      49 | #define EREMOTE         66      /* Object is remote */
         | 
   arch/alpha/include/uapi/asm/errno.h:48: note: this is the location of the previous definition
      48 | #define EREMOTE         71      /* Object is remote */
         | 
>> include/uapi/asm-generic/errno.h:50: warning: "ENOLINK" redefined
      50 | #define ENOLINK         67      /* Link has been severed */
         | 
   arch/alpha/include/uapi/asm/errno.h:87: note: this is the location of the previous definition
      87 | #define ENOLINK         106     /* Link has been severed */
         | 
>> include/uapi/asm-generic/errno.h:51: warning: "EADV" redefined
      51 | #define EADV            68      /* Advertise error */
         | 
   arch/alpha/include/uapi/asm/errno.h:88: note: this is the location of the previous definition
      88 | #define EADV            107     /* Advertise error */
         | 
>> include/uapi/asm-generic/errno.h:52: warning: "ESRMNT" redefined
      52 | #define ESRMNT          69      /* Srmount error */
         | 
   arch/alpha/include/uapi/asm/errno.h:89: note: this is the location of the previous definition
      89 | #define ESRMNT          108     /* Srmount error */
         | 
>> include/uapi/asm-generic/errno.h:53: warning: "ECOMM" redefined
      53 | #define ECOMM           70      /* Communication error on send */
         | 
   arch/alpha/include/uapi/asm/errno.h:90: note: this is the location of the previous definition
      90 | #define ECOMM           109     /* Communication error on send */
         | 
>> include/uapi/asm-generic/errno.h:54: warning: "EPROTO" redefined
      54 | #define EPROTO          71      /* Protocol error */
         | 
   arch/alpha/include/uapi/asm/errno.h:58: note: this is the location of the previous definition
      58 | #define EPROTO          85      /* Protocol error */
         | 
   include/uapi/asm-generic/errno.h:55: warning: "EMULTIHOP" redefined
      55 | #define EMULTIHOP       72      /* Multihop attempted */
         | 
   arch/alpha/include/uapi/asm/errno.h:91: note: this is the location of the previous definition
      91 | #define EMULTIHOP       110     /* Multihop attempted */
         | 
>> include/uapi/asm-generic/errno.h:56: warning: "EDOTDOT" redefined
      56 | #define EDOTDOT         73      /* RFS specific error */
         | 
   arch/alpha/include/uapi/asm/errno.h:92: note: this is the location of the previous definition
      92 | #define EDOTDOT         111     /* RFS specific error */
         | 
   include/uapi/asm-generic/errno.h:57: warning: "EBADMSG" redefined
      57 | #define EBADMSG         74      /* Not a data message */
         | 
   arch/alpha/include/uapi/asm/errno.h:57: note: this is the location of the previous definition
      57 | #define EBADMSG         84      /* Not a data message */
         | 
   include/uapi/asm-generic/errno.h:58: warning: "EOVERFLOW" redefined
      58 | #define EOVERFLOW       75      /* Value too large for defined data type */
         | 
   arch/alpha/include/uapi/asm/errno.h:93: note: this is the location of the previous definition
      93 | #define EOVERFLOW       112     /* Value too large for defined data type */
         | 
   include/uapi/asm-generic/errno.h:59: warning: "ENOTUNIQ" redefined
      59 | #define ENOTUNIQ        76      /* Name not unique on network */
         | 
   arch/alpha/include/uapi/asm/errno.h:94: note: this is the location of the previous definition
      94 | #define ENOTUNIQ        113     /* Name not unique on network */
         | 
   include/uapi/asm-generic/errno.h:60: warning: "EBADFD" redefined
      60 | #define EBADFD          77      /* File descriptor in bad state */
         | 
   arch/alpha/include/uapi/asm/errno.h:95: note: this is the location of the previous definition
      95 | #define EBADFD          114     /* File descriptor in bad state */
         | 
   include/uapi/asm-generic/errno.h:61: warning: "EREMCHG" redefined
      61 | #define EREMCHG         78      /* Remote address changed */
         | 
   arch/alpha/include/uapi/asm/errno.h:96: note: this is the location of the previous definition
      96 | #define EREMCHG         115     /* Remote address changed */
         | 
   include/uapi/asm-generic/errno.h:62: warning: "ELIBACC" redefined
      62 | #define ELIBACC         79      /* Can not access a needed shared library */
         | 
   arch/alpha/include/uapi/asm/errno.h:104: note: this is the location of the previous definition
     104 | #define ELIBACC         122     /* Can not access a needed shared library */
         | 
   include/uapi/asm-generic/errno.h:63: warning: "ELIBBAD" redefined
      63 | #define ELIBBAD         80      /* Accessing a corrupted shared library */
         | 
   arch/alpha/include/uapi/asm/errno.h:105: note: this is the location of the previous definition
     105 | #define ELIBBAD         123     /* Accessing a corrupted shared library */
         | 
   include/uapi/asm-generic/errno.h:64: warning: "ELIBSCN" redefined
      64 | #define ELIBSCN         81      /* .lib section in a.out corrupted */
         | 
   arch/alpha/include/uapi/asm/errno.h:106: note: this is the location of the previous definition
     106 | #define ELIBSCN         124     /* .lib section in a.out corrupted */
         | 
   include/uapi/asm-generic/errno.h:65: warning: "ELIBMAX" redefined
      65 | #define ELIBMAX         82      /* Attempting to link in too many shared libraries */
         | 
   arch/alpha/include/uapi/asm/errno.h:107: note: this is the location of the previous definition
     107 | #define ELIBMAX         125     /* Attempting to link in too many shared libraries */
         | 
   include/uapi/asm-generic/errno.h:66: warning: "ELIBEXEC" redefined
      66 | #define ELIBEXEC        83      /* Cannot exec a shared library directly */
         | 
   arch/alpha/include/uapi/asm/errno.h:108: note: this is the location of the previous definition
     108 | #define ELIBEXEC        126     /* Cannot exec a shared library directly */
         | 
   include/uapi/asm-generic/errno.h:67: warning: "EILSEQ" redefined
      67 | #define EILSEQ          84      /* Illegal byte sequence */
         | 
   arch/alpha/include/uapi/asm/errno.h:64: note: this is the location of the previous definition
      64 | #define EILSEQ          116     /* Illegal byte sequence */
         | 
   include/uapi/asm-generic/errno.h:68: warning: "ERESTART" redefined
      68 | #define ERESTART        85      /* Interrupted system call should be restarted */
         | 
   arch/alpha/include/uapi/asm/errno.h:109: note: this is the location of the previous definition
     109 | #define ERESTART        127     /* Interrupted system call should be restarted */
         | 
   include/uapi/asm-generic/errno.h:69: warning: "ESTRPIPE" redefined
      69 | #define ESTRPIPE        86      /* Streams pipe error */
         | 
   arch/alpha/include/uapi/asm/errno.h:110: note: this is the location of the previous definition
     110 | #define ESTRPIPE        128     /* Streams pipe error */
         | 
   include/uapi/asm-generic/errno.h:70: warning: "EUSERS" redefined
      70 | #define EUSERS          87      /* Too many users */
         | 
   arch/alpha/include/uapi/asm/errno.h:45: note: this is the location of the previous definition
      45 | #define EUSERS          68      /* Too many users */
         | 
   include/uapi/asm-generic/errno.h:71: warning: "ENOTSOCK" redefined
      71 | #define ENOTSOCK        88      /* Socket operation on non-socket */
         | 
   arch/alpha/include/uapi/asm/errno.h:15: note: this is the location of the previous definition
      15 | #define ENOTSOCK        38      /* Socket operation on non-socket */
         | 
   include/uapi/asm-generic/errno.h:72: warning: "EDESTADDRREQ" redefined
      72 | #define EDESTADDRREQ    89      /* Destination address required */
         | 
   arch/alpha/include/uapi/asm/errno.h:16: note: this is the location of the previous definition
      16 | #define EDESTADDRREQ    39      /* Destination address required */
--
         | 
   arch/alpha/include/uapi/asm/errno.h:39: note: this is the location of the previous definition
      39 | #define ELOOP           62      /* Too many symbolic links encountered */
         | 
   include/uapi/asm-generic/errno.h:23: warning: "ENOMSG" redefined
      23 | #define ENOMSG          42      /* No message of desired type */
         | 
   arch/alpha/include/uapi/asm/errno.h:53: note: this is the location of the previous definition
      53 | #define ENOMSG          80      /* No message of desired type */
         | 
   include/uapi/asm-generic/errno.h:24: warning: "EIDRM" redefined
      24 | #define EIDRM           43      /* Identifier removed */
         | 
   arch/alpha/include/uapi/asm/errno.h:54: note: this is the location of the previous definition
      54 | #define EIDRM           81      /* Identifier removed */
         | 
   include/uapi/asm-generic/errno.h:25: warning: "ECHRNG" redefined
      25 | #define ECHRNG          44      /* Channel number out of range */
         | 
   arch/alpha/include/uapi/asm/errno.h:67: note: this is the location of the previous definition
      67 | #define ECHRNG          88      /* Channel number out of range */
         | 
   include/uapi/asm-generic/errno.h:26: warning: "EL2NSYNC" redefined
      26 | #define EL2NSYNC        45      /* Level 2 not synchronized */
         | 
   arch/alpha/include/uapi/asm/errno.h:68: note: this is the location of the previous definition
      68 | #define EL2NSYNC        89      /* Level 2 not synchronized */
         | 
   include/uapi/asm-generic/errno.h:27: warning: "EL3HLT" redefined
      27 | #define EL3HLT          46      /* Level 3 halted */
         | 
   arch/alpha/include/uapi/asm/errno.h:69: note: this is the location of the previous definition
      69 | #define EL3HLT          90      /* Level 3 halted */
         | 
   include/uapi/asm-generic/errno.h:28: warning: "EL3RST" redefined
      28 | #define EL3RST          47      /* Level 3 reset */
         | 
   arch/alpha/include/uapi/asm/errno.h:70: note: this is the location of the previous definition
      70 | #define EL3RST          91      /* Level 3 reset */
         | 
   include/uapi/asm-generic/errno.h:29: warning: "ELNRNG" redefined
      29 | #define ELNRNG          48      /* Link number out of range */
         | 
   arch/alpha/include/uapi/asm/errno.h:72: note: this is the location of the previous definition
      72 | #define ELNRNG          93      /* Link number out of range */
         | 
   include/uapi/asm-generic/errno.h:30: warning: "EUNATCH" redefined
      30 | #define EUNATCH         49      /* Protocol driver not attached */
         | 
   arch/alpha/include/uapi/asm/errno.h:73: note: this is the location of the previous definition
      73 | #define EUNATCH         94      /* Protocol driver not attached */
         | 
   include/uapi/asm-generic/errno.h:31: warning: "ENOCSI" redefined
      31 | #define ENOCSI          50      /* No CSI structure available */
         | 
   arch/alpha/include/uapi/asm/errno.h:74: note: this is the location of the previous definition
      74 | #define ENOCSI          95      /* No CSI structure available */
         | 
   include/uapi/asm-generic/errno.h:32: warning: "EL2HLT" redefined
      32 | #define EL2HLT          51      /* Level 2 halted */
         | 
   arch/alpha/include/uapi/asm/errno.h:75: note: this is the location of the previous definition
      75 | #define EL2HLT          96      /* Level 2 halted */
         | 
   include/uapi/asm-generic/errno.h:33: warning: "EBADE" redefined
      33 | #define EBADE           52      /* Invalid exchange */
         | 
   arch/alpha/include/uapi/asm/errno.h:76: note: this is the location of the previous definition
      76 | #define EBADE           97      /* Invalid exchange */
         | 
   include/uapi/asm-generic/errno.h:34: warning: "EBADR" redefined
      34 | #define EBADR           53      /* Invalid request descriptor */
         | 
   arch/alpha/include/uapi/asm/errno.h:77: note: this is the location of the previous definition
      77 | #define EBADR           98      /* Invalid request descriptor */
         | 
   include/uapi/asm-generic/errno.h:35: warning: "EXFULL" redefined
      35 | #define EXFULL          54      /* Exchange full */
         | 
   arch/alpha/include/uapi/asm/errno.h:78: note: this is the location of the previous definition
      78 | #define EXFULL          99      /* Exchange full */
         | 
   include/uapi/asm-generic/errno.h:36: warning: "ENOANO" redefined
      36 | #define ENOANO          55      /* No anode */
         | 
   arch/alpha/include/uapi/asm/errno.h:79: note: this is the location of the previous definition
      79 | #define ENOANO          100     /* No anode */
         | 
   include/uapi/asm-generic/errno.h:37: warning: "EBADRQC" redefined
      37 | #define EBADRQC         56      /* Invalid request code */
         | 
   arch/alpha/include/uapi/asm/errno.h:80: note: this is the location of the previous definition
      80 | #define EBADRQC         101     /* Invalid request code */
         | 
   include/uapi/asm-generic/errno.h:38: warning: "EBADSLT" redefined
      38 | #define EBADSLT         57      /* Invalid slot */
         | 
   arch/alpha/include/uapi/asm/errno.h:81: note: this is the location of the previous definition
      81 | #define EBADSLT         102     /* Invalid slot */
         | 
>> include/uapi/asm-generic/errno.h:42: warning: "EBFONT" redefined
      42 | #define EBFONT          59      /* Bad font file format */
         | 
   arch/alpha/include/uapi/asm/errno.h:85: note: this is the location of the previous definition
      85 | #define EBFONT          104     /* Bad font file format */
         | 
>> include/uapi/asm-generic/errno.h:43: warning: "ENOSTR" redefined
      43 | #define ENOSTR          60      /* Device not a stream */
         | 
   arch/alpha/include/uapi/asm/errno.h:60: note: this is the location of the previous definition
      60 | #define ENOSTR          87      /* Device not a stream */
         | 
>> include/uapi/asm-generic/errno.h:44: warning: "ENODATA" redefined
      44 | #define ENODATA         61      /* No data available */
         | 
   arch/alpha/include/uapi/asm/errno.h:59: note: this is the location of the previous definition
      59 | #define ENODATA         86      /* No data available */
         | 
>> include/uapi/asm-generic/errno.h:45: warning: "ETIME" redefined
      45 | #define ETIME           62      /* Timer expired */
         | 
   arch/alpha/include/uapi/asm/errno.h:56: note: this is the location of the previous definition
      56 | #define ETIME           83      /* Timer expired */
         | 
>> include/uapi/asm-generic/errno.h:46: warning: "ENOSR" redefined
      46 | #define ENOSR           63      /* Out of streams resources */
         | 
   arch/alpha/include/uapi/asm/errno.h:55: note: this is the location of the previous definition
      55 | #define ENOSR           82      /* Out of streams resources */
         | 
>> include/uapi/asm-generic/errno.h:47: warning: "ENONET" redefined
      47 | #define ENONET          64      /* Machine is not on the network */
         | 
   arch/alpha/include/uapi/asm/errno.h:86: note: this is the location of the previous definition
      86 | #define ENONET          105     /* Machine is not on the network */
         | 
>> include/uapi/asm-generic/errno.h:48: warning: "ENOPKG" redefined
      48 | #define ENOPKG          65      /* Package not installed */
         | 
   arch/alpha/include/uapi/asm/errno.h:62: note: this is the location of the previous definition
      62 | #define ENOPKG          92      /* Package not installed */
         | 
>> include/uapi/asm-generic/errno.h:49: warning: "EREMOTE" redefined
      49 | #define EREMOTE         66      /* Object is remote */
         | 
   arch/alpha/include/uapi/asm/errno.h:48: note: this is the location of the previous definition
      48 | #define EREMOTE         71      /* Object is remote */
         | 
>> include/uapi/asm-generic/errno.h:50: warning: "ENOLINK" redefined
      50 | #define ENOLINK         67      /* Link has been severed */
         | 
   arch/alpha/include/uapi/asm/errno.h:87: note: this is the location of the previous definition
      87 | #define ENOLINK         106     /* Link has been severed */
         | 
>> include/uapi/asm-generic/errno.h:51: warning: "EADV" redefined
      51 | #define EADV            68      /* Advertise error */
         | 
   arch/alpha/include/uapi/asm/errno.h:88: note: this is the location of the previous definition
      88 | #define EADV            107     /* Advertise error */
         | 
>> include/uapi/asm-generic/errno.h:52: warning: "ESRMNT" redefined
      52 | #define ESRMNT          69      /* Srmount error */
         | 
   arch/alpha/include/uapi/asm/errno.h:89: note: this is the location of the previous definition
      89 | #define ESRMNT          108     /* Srmount error */
         | 
>> include/uapi/asm-generic/errno.h:53: warning: "ECOMM" redefined
      53 | #define ECOMM           70      /* Communication error on send */
         | 
   arch/alpha/include/uapi/asm/errno.h:90: note: this is the location of the previous definition
      90 | #define ECOMM           109     /* Communication error on send */
         | 
>> include/uapi/asm-generic/errno.h:54: warning: "EPROTO" redefined
      54 | #define EPROTO          71      /* Protocol error */
         | 
   arch/alpha/include/uapi/asm/errno.h:58: note: this is the location of the previous definition
      58 | #define EPROTO          85      /* Protocol error */
         | 
   include/uapi/asm-generic/errno.h:55: warning: "EMULTIHOP" redefined
      55 | #define EMULTIHOP       72      /* Multihop attempted */
         | 
   arch/alpha/include/uapi/asm/errno.h:91: note: this is the location of the previous definition
      91 | #define EMULTIHOP       110     /* Multihop attempted */
         | 
>> include/uapi/asm-generic/errno.h:56: warning: "EDOTDOT" redefined
      56 | #define EDOTDOT         73      /* RFS specific error */
         | 
   arch/alpha/include/uapi/asm/errno.h:92: note: this is the location of the previous definition
      92 | #define EDOTDOT         111     /* RFS specific error */
         | 
   include/uapi/asm-generic/errno.h:57: warning: "EBADMSG" redefined
      57 | #define EBADMSG         74      /* Not a data message */
         | 
   arch/alpha/include/uapi/asm/errno.h:57: note: this is the location of the previous definition
      57 | #define EBADMSG         84      /* Not a data message */
         | 
   include/uapi/asm-generic/errno.h:58: warning: "EOVERFLOW" redefined
      58 | #define EOVERFLOW       75      /* Value too large for defined data type */
         | 
   arch/alpha/include/uapi/asm/errno.h:93: note: this is the location of the previous definition
      93 | #define EOVERFLOW       112     /* Value too large for defined data type */
         | 
   include/uapi/asm-generic/errno.h:59: warning: "ENOTUNIQ" redefined
      59 | #define ENOTUNIQ        76      /* Name not unique on network */
         | 
   arch/alpha/include/uapi/asm/errno.h:94: note: this is the location of the previous definition
      94 | #define ENOTUNIQ        113     /* Name not unique on network */
         | 
   include/uapi/asm-generic/errno.h:60: warning: "EBADFD" redefined
      60 | #define EBADFD          77      /* File descriptor in bad state */
         | 
   arch/alpha/include/uapi/asm/errno.h:95: note: this is the location of the previous definition
      95 | #define EBADFD          114     /* File descriptor in bad state */
         | 
   include/uapi/asm-generic/errno.h:61: warning: "EREMCHG" redefined
      61 | #define EREMCHG         78      /* Remote address changed */
         | 
   arch/alpha/include/uapi/asm/errno.h:96: note: this is the location of the previous definition
      96 | #define EREMCHG         115     /* Remote address changed */
         | 
   include/uapi/asm-generic/errno.h:62: warning: "ELIBACC" redefined
      62 | #define ELIBACC         79      /* Can not access a needed shared library */
         | 
   arch/alpha/include/uapi/asm/errno.h:104: note: this is the location of the previous definition
     104 | #define ELIBACC         122     /* Can not access a needed shared library */
         | 
   include/uapi/asm-generic/errno.h:63: warning: "ELIBBAD" redefined
      63 | #define ELIBBAD         80      /* Accessing a corrupted shared library */
         | 
   arch/alpha/include/uapi/asm/errno.h:105: note: this is the location of the previous definition
     105 | #define ELIBBAD         123     /* Accessing a corrupted shared library */
         | 
   include/uapi/asm-generic/errno.h:64: warning: "ELIBSCN" redefined
      64 | #define ELIBSCN         81      /* .lib section in a.out corrupted */
         | 
   arch/alpha/include/uapi/asm/errno.h:106: note: this is the location of the previous definition
     106 | #define ELIBSCN         124     /* .lib section in a.out corrupted */
         | 
   include/uapi/asm-generic/errno.h:65: warning: "ELIBMAX" redefined
      65 | #define ELIBMAX         82      /* Attempting to link in too many shared libraries */
         | 
   arch/alpha/include/uapi/asm/errno.h:107: note: this is the location of the previous definition
     107 | #define ELIBMAX         125     /* Attempting to link in too many shared libraries */
         | 
   include/uapi/asm-generic/errno.h:66: warning: "ELIBEXEC" redefined
      66 | #define ELIBEXEC        83      /* Cannot exec a shared library directly */
         | 
   arch/alpha/include/uapi/asm/errno.h:108: note: this is the location of the previous definition
     108 | #define ELIBEXEC        126     /* Cannot exec a shared library directly */
         | 
   include/uapi/asm-generic/errno.h:67: warning: "EILSEQ" redefined
      67 | #define EILSEQ          84      /* Illegal byte sequence */
         | 
   arch/alpha/include/uapi/asm/errno.h:64: note: this is the location of the previous definition
      64 | #define EILSEQ          116     /* Illegal byte sequence */
         | 
   include/uapi/asm-generic/errno.h:68: warning: "ERESTART" redefined
      68 | #define ERESTART        85      /* Interrupted system call should be restarted */
         | 
   arch/alpha/include/uapi/asm/errno.h:109: note: this is the location of the previous definition
     109 | #define ERESTART        127     /* Interrupted system call should be restarted */
         | 
   include/uapi/asm-generic/errno.h:69: warning: "ESTRPIPE" redefined
      69 | #define ESTRPIPE        86      /* Streams pipe error */
         | 
   arch/alpha/include/uapi/asm/errno.h:110: note: this is the location of the previous definition
     110 | #define ESTRPIPE        128     /* Streams pipe error */
         | 
   include/uapi/asm-generic/errno.h:70: warning: "EUSERS" redefined
      70 | #define EUSERS          87      /* Too many users */
         | 
   arch/alpha/include/uapi/asm/errno.h:45: note: this is the location of the previous definition
      45 | #define EUSERS          68      /* Too many users */
         | 
   include/uapi/asm-generic/errno.h:71: warning: "ENOTSOCK" redefined
      71 | #define ENOTSOCK        88      /* Socket operation on non-socket */
         | 
   arch/alpha/include/uapi/asm/errno.h:15: note: this is the location of the previous definition
      15 | #define ENOTSOCK        38      /* Socket operation on non-socket */
         | 
   include/uapi/asm-generic/errno.h:72: warning: "EDESTADDRREQ" redefined
      72 | #define EDESTADDRREQ    89      /* Destination address required */
         | 
   arch/alpha/include/uapi/asm/errno.h:16: note: this is the location of the previous definition
      16 | #define EDESTADDRREQ    39      /* Destination address required */


vim +/EBFONT +42 include/uapi/asm-generic/errno.h

e15f431fe2d53c include/uapi/asm-generic/errno.h Andy Lutomirski 2015-04-16   19  
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   20  #define	ENOTEMPTY	39	/* Directory not empty */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   21  #define	ELOOP		40	/* Too many symbolic links encountered */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   22  #define	EWOULDBLOCK	EAGAIN	/* Operation would block */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   23  #define	ENOMSG		42	/* No message of desired type */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   24  #define	EIDRM		43	/* Identifier removed */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   25  #define	ECHRNG		44	/* Channel number out of range */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   26  #define	EL2NSYNC	45	/* Level 2 not synchronized */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   27  #define	EL3HLT		46	/* Level 3 halted */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   28  #define	EL3RST		47	/* Level 3 reset */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   29  #define	ELNRNG		48	/* Link number out of range */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   30  #define	EUNATCH		49	/* Protocol driver not attached */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   31  #define	ENOCSI		50	/* No CSI structure available */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   32  #define	EL2HLT		51	/* Level 2 halted */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   33  #define	EBADE		52	/* Invalid exchange */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   34  #define	EBADR		53	/* Invalid request descriptor */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   35  #define	EXFULL		54	/* Exchange full */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   36  #define	ENOANO		55	/* No anode */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   37  #define	EBADRQC		56	/* Invalid request code */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @38  #define	EBADSLT		57	/* Invalid slot */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   39  
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   40  #define	EDEADLOCK	EDEADLK
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   41  
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @42  #define	EBFONT		59	/* Bad font file format */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @43  #define	ENOSTR		60	/* Device not a stream */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @44  #define	ENODATA		61	/* No data available */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @45  #define	ETIME		62	/* Timer expired */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @46  #define	ENOSR		63	/* Out of streams resources */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @47  #define	ENONET		64	/* Machine is not on the network */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @48  #define	ENOPKG		65	/* Package not installed */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @49  #define	EREMOTE		66	/* Object is remote */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @50  #define	ENOLINK		67	/* Link has been severed */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @51  #define	EADV		68	/* Advertise error */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @52  #define	ESRMNT		69	/* Srmount error */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @53  #define	ECOMM		70	/* Communication error on send */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @54  #define	EPROTO		71	/* Protocol error */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @55  #define	EMULTIHOP	72	/* Multihop attempted */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  @56  #define	EDOTDOT		73	/* RFS specific error */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   57  #define	EBADMSG		74	/* Not a data message */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   58  #define	EOVERFLOW	75	/* Value too large for defined data type */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   59  #define	ENOTUNIQ	76	/* Name not unique on network */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   60  #define	EBADFD		77	/* File descriptor in bad state */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   61  #define	EREMCHG		78	/* Remote address changed */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   62  #define	ELIBACC		79	/* Can not access a needed shared library */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   63  #define	ELIBBAD		80	/* Accessing a corrupted shared library */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   64  #define	ELIBSCN		81	/* .lib section in a.out corrupted */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   65  #define	ELIBMAX		82	/* Attempting to link in too many shared libraries */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   66  #define	ELIBEXEC	83	/* Cannot exec a shared library directly */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   67  #define	EILSEQ		84	/* Illegal byte sequence */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   68  #define	ERESTART	85	/* Interrupted system call should be restarted */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   69  #define	ESTRPIPE	86	/* Streams pipe error */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   70  #define	EUSERS		87	/* Too many users */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   71  #define	ENOTSOCK	88	/* Socket operation on non-socket */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   72  #define	EDESTADDRREQ	89	/* Destination address required */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   73  #define	EMSGSIZE	90	/* Message too long */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   74  #define	EPROTOTYPE	91	/* Protocol wrong type for socket */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   75  #define	ENOPROTOOPT	92	/* Protocol not available */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   76  #define	EPROTONOSUPPORT	93	/* Protocol not supported */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   77  #define	ESOCKTNOSUPPORT	94	/* Socket type not supported */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   78  #define	EOPNOTSUPP	95	/* Operation not supported on transport endpoint */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   79  #define	EPFNOSUPPORT	96	/* Protocol family not supported */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   80  #define	EAFNOSUPPORT	97	/* Address family not supported by protocol */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   81  #define	EADDRINUSE	98	/* Address already in use */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   82  #define	EADDRNOTAVAIL	99	/* Cannot assign requested address */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   83  #define	ENETDOWN	100	/* Network is down */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   84  #define	ENETUNREACH	101	/* Network is unreachable */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   85  #define	ENETRESET	102	/* Network dropped connection because of reset */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   86  #define	ECONNABORTED	103	/* Software caused connection abort */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   87  #define	ECONNRESET	104	/* Connection reset by peer */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   88  #define	ENOBUFS		105	/* No buffer space available */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   89  #define	EISCONN		106	/* Transport endpoint is already connected */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   90  #define	ENOTCONN	107	/* Transport endpoint is not connected */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   91  #define	ESHUTDOWN	108	/* Cannot send after transport endpoint shutdown */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   92  #define	ETOOMANYREFS	109	/* Too many references: cannot splice */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   93  #define	ETIMEDOUT	110	/* Connection timed out */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   94  #define	ECONNREFUSED	111	/* Connection refused */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   95  #define	EHOSTDOWN	112	/* Host is down */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   96  #define	EHOSTUNREACH	113	/* No route to host */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   97  #define	EALREADY	114	/* Operation already in progress */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16   98  #define	EINPROGRESS	115	/* Operation now in progress */
0ca43435188b9f include/uapi/asm-generic/errno.h Eric Sandeen    2013-11-12   99  #define	ESTALE		116	/* Stale file handle */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  100  #define	EUCLEAN		117	/* Structure needs cleaning */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  101  #define	ENOTNAM		118	/* Not a XENIX named type file */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  102  #define	ENAVAIL		119	/* No XENIX semaphores available */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  103  #define	EISNAM		120	/* Is a named type file */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  104  #define	EREMOTEIO	121	/* Remote I/O error */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  105  #define	EDQUOT		122	/* Quota exceeded */
^1da177e4c3f41 include/asm-generic/errno.h      Linus Torvalds  2005-04-16  106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
