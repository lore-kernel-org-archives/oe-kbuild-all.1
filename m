Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DA12206A6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 10:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156400; cv=none; b=FDwWSMVh5HETGGprMH+iX2shEElarZSG/Vd95eM8AIqdyW7EqcY1OtdTOgor66Wn3jgGI8dVHta0bflSziCVKkYQDGtfGNPA8DC1gG4yRJJ2dtzFB/kS8LTpFOih+Mobye2WLQltbQ1dLpKLELr5nuRptd7HrnuPbi7kNs8lVaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156400; c=relaxed/simple;
	bh=sT4vhQYERgpCFlqCS1bPYYCJ/h+3tCrQ5vYuuwClqeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NulApzr44tHHjgQm/UnP3tmWKHYVEZM1suqpLGGihvrc1sKcCWpJzemKt/xAkFDGLOedbhXtTgvIi6xSYPOKGlApLbOoJNQt+mPJWgP4oLDcaxRvAY5llC+MeneomNDgvQ0TCf9CkHw+d/Ei9XYJFiciIuHD335cWQYZbTCXFK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJn1IDwK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJn1IDwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750156399; x=1781692399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sT4vhQYERgpCFlqCS1bPYYCJ/h+3tCrQ5vYuuwClqeo=;
  b=eJn1IDwKy/7uEpy7G2NgSTzIrGdOXkqDv+zQd3Tm826AybSPVIrEkBuf
   GgCiBKAks8N0ijhldg7VKFienJd1WGXN9MMp6oDMJCnBDNpoVWh8LceZp
   5L67rZyLFznWgAg8tZgYMOwZV9Q96Cz36nbYyBZCA0KXx2ASKdauoWavr
   NF+buHehQBqXvGJHrjhicWgOFBPZEAEgYZ7K+kuyiEUjql9yhQPb7k2Ip
   PSUM9Wxp8fr061m0NIYGDBQDiHWp4BYn2Yh6EspZEAaWl2Q3MOauAgm85
   f65RqZ8YR0k4jRD4ZDuj3y8gv1JV22RYpSLeSZFCb6i9bRcmoU0j0cKbp
   Q==;
X-CSE-ConnectionGUID: lYm91YU2RzCcwt+MPmMOLw==
X-CSE-MsgGUID: zHNPEhf5RxuZPJWI6t2KmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="39932605"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="39932605"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 03:33:18 -0700
X-CSE-ConnectionGUID: PkdBpB7ATYGTU8Gqc6mTQw==
X-CSE-MsgGUID: 8J/zQpcCSE2SAYeNSV4sBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="149627519"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jun 2025 03:33:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRTcw-000Ft8-0B;
	Tue, 17 Jun 2025 10:33:14 +0000
Date: Tue, 17 Jun 2025 18:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 102/102] mm/slub.c:4040:1: warning:
 no previous prototype for function 'oot___kmalloc_0'
