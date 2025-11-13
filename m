Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1C22222BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763041882; cv=none; b=V78ss0xjtr6nJNmvW3qnXYZTkdSQSSvwRPT+X2a/p3GOhaLHRXtKTJSLJpW1QwhD9VuoZHb13ry9AW96lF+8rOB0IhsvboRKcawvhZz+vucNFHSL0KDAPryTj4AKf5UO06lQobx8gBBZBoUupFfSxSzgy80cnes5yj5BPbzREAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763041882; c=relaxed/simple;
	bh=S/CM9j0Xrm10oIU0y78SIo2eX7noZuPAYgTa3ONpHI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gSmiT+rIgVBdNImd7LpU2b0KIjlW5vMbKfqJAyB+/K88y6kr55tdHlS9XRsKrTm8C8z+l9MoflIBopjUQm1C5RBSq8Zj6ZCBiPyhYeeooclrQu5+8Z4FOcvq77f6yscjGxs75oPd8Zp0/Zbpa8hUMwTL2fxj30+V6A+i0lUUNB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XiBiDCUg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XiBiDCUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763041880; x=1794577880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S/CM9j0Xrm10oIU0y78SIo2eX7noZuPAYgTa3ONpHI8=;
  b=XiBiDCUgZQOZg125RqEe4ssB92nGEUZyLns7M1tJRDc9UpZYY1G/6NsF
   y38dlMCys6D5yE4/F7sSp+oleAIt574k1GVT9QgkPL2UYyULKRayiecut
   1kGU7u14A9XQUMLBLobxIuG16pgDvaPLcc2k234jiMkpncMKo5I16K2Cn
   7SRIRFXv0f+y9gjYWHAAXGqrucPU36SshTTRLmxj/1xLpqRJHNbCqxs/e
   RoeJ3WyloEHkmDCvh93uzbs0qLH+07bjAcIL3o70OoQ0kHVt5IpPTxX9J
   pJ2gsMlIcYnGBS82phfWKDCMXHtu0r6EunPs9b0ULNNAd2DHex+tfY006
   g==;
X-CSE-ConnectionGUID: zurFcJBCR4+14eZnivSFSQ==
X-CSE-MsgGUID: pDUWEdIMS7GPQnMIYkyX/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="67722735"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="67722735"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 05:51:20 -0800
X-CSE-ConnectionGUID: KEkTVdx7QHi6GQBzKqwzYA==
X-CSE-MsgGUID: CJjEn7UhQA+18vmxOV3k7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="189520305"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2025 05:51:18 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJXjI-0005Ov-1Q;
	Thu, 13 Nov 2025 13:51:16 +0000
Date: Thu, 13 Nov 2025 21:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-next 3/9] fs/smb/client/cifs_debug.c:48:66:
 warning: passing argument 3 of 'server->ops->check_message' makes integer
 from pointer without a cast
