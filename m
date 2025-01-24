Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003A6433A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737724126; cv=none; b=NwM+9/NzQR7WIVukaohxqqiCiu9UCevDn8NLJvJhthjIORv/e5Cr+g27sLRcl3KWD9fwOb9vWwzE5mlAKQ6kLjoySGcfkRXm4gOCYPBEky7pNhEcBDho1OxkAtCsTsqGHsUMGIF7FMkkZJ8hi/WJlUx5dJqKE6QcAcrTOiaK3WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737724126; c=relaxed/simple;
	bh=ERy+KU0tVjgPZnJVH7Zsbv9rVqGYibFnxMhJK626JoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J1RnxHjVHvbqUNFWqucKjcCwwlSjsQpeLy1g3Bk0zkQVHCMH4vnaNTYJiCKEih/2p69LbakgrvAoagBewDbSGjzkMHaKAJeouYfrZUORhb4MujzAtNiNFga2bQGGmtCFp9OxNu8rBKTTYcJZgDZb4zqzX94uOjB2vNVeHglJRqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8Bl8qEx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8Bl8qEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737724125; x=1769260125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ERy+KU0tVjgPZnJVH7Zsbv9rVqGYibFnxMhJK626JoQ=;
  b=F8Bl8qEx3wsj6hlo1e69muf5F2YFPiBRd3gMJjpkDzXndZK/o4bPpB2Q
   TkGpxzuc5d/zBuuQP4SepNGb2DrBnMned+TH3AeIACrtqFlJN4uN+GQad
   MewxOGeky9DjCf4gW6tmHLpc45gEP3bwNyNd4YUyoKp+2VAIlJwX+aJw7
   g4TCLFcP9wYevynR16jjSiFHPX+HlDGHrb2h9DFW2jJbqRZgch5h+crfu
   +GAymACdvNO6kT+TEOwnc2Y8F9J8C11qBcJeGVjZcHHK01MO3egMOoUC1
   5Adp3sF8j3kvNUQOWCgvOXFik2uKGA8Cr4Ib/5zsYLQsTmnAYVmnRkNJS
   g==;
X-CSE-ConnectionGUID: oGeRpqI3R0anHa7T8X9ONg==
X-CSE-MsgGUID: iZyoO74BTwa830b/NT/V7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38399593"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="38399593"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 05:08:44 -0800
X-CSE-ConnectionGUID: Ayjkgdr0R+yqqcC8Mpjv6Q==
X-CSE-MsgGUID: ht5YXpfERaqf5dBc/xaW+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138638677"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jan 2025 05:08:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbJQO-000chB-0Z;
	Fri, 24 Jan 2025 13:08:40 +0000
Date: Fri, 24 Jan 2025 21:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1841/1841] include/trace/stages/init.h:2:23:
 warning: 'str__fs__trace_system_name' defined but not used
Message-ID: <202501242129.SwiNXW4P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6b6d5871437c4adda78a8fb495b923380a7f9d2e
commit: e127275c9aa7024511b06e1f31374bd242c461b0 [1841/1841] vfs: add bare tracepoints for vfs read and release
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250124/202501242129.SwiNXW4P-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501242129.SwiNXW4P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501242129.SwiNXW4P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/events/fs.h:33,
                    from fs/read_write.c:28:
>> include/trace/stages/init.h:2:23: warning: 'str__fs__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/str__fs__trace_system_name +2 include/trace/stages/init.h

af6b9668e85ffd Steven Rostedt (Google  2022-03-03 @2) #define __app__(x, y) str__##x##y
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  3) #define __app(x, y) __app__(x, y)
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  4) 

:::::: The code at line 2 was first introduced by commit
:::::: af6b9668e85ffd1502aada8036ccbf4dbd481708 tracing: Move the defines to create TRACE_EVENTS into their own files

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