Message-ID: <202506171830.JOMTq9vp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8cbb260f5584b8ea3d3941593c23a2ddc27fe701
commit: baa47e1aa754428b439764393f2d71fb6bce04bf [102/102] anolis: mm: introduce per module slab for oot memory isolation
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250617/202506171830.JOMTq9vp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171830.JOMTq9vp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171830.JOMTq9vp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slub.c:4040:1: warning: no previous prototype for function 'oot___kmalloc_0' [-Wmissing-prototypes]
    4040 | DEFINE_OOT_FUNC___kmalloc(0);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:190:1: note: expanded from here
     190 | oot___kmalloc_0
         | ^
   mm/slub.c:4040:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4040 | DEFINE_OOT_FUNC___kmalloc(0);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4041:1: warning: no previous prototype for function 'oot___kmalloc_1' [-Wmissing-prototypes]
    4041 | DEFINE_OOT_FUNC___kmalloc(1);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:206:1: note: expanded from here
     206 | oot___kmalloc_1
         | ^
   mm/slub.c:4041:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4041 | DEFINE_OOT_FUNC___kmalloc(1);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4042:1: warning: no previous prototype for function 'oot___kmalloc_2' [-Wmissing-prototypes]
    4042 | DEFINE_OOT_FUNC___kmalloc(2);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:222:1: note: expanded from here
     222 | oot___kmalloc_2
         | ^
   mm/slub.c:4042:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4042 | DEFINE_OOT_FUNC___kmalloc(2);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4043:1: warning: no previous prototype for function 'oot___kmalloc_3' [-Wmissing-prototypes]
    4043 | DEFINE_OOT_FUNC___kmalloc(3);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:16:1: note: expanded from here
      16 | oot___kmalloc_3
         | ^
   mm/slub.c:4043:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4043 | DEFINE_OOT_FUNC___kmalloc(3);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4044:1: warning: no previous prototype for function 'oot___kmalloc_4' [-Wmissing-prototypes]
    4044 | DEFINE_OOT_FUNC___kmalloc(4);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:32:1: note: expanded from here
      32 | oot___kmalloc_4
         | ^
   mm/slub.c:4044:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4044 | DEFINE_OOT_FUNC___kmalloc(4);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4045:1: warning: no previous prototype for function 'oot___kmalloc_5' [-Wmissing-prototypes]
    4045 | DEFINE_OOT_FUNC___kmalloc(5);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:48:1: note: expanded from here
      48 | oot___kmalloc_5
         | ^
   mm/slub.c:4045:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4045 | DEFINE_OOT_FUNC___kmalloc(5);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4046:1: warning: no previous prototype for function 'oot___kmalloc_6' [-Wmissing-prototypes]
    4046 | DEFINE_OOT_FUNC___kmalloc(6);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:64:1: note: expanded from here
      64 | oot___kmalloc_6
         | ^
   mm/slub.c:4046:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4046 | DEFINE_OOT_FUNC___kmalloc(6);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4047:1: warning: no previous prototype for function 'oot___kmalloc_7' [-Wmissing-prototypes]
    4047 | DEFINE_OOT_FUNC___kmalloc(7);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:80:1: note: expanded from here
      80 | oot___kmalloc_7
         | ^
   mm/slub.c:4047:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4047 | DEFINE_OOT_FUNC___kmalloc(7);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4048:1: warning: no previous prototype for function 'oot___kmalloc_8' [-Wmissing-prototypes]
    4048 | DEFINE_OOT_FUNC___kmalloc(8);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:96:1: note: expanded from here
      96 | oot___kmalloc_8
         | ^
   mm/slub.c:4048:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4048 | DEFINE_OOT_FUNC___kmalloc(8);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4049:1: warning: no previous prototype for function 'oot___kmalloc_9' [-Wmissing-prototypes]
    4049 | DEFINE_OOT_FUNC___kmalloc(9);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:112:1: note: expanded from here
     112 | oot___kmalloc_9
         | ^
   mm/slub.c:4049:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4049 | DEFINE_OOT_FUNC___kmalloc(9);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4050:1: warning: no previous prototype for function 'oot___kmalloc_10' [-Wmissing-prototypes]
    4050 | DEFINE_OOT_FUNC___kmalloc(10);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:128:1: note: expanded from here
     128 | oot___kmalloc_10
         | ^
   mm/slub.c:4050:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4050 | DEFINE_OOT_FUNC___kmalloc(10);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4051:1: warning: no previous prototype for function 'oot___kmalloc_11' [-Wmissing-prototypes]
    4051 | DEFINE_OOT_FUNC___kmalloc(11);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:144:1: note: expanded from here
     144 | oot___kmalloc_11
         | ^
   mm/slub.c:4051:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4051 | DEFINE_OOT_FUNC___kmalloc(11);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4052:1: warning: no previous prototype for function 'oot___kmalloc_12' [-Wmissing-prototypes]
    4052 | DEFINE_OOT_FUNC___kmalloc(12);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:160:1: note: expanded from here
     160 | oot___kmalloc_12
         | ^
   mm/slub.c:4052:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4052 | DEFINE_OOT_FUNC___kmalloc(12);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4053:1: warning: no previous prototype for function 'oot___kmalloc_13' [-Wmissing-prototypes]
    4053 | DEFINE_OOT_FUNC___kmalloc(13);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:2:1: note: expanded from here
       2 | oot___kmalloc_13
         | ^
   mm/slub.c:4053:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4053 | DEFINE_OOT_FUNC___kmalloc(13);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4054:1: warning: no previous prototype for function 'oot___kmalloc_14' [-Wmissing-prototypes]
    4054 | DEFINE_OOT_FUNC___kmalloc(14);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:18:1: note: expanded from here
      18 | oot___kmalloc_14
         | ^
   mm/slub.c:4054:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4054 | DEFINE_OOT_FUNC___kmalloc(14);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4055:1: warning: no previous prototype for function 'oot___kmalloc_15' [-Wmissing-prototypes]
    4055 | DEFINE_OOT_FUNC___kmalloc(15);
         | ^
   mm/slub.c:4017:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4017 | void *oot___kmalloc_ ## index(size_t size, gfp_t flags)                 \
         |       ^
   <scratch space>:34:1: note: expanded from here
      34 | oot___kmalloc_15
         | ^
   mm/slub.c:4055:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4055 | DEFINE_OOT_FUNC___kmalloc(15);
         | ^
         | static 
   mm/slub.c:4016:45: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc'
    4016 | #define DEFINE_OOT_FUNC___kmalloc(index)                                \
         |                                                                         ^
