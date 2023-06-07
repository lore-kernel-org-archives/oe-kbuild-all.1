Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8659F6118
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 19:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686164757; x=1717700757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YBWY6CWdiGeve5fNLO7HPPXtVMYba6DavbpCvQitRAU=;
  b=S1xorh8bgNjy9JyqkyjV1CDBGKTklx0VaB9+o1t1ng5sE/cBR+ho25yQ
   rZbYMTMBs0L1lq+xhRrDOcvKIMBF1NRRqISvHJL83QQ9kskyvSSEd1HJI
   JZNFKr/9T5/HVF0fjp3NvDkc0QnBGq5FTtdl0jHnc/q2TC4x3hgvHqix1
   iroWkyjBc8LDpfqm+EoEuoOGb/eo5AodS6P0NS+THgo1o55/6g1p46cWF
   Fb40HvtamQLGHzCfUE4m3gyYqLcUsJm69y7gg3+1vWBkONvpVprHLzLSc
   wuGfgnEP8UaXtNRv4Hzwly9h/B8Y35/12Y2cqcemmXJI1Iwz/3eFE1aaP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357093565"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="357093565"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 12:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739392402"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="739392402"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Jun 2023 12:05:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6yTS-0006qX-00;
	Wed, 07 Jun 2023 19:05:38 +0000
Date: Thu, 8 Jun 2023 03:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 41/67]
 include/trace/events/cros_net.h:55:1: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202306080258.BdBD5kJu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   947f87276bfd2fc7e826d1aa07c98601cc8f350a
commit: 6f4417e6fdbc3ce32575520d4fb5288f424b6a51 [41/67] CHROMIUM: add cros_net tp for inet send,rcv,accept
config: openrisc-randconfig-s031-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080258.BdBD5kJu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 6f4417e6fdbc3ce32575520d4fb5288f424b6a51
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash net/ipv4/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080258.BdBD5kJu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv4/af_inet.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/cros_net.h):
>> include/trace/events/cros_net.h:55:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:55:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:55:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
>> include/trace/events/cros_net.h:55:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:55:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:55:1: sparse:     got restricted __be16 [usertype] skc_dport
>> include/trace/events/cros_net.h:55:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:55:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:55:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:87:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:87:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:87:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:87:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:87:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:87:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:87:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:87:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:87:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:123:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:123:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:123:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:123:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:123:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:123:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:123:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:123:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:123:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:160:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:160:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:160:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:160:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:160:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:160:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:160:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:160:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:160:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:196:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:196:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:196:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:196:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:196:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:196:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:196:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:196:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:196:1: sparse:     got restricted __be32 [usertype] skc_daddr
   include/trace/events/cros_net.h:232:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] saddr4 @@     got restricted __be32 [usertype] skc_rcv_saddr @@
   include/trace/events/cros_net.h:232:1: sparse:     expected unsigned int [usertype] saddr4
   include/trace/events/cros_net.h:232:1: sparse:     got restricted __be32 [usertype] skc_rcv_saddr
   include/trace/events/cros_net.h:232:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dport @@     got restricted __be16 [usertype] skc_dport @@
   include/trace/events/cros_net.h:232:1: sparse:     expected unsigned short [usertype] dport
   include/trace/events/cros_net.h:232:1: sparse:     got restricted __be16 [usertype] skc_dport
   include/trace/events/cros_net.h:232:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] daddr4 @@     got restricted __be32 [usertype] skc_daddr @@
   include/trace/events/cros_net.h:232:1: sparse:     expected unsigned int [usertype] daddr4
   include/trace/events/cros_net.h:232:1: sparse:     got restricted __be32 [usertype] skc_daddr
   net/ipv4/af_inet.c:1535:59: sparse: sparse: restricted __be16 degrades to integer

vim +55 include/trace/events/cros_net.h

    54	
  > 55	TRACE_EVENT_CONDITION(cros_inet_accept_exit,
    56		/* The tracepoint signature matches the signature of inet_accept with
    57		 * addition of the return value. This is done to match the expected
    58		 * signature of an fexit bpf program.
    59		 * This is done so that a BPF application can use the same
    60		 * handler for kernels that don't support fexit for ARM64 and those
    61		 * that do.
    62		 */
    63		TP_PROTO(struct socket *sock, struct socket *newsock, int flags, bool kern, int rv),
    64		TP_ARGS(sock, newsock, flags, kern, rv),
    65		TP_CONDITION(newsock && newsock->sk),
    66		TP_STRUCT__entry(
    67		__field(__u32, saddr4)
    68		__field(__u32, daddr4)
    69		__field(__u16, sport)
    70		__field(__u16, dport)
    71		__field(__u8, protocol)
    72		),
    73		TP_fast_assign(
    74			struct sock *sk = newsock->sk;
    75	
    76			CROS_NET_FILL_ADDR_PORT(sk, __entry);
    77		),
    78		TP_printk(
    79			"informational_only_will_be_removed:%pi4:%d-%pi4:%d",
    80			&__entry->saddr4,
    81			__entry->sport,
    82			&__entry->daddr4,
    83			__entry->dport)
    84	);
    85	
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
