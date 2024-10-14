Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AAC1C7B77
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 19:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728933306; cv=none; b=rnRrXSvV/uYq0+xScoYphwzIo5vmmHh+8R8XdRlEFPoNFYeQiKXjeSNHCaKcuTtzX8N6UhdLSpMqIbQoy2KQR2/+bcrHIHKPBVYROXFsVVnzbMgYSCfkxWdBQb0lNe0FkNSLBfAi7+Pf+yZFRn8167lPRFJnD/TLpgWV5vTiFvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728933306; c=relaxed/simple;
	bh=KuyjISvCxaNgCOrv0iPPeNDX4XlHX36hrHSOoYW7TJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qw+rFdmC36mjOCokx1xi7u5FprV1zus1AEFikkKysEMgu/FuqlrsK2b7JhRMr6BDT905rcWg1zw1AgzapUIl4AsCn3ywlKZLkDCxuC+vIPwp/w4/sE0D2UgbZJ5w6zWM6IO6v5bsHgupQG542AAbQ3dFuCM2rz5PzdUrry1iZu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7o5krpU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7o5krpU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728933305; x=1760469305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KuyjISvCxaNgCOrv0iPPeNDX4XlHX36hrHSOoYW7TJg=;
  b=f7o5krpURAWN+VJ87iSFuMVtoQmYtPFyh57MIINOQUozMTAQk6IbUYcZ
   Toz+aDUUpo8NB2bz0bHJ06DUObZPsidujxoMHMSANMkD/iyLTcfWaAiGz
   1HvOC4ElX5D5ZMuovbpvzgmNcuP6jGds6i2WFJLDaIKoqJ22PFFe6YyCD
   RwwntF/mcUUxQSTw85ZNrRFmsh2/4qk1+Qh2YoG3rR1DBMNspLpH3/pVC
   y1YHCYvKlb5ea10H6pATFSGmxXQIqgPpJYH397bNxaRj1kA19H4vNXKnu
   d++gDBaWyY+Z2Hdz1W3tmlf9dkVDffsJOcqHrZtuVBy45OPeGGHAooZgI
   Q==;
X-CSE-ConnectionGUID: L8S3cxVaSR2/KpzkRbpd+Q==
X-CSE-MsgGUID: EWjrJk6PTBy7ORXUj1Buvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28486200"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="28486200"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 12:15:04 -0700
X-CSE-ConnectionGUID: Y1HWl2NKTnqVI/TNltK+zQ==
X-CSE-MsgGUID: zl7Rwk/fQIm2cVZoFwXp0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82450178"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Oct 2024 12:15:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0QWw-000H2x-0T;
	Mon, 14 Oct 2024 19:14:58 +0000
Date: Tue, 15 Oct 2024 03:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 13036/13038] arch/x86/kvm/x86.c:11156:6: warning:
 no previous prototype for 'kvm_arch_vcpu_preempted_in_kernel'
Message-ID: <202410150353.KhTTOcWT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   413b1b249304f17f4514dd859a44e3959e5d7674
commit: 4071fe18bc901882fa719cbafb49a11f337ca17e [13036/13038] KVM: x86: Reorganize code in x86.c to co-locate vCPU blocking/running helpers
config: x86_64-oc_stream_base_config (https://download.01.org/0day-ci/archive/20241015/202410150353.KhTTOcWT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150353.KhTTOcWT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150353.KhTTOcWT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:11156:6: warning: no previous prototype for 'kvm_arch_vcpu_preempted_in_kernel' [-Wmissing-prototypes]
   11156 | bool kvm_arch_vcpu_preempted_in_kernel(struct kvm_vcpu *vcpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_arch_vcpu_preempted_in_kernel +11156 arch/x86/kvm/x86.c

 11155	
 11156	bool kvm_arch_vcpu_preempted_in_kernel(struct kvm_vcpu *vcpu)
 11157	{
 11158		return vcpu->arch.preempted_in_kernel;
 11159	}
 11160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
