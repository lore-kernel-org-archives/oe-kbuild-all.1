Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEED1509AB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 May 2026 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780233906; cv=none; b=MykFVq7T2Q1enROall3bP6gLPpZ9INiwHpNHVJLEia81VWeVQ8RBWQp9oxF6+pllg9UbZ1rkd0SfLyBUt14T4/ujif353F6ZlU+k/LiuhY9chq5zb6Q59Os/F3SjaNmypkztxugRpGw18r7S3zA3UgGmJc9HqOy++KbQ7dVP2LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780233906; c=relaxed/simple;
	bh=8vWA4VL9d4TrFRHHymChD+aBjowvfvHbKVaGGPl67B0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dWh51MC78xgHetlL7jmi/J2CKJ6XiMHpLjUPmnlC4y4t5azdFZ6rDk9xBWTToI4nMP8dAaotqDc1YuT0cvCwJ2ycoUtzEoS1eDWe2T1VxMEA8xE0BNcXiddOrTL5lpJCailp8JZPa0VMNqbkLvcSZZEPdNoko0nsKe30Gqb/CJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCu8APf1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCu8APf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780233904; x=1811769904;
  h=date:from:to:cc:subject:message-id;
  bh=8vWA4VL9d4TrFRHHymChD+aBjowvfvHbKVaGGPl67B0=;
  b=LCu8APf1fD1z9VpNY1MBMNNpCuhaqN0pZKEgavj8p/+H5tSy1D0+nUfL
   o4tmnuM8cL9fdeyo9u8c+0QQbJt0i/RHxUhGGO97AgvtKe4bQmXMxdt9M
   by0ASBsJ5QbgnJU/qdIAlsMi2SqqOstezy7VmC6aGZXL+BfroaLyW0alt
   YXPZI/2ytSyoPCoVvFeIgdeM6vhKnc3mqhjnDlWDAVNvLZBi+7oBfkOS3
   SrGlBkQvMDCvUFQmlLj8/Z/dglaGguSPkhi9X+aeQwNkHFHzuwoc4tWKu
   TOLvY34yAqyXNqMM9wajvROhgs0HzKN0KB7DdP7mSSF8A/viot0xbGTT4
   w==;
X-CSE-ConnectionGUID: 3D9FxZUOTh2zy3a0Cleu3g==
X-CSE-MsgGUID: LK6K7ms3RsukpPzDwEiPoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80983802"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80983802"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 06:25:04 -0700
X-CSE-ConnectionGUID: 0LiItSJKSEm6Q38n0rAuhg==
X-CSE-MsgGUID: QY9IcdWwSOyddI26GCq3Cw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 31 May 2026 06:25:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTgA0-000000001Nl-2vbW;
	Sun, 31 May 2026 13:25:00 +0000
Date: Sun, 31 May 2026 15:24:44 +0200
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: run-command.c:259:4: error: use of undeclared identifier
 'waiting'
Message-ID: <202605311529.eHI9QQYt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-jevents-py-Make-generated-C-code-more-kernel-style/20260531-163012
head:   69f2cb88abe78c59ec6c963e1833369a0f080c9d
commit: 8cea940c10badef9d9b9752fcdb00e04648d27bc tools subcmd: Robust fallback and existence checks for process reaping
date:   5 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260531/202605311529.eHI9QQYt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605311529.eHI9QQYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605311529.eHI9QQYt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> run-command.c:259:4: error: use of undeclared identifier 'waiting'
     259 |                         waiting = waitpid(cmd->pid, &status, WNOHANG);
         |                         ^
>> run-command.c:259:33: error: use of undeclared identifier 'status'
     259 |                         waiting = waitpid(cmd->pid, &status, WNOHANG);
         |                                                      ^
   run-command.c:260:8: error: use of undeclared identifier 'waiting'; did you mean 'waitid'?
     260 |                         if (waiting == cmd->pid) {
         |                             ^~~~~~~
         |                             waitid
   /usr/include/x86_64-linux-gnu/sys/wait.h:127:12: note: 'waitid' declared here
     127 | extern int waitid (idtype_t __idtype, __id_t __id, siginfo_t *__infop,
         |            ^
   run-command.c:265:21: error: use of undeclared identifier 'status'
     265 |                                 if (WIFSIGNALED(status)) {
         |                                                 ^
   run-command.c:267:27: error: use of undeclared identifier 'status'
     267 |                                 } else if (!WIFEXITED(status)) {
         |                                                       ^
   run-command.c:270:25: error: use of undeclared identifier 'status'
     270 |                                         code = WEXITSTATUS(status);
         |                                                            ^
   run-command.c:286:8: error: use of undeclared identifier 'waiting'; did you mean 'waitid'?
     286 |                         if (waiting < 0 && errno == ECHILD)
         |                             ^~~~~~~
         |                             waitid
   /usr/include/x86_64-linux-gnu/sys/wait.h:127:12: note: 'waitid' declared here
     127 | extern int waitid (idtype_t __idtype, __id_t __id, siginfo_t *__infop,
         |            ^
   7 errors generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
