Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5058C19D082
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 03:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760670609; cv=none; b=dqvZ3Pmr5fB7YWVu+EyKP6pPRgtErpmnS7DfEOq0OnBcW2Ys3uTQCGsSkGrgfaDjiKml7tlNYszDbuoT2bY/JblzSDZYfKbApQTj0rMW2uLu4sdV3CYrDELx32vDTjUUnuDKF600O48T8Cfiib6qMRGZhqan/pRL4IfcaqYsY7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760670609; c=relaxed/simple;
	bh=3LYy7XWMNNgyIsZOmbukB62ZWuZbojK7n90ONfAP7HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c4YbD3qY2/8oP/Ng8zkrjEqOR7a7t/2trDkje6GPBncYjJtoSrR6tAi5gCGQxgnDzWr1OUw3CefQfsn8DpUkdW2N02mtO9puY96Kt9chAM0opPY97C7wvvmrN+Yu+AaAVTSrV0lOTO2n1y+Wp9zrpjDNhgBalAvVmeTf90CvuDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEBrTfis; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEBrTfis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760670607; x=1792206607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3LYy7XWMNNgyIsZOmbukB62ZWuZbojK7n90ONfAP7HQ=;
  b=IEBrTfisnW/hbdPmhEC2JNVcnF4YcxMsqIw2zm4mad3GdI7/yLWqOGTh
   qW5Hr7XENUoc6FD1MNKZl2LDDwuLCCm2tV9+ttj3tZ/x0iBGVZ9cVn2ze
   RhkVGG9EFrhgBhKalIUGGOrE3MrQpWEenbhos6Y/6iiMMgZEOkG3KO2b/
   VtrXybpp/cmE5ApQOIgaoyzSC4wm47ZUAgT2288YhA1dEGRsNYbxjZvOa
   5u3M0cE0DCU2RJVLyDB/LGoe72M3dsLMKQlY+3AdF+tNjkjPJsBNJuw+i
   glPZmaw7SbH17hYGx1gugOFXgDFv8/5aoCLGDLcB6SfyY12NWixILDtub
   g==;
X-CSE-ConnectionGUID: Z4XS8ZIEQxS0e8kLRNS/rA==
X-CSE-MsgGUID: 2TxlJnzlTSSclcUmMmcgEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66742092"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66742092"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 20:10:05 -0700
X-CSE-ConnectionGUID: 2L3q/eZcR1iooFd7KmKnQg==
X-CSE-MsgGUID: ek6rY7SKTtG74adVzHnUaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="187898284"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 16 Oct 2025 20:10:03 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9aqv-0005Tz-2u;
	Fri, 17 Oct 2025 03:10:01 +0000
Date: Fri, 17 Oct 2025 11:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/l1tf_mitigation_mitigation 4/5]
 arch/x86/kvm/vmx/vmx.c:313:16: error: too many arguments to function
 'vmx_setup_l1d_flush'
Message-ID: <202510171159.FIKy2qnq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/l1tf_mitigation_mitigation
head:   6b03b37c78d0bdc369aa93991cfa0f209cf20964
commit: 111c111ee261f0d902f2a33b0193cb68c687b8e9 [4/5] KVM: VMX: Disable L1TF L1 data cache flush if CONFIG_CPU_MITIGATIONS=n
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251017/202510171159.FIKy2qnq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171159.FIKy2qnq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171159.FIKy2qnq-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/vmx/vmx.c: In function 'vmx_setup_l1d_flush':
>> arch/x86/kvm/vmx/vmx.c:313:16: error: too many arguments to function 'vmx_setup_l1d_flush'
     313 |         return vmx_setup_l1d_flush(vmentry_l1d_flush_param);
         |                ^~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:306:12: note: declared here
     306 | static int vmx_setup_l1d_flush(void)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/vmx_setup_l1d_flush +313 arch/x86/kvm/vmx/vmx.c

   305	
   306	static int vmx_setup_l1d_flush(void)
   307	{
   308		/*
   309		 * Hand the parameter mitigation value in which was stored in the pre
   310		 * module init parser. If no parameter was given, it will contain
   311		 * 'auto' which will be turned into the default 'cond' mitigation mode.
   312		 */
 > 313		return vmx_setup_l1d_flush(vmentry_l1d_flush_param);
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
