Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3AF12AADA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 19:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706122833; cv=none; b=akuwKuDg363JvjoF4d+YT2gOKC6BjW7z6HnUC56CMlwJb/DuDwD5mKgWDFyYtJCE8xBDH65mpHFAYSnwcn5Z/yVg77KlNUUhmh9YYHS6QrTCL/JByk623+Rcw3D0qGG7lce8QcGu4iyp1sjS3LyMtLNFvixUaV2rzqCPyLTaBcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706122833; c=relaxed/simple;
	bh=EVdbz57zGwXfDQgCW1I6zKm+MMbNZoTZhRRu3juhvwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ccoh0NUdDl/8C1cJizZp980FjFM4a6Vqtf75gy0LQSbSPoW07uBLMhCEMMvkEY6+95bB7EH9nUngAYhtKIUbsP6UDgNsNIDKVK9YmZyKUIG4X6d7T+CBR/ql4dSkiHR4AQocHoGYguA+X8C4uRFsLACIEy8Xd2drdLjG+EVHseA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kz6XOm2P; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kz6XOm2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706122816; x=1737658816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EVdbz57zGwXfDQgCW1I6zKm+MMbNZoTZhRRu3juhvwA=;
  b=Kz6XOm2POX1A1GPRF1LjARvjgSGfsXyAiECHfaB89g6DIpbNMZBnc0nB
   SaZ3j/rq8L5b1CuLVnECvfSqmvL9Psu838smtfgcWkTqhI10nw3KvDSQG
   yTz4J2ZHs5Ks5mSdNqZGCwzjClt4Cv9jtaKW2GJWhKFEXmcAzU+zE+hkh
   H1AaPQZo3+Etk7HzS3CE9ulaN48cIRe9pz66InTQLAukYl2Ri2csxjSD0
   B1XsJFekF9xRiVn0HKdvoZYwjeFSfJfkZbdf3gxxR3wv5PqyNdDkCzt9O
   XJNS7UFNRpbj1Pet/IDzsXfhFD1gdcyzwhROxOZJQ4i1LiGvdQIlLsMoE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9045068"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9045068"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 11:00:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="876783901"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="876783901"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2024 11:00:12 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSiTp-0008NJ-31;
	Wed, 24 Jan 2024 19:00:09 +0000
Date: Thu, 25 Jan 2024 02:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 155/175]
 arch/arm64/kvm/hyp_trace.c:709:37: warning: 'hyp_trace_raw_fops' defined but
 not used
Message-ID: <202401250227.mzj1nM59-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   faf8e92b3bdd8457b68cf85e37cdcd4a4ed867e9
commit: f833c4c66599d064f5f9b29f0d78e13d63cfb29f [155/175] ANDROID: KVM: arm64: Add raw interface to nVHE hyp tracing
config: arm64-randconfig-002-20240123 (https://download.01.org/0day-ci/archive/20240125/202401250227.mzj1nM59-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401250227.mzj1nM59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401250227.mzj1nM59-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:709:37: warning: 'hyp_trace_raw_fops' defined but not used [-Wunused-const-variable=]
     709 | static const struct file_operations hyp_trace_raw_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_trace.c: In function 'hyp_trace_init_tracefs':
   arch/arm64/kvm/hyp_trace.c:778:66: warning: '%ld' directive output may be truncated writing between 1 and 20 bytes into a region of size 13 [-Wformat-truncation=]
     778 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                                  ^~~
   arch/arm64/kvm/hyp_trace.c:778:62: note: directive argument in the range [-9223372036854775808, 4294967294]
     778 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                              ^~~~~~~~
   arch/arm64/kvm/hyp_trace.c:778:17: note: 'snprintf' output between 5 and 24 bytes into a destination of size 16
     778 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hyp_trace_raw_fops +709 arch/arm64/kvm/hyp_trace.c

   708	
 > 709	static const struct file_operations hyp_trace_raw_fops = {
   710		.open           = hyp_trace_raw_open,
   711		.read           = hyp_trace_raw_read,
   712		.release        = hyp_trace_raw_release,
   713		.llseek         = no_llseek,
   714	};
   715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
