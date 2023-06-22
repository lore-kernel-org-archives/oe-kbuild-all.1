Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08FD17C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 01:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687398926; x=1718934926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brwQ9U2ovnHWPSR4AdXAYdLSRcO18MXVwCneEQvITdY=;
  b=cwKKwn/IfIGHjBzurepqiXQdEtUtZKR8eUMQitmWgUXtRrBWfkcy+soz
   UbGUZuSHwJaMdHDGpCqwnu0hpgfgtMN1EVqF5n3j74Vx4FA1C04xQA5+i
   gLuw0V/3IpqqCXYkdRFDRMdkQc6/0BWfxyHU7HD98M0E6GJHHuPRLRR0x
   0jx4R32I5d0N5mYnNh6cGhjhON/wVVIAvU7VQNZM078CY5KVvShdSsnip
   6XTC8qQ8qQM7IuqcEopUNK33/IzCxr+kH1i6WSCVhs4Nsd7CCp67FP5+m
   m3wZl0k/ICMOEW/Tg9HoywDHMAMrEx0Ulyw8nxWwAJMDXmrdKDRaVpInC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360376489"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="360376489"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 18:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="827707301"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="827707301"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jun 2023 18:55:25 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC9Xg-0007Er-1e;
	Thu, 22 Jun 2023 01:55:24 +0000
Date: Thu, 22 Jun 2023 09:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/2] vmlinux.o: warning: objtool:
 .text.drbg_ctr_update: unexpected end of section
Message-ID: <202306220947.QQTouXJv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   26fdb5f5bfb60f9eee81855ea64f13d25b369b2b
commit: d4d78c7278ee4f6fd8f3b02c18e472e55558a98b [2/2] ANDROID: fuse-bpf: Fix non-fusebpf build
config: x86_64-randconfig-a015-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220947.QQTouXJv-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220947.QQTouXJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220947.QQTouXJv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: arch_do_signal()+0x306: call to sas_ss_reset() with UACCESS enabled
   vmlinux.o: warning: objtool: ia32_setup_rt_frame()+0x13b: call to sas_ss_reset() with UACCESS enabled
>> vmlinux.o: warning: objtool: .text.drbg_ctr_update: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