>> mm/slub.c:4136:1: warning: no previous prototype for function 'oot___kmalloc_node_0' [-Wmissing-prototypes]
    4136 | DEFINE_OOT_FUNC___kmalloc_node(0);
         | ^
   mm/slub.c:4106:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:66:1: note: expanded from here
      66 | oot___kmalloc_node_0
         | ^
   mm/slub.c:4136:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4136 | DEFINE_OOT_FUNC___kmalloc_node(0);
         | ^
         | static 
   mm/slub.c:4105:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4105 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slub.c:4137:1: warning: no previous prototype for function 'oot___kmalloc_node_1' [-Wmissing-prototypes]
    4137 | DEFINE_OOT_FUNC___kmalloc_node(1);
         | ^
   mm/slub.c:4106:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:83:1: note: expanded from here
      83 | oot___kmalloc_node_1
         | ^
   mm/slub.c:4137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4137 | DEFINE_OOT_FUNC___kmalloc_node(1);
         | ^
         | static 
   mm/slub.c:4105:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4105 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slub.c:4138:1: warning: no previous prototype for function 'oot___kmalloc_node_2' [-Wmissing-prototypes]
    4138 | DEFINE_OOT_FUNC___kmalloc_node(2);
         | ^
   mm/slub.c:4106:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:100:1: note: expanded from here
     100 | oot___kmalloc_node_2
         | ^
   mm/slub.c:4138:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4138 | DEFINE_OOT_FUNC___kmalloc_node(2);
         | ^
         | static 
   mm/slub.c:4105:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4105 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
