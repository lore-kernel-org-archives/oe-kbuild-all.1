Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C110E1A682D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 04:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772772416; cv=none; b=gCu6UcYBjjpWqtdwYhAANUIfVzuNNq1uouKUxJuVBXYj66nipKYFbxMvKPL4HNR0IxL6bQuw6JvjfZTVLrd9F60aZRkQQZfsZ0/rfG4GKVnS4jFuFWczkyWXcFmcP42HiJSQOUztLKWdXlJWjlGbVs1UPpAkbOK9KYj21Sp0EZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772772416; c=relaxed/simple;
	bh=vmPzcBqx05XpepblBVJSx+T35da844RrtVnvhOGpGjQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nOIz6Zi4n0Eb3PM2GiU34jF0uYonmEFLSbGtCOpVvz3ICSD7GqdkFOt4UGHEn27hyCyIE+O4LxnkUA7yaPDJk2P21xVAHJDxOuGAE3VdfwdFoZHHdNjG6LScGE5k8+Q4pxDzahmw6NCeoM/QYIJlDqilt+mBXTjenQZX3r7e7FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcfeKk2g; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcfeKk2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772772415; x=1804308415;
  h=date:from:to:cc:subject:message-id;
  bh=vmPzcBqx05XpepblBVJSx+T35da844RrtVnvhOGpGjQ=;
  b=VcfeKk2gS4Itn0F4Z6l6/C09bn5jAGihtRHmCugclRnwVhwIPmQ9bjlh
   RvoRPeGgD2W1etJVLNSqw5vNhbJt+Gdq1xO030Ek0YpsSnIaRjqleGWHl
   cwwigvI80xSH+IOf+fLQZ3j54DbSmOK4srfdTqhPl9Yb7Kw9Gd90Di1nz
   q2QcNer5rMeAQtl7bwOfyWd8pOrxhmEk799q62VdbPn3kbBhhihnEx4PE
   UCvK3vFlTKxDh7tlTjhyPoyXZilpFfNmPNm5uS1e0IysZSnlM2TobxYyS
   F9ack5fI8kbOEUOEOeAay378+1trxtTa3kRDi0zT9YclHIfpCCgDLY55T
   g==;
X-CSE-ConnectionGUID: us7X7EjpQOydIsyNNo7bHg==
X-CSE-MsgGUID: 36HSE5iwRde3QVtMSyxfxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77721456"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="77721456"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 20:46:54 -0800
X-CSE-ConnectionGUID: Az7QoIEfT7a07jo3WCg+mw==
X-CSE-MsgGUID: iBT47PtJR9SDtq0jobO29w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 20:46:53 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyN5O-000000000Mr-2oOO;
	Fri, 06 Mar 2026 04:46:50 +0000
Date: Fri, 06 Mar 2026 12:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_bpf_monitors 20/29]
 kernel/trace/rv/rv_bpf.c:126:38: error: implicit declaration of function
 'get_monitor_mdef_by_name'
Message-ID: <202603061228.fbMtrfDi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_bpf_monitors
head:   3a153b8189ae2fb3a1e680f5092df636abbdac56
commit: 5c96c9aebafa7460b9d4335f84f4f643747750d8 [20/29] rv: Add reactors support to BPF monitors
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260306/202603061228.fbMtrfDi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061228.fbMtrfDi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061228.fbMtrfDi-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/rv/rv_bpf.c: In function 'bpf_rv_react':
>> kernel/trace/rv/rv_bpf.c:126:38: error: implicit declaration of function 'get_monitor_mdef_by_name' [-Wimplicit-function-declaration]
     126 |         struct rv_monitor *monitor = get_monitor_mdef_by_name(name__str);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/rv/rv_bpf.c:126:38: error: initialization of 'struct rv_monitor *' from 'int' makes pointer from integer without a cast [-Wint-conversion]


vim +/get_monitor_mdef_by_name +126 kernel/trace/rv/rv_bpf.c

   115	
   116	/**
   117	 * bpf_rv_react - trigger a reactor from BPF
   118	 * @name: monitor name
   119	 * @msg: pre-formatted message string
   120	 *
   121	 * This kfunc allows BPF monitors to trigger reactors with a message.
   122	 * The message should be pre-formatted by the BPF program using bpf_snprintf.
   123	 */
   124	__bpf_kfunc void bpf_rv_react(char *name__str, char *msg)
   125	{
 > 126		struct rv_monitor *monitor = get_monitor_mdef_by_name(name__str);
   127	
   128		if (monitor)
   129			rv_react(monitor, "%s", msg);
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