Message-ID: <202511132120.BjBdZPVN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-next
head:   4ca2b517a4ff65e3e8e3a7decc78e4a23481a1de
commit: 99a365f9df4d8326defaf33b4dbef35c16d9cde8 [3/9] cifs: Remove the RFC1002 header from smb_hdr
config: sh-randconfig-002-20251113 (https://download.01.org/0day-ci/archive/20251113/202511132120.BjBdZPVN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511132120.BjBdZPVN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511132120.BjBdZPVN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/cifs_debug.c: In function 'cifs_dump_detail':
>> fs/smb/client/cifs_debug.c:48:66: warning: passing argument 3 of 'server->ops->check_message' makes integer from pointer without a cast [-Wint-conversion]
      48 |         if (!server->ops->check_message(buf, server->total_read, server)) {
         |                                                                  ^~~~~~
         |                                                                  |
         |                                                                  struct TCP_Server_Info *
   fs/smb/client/cifs_debug.c:48:66: note: expected 'unsigned int' but argument is of type 'struct TCP_Server_Info *'
   fs/smb/client/cifs_debug.c:48:14: error: too few arguments to function 'server->ops->check_message'
      48 |         if (!server->ops->check_message(buf, server->total_read, server)) {
         |              ^~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from fs/smb/client/cifs_debug.c:8:
   fs/smb/client/cifs_debug.c: In function 'cifs_dump_mids':
   include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct mid_q_entry'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   fs/smb/client/cifs_debug.c:65:9: note: in expansion of macro 'list_for_each_entry'
      65 |         list_for_each_entry(mid_entry, &server->pending_mid_q, qhead) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:537:27: error: expression in static assertion is not an integer
     537 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   fs/smb/client/cifs_debug.c:65:9: note: in expansion of macro 'list_for_each_entry'
      65 |         list_for_each_entry(mid_entry, &server->pending_mid_q, qhead) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/sh/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382,
                    from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/sh/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from fs/smb/client/cifs_debug.c:8:
   include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct mid_q_entry'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   fs/smb/client/cifs_debug.c:65:9: note: in expansion of macro 'list_for_each_entry'
      65 |         list_for_each_entry(mid_entry, &server->pending_mid_q, qhead) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
--
   fs/smb/client/smb2ops.c: In function 'smb2_dump_detail':
>> fs/smb/client/smb2ops.c:443:66: warning: passing argument 3 of 'server->ops->check_message' makes integer from pointer without a cast [-Wint-conversion]
     443 |         if (!server->ops->check_message(buf, server->total_read, server)) {
         |                                                                  ^~~~~~
         |                                                                  |
         |                                                                  struct TCP_Server_Info *
   fs/smb/client/smb2ops.c:443:66: note: expected 'unsigned int' but argument is of type 'struct TCP_Server_Info *'
   fs/smb/client/smb2ops.c:443:14: error: too few arguments to function 'server->ops->check_message'
     443 |         if (!server->ops->check_message(buf, server->total_read, server)) {
         |              ^~~~~~


vim +48 fs/smb/client/cifs_debug.c

^1da177e4c3f41 fs/cifs/cifs_debug.c       Linus Torvalds  2005-04-16  39  
14547f7d74c4a2 fs/cifs/cifs_debug.c       Ronnie Sahlberg 2018-04-22  40  void cifs_dump_detail(void *buf, struct TCP_Server_Info *server)
3979877e5606ec fs/cifs/cifs_debug.c       Steve French    2006-05-31  41  {
8aa26f3ed80ddb fs/cifs/cifs_debug.c       Pavel Shilovsky 2012-05-17  42  #ifdef CONFIG_CIFS_DEBUG2
0827f71b881c9d fs/cifs/cifs_debug.c       Yu Zhe          2022-06-14  43  	struct smb_hdr *smb = buf;
d4e4854fd1c85a fs/cifs/cifs_debug.c       Pavel Shilovsky 2012-03-23  44  
b50492b05fd028 fs/smb/client/cifs_debug.c Paulo Alcantara 2023-12-16  45  	cifs_dbg(VFS, "Cmd: %d Err: 0x%x Flags: 0x%x Flgs2: 0x%x Mid: %d Pid: %d Wct: %d\n",
b50492b05fd028 fs/smb/client/cifs_debug.c Paulo Alcantara 2023-12-16  46  		 smb->Command, smb->Status.CifsError, smb->Flags,
b50492b05fd028 fs/smb/client/cifs_debug.c Paulo Alcantara 2023-12-16  47  		 smb->Flags2, smb->Mid, smb->Pid, smb->WordCount);
b50492b05fd028 fs/smb/client/cifs_debug.c Paulo Alcantara 2023-12-16 @48  	if (!server->ops->check_message(buf, server->total_read, server)) {
14547f7d74c4a2 fs/cifs/cifs_debug.c       Ronnie Sahlberg 2018-04-22  49  		cifs_dbg(VFS, "smb buf %p len %u\n", smb,
68ed14496b032b fs/cifs/cifs_debug.c       Enzo Matsumiya  2022-08-17  50  			 server->ops->calc_smb_size(smb));
b50492b05fd028 fs/smb/client/cifs_debug.c Paulo Alcantara 2023-12-16  51  	}
8aa26f3ed80ddb fs/cifs/cifs_debug.c       Pavel Shilovsky 2012-05-17  52  #endif /* CONFIG_CIFS_DEBUG2 */
3979877e5606ec fs/cifs/cifs_debug.c       Steve French    2006-05-31  53  }
3979877e5606ec fs/cifs/cifs_debug.c       Steve French    2006-05-31  54  

:::::: The code at line 48 was first introduced by commit
:::::: b50492b05fd02887b46aef079592207fb5c97a4c smb: client: fix potential OOB in cifs_dump_detail()

:::::: TO: Paulo Alcantara <pc@manguebit.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
