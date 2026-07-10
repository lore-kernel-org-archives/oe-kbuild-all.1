Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631F63B28D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 01:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783646382; cv=none; b=MAVjIWeeVP5ne5jBVcZxdestzmpHTF+WtHObHnKiNppDmywuALi8e9uQFcKTCQnlVcKA5TKYxJCFpXnjzD5P1/8bT6JJEVoolpXHLW5vn+MTHnnFy7UYGBEwNfZtUoE7Lk1RhbvpRhIgCCYhsHyrmB/DDgV3emWTqDC3YYDJ1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783646382; c=relaxed/simple;
	bh=kusXULzMe7r7YuDP7oFhitODABymSsN/JVULsLa7vzQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sK4mSho4lBus8iZnRP1bA51KDRdW7a/JvGzRsIBEHr9fvavIH5NVhhqU274pi8LcaHZK2MNpElY8N1TLCIbkusR7gs8vjba0jdwimetUc78A5kntZLXVku7EGCbQySvGTuNzTiTKvR3gkdYrkrX7d0uTpRK+CDj+fGgld2j0s5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILmU188a; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILmU188a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783646381; x=1815182381;
  h=date:from:to:cc:subject:message-id;
  bh=kusXULzMe7r7YuDP7oFhitODABymSsN/JVULsLa7vzQ=;
  b=ILmU188arEu5kMgfLAbsLab79VjYK8CwwhmbCAfk6HFeY6HrqDzHKMyb
   VDiQzesIqRxF4uXOnL7m4NS98/g1R3afZUC6C8eNK+vMMwES9mMcSAHe3
   0VEVkob8BM2H/ru9aKTfSNy1QRsQmelmd6WR7LzxKTOdRq1RJM60a/5k2
   ioqI/91XHLJvSuJilFnSDvBJqgNDN2k3IGpYe7XH1GmLQlhAONRL6JVRP
   IbKYT2PdLdp4CYg0V78rQ5Z7I4fpyL6rTReHu1FmRqKuao7ZO77YEtv9K
   /w7r4uBIOTfY0TTJbNQxTZGBvYa9qZwQlP+ONywiTDKRW/TuROTCEmHxo
   Q==;
X-CSE-ConnectionGUID: biA2OcP1QnCAbtIZvpyIYQ==
X-CSE-MsgGUID: hrtSOd69SGC4x5VY5BMcKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83322738"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83322738"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 18:19:40 -0700
X-CSE-ConnectionGUID: nBgIX6RoQs+nc2H7jpe9YA==
X-CSE-MsgGUID: J7ro5n8CSQyAcYTAFO+btQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253008933"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2026 18:19:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whztv-00000000ILT-48Iw;
	Fri, 10 Jul 2026 01:19:35 +0000
Date: Fri, 10 Jul 2026 09:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/nvhe/serial.c:60:6: warning: no previous prototype for
 'hyp_putc'
Message-ID: <202607100954.BXgRJJUn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   4dd097d4271efd3d8164d7f40023880a93966f0c
commit: ea53aa5d800829a9adc17df0b6615eb845a9314b [1/1] ANDROID: KVM: arm64: Add serial framework for pKVM
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260710/202607100954.BXgRJJUn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100954.BXgRJJUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607100954.BXgRJJUn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/serial.c:42:6: warning: no previous prototype for 'hyp_puts' [-Wmissing-prototypes]
      42 | void hyp_puts(const char *s)
         |      ^~~~~~~~
   arch/arm64/kvm/hyp/nvhe/serial.c:54:6: warning: no previous prototype for 'hyp_putx64' [-Wmissing-prototypes]
      54 | void hyp_putx64(u64 x)
         |      ^~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/serial.c:60:6: warning: no previous prototype for 'hyp_putc' [-Wmissing-prototypes]
      60 | void hyp_putc(char c)
         |      ^~~~~~~~
   arch/arm64/kvm/hyp/nvhe/serial.c:66:5: warning: no previous prototype for '__pkvm_register_serial_driver' [-Wmissing-prototypes]
      66 | int __pkvm_register_serial_driver(void (*cb)(char))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hyp_putc +60 arch/arm64/kvm/hyp/nvhe/serial.c

    59	
  > 60	void hyp_putc(char c)
    61	{
    62		if (hyp_serial_enabled())
    63			__hyp_putc(c);
    64	}
    65	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
