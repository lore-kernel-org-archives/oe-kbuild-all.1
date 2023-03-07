Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A570613D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678193648; x=1709729648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WF3fRI8CQ6q8wIXDgF0HhLnKsesy0i8pzlfW9HKFnZI=;
  b=axmXo6+Y17SLgsxmm9yTNlkRodzJh45SAMQfWtwlP8Ci+XXZ7bmcotQE
   Tz2v/Mk8UgitvC8pyKPgA8wzBCN8ftQ0Y3kC2cJAH2/a4AYy0dlcFmgfq
   Smk1Y4JhtBRgt/1JnBphNz4HHGmOc/jS6Z9OZTs70XtsewqTyCAE1glKD
   rR5fNZt3gN3DT1Cf0Qq4TqR3lSm91b5/ABuunGA+BJOozwKCErmI5NweS
   Hk4T8GSSs07n23+s5TkZL70G9Hjdh0F5ti0OErnrhRzjgM7DmspLl+9IX
   380zJ4ZgxnW1LBtVBV18Sse3sY7AoNQxvBR9s9mUIRWILhE33VFYOGBhd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="333313333"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="333313333"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 04:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="709041808"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="709041808"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Mar 2023 04:54:06 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZWpR-0001KF-19;
	Tue, 07 Mar 2023 12:54:05 +0000
Date: Tue, 7 Mar 2023 20:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:viro/vfs/work.csum 5/5]
 include/net/checksum.h:35:23: error: static declaration of 'ip_compute_csum'
 follows non-static declaration
Message-ID: <202303072040.UFmbNAHT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block viro/vfs/work.csum
head:   8b3fb774b1eee6ee4f8c896e3d2f25bb82d2f467
commit: 8b3fb774b1eee6ee4f8c896e3d2f25bb82d2f467 [5/5] consolidate default ip_compute_csum()
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20230307/202303072040.UFmbNAHT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/8b3fb774b1eee6ee4f8c896e3d2f25bb82d2f467
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block viro/vfs/work.csum
        git checkout 8b3fb774b1eee6ee4f8c896e3d2f25bb82d2f467
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303072040.UFmbNAHT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from init/main.c:104:
>> include/net/checksum.h:35:23: error: static declaration of 'ip_compute_csum' follows non-static declaration
      35 | static inline __sum16 ip_compute_csum(const void *buff, int len)
         |                       ^~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/checksum.h:105,
                    from include/net/checksum.h:21,
                    from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from init/main.c:104:
   arch/x86/um/asm/checksum_64.h:17:16: note: previous declaration of 'ip_compute_csum' with type '__sum16(const void *, int)' {aka 'short unsigned int(const void *, int)'}
      17 | extern __sum16 ip_compute_csum(const void *buff, int len);
         |                ^~~~~~~~~~~~~~~
   init/main.c:775:20: warning: no previous prototype for 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
     775 | void __init __weak arch_post_acpi_subsys_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   init/main.c:787:20: warning: no previous prototype for 'mem_encrypt_init' [-Wmissing-prototypes]
     787 | void __init __weak mem_encrypt_init(void) { }
         |                    ^~~~~~~~~~~~~~~~
   init/main.c:789:20: warning: no previous prototype for 'poking_init' [-Wmissing-prototypes]
     789 | void __init __weak poking_init(void) { }
         |                    ^~~~~~~~~~~
--
   In file included from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/inet.h:42,
                    from include/linux/sunrpc/msg_prot.h:205,
                    from include/linux/sunrpc/auth.h:14,
                    from include/linux/nfs_fs.h:31,
                    from init/do_mounts.c:22:
>> include/net/checksum.h:35:23: error: static declaration of 'ip_compute_csum' follows non-static declaration
      35 | static inline __sum16 ip_compute_csum(const void *buff, int len)
         |                       ^~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/checksum.h:105,
                    from include/net/checksum.h:21,
                    from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/inet.h:42,
                    from include/linux/sunrpc/msg_prot.h:205,
                    from include/linux/sunrpc/auth.h:14,
                    from include/linux/nfs_fs.h:31,
                    from init/do_mounts.c:22:
   arch/x86/um/asm/checksum_64.h:17:16: note: previous declaration of 'ip_compute_csum' with type '__sum16(const void *, int)' {aka 'short unsigned int(const void *, int)'}
      17 | extern __sum16 ip_compute_csum(const void *buff, int len);
         |                ^~~~~~~~~~~~~~~
--
   In file included from include/linux/skbuff.h:26,
                    from include/linux/if_arp.h:22,
                    from arch/um/drivers/slirp_kern.c:6:
