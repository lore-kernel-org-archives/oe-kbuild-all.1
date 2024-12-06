Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38C01B78E7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 06:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733465455; cv=none; b=KbtPsBiQuyv/nCz9Po4IManuFaCgN3q3T5LqKFL/zJD1CybmJgEprqeKxrobC1JnyVDp1ZXJQT8N4PRzpzV0jNshL+62AT5NkigeKWc98xkRjqe5+zDtm1dKiP4oZnYv4CNZipVxJs0maJCsG6ETwmf8Tu9qKMBROXrsDLB42is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733465455; c=relaxed/simple;
	bh=xfrbAEupejpNdxa2o5nxraAm2slde6nTZ58pf7znLCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NrRYqmDPC9E9sBQziftOIk03vmFk/1VBJc0aeWS7ME5FLCa3CUN7ePn4Vl8LNggq4NqO4kuxUsAguqDtH4Qm8iwO3Q0O/nmgh1oSlFAKEo6hR4wYN5YInZeRnOTEw9ymq3HCVhX0v5lJhObVcmEj1wbSQ8zIvDdflokUQevoPkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3quI/MU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3quI/MU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733465454; x=1765001454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xfrbAEupejpNdxa2o5nxraAm2slde6nTZ58pf7znLCI=;
  b=K3quI/MUpC7FEHFgtB0tni1oYcf8XDFYzAKwIkk+a9zYtWMYFeKY7L0Z
   dtBcu7gDtHeUVHFavNM3437Vj114lxwDmdnf4daWa5hnqIISe1nQnJARf
   s5grMjbBEh2Fj9QbngMFVMbRp+gsfYM4UYnK9sjCw/5QGUEaF1Hl78Z0j
   AQ2sBHoiIS6QrWtC8Py1si+uOT6XU1Z6rG2DeAQnnkzgJLsBvN/dwjI+8
   kdXefw/GV8TKpGRBI4EbosISOLdrjkQDQE8cF7CYq2ZUUcGYXpV37daAr
   QJIMy0NBCm8Cg5Q/rvXupABAuSTDRl+FbUZZMqm644qHNwmLODBhvBO1U
   w==;
X-CSE-ConnectionGUID: CnPO/qRPRaiJYbdD08oEfg==
X-CSE-MsgGUID: mTwbRnBQQaSbs/Jjww+cWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51343361"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="51343361"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 22:10:53 -0800
X-CSE-ConnectionGUID: Upj2nLaVR1KNUA3GLGrgOg==
X-CSE-MsgGUID: w0xAWUD8TWe74FejDtfo9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="99136382"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Dec 2024 22:10:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJRYA-0000l9-0A;
	Fri, 06 Dec 2024 06:10:50 +0000
Date: Fri, 6 Dec 2024 14:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 19/19]
 kernel/trace/bpf_trace.c:1053:29: error: implicit declaration of function
 'ftrace_get_symaddr'
Message-ID: <202412061423.K79V55Hd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   e6369db4372d722c47a45887eeb6a0f483c20ced
commit: e6369db4372d722c47a45887eeb6a0f483c20ced [19/19] bpf: Use ftrace_get_symaddr() in get_entry_ip()
config: i386-buildonly-randconfig-006 (https://download.01.org/0day-ci/archive/20241206/202412061423.K79V55Hd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061423.K79V55Hd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061423.K79V55Hd-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/bpf_trace.c: In function 'get_entry_ip':
>> kernel/trace/bpf_trace.c:1053:29: error: implicit declaration of function 'ftrace_get_symaddr' [-Werror=implicit-function-declaration]
    1053 |         unsigned long ret = ftrace_get_symaddr(fentry_ip);
         |                             ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ftrace_get_symaddr +1053 kernel/trace/bpf_trace.c

  1050	
  1051	static unsigned long get_entry_ip(unsigned long fentry_ip)
  1052	{
> 1053		unsigned long ret = ftrace_get_symaddr(fentry_ip);
  1054	
  1055		return ret ? : fentry_ip;
  1056	}
  1057	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
