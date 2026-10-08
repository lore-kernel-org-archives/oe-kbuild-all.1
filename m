Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A6228E0F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 00:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791420716; cv=none; b=PIGQnJu9Suy4Aodxt4XMsP06MFNe4OUGKDgsqynmPwMhZ2kkUVlIPH9V2Kkrg/8tbyDHiV5dB0Rq4Kh2yczFbdQkw/vhl0Zp7Sgz5EGaJ8j2z+614xoMq1f4G19QEj+YaVqIlm5vWfiIOHabwXNJB4ds9kCMcRLjUJ4JsMCvvNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791420716; c=relaxed/simple;
	bh=NsZFAzI8cuJt6jK6hJX7C5N+n1AoJmLuNRGUqykJHPo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r7alxocSIpPDFc64mn1b7V0N+HQ9cjau8gRQtJfAIxYe4Yu3DbTWwv7vcBvQ7qk96F/Rv6wHQ8+GNnaQpx47pZ7SLXJDm645DMRDwa4dNN023ut5C7rHPH/YEKZFSV4aI4HB3ozzQZKv0Y9wZK6aF0ikl3hQ8pt/fcoERvzkzsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjIgz5YM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjIgz5YM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791420715; x=1822956715;
  h=date:from:to:cc:subject:message-id;
  bh=NsZFAzI8cuJt6jK6hJX7C5N+n1AoJmLuNRGUqykJHPo=;
  b=AjIgz5YMfuJLNQROZN0ydp46/uKcBhUDi9iTBMyJAwWQgdqzGmZ4mett
   vlr7OhIJyH7vl7qKq96Cntx1S1WDPi3Enfacpz3dZxEm4V5+YixN+TOXl
   k6E7LZaEp4Nx0gEcjTE7cqwTfavxLB8pFZxpjfXHPtj5cWxl+pcM903kR
   XZ2DAtthJJMxPnipOzjzCVNV83kRdEmveM7KNmFj2XjplVlEDT5Z3e+pl
   RR0y2E+1L8i5963iIzeS39DH3EU1b01JKBJIPvrXkNFwKjZ7XE9ybl9lM
   PmJLfIDJ8DRnqkzb/DwjSwNUA1zm8Lsh+2IoD6SsHFDf0bKentNdTWYSb
   g==;
X-CSE-ConnectionGUID: bC7Tkqu6RN6z1BJBcJpXvQ==
X-CSE-MsgGUID: GyaQ+wLaSPCPJuHil3XnxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="97424"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="97424"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 17:51:55 -0700
X-CSE-ConnectionGUID: kNtOJd7MSl2Om4M9jQOPQA==
X-CSE-MsgGUID: LjA85kS7TXqj2xUzzMlZoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="277717641"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 07 Oct 2026 17:51:53 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEcMQ-000000004RP-3ScM;
	Thu, 08 Oct 2026 00:51:50 +0000
Date: Thu, 08 Oct 2026 02:51:41 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp-round4-backup 36/42] htmldocs:
 Documentation/bpf/xdp_tcp.rst:1: WARNING: Title overline too short.
Message-ID: <202610080223.uKILiduD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux xdp-tcp-round4-backup
head:   63925314fb03ace1f3949a09d298cfdc0188bc8a
commit: 97d3e26477bd9ae7600ba798e1dea7cabf3ebc57 [36/42] selftests/bpf: Introduce a socket interface for XDP TCP programs
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261008/202610080223.uKILiduD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080223.uKILiduD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Using alabaster theme
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/bpf/xdp_tcp.rst:1: WARNING: Title overline too short.


vim +1 Documentation/bpf/xdp_tcp.rst

   > 1	===================
     2	TCP sockets from XDP
     3	===================
     4	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
