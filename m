Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989810;
	b=nZm0StXbKu5ylejQJtxvzCPJlV+qz0FBw9U61/+t4MwqvupDbnBCN7d2Em9w/wuNdoqD
	 cTuQDW6ByuckFhPGqD7sPdb9/jNYW57E4B33tZ6w8Y8E968o+4oS6HogWR+XVPuhWhDd2
	 vVSfPMNjOnRYvbnPEkQoWrPtyyknGMnRe8F1UWbCqngXQEHkyTZzYdUS8/Uv8iwGSMiHl
	 smVzEDyWpckHoJD/wQ+IjaCfR5JYSeoMm4iRPGf0gRO5F5L+dAR6JHxc1jp9aIL6dyVfb
	 HM7zJJ8IB3YODS/4yEL4uoiFQ5/B1BAP2/ReLFMK6Kva0mrXdaCJa1pV1L3xnILu7wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989810;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=99KcijNA3EjJ07wRg720ApD+kZFoHD0I4IIHuWXdZOI=;
	b=jo59SAiSoBrWr6xUISZccvBYGsO7wILMWkjK38gLl4BgYihgc35hXrjnJe1CXLT20YC8
	 HSWZnRcCeTAoFdN13S/SwaRj7/5eYY6N15UGt09zCqYp9Id+yr4d0yMrkPE4jq45YUWDr
	 65VRX/yL1yBmmuXYWWoeiTfZLprwF3b+SSpg2ADziL0WasAvetqja9JP4hNVB3NfreCw3
	 A/rGF0+2HRutOsejIDQ5hwZmiT6dU0xJa39poMSdWHLuSNxnu077NR2cra1tKjxuf6fBz
	 /0RhbzybDhTftFjoF/azFCa+8cA9L/sCV9XJA6s0SUaDczejCAsfP/Yv1y/MNEUULFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lrvMhR5+;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD8C606A32E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 18:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD8C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lrvMhR5+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793989809; x=1825525809;
  h=date:from:to:cc:subject:message-id;
  bh=niduVHgOwCARHhCv8zIGF9VsLXhfTyz/hG12dmON+r4=;
  b=lrvMhR5+MSlkSzsm5Hj6wF1/K6AHowxQbqFs6efulCYLzhfTgv5Rqk8f
   Uki4mDrRdhMq5iVdaVP5QP6VPBqV++DkRbVMfb0Duy82QBOug2mkZ4HIb
   LnLkiSk3giNyxZfOvPKltSb8JxjKJNTcf+HIFxG6JWHcuUKa6BYgIevMg
   5uYFiaqEWAhR7v0/QsAMOfxrDtxX1+z1ZHfkOAziOeE1530jIiHEwuPEw
   xuRIqFvE7LpyCOlMsh/eRgktZq98t1vwN+ZHy0VU2KKYpPuj7SYkg5jfd
   6no6T+7DIKylsBTooLIgt81GY50HFBwfxvKCB858Il3Tyc902zSG5YWjf
   w==;
X-CSE-ConnectionGUID: lPUI0KxvRVKJ5Hv7IYmNJg==
X-CSE-MsgGUID: gc5kuSgcShuFjbQbFn627g==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2709041"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2709041"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 10:30:08 -0800
X-CSE-ConnectionGUID: 8IQKHsVxT1GM2dd4rwspqA==
X-CSE-MsgGUID: 5xU6t8OhTr21CsWaCD4zIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7320987"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2026 10:30:07 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPOhQ-00000000AKd-3fCI;
	Fri, 06 Nov 2026 18:30:04 +0000
Date: Fri, 06 Nov 2026 19:29:08 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 38/56] warning: casts from
 `u8` to `u32` can be expressed infallibly using `From`
Message-ID: <202611061930.kJUSXVkl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: a95673578a867ad8c65f4c68a929107b718f9c5d [38/56] rust: usb: Add safe accessors for Device, IAD, and interface descriptors
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261106/202611061930.kJUSXVkl-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061930.kJUSXVkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061930.kJUSXVkl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: casts from `u8` to `u32` can be expressed infallibly using `From`
   --> rust/kernel/usb.rs:362:9
   |
   362 |         self.cur_altsetting().number() as u32
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: an `as` cast can become silently lossy if the types change in the future
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#cast_lossless
   = note: requested on the command line with `-W clippy::cast-lossless`
   help: use `u32::from` instead
   |
   362 -         self.cur_altsetting().number() as u32
   362 +         u32::from(self.cur_altsetting().number())
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