>> include/net/checksum.h:35:23: error: static declaration of 'ip_compute_csum' follows non-static declaration
      35 | static inline __sum16 ip_compute_csum(const void *buff, int len)
         |                       ^~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/checksum.h:105,
                    from include/net/checksum.h:21,
                    from include/linux/skbuff.h:26,
                    from include/linux/if_arp.h:22,
                    from arch/um/drivers/slirp_kern.c:6:
   arch/x86/um/asm/checksum_64.h:17:16: note: previous declaration of 'ip_compute_csum' with type '__sum16(const void *, int)' {aka 'short unsigned int(const void *, int)'}
      17 | extern __sum16 ip_compute_csum(const void *buff, int len);
         |                ^~~~~~~~~~~~~~~
   arch/um/drivers/slirp_kern.c:18:6: warning: no previous prototype for 'slirp_init' [-Wmissing-prototypes]
      18 | void slirp_init(struct net_device *dev, void *data)
         |      ^~~~~~~~~~
--
   kernel/fork.c:162:13: warning: no previous prototype for 'arch_release_task_struct' [-Wmissing-prototypes]
     162 | void __weak arch_release_task_struct(struct task_struct *tsk)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:859:20: warning: no previous prototype for 'arch_task_cache_init' [-Wmissing-prototypes]
     859 | void __init __weak arch_task_cache_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:954:12: warning: no previous prototype for 'arch_dup_task_struct' [-Wmissing-prototypes]
     954 | int __weak arch_dup_task_struct(struct task_struct *dst,
         |            ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/init_task.h:18,
                    from kernel/fork.c:1088:
>> include/net/checksum.h:35:23: error: static declaration of 'ip_compute_csum' follows non-static declaration
      35 | static inline __sum16 ip_compute_csum(const void *buff, int len)
         |                       ^~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/checksum.h:105,
                    from include/net/checksum.h:21,
                    from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/init_task.h:18,
                    from kernel/fork.c:1088:
   arch/x86/um/asm/checksum_64.h:17:16: note: previous declaration of 'ip_compute_csum' with type '__sum16(const void *, int)' {aka 'short unsigned int(const void *, int)'}
      17 | extern __sum16 ip_compute_csum(const void *buff, int len);
         |                ^~~~~~~~~~~~~~~
--
   In file included from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/init_task.h:18,
                    from kernel/exit.c:55:
>> include/net/checksum.h:35:23: error: static declaration of 'ip_compute_csum' follows non-static declaration
      35 | static inline __sum16 ip_compute_csum(const void *buff, int len)
         |                       ^~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/checksum.h:105,
                    from include/net/checksum.h:21,
                    from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/init_task.h:18,
                    from kernel/exit.c:55:
   arch/x86/um/asm/checksum_64.h:17:16: note: previous declaration of 'ip_compute_csum' with type '__sum16(const void *, int)' {aka 'short unsigned int(const void *, int)'}
      17 | extern __sum16 ip_compute_csum(const void *buff, int len);
         |                ^~~~~~~~~~~~~~~
   kernel/exit.c:1915:32: warning: no previous prototype for 'abort' [-Wmissing-prototypes]
    1915 | __weak __function_aligned void abort(void)
         |                                ^~~~~
--
   In file included from include/linux/skbuff.h:26,
                    from include/linux/filter.h:12,
                    from kernel/kallsyms.c:25:
>> include/net/checksum.h:35:23: error: static declaration of 'ip_compute_csum' follows non-static declaration
      35 | static inline __sum16 ip_compute_csum(const void *buff, int len)
         |                       ^~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/checksum.h:105,
                    from include/net/checksum.h:21,
                    from include/linux/skbuff.h:26,
                    from include/linux/filter.h:12,
                    from kernel/kallsyms.c:25:
   arch/x86/um/asm/checksum_64.h:17:16: note: previous declaration of 'ip_compute_csum' with type '__sum16(const void *, int)' {aka 'short unsigned int(const void *, int)'}
      17 | extern __sum16 ip_compute_csum(const void *buff, int len);
         |                ^~~~~~~~~~~~~~~
   kernel/kallsyms.c:663:12: warning: no previous prototype for 'arch_get_kallsym' [-Wmissing-prototypes]
     663 | int __weak arch_get_kallsym(unsigned int symnum, unsigned long *value,
         |            ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from arch/um/os-Linux/drivers/ethertap_kern.c:10:
>> include/net/checksum.h:35:23: error: static declaration of 'ip_compute_csum' follows non-static declaration
      35 | static inline __sum16 ip_compute_csum(const void *buff, int len)
         |                       ^~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/checksum.h:105,
                    from include/net/checksum.h:21,
                    from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from arch/um/os-Linux/drivers/ethertap_kern.c:10:
   arch/x86/um/asm/checksum_64.h:17:16: note: previous declaration of 'ip_compute_csum' with type '__sum16(const void *, int)' {aka 'short unsigned int(const void *, int)'}
      17 | extern __sum16 ip_compute_csum(const void *buff, int len);
         |                ^~~~~~~~~~~~~~~
   arch/um/os-Linux/drivers/ethertap_kern.c:66:5: warning: no previous prototype for 'ethertap_setup' [-Wmissing-prototypes]
      66 | int ethertap_setup(char *str, char **mac_out, void *data)
         |     ^~~~~~~~~~~~~~
--
   In file included from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from arch/um/os-Linux/drivers/tuntap_kern.c:6:
>> include/net/checksum.h:35:23: error: static declaration of 'ip_compute_csum' follows non-static declaration
      35 | static inline __sum16 ip_compute_csum(const void *buff, int len)
         |                       ^~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/checksum.h:105,
                    from include/net/checksum.h:21,
                    from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from arch/um/os-Linux/drivers/tuntap_kern.c:6:
   arch/x86/um/asm/checksum_64.h:17:16: note: previous declaration of 'ip_compute_csum' with type '__sum16(const void *, int)' {aka 'short unsigned int(const void *, int)'}
      17 | extern __sum16 ip_compute_csum(const void *buff, int len);
         |                ^~~~~~~~~~~~~~~
   arch/um/os-Linux/drivers/tuntap_kern.c:56:5: warning: no previous prototype for 'tuntap_setup' [-Wmissing-prototypes]
      56 | int tuntap_setup(char *str, char **mac_out, void *data)
         |     ^~~~~~~~~~~~
--
   In file included from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from io_uring/io_uring.c:61:
>> include/net/checksum.h:35:23: error: static declaration of 'ip_compute_csum' follows non-static declaration
      35 | static inline __sum16 ip_compute_csum(const void *buff, int len)
         |                       ^~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/checksum.h:105,
                    from include/net/checksum.h:21,
                    from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from io_uring/io_uring.c:61:
   arch/x86/um/asm/checksum_64.h:17:16: note: previous declaration of 'ip_compute_csum' with type '__sum16(const void *, int)' {aka 'short unsigned int(const void *, int)'}
      17 | extern __sum16 ip_compute_csum(const void *buff, int len);
         |                ^~~~~~~~~~~~~~~
   io_uring/io_uring.c: In function '__io_submit_flush_completions':
   io_uring/io_uring.c:1502:40: warning: variable 'prev' set but not used [-Wunused-but-set-variable]
    1502 |         struct io_wq_work_node *node, *prev;
         |                                        ^~~~
--
   In file included from include/linux/skbuff.h:26,
                    from include/linux/tcp.h:17,
                    from include/linux/ipv6.h:93,
                    from include/net/addrconf.h:52,
                    from lib/vsprintf.c:40:
>> include/net/checksum.h:35:23: error: static declaration of 'ip_compute_csum' follows non-static declaration
      35 | static inline __sum16 ip_compute_csum(const void *buff, int len)
         |                       ^~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/checksum.h:105,
                    from include/net/checksum.h:21,
                    from include/linux/skbuff.h:26,
                    from include/linux/tcp.h:17,
                    from include/linux/ipv6.h:93,
                    from include/net/addrconf.h:52,
                    from lib/vsprintf.c:40:
   arch/x86/um/asm/checksum_64.h:17:16: note: previous declaration of 'ip_compute_csum' with type '__sum16(const void *, int)' {aka 'short unsigned int(const void *, int)'}
      17 | extern __sum16 ip_compute_csum(const void *buff, int len);
         |                ^~~~~~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1681:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1681 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from include/linux/bpf-cgroup.h:11,
                    from net/socket.c:55:
>> include/net/checksum.h:35:23: error: static declaration of 'ip_compute_csum' follows non-static declaration
      35 | static inline __sum16 ip_compute_csum(const void *buff, int len)
         |                       ^~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/checksum.h:105,
                    from include/net/checksum.h:21,
                    from include/linux/skbuff.h:26,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from include/linux/bpf-cgroup.h:11,
                    from net/socket.c:55:
   arch/x86/um/asm/checksum_64.h:17:16: note: previous declaration of 'ip_compute_csum' with type '__sum16(const void *, int)' {aka 'short unsigned int(const void *, int)'}
      17 | extern __sum16 ip_compute_csum(const void *buff, int len);
         |                ^~~~~~~~~~~~~~~
   net/socket.c: In function '__sys_getsockopt':
   net/socket.c:2300:13: warning: variable 'max_optlen' set but not used [-Wunused-but-set-variable]
    2300 |         int max_optlen;
         |             ^~~~~~~~~~
..


vim +/ip_compute_csum +35 include/net/checksum.h

    25	
    26	/**
    27	 * ip_compute_csum - Compute an 16bit IP checksum.
    28	 * @buff: buffer address.
    29	 * @len: length of buffer.
    30	 *
    31	 * Returns the 16bit folded/inverted checksum of the passed buffer.
    32	 * Ready to fill in.
    33	 */
    34	#ifndef _HAVE_IP_COMPUTE_CSUM
  > 35	static inline __sum16 ip_compute_csum(const void *buff, int len)
    36	{
    37		return csum_fold (csum_partial(buff, len, 0));
    38	}
    39	#else
    40	extern __sum16 ip_compute_csum(const void *buff, int len);
    41	#endif
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
