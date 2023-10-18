Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA778C0C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 16:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8mH+o6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697647593; x=1729183593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uzAvuhQz15sWanIarI6Rmy71ywkLXN7KF/vTrky9N98=;
  b=V8mH+o6Y8tbSsEW4RIX1zFWA9QRUSKYq6/Jw40FawPsBXZ6C3ZHi3ibG
   n4AQ+VdzpjUjh/Q2IAjtifzxbCYyjIrory5uZMY9LGZf7n8kgSeQvJJaI
   Fi9AEIs9XKZ+qmDU8XH6idKL9lJeBVtpQDB20dCoVCmkKJxhEo1i7sfuU
   zQIG1K+zsN3CzCDa53Bc3j0bjwcljNWrSQvp7VZkSRgeC8Aem5PPwhdwA
   9V1agquYSHHZs6dvK1Ee/F4HR1ZTENsWC+TI2tlGjKxiO087UiUb2+THX
   suZT2PdU4Rp460KTBkOmfVH2DUKJkkzwgP7eQ49BT6NwsbLuheodg7J7/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="384934185"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="384934185"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 09:46:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="785994668"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="785994668"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Oct 2023 09:46:10 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt9gN-0000hI-22;
	Wed, 18 Oct 2023 16:46:07 +0000
Date: Thu, 19 Oct 2023 00:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 5610/28069]
 kernel/power/wakeup_reason.c:199:6: warning: no previous prototype for
 function '__log_abort_or_abnormal_wake'
Message-ID: <202310190046.ElHMomC3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   61c44cc986d6ba814dd251a7cf634f972668d4ca
commit: 189ced91cd7b0e440b0be876406fd36313a11c3f [5610/28069] ANDROID: power: wakeup_reason: wake reason enhancements
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231019/202310190046.ElHMomC3-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190046.ElHMomC3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190046.ElHMomC3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   clang-16: warning: argument unused during compilation: '-mno-global-merge' [-Wunused-command-line-argument]
>> kernel/power/wakeup_reason.c:199:6: warning: no previous prototype for function '__log_abort_or_abnormal_wake' [-Wmissing-prototypes]
   void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
        ^
   kernel/power/wakeup_reason.c:199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
   ^
   static 
   kernel/power/wakeup_reason.c:378:12: warning: no previous prototype for function 'wakeup_reason_init' [-Wmissing-prototypes]
   int __init wakeup_reason_init(void)
              ^
   kernel/power/wakeup_reason.c:378:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init wakeup_reason_init(void)
   ^
   static 
   2 warnings generated.


vim +/__log_abort_or_abnormal_wake +199 kernel/power/wakeup_reason.c

   198	
 > 199	void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
   200	{
   201		unsigned long flags;
   202	
   203		spin_lock_irqsave(&wakeup_reason_lock, flags);
   204	
   205		/* Suspend abort or abnormal wake reason has already been logged. */
   206		if (suspend_abort || abnormal_wake) {
   207			spin_unlock_irqrestore(&wakeup_reason_lock, flags);
   208			return;
   209		}
   210	
   211		suspend_abort = abort;
   212		abnormal_wake = !abort;
   213		vsnprintf(non_irq_wake_reason, MAX_SUSPEND_ABORT_LEN, fmt, args);
   214	
   215		spin_unlock_irqrestore(&wakeup_reason_lock, flags);
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
