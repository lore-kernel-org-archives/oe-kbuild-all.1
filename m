Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5C91B4224
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 17:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782149759; cv=none; b=IxCi91UVz09Xy5XakortW9/5yt57YfPgtJ5psxg4k4Q1IR4CurJ5xG207nWc6GePnTRmIoMWhOamuJGEJ7EbIUJ1FxIrQAq2dVYsJwCKpD8RYLCeZfGlqxBJ2skROIoCS3xV7umqom/0FCjpDutcTUQ6yIEKQU7K30MkGMkI0DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782149759; c=relaxed/simple;
	bh=E5sryANTtvZk8NeFVCqZz+yARmfL4XPLnxBTLl5ULQ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=udjsUl0ia0yRQxQaGIR4YR4D9H4dF6WBIbAyqMTDyNxTkkdPW5rPwQ953J+sW+ZsIP3tN+3cczHdDT1jDN34pm0W73r72jg53WuzaEngS/qM4zloVflrU2UT6c5xnQYEZpuR4x3QTkbMfTM6XSgpdhj6xc5AtpKIB0yXAWOFtDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RubTcwyx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RubTcwyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782149759; x=1813685759;
  h=date:from:to:cc:subject:message-id;
  bh=E5sryANTtvZk8NeFVCqZz+yARmfL4XPLnxBTLl5ULQ0=;
  b=RubTcwyxjh959oXzdPKKywaEx7rH3P9SSbfHESqJ1YvAnqjXY+14rXS9
   Jj//3bZcxwhRjAGIIGA0XWmHYjlEcM7IEdbOW0ArdBSV1L6i3Y9bhrvWb
   jilyZSuN2oPUVgzBY71UQt/YB9eWfzVPSRAyyAxuv92jii5ZiB6ycmFXZ
   vDviuLQBTW7zSqNP5QvYO+rcwj9k3YpM1zD4+DTB9kirv1a49hW7H8X8g
   zuYwJCtDebEae8S+gmrwRhbYnACB1qEljUr2UTfwgfzLX7KUMN6IK7dv6
   cL1y8y4amF4k1+X+v1ugxW7MBu9lqXejdAYjPlUYgnhqo5FxJ/IjXKwuq
   A==;
X-CSE-ConnectionGUID: IiL64RuBQD2iZU0NGSqZ5w==
X-CSE-MsgGUID: E0WaYPAyRAOvMU1+CeOQlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93542215"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="93542215"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 10:35:44 -0700
X-CSE-ConnectionGUID: pzywvkG3TLuwnlCDxKm1ag==
X-CSE-MsgGUID: NFPy0d2ZTQaDdlKyvEikzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="251223481"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2026 10:35:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbiYe-000000001dk-0yux;
	Mon, 22 Jun 2026 17:35:40 +0000
Date: Tue, 23 Jun 2026 01:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/syscall 2/4] vmlinux.o: warning: objtool:
 x32_sys_call+0x1c76: return with instrumentation enabled
Message-ID: <202606230137.uNIF6ChC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/syscall
head:   47c2508c2db3f83600b4d5e8f7a83226213b6cc1
commit: 9056c35af120a6bba4e4532eb34a00533f6f73c3 [2/4] x86_64/entry: Make syscall dispatch noinstr
config: x86_64-randconfig-104-20260622 (https://download.01.org/0day-ci/archive/20260623/202606230137.uNIF6ChC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230137.uNIF6ChC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230137.uNIF6ChC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: x64_sys_call+0x1b37: return with instrumentation enabled
>> vmlinux.o: warning: objtool: x32_sys_call+0x1c76: return with instrumentation enabled
   vmlinux.o: warning: objtool: ia32_sys_call+0x2127: return with instrumentation enabled

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