>> mm/slub.c:4139:1: warning: no previous prototype for function 'oot___kmalloc_node_3' [-Wmissing-prototypes]
    4139 | DEFINE_OOT_FUNC___kmalloc_node(3);
         | ^
   mm/slub.c:4106:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:117:1: note: expanded from here
     117 | oot___kmalloc_node_3
         | ^
   mm/slub.c:4139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4139 | DEFINE_OOT_FUNC___kmalloc_node(3);
         | ^
         | static 
   mm/slub.c:4105:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4105 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
   mm/slub.c:4140:1: warning: no previous prototype for function 'oot___kmalloc_node_4' [-Wmissing-prototypes]
    4140 | DEFINE_OOT_FUNC___kmalloc_node(4);
         | ^
   mm/slub.c:4106:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:134:1: note: expanded from here
     134 | oot___kmalloc_node_4
         | ^
   mm/slub.c:4140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4140 | DEFINE_OOT_FUNC___kmalloc_node(4);
         | ^
         | static 
   mm/slub.c:4105:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4105 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
   mm/slub.c:4141:1: warning: no previous prototype for function 'oot___kmalloc_node_5' [-Wmissing-prototypes]
    4141 | DEFINE_OOT_FUNC___kmalloc_node(5);
         | ^
   mm/slub.c:4106:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:151:1: note: expanded from here
     151 | oot___kmalloc_node_5
         | ^
   mm/slub.c:4141:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4141 | DEFINE_OOT_FUNC___kmalloc_node(5);
         | ^
         | static 
   mm/slub.c:4105:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4105 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
   mm/slub.c:4142:1: warning: no previous prototype for function 'oot___kmalloc_node_6' [-Wmissing-prototypes]
    4142 | DEFINE_OOT_FUNC___kmalloc_node(6);
         | ^
   mm/slub.c:4106:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:5:1: note: expanded from here
       5 | oot___kmalloc_node_6
         | ^
   mm/slub.c:4142:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4142 | DEFINE_OOT_FUNC___kmalloc_node(6);
         | ^
         | static 
   mm/slub.c:4105:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4105 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
   mm/slub.c:4143:1: warning: no previous prototype for function 'oot___kmalloc_node_7' [-Wmissing-prototypes]
    4143 | DEFINE_OOT_FUNC___kmalloc_node(7);
         | ^
   mm/slub.c:4106:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:22:1: note: expanded from here
      22 | oot___kmalloc_node_7
         | ^
   mm/slub.c:4143:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4143 | DEFINE_OOT_FUNC___kmalloc_node(7);
         | ^
         | static 
   mm/slub.c:4105:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4105 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
   mm/slub.c:4144:1: warning: no previous prototype for function 'oot___kmalloc_node_8' [-Wmissing-prototypes]
    4144 | DEFINE_OOT_FUNC___kmalloc_node(8);
         | ^
   mm/slub.c:4106:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \
         |       ^
   <scratch space>:39:1: note: expanded from here
      39 | oot___kmalloc_node_8
         | ^
   mm/slub.c:4144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4144 | DEFINE_OOT_FUNC___kmalloc_node(8);
         | ^
         | static 
   mm/slub.c:4105:50: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4105 | #define DEFINE_OOT_FUNC___kmalloc_node(index)                           \
         |                                                                         ^
   mm/slub.c:4145:1: warning: no previous prototype for function 'oot___kmalloc_node_9' [-Wmissing-prototypes]
    4145 | DEFINE_OOT_FUNC___kmalloc_node(9);
         | ^
   mm/slub.c:4106:7: note: expanded from macro 'DEFINE_OOT_FUNC___kmalloc_node'
    4106 | void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)  \


vim +/oot___kmalloc_0 +4040 mm/slub.c

  4039	
