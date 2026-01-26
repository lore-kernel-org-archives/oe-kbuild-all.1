Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55479248886
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 20:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769458407; cv=none; b=I09eWOihBFKNbnvPd+85sqO92zfFsGw5Jl3j+InOmS4US5bX2IMlEW7eNpuFT2mZg1UOtRxPpsGtvdiXculoaO5pPSo1ZUUSJ4csia/4Z8PS0cZVyBWIUCHU5oKNqibtnJy96LiWWV2N17VMtKd2DZmfIMt23W4wgx/uSR6NfUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769458407; c=relaxed/simple;
	bh=qkJo7ESXrCrfYoaZyj6OtEZMoYS2QMRbXdhAs0mHk+Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VaKdXHOeoEpD471W9YjLcmh97cpwPc2cjIs4HdBIeshazHNsgWLnxpYLZp8sWYvww22U1izseT7gRYa1cLyth+CSqNRKZg0DCyg/y4X+r+r0gLk/czdMKxD6EO8WreEed3M8YB0otjaAs6NHVjBrKN13DjPjH5CjbEblh/j4fdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJJfJvOV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJJfJvOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769458405; x=1800994405;
  h=date:from:to:cc:subject:message-id;
  bh=qkJo7ESXrCrfYoaZyj6OtEZMoYS2QMRbXdhAs0mHk+Y=;
  b=gJJfJvOVROOKhOTWWc6CE7g8DGqaeRL7vUVqEDETbP5m98LM2UXW5Cr3
   vpSstJ2rNQigDrKfe3BT82Tfv5kLmidcHDSk5HWtWjPp5+Xk1C0ngJvYX
   pN3l2xRIFgpS7NtNcBzBcSX+kUlnnjLCWSyZwRACgm88Q6Fc3dx/jaQ9P
   ob1LcRt31wniEhNovI/dxvD3A5YCcMi7P9DECnaNFmTbYb1HycotwqMR/
   xkVCvEBY1bzLHfzVdf9j0q4vdeCS3JwPNzMEKmMChMWIhGis0dvN297MZ
   EU26QN4MZqApVAFUOJYk7WPPdUWPXuYcFezEmEMVp+Ux4KuKEai0pixfb
   A==;
X-CSE-ConnectionGUID: etC7kzvZSiapz3GZJ6gK9A==
X-CSE-MsgGUID: 4ezZEj9FSu6wNu7WzK22Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69843717"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="69843717"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 12:13:25 -0800
X-CSE-ConnectionGUID: uA9dRYdoSgKIiQVUpP8LIQ==
X-CSE-MsgGUID: icOJ/cmURlOxI3IBdlDtFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207577766"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 26 Jan 2026 12:13:24 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkSxd-000000001az-13ZR;
	Mon, 26 Jan 2026 20:13:21 +0000
Date: Mon, 26 Jan 2026 21:12:49 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 kernel/trace/trace_events.c:1876:37: warning: unused variable
 'ftrace_event_id_fops'
Message-ID: <202601262120.Zm4zkSO4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Nick,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   c35b97a00bbebbd99c3e1980433ff4e45ba40082
commit: 377062e9833e131b9808a04f71be39161a1f04a6 [1/1] UPSTREAM: Makefile: infer --target from ARCH for CC=clang
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260126/202601262120.Zm4zkSO4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262120.Zm4zkSO4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601262120.Zm4zkSO4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from ././include/linux/compiler_types.h:69:
   ./include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> kernel/trace/trace_events.c:1876:37: warning: unused variable 'ftrace_event_id_fops' [-Wunused-const-variable]
    1876 | static const struct file_operations ftrace_event_id_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/ftrace_event_id_fops +1876 kernel/trace/trace_events.c

981d081ec8b958 Steven Rostedt 2009-03-02  1875  
23725aeeab10ba Peter Zijlstra 2009-03-19 @1876  static const struct file_operations ftrace_event_id_fops = {
23725aeeab10ba Peter Zijlstra 2009-03-19  1877  	.read = event_id_read,
6038f373a3dc1f Arnd Bergmann  2010-08-15  1878  	.llseek = default_llseek,
23725aeeab10ba Peter Zijlstra 2009-03-19  1879  };
23725aeeab10ba Peter Zijlstra 2009-03-19  1880  

:::::: The code at line 1876 was first introduced by commit
:::::: 23725aeeab10ba02bcf10ec49ad73146b54cb52f ftrace: provide an id file for each event

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
