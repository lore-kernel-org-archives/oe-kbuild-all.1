Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924250;
	b=tN04UKdrRJ6fEAwK2eNfKt/EJfm5aj6yZ8J5xtncuJRtSHaZiZZPbj3rQs+El+SWRbpX
	 fwPF1v2mxvD2SG+JQI/W3s0jYS2ydzsS6CxzPNACTOxA357hzrZshemxFybB4kyPqacmQ
	 Mv4/tSmJU5Fns7qHg59u5sojVA0Rj46fdPxjCvhFfls8u+fDskjA9fgZVqiOxmpBVwiN1
	 aHPpI6DaAB0y6LEweGcSJJsFA01V/G/HQpuJ3Z9BT1pUdzbPiF95nbEu/nj8rDcD3Qclj
	 jJsgp0X0atP8UlYJwCU6D+TOdiWPd5mlSln+kEuQqzI8SrYq5us8+0bvg/dtNL/vRjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924250;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5jGqKMzpHIBt9HmpwpDrqu2DhhE4x8wUp8p1Drn43Ak=;
	b=xKGftHIZ347dVvf1Ze9Z7TFYTg85SmwtEF8346UDBZ3qDtL7NJlByR3F1pALwfF3QsLu
	 hl9qJ5Y3LUp4rVxC6o/uHyBsWmuU8yKQhdwlKBXO/kzVe4h6zir2Q1nh39g3+fyhQRsLv
	 5PdNF4HNWfF2CZVXzXgWd+r25KaoJwpzY4g5MmZU9TXohcoPyS4yevETsZdZnLNfOg3bK
	 jnpijcpw4nyHV1DIMACH1PXsQaehM79AvLoAni/lg2bvH+TGyTipJEW7aQAxGZhTSepOA
	 tHZdFGZeO3kIR7aQfykc0HLxW3qJTk87Fe9OPqtIt3napUr1brzEwXOwQdwPRNQ1tgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PUf2W3uw;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E133606A33A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 14:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E133606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PUf2W3uw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794924250; x=1826460250;
  h=date:from:to:cc:subject:message-id;
  bh=hQN8welQxv9k4rl4HD+iCMs6hNmuTmKOI3f0qQcpOpg=;
  b=PUf2W3uwqSyxnCg7hb00qAysF2L8DDjXEOzg/ocglf7HTjEnp2r6bfoz
   gbX7Oyt7eEVeijDqtFT7d4UR3qv2+cQcqIIazG5eEnL+nke88J3dgZ+fd
   KwQNLmLUry4fm1gRwBPrAfz8o7/IS7aoYXf8Z4Xahri+hQP8CHujD0XAg
   c6b9YsQrwmdSGYnbZUxLwvwVivQNKzntYD6VUEWh1taOz9tTsXfY8Zx7X
   Oqxg40KsAnQSWNv/e6hjWRIaDNgjAXdlcIDCxPNgO3kDdS0oIJyv0jyRl
   e2zBdqixh86QPSybBR27AJydd6wSgY4Da2XQBNYAOYebmE2C06HHHWoIj
   Q==;
X-CSE-ConnectionGUID: x64uyPRlSBG3NpubhsLkvg==
X-CSE-MsgGUID: C/+j4R/hQQu8UxsEt8EGrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3733224"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3733224"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 06:04:09 -0800
X-CSE-ConnectionGUID: eAe5XsJiRA29BNDpe+NEcA==
X-CSE-MsgGUID: tZurIZY4SJWrtowJmB12KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10236403"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 17 Nov 2026 06:04:07 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTJn3-00000000386-1TPl;
	Tue, 17 Nov 2026 14:04:05 +0000
Date: Tue, 17 Nov 2026 15:03:16 +0100
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [mhiramat:topic/bootconfig-multiple 5/9] htmldocs:
 Documentation/admin-guide/bootconfig:415: ./lib/bootconfig.c:1256: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <20261117150234.wWb8ZTnT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/bootconfig-multiple
head:   1f638abe94c9f0d98d017e0aaf27a76982b7d8b9
commit: 1646c45f5190170cc1c9eb1379dc94e7e8cabec5 [5/9] bootconfig: Add multi-config ID helpers and xbc_init_configs() support
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261117/20261117150234.wWb8ZTnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117150234.wWb8ZTnT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
   Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/admin-guide/bootconfig:415: ./lib/bootconfig.c:1255: ERROR: Unexpected indentation. [docutils]
>> Documentation/admin-guide/bootconfig:415: ./lib/bootconfig.c:1256: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/admin-guide/bootconfig:415: ./lib/bootconfig.c:1258: WARNING: Inline strong start-string without end-string. [docutils]
>> Documentation/admin-guide/bootconfig:415: ./lib/bootconfig.c:1258: WARNING: Inline strong start-string without end-string. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:387: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:410: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
