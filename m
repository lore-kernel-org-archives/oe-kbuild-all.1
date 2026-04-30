Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B076257824
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555230; cv=none; b=HiIsPy7W9HPdhSytwlfN/M28MOf+WtZjkZkDR0yPvQ3tCUa4dZ0jDCIV+D2+m2YWfIeH/PdoNxV8zD4I0zgDwlW6uDorQkkTxGk6fnqCzjB6/ze+vYJ32v2IVdOhCs5py4vQ3jQXPIdTFg3kUP/KVEPIks36Ysrhir1VghfMkM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555230; c=relaxed/simple;
	bh=yQCl6qBqP197ZV+3x23/mPD4Q2kCyW8Cz9KaNgYP8X8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e/Nq2YJ5whd211/mI4TB1YXPy17KujtB9fM5FbVCV/sbE5ULfqU+QJzzScsxyNozvHmzOkQDML5N5Cd+wvf8zfaauclW+Et0dgjE+18yo5ESQGX4KWn8Tqwm3QRGgF+ahiTkmPQ1wIZ/TYVoQOVxij58ARSsJaeC6GoWAhd1ueo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFvaYTDs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFvaYTDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777555229; x=1809091229;
  h=date:from:to:cc:subject:message-id;
  bh=yQCl6qBqP197ZV+3x23/mPD4Q2kCyW8Cz9KaNgYP8X8=;
  b=VFvaYTDs2Q5BpqcnETrtHFH3ZEFxCpkLUXee6nVywYkrvZjSH8gvuaNE
   x23ELjlWY8W8rjF26v3fUsCxUTuTCpeRp6aGgQh0BWOvfmL9e/s/YGsbN
   R49EyxBdFllLpFilT40GOuf7urVPbwtx5q9iUbTb3w1C/gv4vC2wDz2UO
   4QdgnJFQ7QpiJk3uao1HnScHMqythPauafFffP7XCxONxVLq/XEfz/237
   CYu4TJnVYpicN/zxvf8xJaDPajQHtvO9Jw8ieVfIIoeqEZBc66za5URLj
   M+X42hj5y+4wN9SK/tcxwzfVhkUNTOHn0CrsIsthwL0PGsBQ0CDfHhcxU
   Q==;
X-CSE-ConnectionGUID: gLlTht0oQRiR6RzXtMl+mA==
X-CSE-MsgGUID: 3MVUt1EJRWSO7b3/O6YbyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78398157"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78398157"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:20:28 -0700
X-CSE-ConnectionGUID: S+OPWmkoTQqFlUdU5Zg4MQ==
X-CSE-MsgGUID: oq9r7vAUSmOeEW5Csk3kAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="257918301"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Apr 2026 06:20:26 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIRJY-00000000CPs-0DiT;
	Thu, 30 Apr 2026 13:20:24 +0000
Date: Thu, 30 Apr 2026 21:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 8/21] kernel/bpf/core.o: warning:
 objtool: ___bpf_prog_run+0x72: ignoring unreachables due to jump table quirk
Message-ID: <202604302138.QD3gvWGT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   9a6d85275cb1def4a196bd5c757f22c4e21f1d0a
commit: 07c6fcc0ac3d793fe9ee0b7a8a1b8b636e8881ba [8/21] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-121-20260430 (https://download.01.org/0day-ci/archive/20260430/202604302138.QD3gvWGT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302138.QD3gvWGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302138.QD3gvWGT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.o: warning: objtool: ___bpf_prog_run+0x72: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
