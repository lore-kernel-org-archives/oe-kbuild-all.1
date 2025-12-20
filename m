Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA12B26F2AF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766243477; cv=none; b=cEBGqOKcyCljQ/UYBeGbFw80hT3WqZeRgQGbF1NPLpFKrdgN1ApJs5297qGkguCCwL/fEZxH2HJSLRa0YTbRDsytCNl3rrh/iQsaenWLyScIHTLU1VrZx+yGxN3o+DgAekGtazAQS0uV3o8qWYPWZUuRK1FCyfBDMy2CDNNFr/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766243477; c=relaxed/simple;
	bh=9ijcfqGSRiUKRBls/ey+/ycM1/Kjau12YrSVVuW72RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkC6Lvp0Qp/M/Xs3NG3bHTV9cCLniZILwKKFh9xwdSehtVGYqB9cdT9RL5CeRgYZlxEoEYPLy5xvqDqVtWE5BpVUFh9WUE494uAVktDaOMKwj1CI8oFC5XBIgZilxVYim/7vIE1WGY6OO5WQZyyanFIlBZjfYrUgLy1uZxiaD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1d3NpD7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1d3NpD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766243476; x=1797779476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ijcfqGSRiUKRBls/ey+/ycM1/Kjau12YrSVVuW72RM=;
  b=C1d3NpD7SOSgyQNXc6IN5os8lslVTChn6nSJNvUG9C/9DpF54efSBVx9
   OS85rmoCPdu8kR2a6Q3G3cDy4qB6CQCqgt1uCcNntaIg9fqfiqmYgtJwf
   q/tjgMqamrs6ZG7w05b/Ks8BVqHRSqUWquLssRCEa1s0U6lppwi9K7Vnb
   /JYN8lqF35d/7E5ngtuj0pW/Y/Sto/JYrndVVx9MjcxBRc7aeFSFvrPqH
   9rOkRI0jITAtnUQurIP/79yXnwz3bitcb+8a7pMEN4b1byywLqrCQk+ef
   WO2WSwro3ms6RdOZ7CD9rG3HWrWQtRA7HM+5QJ1o6BCPahf220beppCsJ
   A==;
X-CSE-ConnectionGUID: vXE2wO8hRVSxetif0k5qCw==
X-CSE-MsgGUID: ODYhfGZdTgqghZFSFFuNlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85592498"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85592498"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:11:13 -0800
X-CSE-ConnectionGUID: IiJDp0jvS9Wo7bF1VoVh+g==
X-CSE-MsgGUID: 9PECquMgTxO6vZMJ5nsW6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="229788590"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Dec 2025 07:11:13 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWybu-000000004il-0oVC;
	Sat, 20 Dec 2025 15:11:10 +0000
Date: Sat, 20 Dec 2025 23:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan =?iso-8859-1?Q?S=F8rensen?= <ssorensen@roku.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] Bluetooth: mgmt: Add idle_timeout to configurable
 system parameters
Message-ID: <202512202236.I5VEcbqG-lkp@intel.com>
References: <20251216092011.111208-4-ssorensen@roku.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216092011.111208-4-ssorensen@roku.com>

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on linus/master v6.19-rc1]
[cannot apply to bluetooth-next/master next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-S-rensen/Bluetooth-hci_conn-use-mod_delayed_work-for-active-mode-timeout/20251216-172823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20251216092011.111208-4-ssorensen%40roku.com
patch subject: [PATCH 3/3] Bluetooth: mgmt: Add idle_timeout to configurable system parameters
config: parisc-randconfig-002-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202236.I5VEcbqG-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202236.I5VEcbqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202236.I5VEcbqG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/parisc/include/uapi/asm/byteorder.h:5,
                    from arch/parisc/include/asm/bitops.h:11,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/net/bluetooth/bluetooth.h:29,
                    from net/bluetooth/mgmt_config.c:7:
   net/bluetooth/mgmt_config.c: In function 'read_def_system_config':
>> include/uapi/linux/byteorder/big_endian.h:34:26: warning: conversion from 'unsigned int' to 'short unsigned int' changes value from '536870912' to '0' [-Woverflow]
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                          ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   net/bluetooth/mgmt_config.c:40:19: note: in expansion of macro 'cpu_to_le32'
      40 |                 { cpu_to_le32(_param_code_), sizeof(__u32) }, \
         |                   ^~~~~~~~~~~
   net/bluetooth/mgmt_config.c:127:17: note: in expansion of macro 'TLV_SET_U32'
     127 |                 TLV_SET_U32(0x0020, idle_timeout),
         |                 ^~~~~~~~~~~
--
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/parisc/include/uapi/asm/byteorder.h:5,
                    from arch/parisc/include/asm/bitops.h:11,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/net/bluetooth/bluetooth.h:29,
                    from mgmt_config.c:7:
   mgmt_config.c: In function 'read_def_system_config':
>> include/uapi/linux/byteorder/big_endian.h:34:26: warning: conversion from 'unsigned int' to 'short unsigned int' changes value from '536870912' to '0' [-Woverflow]
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                          ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   mgmt_config.c:40:19: note: in expansion of macro 'cpu_to_le32'
      40 |                 { cpu_to_le32(_param_code_), sizeof(__u32) }, \
         |                   ^~~~~~~~~~~
   mgmt_config.c:127:17: note: in expansion of macro 'TLV_SET_U32'
     127 |                 TLV_SET_U32(0x0020, idle_timeout),
         |                 ^~~~~~~~~~~


vim +34 include/uapi/linux/byteorder/big_endian.h

5921e6f8809b16 David Howells 2012-10-13  15  
5921e6f8809b16 David Howells 2012-10-13  16  #define __constant_htonl(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  17  #define __constant_ntohl(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  18  #define __constant_htons(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  19  #define __constant_ntohs(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  20  #define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  21  #define __constant_le64_to_cpu(x) ___constant_swab64((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  22  #define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  23  #define __constant_le32_to_cpu(x) ___constant_swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  24  #define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  25  #define __constant_le16_to_cpu(x) ___constant_swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  26  #define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  27  #define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  28  #define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  29  #define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  30  #define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  31  #define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  32  #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  33  #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13 @34  #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  35  #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  36  #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  37  #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  38  #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  39  #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  40  #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  41  #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  42  #define __cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  43  #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  44  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
