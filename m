Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD74221297
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 20:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215783; cv=none; b=N+oB5G6XZl922ZnsDyuJdg2h3MRWzqCSrRr5AUQhrl4rm/ZOJEX+at8a0rl8tAfxcM4ocpHNwLdfoxHMHIfnOxgKFs59vOtVdq3x540l0Jk0fRwm6mnOeKh1QqEkmHz5jtBDDHrwHunuE4vhKe6KBq118Inmp7bahbP1gILkZno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215783; c=relaxed/simple;
	bh=PBjRfniT80agn630LUOmZrFuF9aSN+J7M62SuEMOIwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KTx97oQWpbzOPvcadLRcuQoPgx/ACfNWKWT2idkpfiCvGsd7KSxYNu0eGkzCThs7aARoyXPQGGLEZVScH6LHu/bW9V+BrW7jcamB3a78yaYrNpFBf6vYg80XdpUJBjL64u6IJxyGBWgLZiX7sc5Gkae3u/oRcjUdSTTqLZE755Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYGDeHkn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYGDeHkn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753215783; x=1784751783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PBjRfniT80agn630LUOmZrFuF9aSN+J7M62SuEMOIwQ=;
  b=LYGDeHknvpEgpW9nLPusKnr35qkPcn9sG64ZheelZwJhdTIYYHgz8k3N
   pWOB54XwcrYLFczw1UiI53O/qa114NKRAcn8CdjN+tGGqFq6udD6DanJc
   SahPUHZvOmlhx8wi6/PpsDcGPMykfucQns7UkxolEF+QzF6CpQ4lKWaFK
   JMEsMcWoUPfdo4kWk/6PG8XkTkX7PulO8Wq0ihoKQmM1w71Gh9YWyYgCN
   NbLvn7vZ90S2UNYly6POyRcg8DkucwY+XA8LIxkhxmnrHLcqDC9xhqTjp
   EDH+TMCsadef9NRKX1/OW7PrB7hvyRr6we5OSxWsh7FTkj+3xy4r/2gfJ
   Q==;
X-CSE-ConnectionGUID: pSnJFqVMSx6b6W0CJO7tOw==
X-CSE-MsgGUID: c6gA4BorT660EwwSrBYk3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="43102415"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="43102415"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 13:23:02 -0700
X-CSE-ConnectionGUID: EmzDwbpmRiaFRFgImVk7Ng==
X-CSE-MsgGUID: 7QLtphyzTjmnxy1wgNQtlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="164888472"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 22 Jul 2025 13:23:00 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueJVq-0001YH-0S;
	Tue, 22 Jul 2025 20:22:58 +0000
Date: Tue, 22 Jul 2025 22:22:01 +0200
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>
Subject: [linux-next:master 7423/11552] kernel/trace/rv/reactor_panic.o:
 warning: objtool: rv_panic_reaction(): unexpected end of section .text
Message-ID: <202507222245.JgnoLxRS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   05adbee3ad528100ab0285c15c91100e19e10138
commit: ff4e233d8ab70fe6ae460ecc8c0e5b24dd0fedb0 [7423/11552] rv: Let the reactors take care of buffers
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20250722/202507222245.JgnoLxRS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507222245.JgnoLxRS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507222245.JgnoLxRS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/rv/reactor_panic.o: warning: objtool: rv_panic_reaction(): unexpected end of section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
