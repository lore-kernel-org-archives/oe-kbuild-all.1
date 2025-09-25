Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD1A25F988
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 18:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758824894; cv=none; b=KdAjHJrMmzSUw4Dr9YLGG0FalyTXNATCxNIjxTmPyZYU3G3aFiZmJoU2h4uOK5r1+IfxVH6Jm35Yv5KWWdVVVXSkhDyI5fIwuAvTqDlWTjUzAHu6FLK+rR0L7p8jEMsAPI1nlLsj3c2ZzkzYxrSElFhLCY1lkYqyjndTUdWBh40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758824894; c=relaxed/simple;
	bh=NyYt/dWEFH8od8JbmSCru8L33Z1DpQV5wZoK7jAuZXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SIpAOA6/mnWyEVMCKP1xTMoDpK5qerr4i2Udm39A8OBSo0Bn+xuA/a4bWR36szB0t+aTNvxsTDQcmfKErnDiFnTexdxC9MD+1nBjIJ7oXqCehYQjvLGMDAVjmUXZSQRc7Y6rVDXVlalqDcS93cJaurQXP6SCflxIej0gGfex4I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKedQLOI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKedQLOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758824892; x=1790360892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NyYt/dWEFH8od8JbmSCru8L33Z1DpQV5wZoK7jAuZXQ=;
  b=nKedQLOIyEn79+XrLVXT7Sf20vURuycGcXhq0u1OXFpHe9hUuJyI2h8i
   E0ZWCtJwzPCgYY53qQV0I8oq8z49dP6T26QTnajmyehaPmgM3iUiPC5NE
   ZcBsrJj7BdUDBlu3QBMRqIvVPYDlMmuDd0hvu9ayvD7OmWb73EhMDNB7Q
   0lqwW4adJWeV8g7ZgPZLB7p658TJfv0jWo/WmXn+1s8VjdJQzt6f6nz6T
   NX0+GdgAgsqr1ItvCnOiaBCctr6yAoAvWNXebn154TomD3vUvw8n94q0h
   bJPegD68xN8FhOgBE6fIPT3B4Vrs4K9+7DcDDgj4h2UnPx//IeUs9BduU
   A==;
X-CSE-ConnectionGUID: X66Dha/JSTSnwHSXEaMtaQ==
X-CSE-MsgGUID: IRfn++3ZQq+CkSadgHWoGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61265540"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="61265540"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 11:27:51 -0700
X-CSE-ConnectionGUID: OF1U19emQXuey/bLp7IpiA==
X-CSE-MsgGUID: wLTsYyS/QGS5Y7uQwKjBhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="181404958"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Sep 2025 11:27:50 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1qh1-0005Uz-0r;
	Thu, 25 Sep 2025 18:27:47 +0000
Date: Fri, 26 Sep 2025 02:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Liang <wangliang74@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3218/3218] include/trace/trace_events.h:27:23:
 warning: 'str__oenetcls__trace_system_name' defined but not used
Message-ID: <202509260246.HUm8BhfP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   26e6aab08db562ec2a74b2125bddcc9a68cb6d5c
commit: d60758b0ffcd28339b899dcd5dc7416019a69b53 [3218/3218] net/oenetcls: introduce oenetcls for network optimization
config: x86_64-buildonly-randconfig-004-20250926 (https://download.01.org/0day-ci/archive/20250926/202509260246.HUm8BhfP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509260246.HUm8BhfP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509260246.HUm8BhfP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/oenetcls.h:41,
                    from drivers/hooks/vendor_hooks.c:12:
>> include/trace/trace_events.h:27:23: warning: 'str__oenetcls__trace_system_name' defined but not used [-Wunused-const-variable=]
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


vim +/str__oenetcls__trace_system_name +27 include/trace/trace_events.h

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
