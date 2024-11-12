Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE4420ADC0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 07:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397483; cv=none; b=GlQnXBSrUkXTGTBrmj8rS+DrAKoDxlWpF3MQTvaU9vJQ/o6jOpK0MPI9tgOnti1TanSbiBL50Lveu5AsRg1Rry5Jg2y6iE4Ha9BoNCFXl30jYPxamR5NPMfQnOCDZYnr86OSOzb3Wuaw7sR2bA+w2R1xd8uKN3R4PV5YO1UQVyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397483; c=relaxed/simple;
	bh=QqOhHo1oivAI70K8s61eVi23eXO3NZbJ2LoXRXT2Dhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k2XyI4vX9QG1M6lqYNITJNc3eoUDIG6x3cIOVlK+W3tkv6929/sDhv7Ja+tAOSdGbOySqxLyo4PxJugL5QBn42K+bqxnsPE7apop2h4A27HbS0TGIlJw0Gio4rt4qdGepFRelZqhDrV3H0Ks6tQ+WjvxLejpPx/1EJ8wljyEJC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlnEfOYe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlnEfOYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731397481; x=1762933481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QqOhHo1oivAI70K8s61eVi23eXO3NZbJ2LoXRXT2Dhw=;
  b=AlnEfOYeaiROcS1z7B5Gnvmy2fQ6Pwl1rAEu4NuP0Dmn29ws94+9UGwl
   o4c2Xszib8IOQtBZ+FGGznOBjLZMiQbGqkAFeF5AmfAEMKwzBGTX4fAKs
   /Y/eyTDUaSLD1tazumOLnZ1sh0lpZU3xtHQ6xTAmkPPFuI3GnXq4FtxeY
   zTZM2NvAfp+IKl9Rnd9lpsCO6/bTVbhmIFptE0wrADqzOg1xYsvZp4SkS
   tsTZxhLSDh6LC1Vikb5+t1HIMgk4LXn8vL3U88VDtgPT5ymQ0ZC4CuN5+
   PHAhXkoduQ+yQQHJcKy5LmZE7LoU1rP0dNEAESOGPEmCu2ReIqsaSt30o
   w==;
X-CSE-ConnectionGUID: CZjfN3IsQ5G0ozdegkCgsQ==
X-CSE-MsgGUID: gklWQP2ZTCKX/0vI6EXHHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53771573"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53771573"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 23:44:40 -0800
X-CSE-ConnectionGUID: /l4tE/exT3elJ/5UdmgWng==
X-CSE-MsgGUID: brTkytcQTDinny+2iFJrcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="118250521"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Nov 2024 23:44:39 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAlZk-0000ar-32;
	Tue, 12 Nov 2024 07:44:36 +0000
Date: Tue, 12 Nov 2024 15:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2417/2417] vmlinux.o: warning: objtool:
 do_syscall_64()+0x8b: call to memset() leaves .noinstr.text section
Message-ID: <202411121519.FfuB626X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   400fd9ccb52e01bf78acae2bbc1710923a15f033
commit: 130620d5878d2348208258965876547a69353f9f [2417/2417] x86/entry: Enable random_kstack_offset support
config: x86_64-buildonly-randconfig-003-20241112 (https://download.01.org/0day-ci/archive/20241112/202411121519.FfuB626X-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121519.FfuB626X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121519.FfuB626X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_syscall_64()+0x8b: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs()+0x1c: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_read_aux()+0x42: call to {dynamic}() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0x13f: call to mce_no_way_out() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
