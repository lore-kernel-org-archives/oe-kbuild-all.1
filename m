Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AB03C00
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 08:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737705975; cv=none; b=EfXNsMDMVptfUOdDluTCqpencQad9QqzpfyFobYgJg6DFAMW2Xcpt2wdk4BC0pv34BnYieSzU5kgApIyIKFi8w1lVxfXqC/RuK7IFdhTtfNT9H6Kj10ubOw5pgKmiPr4tcfF/uTKua+jQilEVk6zQurbTzRw2CQbi6/ZurP8BqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737705975; c=relaxed/simple;
	bh=pj+mHQaNWfitLBPZYBfSC2xXx+037GaPX/9xJkNrrEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRDv0QWesIbjJhbGO4n69KV1trW20V1amkMQSI0uB7R4i2tSZ+8qiJ50el9M8GLHyWnyqzd/+wh2Q0kth07nvJoRKf0pUedW3qdLojLacFPT4uPbYy/VJZML9/ts4qsF2UyEpEsHGzNiwvnKPVT9+47eZJseTDVzyLTymWV406w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ez6B2/2o; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ez6B2/2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737705973; x=1769241973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pj+mHQaNWfitLBPZYBfSC2xXx+037GaPX/9xJkNrrEM=;
  b=Ez6B2/2oYa7AT13VPBMtR46AOKVJDOhqv+YL3y3Dh9AjR366K8isL1eR
   YNOywFLdpyps5qOaYlKkvsRVY/pSLqcSWXfHFatD/PvPl7YCEzlO3/1WK
   WzRAeHGw5EsxAkLSXzgcjrxNHXqpbxZK/NblfnCSgqlyaAQ/HW19khpwH
   8mqtZB7tBYOBnLFSzGsKBqHJnZs+sPVgTleuEVfVpAQRCuIqeSsJPJW60
   qCu+DwoNc8yHNWHkMOpk88VIeBnIR06qNLyBTLDC0Pu4NJxxgAmN6NpVE
   MtvbuMmkcGNlSCDAolCLul/+3y1lGXR0NJCKWstHgAoVLRcULxh8i+9rW
   Q==;
X-CSE-ConnectionGUID: l4RBlTdSR0iOitvMLy7EjQ==
X-CSE-MsgGUID: xg7+OE70Q92lnP8qcwJOFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="63586756"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="63586756"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 00:06:12 -0800
X-CSE-ConnectionGUID: YtKQLaruQ3aogvk2IFv7gg==
X-CSE-MsgGUID: Q8uqRGXFQJSFLKfKHf4Kvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107509719"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jan 2025 00:06:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbEhc-000cPp-2w;
	Fri, 24 Jan 2025 08:06:08 +0000
Date: Fri, 24 Jan 2025 16:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhengchao Shao <shaozhengchao@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1841/1841] include/trace/stages/init.h:2:23:
 warning: 'str__bonding__trace_system_name' defined but not used
Message-ID: <202501241646.6wTHZP2L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wei,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1b973c5f4ead8093d8018eb8c3aad83f34724173
commit: 69ddcb21328bd29cfd2f64710bdac158f4c90bf6 [1841/1841] drivers: hooks: add bonding driver vendor hooks
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250124/202501241646.6wTHZP2L-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241646.6wTHZP2L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241646.6wTHZP2L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/hooks/bonding.h:27,
                    from drivers/hooks/vendor_hooks.c:11:
>> include/trace/stages/init.h:2:23: warning: 'str__bonding__trace_system_name' defined but not used [-Wunused-const-variable=]
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


vim +/str__bonding__trace_system_name +2 include/trace/stages/init.h

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
