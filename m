Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3335184
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 02:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727057095; cv=none; b=Ceb+vfdYZDNiytWZfJQrXSt7N6HpAYtIM3Mpggqrtqu9nDRqIchBidnqqGFh6bkgW/One8Nfvk/XmLdzihaYt8MzlZXCAOyT5r7Pos9CGz0nNcRnhokKRV+faw02s/AS/cgg6EFMF01x5LUDVHAXlhd3i6b38nzlBbfraGY6DPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727057095; c=relaxed/simple;
	bh=Nbfl7eUZ5IRWebdiQNFPXiEkwI7EyQzq+YLUDt1K6FE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hu2xa34si7YwEyXjEb/CE06u3dCWStaC7jFWO2MmTbqyTnXOi2JmSt9x8+AxjSV6IDIgUsiG4l3d4/gbQiwWIPb5EQUn6VmBlF3Lp+UtUjo15F28JVPgDlX7nJlIO+/MbS9WL4LAioWqpOlpjEqtiVJMd8jPZ6QFB9vDcBLAu/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iY6dic44; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iY6dic44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727057093; x=1758593093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nbfl7eUZ5IRWebdiQNFPXiEkwI7EyQzq+YLUDt1K6FE=;
  b=iY6dic44fu/gsaM3cb6r2Uf6i3Ono6E5ds14RzPwaWcTOKDtcijDW0QZ
   aQN53dBK897A3TEJ/q9guVDuIIemyirH1/JUHDrWZwlUUGa8PobZofTTq
   gRUrpTRxzY6b4qiuIULzXSj8ePhyoQfpia0CJl/5VHMskRZICIJhApWEs
   P1kOOjiMZh4NLY571ERiXEbqJO+nT7x0WsGJBPud1oll9ViDHr027dSmg
   AjnXDPPzXUzIIBHdgvlKv50kIrWMeKEHAP+dKQtkAN5TKWyB1SOH34rXT
   eEDdZ7k43WGWzAfjClraGgrlm5fT3yxCZgdncBLaJjE6uWa4cOXEyzKXl
   Q==;
X-CSE-ConnectionGUID: WzTlPjbqSB2DWbvj59Zwzw==
X-CSE-MsgGUID: 9WgvwpQWQPSc9G/HgWcT6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="43506348"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="43506348"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 19:04:51 -0700
X-CSE-ConnectionGUID: cqgHbXlXTiSI5NDkLKeIHQ==
X-CSE-MsgGUID: zyuoAvKdSHKNitrOsuIXgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="94245653"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2024 19:04:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssYRU-000Gow-0L;
	Mon, 23 Sep 2024 02:04:48 +0000
Date: Mon, 23 Sep 2024 10:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:rnvme-device-id-without-macro 58/69] warning: field
 `tagset` is never read
Message-ID: <202409230944.m0nDeruh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux rnvme-device-id-without-macro
head:   c156c0fda9fdc684562c4696f38beb1206c4f4d4
commit: 2b4d385633b2e1ff34821f8ac006a4bee0398b59 [58/69] rust: update blk-mq for nvme
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240923/202409230944.m0nDeruh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230944.m0nDeruh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230944.m0nDeruh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: field `tagset` is never read
   --> rust/kernel/block/mq/request.rs:478:5
   |
   476 | pub struct RequestQueue<T: Operations> {
   |            ------------ field in this struct
   477 |     ptr: *mut bindings::request_queue,
   478 |     tagset: Arc<TagSet<T>>,
   |     ^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
