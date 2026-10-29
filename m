Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793302529;
	b=zkAwjMvr9XY/nHpsLMiX8kdStPx9GCneK+J1xEP2Rl3DsJSO4GoTIKvUu4GA8RabLErZ
	 SJnjUOFsq8hZ2K55UoO7rRQR9yLi5a0YnMm6KQW7hgom9o9P7if9rc9b7RPQ8oC2OYCpl
	 OzZavuCe4zHFAOPvslu118FYWJ7/frZBRiprg+21PTRWBWxcePiDEmUKKiakjj0WgfzkJ
	 fVflCoXrSqDFyc9eWhrIXdY6RUYgvMSxPA2lFW3AsVdiJmBJ9vt3Ra/t/u7WyZBOTgOgg
	 +Z96pXL3VLjqtgGjMyeJUHF+Ro7v3XZLDEjdqdZh5yXVEB6+G0hSuAJ010myBx4VovQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793302529;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YUvh3tSBqRx441FdSNU2AhEj96SwTOrLMSJhHbD7jtg=;
	b=2I0EAgVSDMHRZ3Xfr9JDyt6LUB5YnhqKqlgYw7cX7M94QKt8ejipaPj+FThF+1niaUsK
	 Nvh9PqkmvGofOA95JL8aisYBRjCtIXfO3k1uCbHBXegka/TaFiESIqm+0cjMHWzYnM+t/
	 /fm84scOW+GHYe79Bx6buXJALwtbU+c+xw80fZWnTfb4tfZouyT0BEMBVbY/w5nlNZDW5
	 4g26teXXhrJWQvc+w1RyTrGPuVrzxSr/AIO1ap+Y5Wnl4c7A8WKgtnQIQHns5T+1omYl/
	 RnHLLXwinI6IgBh9yjG++ep6hSViQX/epXt5fpVOfazHYZUHqEJd49zAEYXhRTMR1WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BKkAJJTM;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B375C606A31E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 19:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B375C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BKkAJJTM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793302527; x=1824838527;
  h=date:from:to:cc:subject:message-id;
  bh=JsJWseeEhJ1AArGSGwuqCcCAcMSbYPQXOyFIoImQID4=;
  b=BKkAJJTMv1B2vT9NRG51WmouGGQgxr10y/RDURSLKBeoPRWdTDxPyXMa
   EGuk2g/tUA1UtCrN2Q7aCSaIm1dyAbMslw3lokkbHKNNMsT1cxvBPA1za
   CfXYzEzIqx8DrH4zNs6g54XQmM16WC8VD5IknEL25qkscBwRdjB/9Ofqy
   nbsZEZ8EOnfmnVy7QfOJKULcLW2WCUJ2UVd6sSPhvEGcKgCn8QqO7LXxi
   Ka/4T4PKxwxhDymEZ11qPuecRzxhUwXM+9xzaYZDVFF7Xd9YljAke9Ja1
   z5AWOJmuUVqjbuWHJrZf/NzNlDxaFSx0aEfDl5I21oeOUpPPOtGJElvS6
   w==;
X-CSE-ConnectionGUID: ngN3XtEDQpOIMxqwTM/62A==
X-CSE-MsgGUID: u2YngvHNSZK0TsW//d/mhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1967320"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1967320"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 12:35:26 -0700
X-CSE-ConnectionGUID: 2/kytgw4T82aF6pYUSQAcA==
X-CSE-MsgGUID: hZa+SUcLROubgOVd4N5Bog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5151707"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2026 12:35:25 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMVuE-00000000arU-2ory;
	Thu, 29 Oct 2026 19:35:22 +0000
Date: Fri, 30 Oct 2026 03:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-p3s 2/2]
 arch/arm64/kvm/pkvm.c:756:5: warning: no previous prototype for
 'pkvm_enable_smc_forwarding'
Message-ID: <202610300305.eCrtmYpL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Nikita,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-p3s
head:   606d03f6372c0cd085fc0d154cbfc17c298058f2
commit: 128144da229a1de12ebe5bca87f607aa348c6ba9 [2/2] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261030/202610300305.eCrtmYpL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300305.eCrtmYpL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300305.eCrtmYpL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/pkvm.c:756:5: warning: no previous prototype for 'pkvm_enable_smc_forwarding' [-Wmissing-prototypes]
     756 | int pkvm_enable_smc_forwarding(struct file *kvm_file)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pkvm_enable_smc_forwarding +756 arch/arm64/kvm/pkvm.c

   755	
 > 756	int pkvm_enable_smc_forwarding(struct file *kvm_file)
   757	{
   758		struct kvm *host_kvm;
   759	
   760		if (!file_is_kvm(kvm_file))
   761			return -EINVAL;
   762	
   763		if (!kvm_get_kvm_safe(kvm_file->private_data))
   764			return -EINVAL;
   765	
   766		host_kvm = kvm_file->private_data;
   767		if (!host_kvm)
   768			return -EINVAL;
   769	
   770		host_kvm->arch.pkvm.smc_forwarded = true;
   771	
   772		return 0;
   773	}
   774	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
