Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFF912B8B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 02:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728009783; cv=none; b=SKUcTkye/Fe9aDEMLRPrIY0aizPERZn3aQ6S0+ljKSlDOOJkJGCZQOiHomEGX5j1PpjgRhNq4DghCaUdKrVp7Z3qmAhWy/+gLxbkmGEKNpdumw67PryTZBdDEo1hmw14cLhei4k6qkcs0ZrNg2hgkomcQ05T1tIyYdhYOmEbwx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728009783; c=relaxed/simple;
	bh=5JtCrdEfLXDJbJ/joDNm4jIE0YjlYma2yduBkYjmKr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZCadPXh4LjOS3o0JwMROo1/O9Sbeg68bUyliG4tXOYt4l8FjpDBv7XqHyfuMTp8CN8ykGQp2jcoP/VhqKdnraayIQE5hX5aK0QkeWbqFjPUMXQr7MmMiJ7pUyggwmjx14M7AhY8DsWcGx7+h2esESLMuiDU2h2NcrT3ccW71qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ig+quIaw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ig+quIaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728009781; x=1759545781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5JtCrdEfLXDJbJ/joDNm4jIE0YjlYma2yduBkYjmKr0=;
  b=ig+quIaw0eB5H2CEX5XH+tOUDwCbujEY25lat+nDf3bbR49JjaQlPzqn
   wGI94Jb1PZALdpUXUeg+7B4ajOghhS+ltEY6jh6OdG5kja4Yf+/tKmG40
   hbTFceuhmpQhaCocpFCOY/yGNunZ9ZnssmEPUPHrP57R4TzuMuF0drG+3
   RXI/30z5T4pWnkSSXLjWa1Z0qzW9pJarO+kfrVgurFRyr8GzlBZzBVXFF
   7mGUquHAp+i2cNh5Fa7NH4SzqOuEZSo+0+OI+sOyymCWH+dKAaOog+igc
   hzntH0UYBjczgScz7SiT75jVb8pt8RX4E5FACDESmXa03H26Uni4WGwsw
   Q==;
X-CSE-ConnectionGUID: D+JbjEGwSWSde9ytNzPhkQ==
X-CSE-MsgGUID: yCa5pBE7THSJ7LubEh+iFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26693653"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="26693653"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 19:43:00 -0700
X-CSE-ConnectionGUID: EEQIxS4ZQie59F/1fP+h4g==
X-CSE-MsgGUID: eQC35FE9T5eOVE6WqOFO2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="78566738"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Oct 2024 19:42:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swYHR-00018u-1Y;
	Fri, 04 Oct 2024 02:42:57 +0000
Date: Fri, 4 Oct 2024 10:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3680/16788]
 include/uapi/linux/sched.h:14:25: warning: passing argument 3 of
 'kernel_thread' makes pointer from integer without a cast
Message-ID: <202410041041.f1u4Lh1N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yuantian,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 98e404ea2707414a2890234862238b42cb05bb88 [3680/16788] LF-5606: libata: pmp: workaround for ERR051238 for imx sata
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241004/202410041041.f1u4Lh1N-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041041.f1u4Lh1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041041.f1u4Lh1N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sched.h:10,
                    from include/linux/delay.h:23,
                    from include/linux/libata.h:13,
                    from drivers/ata/libata-pmp.c:11:
   drivers/ata/libata-pmp.c: In function 'sata_pmp_configure':
