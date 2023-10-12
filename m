Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B5C208D5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lE/Oa8fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697114220; x=1728650220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5CAelJecwC3Xdj0+UAdvmykfhJXOqC+c6DcpzwwVB/g=;
  b=lE/Oa8fhqcRYZwY1i4L31FegPd6xn97j8h+34Df+tabw1tT+dTtKfxwW
   slDh87r/cNUb6CgqHAS89DcCOtkOl9NHgJlEB2Zln9/yzaoOUSIPTkgpn
   5gEaxpx8ZL8EG+/1wbpQm1q0npQYVN6dMN9lH/HHfq+fEIoWWAP7xyIRZ
   ts9ma/SZsi6aDFKUwGRyZKvoBQGPNfG05teP5DVgtagSO44s3KwdAIVpQ
   CRqu2q7OyFzUYyVcrf/lbh7quBlzVwwZZaj0lQHO7Fj3HNClgLVuaUlOG
   7nn/dwex67DrQsWbq+ABhCYdBBaIEfreqecRL8MqGYOjC0RmDN1JnWfS/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="449096124"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="449096124"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 05:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="789379985"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="789379985"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Oct 2023 05:36:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qquvo-0003RH-0q;
	Thu, 12 Oct 2023 12:36:48 +0000
Date: Thu, 12 Oct 2023 20:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] netlink: add variable-length / auto integers
Message-ID: <202310122018.E8b1ottR-lkp@intel.com>
References: <20231011003313.105315-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011003313.105315-1-kuba@kernel.org>

Hi Jakub,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on net-next/main linus/master v6.6-rc5 next-20231012]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/netlink-add-variable-length-auto-integers/20231011-083419
base:   net/main
patch link:    https://lore.kernel.org/r/20231011003313.105315-1-kuba%40kernel.org
patch subject: [RFC] netlink: add variable-length / auto integers
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20231012/202310122018.E8b1ottR-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310122018.E8b1ottR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122018.E8b1ottR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/rtnetlink.h:6:0,
                    from include/net/neighbour.h:31,
                    from include/net/dst.h:20,
                    from include/net/sock.h:66,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:94,
                    from include/net/ipv6.h:12,
                    from include/linux/sunrpc/clnt.h:29,
                    from include/linux/nfs_fs.h:32,
                    from init/do_mounts.c:23:
   include/net/netlink.h: In function 'nla_get_uint':
   include/net/netlink.h:1647:9: error: implicit declaration of function 'nla_get_u64'; did you mean 'nla_get_u32'? [-Werror=implicit-function-declaration]
     return nla_get_u64(nla);
            ^~~~~~~~~~~
            nla_get_u32
   include/net/netlink.h: At top level:
>> include/net/netlink.h:1708:19: error: conflicting types for 'nla_get_u64'
    static inline u64 nla_get_u64(const struct nlattr *nla)
                      ^~~~~~~~~~~
   include/net/netlink.h:1647:9: note: previous implicit declaration of 'nla_get_u64' was here
     return nla_get_u64(nla);
            ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/rtnetlink.h:6:0,
                    from include/net/neighbour.h:31,
                    from include/net/dst.h:20,
                    from include/net/sock.h:66,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:94,
                    from include/net/addrconf.h:52,
                    from lib/vsprintf.c:41:
   include/net/netlink.h: In function 'nla_get_uint':
   include/net/netlink.h:1647:9: error: implicit declaration of function 'nla_get_u64'; did you mean 'nla_get_u32'? [-Werror=implicit-function-declaration]
     return nla_get_u64(nla);
            ^~~~~~~~~~~
            nla_get_u32
   include/net/netlink.h: At top level:
>> include/net/netlink.h:1708:19: error: conflicting types for 'nla_get_u64'
    static inline u64 nla_get_u64(const struct nlattr *nla)
                      ^~~~~~~~~~~
   include/net/netlink.h:1647:9: note: previous implicit declaration of 'nla_get_u64' was here
     return nla_get_u64(nla);
            ^~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1682:2: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
     ^~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/rtnetlink.h:6:0,
                    from include/net/neighbour.h:31,
                    from include/net/dst.h:20,
                    from include/net/sock.h:66,
                    from include/linux/bpf-cgroup.h:11,
                    from net/socket.c:55:
   include/net/netlink.h: In function 'nla_get_uint':
   include/net/netlink.h:1647:9: error: implicit declaration of function 'nla_get_u64'; did you mean 'nla_get_u32'? [-Werror=implicit-function-declaration]
     return nla_get_u64(nla);
            ^~~~~~~~~~~
            nla_get_u32
   include/net/netlink.h: At top level:
>> include/net/netlink.h:1708:19: error: conflicting types for 'nla_get_u64'
    static inline u64 nla_get_u64(const struct nlattr *nla)
                      ^~~~~~~~~~~
   include/net/netlink.h:1647:9: note: previous implicit declaration of 'nla_get_u64' was here
     return nla_get_u64(nla);
            ^~~~~~~~~~~
   net/socket.c:1696:21: warning: no previous declaration for 'update_socket_protocol' [-Wmissing-declarations]
    __weak noinline int update_socket_protocol(int family, int type, int protocol)
                        ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/rtnetlink.h:6:0,
                    from include/net/sch_generic.h:20,
                    from include/linux/filter.h:27,
                    from include/linux/bpf_verifier.h:9,
                    from net/core/filter.c:21:
   include/net/netlink.h: In function 'nla_get_uint':
   include/net/netlink.h:1647:9: error: implicit declaration of function 'nla_get_u64'; did you mean 'nla_get_u32'? [-Werror=implicit-function-declaration]
     return nla_get_u64(nla);
            ^~~~~~~~~~~
            nla_get_u32
   include/net/netlink.h: At top level:
