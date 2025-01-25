Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E3223B0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737806517; cv=none; b=MAiQvhuYvAjPqbaJmjnS3hf3jMaU4r8n/9kknykd9m7s1/Nn0j7Yu+X6wHVTrGARlmSixdWABl2dFiJQMPx3BvyY280a4gaQP2mr98k1G99vKZ9No4krdGU93NVt2qZFTXMNMGkM0ndwJ1BiMTLD2bWtQuGiIzaooLfdPxFWj7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737806517; c=relaxed/simple;
	bh=zGzTCaM1bnuzpd6KhWbBQp1j0ccW10dZjFRJRJPZi6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=grrlvSJDFedcnxYxprl3rPJKPm0jU/XtiQUU+jHI9OFJuEyXCIcR9fWBTKzWc7Sv8z36xyUCbwYPVWOY401bXF/6XZuAiHIP7aLWf23MEI7gjIAH9dfxFkb/Qelufmk8fbFFnrwrhtQKWjCB64hUUtrKdmTOp11BQhFQfkdYvcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msS85RtW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msS85RtW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737806515; x=1769342515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zGzTCaM1bnuzpd6KhWbBQp1j0ccW10dZjFRJRJPZi6k=;
  b=msS85RtW/SVqgOcl+OR4AQgUG/8CPzSKaIL0IkNEmUVT3axZRWNSD8xt
   gvgg0UZ7hfNSjp6R3AgsRviuy3L3WfxE+2B9u5YEqi0fA86A2/wj5K55o
   ngJ4HU9pHkn7mBLt+NM5Kedtg55YjOVK2EGLg+vKV8fvmAE9cn00g/G3s
   b644N0kUymje0nfa+CSYH7sSuLcz74G7rojJPMDRJqXGWP/s7ExSNwGGO
   nkYAssmP74jhmFlKGbICh7ExqA1kDahp4no638Ki/ObhS2MdFKWoEnucS
   T7Lml7g4imf3ojvPg/Ko/nak/eAQt4YAMGPYkVS1Cp6u3ED3TYKjhQjW4
   Q==;
X-CSE-ConnectionGUID: qU6G5wnHTUCBhNvQ0mbBkg==
X-CSE-MsgGUID: J2FdZ+Y3Qb6DjeGxk1S40w==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38211641"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="38211641"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 04:01:55 -0800
X-CSE-ConnectionGUID: fcur7ZlxT3ihrYO1OMtoTg==
X-CSE-MsgGUID: qS7BOudlSqGXVEg+0alMcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112030898"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jan 2025 04:01:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tberH-000dmt-16;
	Sat, 25 Jan 2025 12:01:51 +0000
Date: Sat, 25 Jan 2025 20:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2024-11 10/10]
 include/trace/trace_events.h:27:23: warning: 'str__sched__trace_system_name'
 defined but not used
Message-ID: <202501251947.sS9GmEBE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yun,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2024-11
head:   ea4a6f067d3f7ae0ae3d460716449adf06a5ff15
commit: a1fc1fba460be48dff2484b438888ede557930d4 [10/10] ANDROID: sched: add restrict vendor hook to modify task placement policy in EAS
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250125/202501251947.sS9GmEBE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251947.sS9GmEBE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251947.sS9GmEBE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/sched.h:23,
                    from drivers/android/vendor_hooks.c:11:
>> include/trace/trace_events.h:27:23: warning: 'str__sched__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/str__sched__trace_system_name +27 include/trace/trace_events.h

acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  26) 
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31 @27) #define __app__(x, y) str__##x##y
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  28) #define __app(x, y) __app__(x, y)
acd388fd3af350 include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  29) 

:::::: The code at line 27 was first introduced by commit
:::::: acd388fd3af350ab24c6ab6f19b83fc4a4f3aa60 tracing: Give system name a pointer

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
