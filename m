Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41C734D382
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203795; cv=none; b=Rqr+Ruh80ozZ8UgWR6zKrsPYAxkino9paPa1P8RevnU6UY3kupMH1TKVWNC3Yw5RDQ/fIL7znSz5FhAhnAlzmi5asF/GPosFjv4borxmArATpPrMbMim7ES5RUo0njzid1bQepyLJWSYEDLTz9hTISB8JMLOMUJkoV6Tfs3n6rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203795; c=relaxed/simple;
	bh=iBycJXRQCcxItsMe3xbfoay5OTteljshhBpSZyAxMkM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n2wHbgs91kI5NDUa7sWqPvwXDisUQ5C0s0Blt47IepdVi4PBp3CGGun5GUQFrQsiGcOe72wuTStKGWwuDYaXlRabv4a91EtT9bPvGh/WVAB0VrYhqEIMisOtkZC7hJtJHDqIvAK16tPggKJccsaCi8ZUnIrxgJAaLR9KT7PDn5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zi5tpzx1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zi5tpzx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791203793; x=1822739793;
  h=date:from:to:cc:subject:message-id;
  bh=iBycJXRQCcxItsMe3xbfoay5OTteljshhBpSZyAxMkM=;
  b=Zi5tpzx16CBffDlu5rhdNNmlwn5QGIEENJe0NINj0seMVoUmLJIaXDOQ
   OxxOBO5UAerXxK4d1ypP75WQADX5oMchubMezoEyOvwiw7k1e/gFRKpPd
   UbZmA7hVVuToECs4Q5Rc8L/N9TqN2mOeYGtxtWZT7IOYGEh9560l6TDr/
   3b47AUk7rwlTglxNAJyIzE530e69y+Tvf2uzJHwmtfdbmHtei/csw5qSV
   RomI19oyU6N9BhhhfvBNYHLcPNX896YE28o5keIwIXusQ5FX/5lQtvflS
   WN0zpWLcV34I5FAol9R1sOHsxP8WvTvjfin2cK40fsHJ5KzH6XWafTRXq
   A==;
X-CSE-ConnectionGUID: dgWOSFNMQvCd7u4whypUpg==
X-CSE-MsgGUID: /zPhRiZLR36zoOY4hhEn5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="95683274"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="95683274"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 05:36:32 -0700
X-CSE-ConnectionGUID: f3AaGPWSRvyMiVThqwkF4Q==
X-CSE-MsgGUID: z4YbdJnmTRu9VFVCMryzaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="19880"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Oct 2026 05:36:31 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDhvg-000000000IN-2TUm;
	Mon, 05 Oct 2026 12:36:28 +0000
Date: Mon, 05 Oct 2026 20:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-10 0/1]
 drivers/block/loop.c:1989:6: warning: no previous prototype for function
 'loop_process_cmd_list'
Message-ID: <202610052044.6WAHTRY6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi jiayingrui,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-10
head:   170954b20ad9307c64c3ce705b609f50852e65ad
commit: aa8a9034d8a0e18d37fff6c6053f470be77637ae [0/1] ANDROID: loop: export loop_process_cmd_list
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20261005/202610052044.6WAHTRY6-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610052044.6WAHTRY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610052044.6WAHTRY6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/loop.c:1989:6: warning: no previous prototype for function 'loop_process_cmd_list' [-Wmissing-prototypes]
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         |      ^
   drivers/block/loop.c:1989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         | ^
         | static 
   1 warning generated.


vim +/loop_process_cmd_list +1989 drivers/block/loop.c

  1988	
> 1989	void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
  1990	{
  1991		struct loop_device *lo = disk->private_data;
  1992		loop_process_work(NULL, cmd_list, lo);
  1993	}
  1994	EXPORT_SYMBOL_GPL(loop_process_cmd_list);
  1995	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