> 4040	DEFINE_OOT_FUNC___kmalloc(0);
> 4041	DEFINE_OOT_FUNC___kmalloc(1);
> 4042	DEFINE_OOT_FUNC___kmalloc(2);
> 4043	DEFINE_OOT_FUNC___kmalloc(3);
> 4044	DEFINE_OOT_FUNC___kmalloc(4);
> 4045	DEFINE_OOT_FUNC___kmalloc(5);
> 4046	DEFINE_OOT_FUNC___kmalloc(6);
> 4047	DEFINE_OOT_FUNC___kmalloc(7);
> 4048	DEFINE_OOT_FUNC___kmalloc(8);
> 4049	DEFINE_OOT_FUNC___kmalloc(9);
> 4050	DEFINE_OOT_FUNC___kmalloc(10);
> 4051	DEFINE_OOT_FUNC___kmalloc(11);
> 4052	DEFINE_OOT_FUNC___kmalloc(12);
> 4053	DEFINE_OOT_FUNC___kmalloc(13);
> 4054	DEFINE_OOT_FUNC___kmalloc(14);
> 4055	DEFINE_OOT_FUNC___kmalloc(15);
  4056	
  4057	#ifdef CONFIG_NUMA
  4058	static void *kmalloc_large_node(size_t size, gfp_t flags, int node)
  4059	{
  4060		struct page *page;
  4061		void *ptr = NULL;
  4062		unsigned int order = get_order(size);
  4063	
  4064		flags |= __GFP_COMP;
  4065		page = alloc_pages_node(node, flags, order);
  4066		if (page) {
  4067			ptr = page_address(page);
  4068			mod_lruvec_page_state(page, NR_SLAB_UNRECLAIMABLE_B,
  4069					      PAGE_SIZE << order);
  4070		}
  4071	
  4072		return kmalloc_large_node_hook(ptr, size, flags);
  4073	}
  4074	
  4075	void *__kmalloc_node(size_t size, gfp_t flags, int node)
  4076	{
  4077		struct kmem_cache *s;
  4078		void *ret;
  4079	
  4080		if (unlikely(size > KMALLOC_MAX_CACHE_SIZE)) {
  4081			ret = kmalloc_large_node(size, flags, node);
  4082	
  4083			trace_kmalloc_node(_RET_IP_, ret,
  4084					   size, PAGE_SIZE << get_order(size),
  4085					   flags, node);
  4086	
  4087			return ret;
  4088		}
  4089	
  4090		s = kmalloc_slab(size, flags);
  4091	
  4092		if (unlikely(ZERO_OR_NULL_PTR(s)))
  4093			return s;
  4094	
  4095		ret = slab_alloc_node(s, flags, node, _RET_IP_, size);
  4096	
  4097		trace_kmalloc_node(_RET_IP_, ret, size, s->size, flags, node);
  4098	
  4099		ret = kasan_kmalloc(s, ret, size, flags);
  4100	
  4101		return ret;
  4102	}
  4103	EXPORT_SYMBOL(__kmalloc_node);
  4104	
  4105	#define DEFINE_OOT_FUNC___kmalloc_node(index)				\
  4106	void *oot___kmalloc_node_ ## index(size_t size, gfp_t flags, int node)	\
  4107	{									\
  4108		struct kmem_cache *s;						\
  4109		void *ret;							\
  4110										\
  4111		if (unlikely(size > KMALLOC_MAX_CACHE_SIZE)) {			\
  4112			ret = kmalloc_large_node(size, flags, node);		\
  4113										\
  4114			trace_kmalloc_node(_RET_IP_, ret,			\
  4115					   size, PAGE_SIZE << get_order(size),	\
  4116					   flags, node);			\
  4117										\
  4118			return ret;						\
  4119		}								\
  4120										\
  4121		s = oot_kmalloc_slab(index, size, flags);			\
  4122										\
  4123		if (unlikely(ZERO_OR_NULL_PTR(s)))				\
  4124			return s;						\
  4125										\
  4126		ret = slab_alloc_node(s, flags, node, _RET_IP_, size);		\
  4127										\
  4128		trace_kmalloc_node(_RET_IP_, ret, size, s->size, flags, node);	\
  4129										\
  4130		ret = kasan_kmalloc(s, ret, size, flags);			\
  4131										\
  4132		return ret;							\
  4133	}									\
  4134	EXPORT_SYMBOL(oot___kmalloc_node_ ## index)
  4135	
> 4136	DEFINE_OOT_FUNC___kmalloc_node(0);
> 4137	DEFINE_OOT_FUNC___kmalloc_node(1);
> 4138	DEFINE_OOT_FUNC___kmalloc_node(2);
> 4139	DEFINE_OOT_FUNC___kmalloc_node(3);
> 4140	DEFINE_OOT_FUNC___kmalloc_node(4);
> 4141	DEFINE_OOT_FUNC___kmalloc_node(5);
> 4142	DEFINE_OOT_FUNC___kmalloc_node(6);
> 4143	DEFINE_OOT_FUNC___kmalloc_node(7);
> 4144	DEFINE_OOT_FUNC___kmalloc_node(8);
> 4145	DEFINE_OOT_FUNC___kmalloc_node(9);
> 4146	DEFINE_OOT_FUNC___kmalloc_node(10);
> 4147	DEFINE_OOT_FUNC___kmalloc_node(11);
> 4148	DEFINE_OOT_FUNC___kmalloc_node(12);
> 4149	DEFINE_OOT_FUNC___kmalloc_node(13);
> 4150	DEFINE_OOT_FUNC___kmalloc_node(14);
> 4151	DEFINE_OOT_FUNC___kmalloc_node(15);
  4152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