>> include/uapi/linux/sched.h:14:25: warning: passing argument 3 of 'kernel_thread' makes pointer from integer without a cast [-Wint-conversion]
      14 | #define CLONE_SIGHAND   0x00000800      /* set if signal handlers and blocked signals shared */
   drivers/ata/libata-pmp.c:381:50: note: in expansion of macro 'CLONE_SIGHAND'
     381 |                 kernel_thread(poll_thread, NULL, CLONE_SIGHAND | SIGCHLD);
         |                                                  ^~~~~~~~~~~~~
   In file included from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1075,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/libata.h:16:
   include/linux/sched/task.h:99:70: note: expected 'const char *' but argument is of type 'int'
      99 | extern pid_t kernel_thread(int (*fn)(void *), void *arg, const char *name,
         |                                                          ~~~~~~~~~~~~^~~~
   drivers/ata/libata-pmp.c:381:17: error: too few arguments to function 'kernel_thread'
     381 |                 kernel_thread(poll_thread, NULL, CLONE_SIGHAND | SIGCHLD);
         |                 ^~~~~~~~~~~~~
   include/linux/sched/task.h:99:14: note: declared here
      99 | extern pid_t kernel_thread(int (*fn)(void *), void *arg, const char *name,
         |              ^~~~~~~~~~~~~


vim +/kernel_thread +14 include/uapi/linux/sched.h

7f192e3cd316ba Christian Brauner 2019-05-25   6  
607ca46e97a1b6 David Howells     2012-10-13   7  /*
607ca46e97a1b6 David Howells     2012-10-13   8   * cloning flags:
607ca46e97a1b6 David Howells     2012-10-13   9   */
607ca46e97a1b6 David Howells     2012-10-13  10  #define CSIGNAL		0x000000ff	/* signal mask to be sent at exit */
607ca46e97a1b6 David Howells     2012-10-13  11  #define CLONE_VM	0x00000100	/* set if VM shared between processes */
607ca46e97a1b6 David Howells     2012-10-13  12  #define CLONE_FS	0x00000200	/* set if fs info shared between processes */
607ca46e97a1b6 David Howells     2012-10-13  13  #define CLONE_FILES	0x00000400	/* set if open files shared between processes */
607ca46e97a1b6 David Howells     2012-10-13 @14  #define CLONE_SIGHAND	0x00000800	/* set if signal handlers and blocked signals shared */
b3e5838252665e Christian Brauner 2019-03-27  15  #define CLONE_PIDFD	0x00001000	/* set if a pidfd should be placed in parent */
607ca46e97a1b6 David Howells     2012-10-13  16  #define CLONE_PTRACE	0x00002000	/* set if we want to let tracing continue on the child too */
607ca46e97a1b6 David Howells     2012-10-13  17  #define CLONE_VFORK	0x00004000	/* set if the parent wants the child to wake it up on mm_release */
607ca46e97a1b6 David Howells     2012-10-13  18  #define CLONE_PARENT	0x00008000	/* set if we want to have the same parent as the cloner */
607ca46e97a1b6 David Howells     2012-10-13  19  #define CLONE_THREAD	0x00010000	/* Same thread group? */
fcd964dda5ece2 Chen Hanxiao      2014-10-07  20  #define CLONE_NEWNS	0x00020000	/* New mount namespace group */
607ca46e97a1b6 David Howells     2012-10-13  21  #define CLONE_SYSVSEM	0x00040000	/* share system V SEM_UNDO semantics */
607ca46e97a1b6 David Howells     2012-10-13  22  #define CLONE_SETTLS	0x00080000	/* create a new TLS for the child */
607ca46e97a1b6 David Howells     2012-10-13  23  #define CLONE_PARENT_SETTID	0x00100000	/* set the TID in the parent */
607ca46e97a1b6 David Howells     2012-10-13  24  #define CLONE_CHILD_CLEARTID	0x00200000	/* clear the TID in the child */
607ca46e97a1b6 David Howells     2012-10-13  25  #define CLONE_DETACHED		0x00400000	/* Unused, ignored */
607ca46e97a1b6 David Howells     2012-10-13  26  #define CLONE_UNTRACED		0x00800000	/* set if the tracing process can't force CLONE_PTRACE on this clone */
607ca46e97a1b6 David Howells     2012-10-13  27  #define CLONE_CHILD_SETTID	0x01000000	/* set the TID in the child */
5e2bec7c2248ae Aditya Kali       2016-01-29  28  #define CLONE_NEWCGROUP		0x02000000	/* New cgroup namespace */
f622b429dadf83 Chen Hanxiao      2014-11-04  29  #define CLONE_NEWUTS		0x04000000	/* New utsname namespace */
f622b429dadf83 Chen Hanxiao      2014-11-04  30  #define CLONE_NEWIPC		0x08000000	/* New ipc namespace */
607ca46e97a1b6 David Howells     2012-10-13  31  #define CLONE_NEWUSER		0x10000000	/* New user namespace */
607ca46e97a1b6 David Howells     2012-10-13  32  #define CLONE_NEWPID		0x20000000	/* New pid namespace */
607ca46e97a1b6 David Howells     2012-10-13  33  #define CLONE_NEWNET		0x40000000	/* New network namespace */
607ca46e97a1b6 David Howells     2012-10-13  34  #define CLONE_IO		0x80000000	/* Clone io context */
607ca46e97a1b6 David Howells     2012-10-13  35  

:::::: The code at line 14 was first introduced by commit
:::::: 607ca46e97a1b6594b29647d98a32d545c24bdff UAPI: (Scripted) Disintegrate include/linux

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
