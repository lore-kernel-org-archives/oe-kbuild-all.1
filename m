Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35705946C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 12:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596463; cv=none; b=gry/SGpilplVA+nQ0eOYbDODSN93KTLOUhLTa6CWEtOKbQ6KY/IDg0NDVya1Hxb8UIUyh+g7Vhz+KLnUGzNNJ8OMmVhMZEGMCX+SS+ignbvjq0sy8HiERMieCPIzcqfJUoSQbPLGuJneK6ujQfYeYUoFSSBJTwSCZf5jfKeUhL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596463; c=relaxed/simple;
	bh=G+u1FDTk40AUSUkIG6hVJ8CP5crsZPBE5lnxU6IB9hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aoL+Kohz81BpfXiD07qk9JBdKATn9lvw1qOFKTK8vGWABn9SaQWByX3/tfq102e3gs0VvRdEXbfgIGQnTwJ8NQrZkMv3w8wQfn4gdebZkrOFGpfvTtMWWvaPwEuHmUEm1DmuVl5C/7t8zrmtP0IaQfSL3vPL7hob6UoKwBP3DbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcXzqXMY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcXzqXMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743596461; x=1775132461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G+u1FDTk40AUSUkIG6hVJ8CP5crsZPBE5lnxU6IB9hc=;
  b=dcXzqXMYevpCZe6JCxbGJIq+DEjpC+QCBxXhUGptw2RTqpcfVxl2QGuc
   XSOBU0O90iE5hLHdxpN25wk0YfxHPYoxIhUkkDlUxwSv6J08a+YveKjhT
   VgbLouW2+bFe01M0LCZAr2SCpirb0pJ2TZcJx7zI+EqnnHSnFKXBWtvqw
   Hne9w/CocdUU+2lzIg7P49TD3DjytDa8XpY0BftqvJjCctI+ybE+LyN4X
   kOtyyifJRGSJjwgRTery6c92LWkqtW1/P0ZFVtF+vnZJYrVXSnK7JzxJe
   hxXIO3GwtdvZkfqhoddOq/WQs09xES3tTvlNhL6/UI9KRQTQO+sI72hQ5
   Q==;
X-CSE-ConnectionGUID: ZzTKwwSWScivciLutwY+Mw==
X-CSE-MsgGUID: kE/GNQxgTb+CYfhjOW+bGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62492848"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="62492848"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:21:01 -0700
X-CSE-ConnectionGUID: 69+SsZLSQq+PW7p69jfgrQ==
X-CSE-MsgGUID: urpG632aSYe1iC8czCuQ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="127173972"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Apr 2025 05:20:59 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzx5U-000AgQ-1c;
	Wed, 02 Apr 2025 12:20:56 +0000
Date: Wed, 2 Apr 2025 20:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>,
	Tony Lindgren <tony.lindgren@linux.intel.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>,
	Kai Huang <kai.huang@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: [intel-tdx:tdx_kvm_dev-2025-04-01 20/175] arch/x86/kvm/vmx/main.c:63
 vt_vm_destroy() warn: inconsistent indenting
Message-ID: <202504022014.q5yoGpHp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git tdx_kvm_dev-2025-04-01
head:   4dd797afe5bccb7a36475aae9df8f71eabb7676a
commit: 8d032b683c299302aa8b5fbce17b9b87a138a5f5 [20/175] KVM: TDX: create/destroy VM structure
config: i386-randconfig-r071-20250402 (https://download.01.org/0day-ci/archive/20250402/202504022014.q5yoGpHp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504022014.q5yoGpHp-lkp@intel.com/

smatch warnings:
arch/x86/kvm/vmx/main.c:63 vt_vm_destroy() warn: inconsistent indenting

vim +63 arch/x86/kvm/vmx/main.c

    57	
    58	static void vt_vm_destroy(struct kvm *kvm)
    59	{
    60		if (is_td(kvm))
    61	               return tdx_vm_destroy(kvm);
    62	
  > 63	       vmx_vm_destroy(kvm);
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