>> include/net/netlink.h:1708:19: error: conflicting types for 'nla_get_u64'
    static inline u64 nla_get_u64(const struct nlattr *nla)
                      ^~~~~~~~~~~
   include/net/netlink.h:1647:9: note: previous implicit declaration of 'nla_get_u64' was here
     return nla_get_u64(nla);
            ^~~~~~~~~~~
   net/core/filter.c:11730:17: warning: no previous declaration for 'bpf_dynptr_from_skb' [-Wmissing-declarations]
    __bpf_kfunc int bpf_dynptr_from_skb(struct sk_buff *skb, u64 flags,
                    ^~~~~~~~~~~~~~~~~~~
   net/core/filter.c:11743:17: warning: no previous declaration for 'bpf_dynptr_from_xdp' [-Wmissing-declarations]
    __bpf_kfunc int bpf_dynptr_from_xdp(struct xdp_buff *xdp, u64 flags,
                    ^~~~~~~~~~~~~~~~~~~
   net/core/filter.c:11828:17: warning: no previous declaration for 'bpf_sock_destroy' [-Wmissing-declarations]
    __bpf_kfunc int bpf_sock_destroy(struct sock_common *sock)
                    ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/rtnetlink.h:6:0,
                    from include/net/sch_generic.h:20,
                    from include/linux/filter.h:27,
                    from net/core/xdp.c:9:
   include/net/netlink.h: In function 'nla_get_uint':
   include/net/netlink.h:1647:9: error: implicit declaration of function 'nla_get_u64'; did you mean 'nla_get_u32'? [-Werror=implicit-function-declaration]
     return nla_get_u64(nla);
            ^~~~~~~~~~~
            nla_get_u32
   include/net/netlink.h: At top level:
>> include/net/netlink.h:1708:19: error: conflicting types for 'nla_get_u64'
    static inline u64 nla_get_u64(const struct nlattr *nla)
                      ^~~~~~~~~~~
   include/net/netlink.h:1647:9: note: previous implicit declaration of 'nla_get_u64' was here
     return nla_get_u64(nla);
            ^~~~~~~~~~~
   net/core/xdp.c:713:17: warning: no previous declaration for 'bpf_xdp_metadata_rx_timestamp' [-Wmissing-declarations]
    __bpf_kfunc int bpf_xdp_metadata_rx_timestamp(const struct xdp_md *ctx, u64 *timestamp)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/xdp.c:735:17: warning: no previous declaration for 'bpf_xdp_metadata_rx_hash' [-Wmissing-declarations]
    __bpf_kfunc int bpf_xdp_metadata_rx_hash(const struct xdp_md *ctx, u32 *hash,
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/rtnetlink.h:6:0,
                    from include/net/fib_rules.h:11,
                    from include/linux/mroute.h:7,
                    from net/ipv4/route.c:79:
   include/net/netlink.h: In function 'nla_get_uint':
   include/net/netlink.h:1647:9: error: implicit declaration of function 'nla_get_u64'; did you mean 'nla_get_u32'? [-Werror=implicit-function-declaration]
     return nla_get_u64(nla);
            ^~~~~~~~~~~
            nla_get_u32
   include/net/netlink.h: At top level:
>> include/net/netlink.h:1708:19: error: conflicting types for 'nla_get_u64'
    static inline u64 nla_get_u64(const struct nlattr *nla)
                      ^~~~~~~~~~~
   include/net/netlink.h:1647:9: note: previous implicit declaration of 'nla_get_u64' was here
     return nla_get_u64(nla);
            ^~~~~~~~~~~
   net/ipv4/route.c: In function 'ip_rt_send_redirect':
   net/ipv4/route.c:880:6: warning: variable 'log_martians' set but not used [-Wunused-but-set-variable]
     int log_martians;
         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/nla_get_u64 +1708 include/net/netlink.h

bfa83a9e03cf8d Thomas Graf     2005-11-10  1703  
bfa83a9e03cf8d Thomas Graf     2005-11-10  1704  /**
bfa83a9e03cf8d Thomas Graf     2005-11-10  1705   * nla_get_u64 - return payload of u64 attribute
bfa83a9e03cf8d Thomas Graf     2005-11-10  1706   * @nla: u64 netlink attribute
bfa83a9e03cf8d Thomas Graf     2005-11-10  1707   */
b057efd4d226fc Patrick McHardy 2008-10-28 @1708  static inline u64 nla_get_u64(const struct nlattr *nla)
bfa83a9e03cf8d Thomas Graf     2005-11-10  1709  {
bfa83a9e03cf8d Thomas Graf     2005-11-10  1710  	u64 tmp;
bfa83a9e03cf8d Thomas Graf     2005-11-10  1711  
bfa83a9e03cf8d Thomas Graf     2005-11-10  1712  	nla_memcpy(&tmp, nla, sizeof(tmp));
bfa83a9e03cf8d Thomas Graf     2005-11-10  1713  
bfa83a9e03cf8d Thomas Graf     2005-11-10  1714  	return tmp;
bfa83a9e03cf8d Thomas Graf     2005-11-10  1715  }
bfa83a9e03cf8d Thomas Graf     2005-11-10  1716  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
