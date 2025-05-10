Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A1B2750ED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746901311; cv=none; b=s92mMriBLk/2ujzxtC544ycq2Flz6HM5BkwJMM+bOXMWJVyDAlwcx3UxF90NXNONtQucHwbbCRkzJhOZBUkB+w/WZUzCg7XHtsuJlVY3ovF07IkDHGjuIY59Vtn8grTZYpMc8CQ8Kw2FS3llCmdZuNVFEO8mnzgkUHqHWjYuicE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746901311; c=relaxed/simple;
	bh=xl2Xm03MEzX92K3RCfMoIfeHFxeUA2uFI9WSwepWXvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qUp9QtKGFKMaIBmd+EhaxtXTSl18jMDva4lwA1+d33DGy4G8/jv8Emm7onjhBFiRyaaYJ4FlPifwWXLkA5/A0/ibCMv2zNQ28/8AU1ygLeP4Avr9aayBqpEoHLQZ5XUZR6n4rJZsMt3D+yObXLHRvsIelYqqaljzWqyqeDlR2ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kH1+NrCR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kH1+NrCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746901310; x=1778437310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xl2Xm03MEzX92K3RCfMoIfeHFxeUA2uFI9WSwepWXvM=;
  b=kH1+NrCRP7UVWYLve+93Fm9SYeBRbVMTZXOJC533Fnk76J1x5u4PRkcO
   xbGoA4ssIBxEd8wXS/WzxgOfDFnamklTA02AsiDVlA7IynhFtS1GdvZRM
   77yjUWdlVCwgaQq61D8PAw0t/MFtVWc44UMddtZ0ex6eDhqjLWgJjKE9M
   MYhWQDYcnwv3UfMaZMJJA8pyFEkY4fbys+v+VpXb4Ha0as2RFA9SZdZCV
   C/EzHYsdtW8FNyOO8zFSHSeMUBhCpFMHFbhQbbN29BYkMfFoR1FKgUl9k
   8qm5c60ZyroVrspwK7pzqe7adJQEr2Kle4F8Z/Xf04rPX/vQ7DJig0fM9
   w==;
X-CSE-ConnectionGUID: nngUcgxES3mfBkXr5w6fJQ==
X-CSE-MsgGUID: gp+8dMvlSg2v41/IWyTfew==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="47835040"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="47835040"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 11:21:46 -0700
X-CSE-ConnectionGUID: GOKj9HCJR0yQwBpw6cXOfA==
X-CSE-MsgGUID: CzWrPRSaThmlsh6BX75ALw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="167860083"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 May 2025 11:21:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDopT-000DHE-2m;
	Sat, 10 May 2025 18:21:43 +0000
Date: Sun, 11 May 2025 02:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.coredump.socket 12/17] net/unix/af_unix.c:
 linux/pidfs.h is included more than once.
Message-ID: <202505110216.S25ORSP7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.coredump.socket
head:   bad5a454ba7c00605ca5652812cc6af5952457ad
commit: 48d45baea7169602452b8ae6a2ab8ced20620b74 [12/17] pidfs, coredump: add PIDFD_INFO_COREDUMP
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110216.S25ORSP7-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> net/unix/af_unix.c: linux/pidfs.h is included more than once.

vim +93 net/unix/af_unix.c

    79	
    80	#include <linux/bpf-cgroup.h>
    81	#include <linux/btf_ids.h>
    82	#include <linux/dcache.h>
    83	#include <linux/errno.h>
    84	#include <linux/fcntl.h>
    85	#include <linux/file.h>
    86	#include <linux/filter.h>
    87	#include <linux/fs.h>
    88	#include <linux/init.h>
    89	#include <linux/kernel.h>
    90	#include <linux/kstrtox.h>
    91	#include <linux/mount.h>
    92	#include <linux/namei.h>
  > 93	#include <linux/pidfs.h>
    94	#include <linux/poll.h>
    95	#include <linux/proc_fs.h>
    96	#include <linux/sched/signal.h>
    97	#include <linux/security.h>
    98	#include <linux/seq_file.h>
    99	#include <linux/skbuff.h>
   100	#include <linux/slab.h>
   101	#include <linux/sock_diag.h>
   102	#include <linux/socket.h>
   103	#include <linux/splice.h>
   104	#include <linux/string.h>
   105	#include <linux/uaccess.h>
 > 106	#include <linux/pidfs.h>
   107	#include <net/af_unix.h>
   108	#include <net/net_namespace.h>
   109	#include <net/scm.h>
   110	#include <net/tcp_states.h>
   111	#include <uapi/linux/sockios.h>
   112	#include <uapi/linux/termios.h>
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
