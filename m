Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589B7C8C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 03:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9v1XtPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696994421; x=1728530421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wq6EaNHqItZc9upN5qDDXcPBh6wzFa9K+dzMDJcaRak=;
  b=N9v1XtPBa2ClWwp+AfNf3ds1UQ6gRO0WU7OZsK/BF05wv9PE58COQqDl
   wdRtmzXqk+EXpFvaTUlTzoaO4640VPBBZXbPzDGJStg+MLMjW3zmy/MxF
   7rTWq8j9Sweikc5rdUWCtYdyFlNTbq5FY/L94bIxetn1F0PivZMLo915U
   KWkO1iXnlCniYLhpttud1EdBkH5HRSb1bBEOl9rJebKfMmwzTy5y0yaq0
   s6gY68pnWLTHgifEJl+zQiXceortYYfHogvuiRaiyr7P26Px3TzF64EjI
   0E9Re7kOzU2zwWmyrebhenGT8VlMuZcWzEcBNSUYj3hfPb2zSL7QzZeMw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="381819152"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="381819152"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 20:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="1085043029"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="1085043029"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2023 20:20:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqPlh-0001dT-0R;
	Wed, 11 Oct 2023 03:20:17 +0000
Date: Wed, 11 Oct 2023 11:20:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] netlink: add variable-length / auto integers
Message-ID: <202310111153.GGkzOshH-lkp@intel.com>
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
[also build test ERROR on net-next/main linus/master v6.6-rc5 next-20231010]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/netlink-add-variable-length-auto-integers/20231011-083419
base:   net/main
patch link:    https://lore.kernel.org/r/20231011003313.105315-1-kuba%40kernel.org
patch subject: [RFC] netlink: add variable-length / auto integers
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231011/202310111153.GGkzOshH-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310111153.GGkzOshH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310111153.GGkzOshH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/rtnetlink.h:6,
                    from include/net/neighbour.h:31,
                    from include/net/dst.h:20,
                    from include/net/sock.h:66,
                    from lib/kobject_uevent.c:28:
   include/net/netlink.h: In function 'nla_get_uint':
>> include/net/netlink.h:1647:16: error: implicit declaration of function 'nla_get_u64'; did you mean 'nla_get_u32'? [-Werror=implicit-function-declaration]
    1647 |         return nla_get_u64(nla);
         |                ^~~~~~~~~~~
         |                nla_get_u32
   include/net/netlink.h: At top level:
>> include/net/netlink.h:1708:19: error: conflicting types for 'nla_get_u64'; have 'u64(const struct nlattr *)' {aka 'long long unsigned int(const struct nlattr *)'}
    1708 | static inline u64 nla_get_u64(const struct nlattr *nla)
         |                   ^~~~~~~~~~~
   include/net/netlink.h:1647:16: note: previous implicit declaration of 'nla_get_u64' with type 'int()'
    1647 |         return nla_get_u64(nla);
         |                ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/rtnetlink.h:6,
                    from include/net/neighbour.h:31,
                    from include/net/dst.h:20,
                    from include/net/sock.h:66,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:94,
                    from include/net/addrconf.h:52,
                    from lib/vsprintf.c:41:
   include/net/netlink.h: In function 'nla_get_uint':
>> include/net/netlink.h:1647:16: error: implicit declaration of function 'nla_get_u64'; did you mean 'nla_get_u32'? [-Werror=implicit-function-declaration]
    1647 |         return nla_get_u64(nla);
         |                ^~~~~~~~~~~
         |                nla_get_u32
   include/net/netlink.h: At top level:
>> include/net/netlink.h:1708:19: error: conflicting types for 'nla_get_u64'; have 'u64(const struct nlattr *)' {aka 'long long unsigned int(const struct nlattr *)'}
    1708 | static inline u64 nla_get_u64(const struct nlattr *nla)
         |                   ^~~~~~~~~~~
   include/net/netlink.h:1647:16: note: previous implicit declaration of 'nla_get_u64' with type 'int()'
    1647 |         return nla_get_u64(nla);
         |                ^~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1682:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1682 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/rtnetlink.h:6,
                    from include/net/neighbour.h:31,
                    from include/net/dst.h:20,
                    from include/net/sock.h:66,
                    from include/net/inet_sock.h:22,
                    from include/linux/udp.h:16,
                    from lib/test_blackhole_dev.c:17:
   include/net/netlink.h: In function 'nla_get_uint':
>> include/net/netlink.h:1647:16: error: implicit declaration of function 'nla_get_u64'; did you mean 'nla_get_u32'? [-Werror=implicit-function-declaration]
    1647 |         return nla_get_u64(nla);
         |                ^~~~~~~~~~~
         |                nla_get_u32
   include/net/netlink.h: At top level:
>> include/net/netlink.h:1708:19: error: conflicting types for 'nla_get_u64'; have 'u64(const struct nlattr *)' {aka 'long long unsigned int(const struct nlattr *)'}
    1708 | static inline u64 nla_get_u64(const struct nlattr *nla)
         |                   ^~~~~~~~~~~
   include/net/netlink.h:1647:16: note: previous implicit declaration of 'nla_get_u64' with type 'int()'
    1647 |         return nla_get_u64(nla);
         |                ^~~~~~~~~~~
   lib/test_blackhole_dev.c: In function 'test_blackholedev_init':
   lib/test_blackhole_dev.c:32:24: warning: variable 'ethh' set but not used [-Wunused-but-set-variable]
      32 |         struct ethhdr *ethh;
         |                        ^~~~
   cc1: some warnings being treated as errors


vim +1647 include/net/netlink.h

  1638	
  1639	/**
  1640	 * nla_get_uint - return payload of uint attribute
  1641	 * @nla: uint netlink attribute
  1642	 */
  1643	static inline u64 nla_get_uint(const struct nlattr *nla)
  1644	{
  1645		if (nla_len(nla) == sizeof(u32))
  1646			return nla_get_u32(nla);
> 1647		return nla_get_u64(nla);
  1648	}
  1649	
  1650	/**
  1651	 * nla_get_be32 - return payload of __be32 attribute
  1652	 * @nla: __be32 netlink attribute
  1653	 */
  1654	static inline __be32 nla_get_be32(const struct nlattr *nla)
  1655	{
  1656		return *(__be32 *) nla_data(nla);
  1657	}
  1658	
  1659	/**
  1660	 * nla_get_le32 - return payload of __le32 attribute
  1661	 * @nla: __le32 netlink attribute
  1662	 */
  1663	static inline __le32 nla_get_le32(const struct nlattr *nla)
  1664	{
  1665		return *(__le32 *) nla_data(nla);
  1666	}
  1667	
  1668	/**
  1669	 * nla_get_u16 - return payload of u16 attribute
  1670	 * @nla: u16 netlink attribute
  1671	 */
  1672	static inline u16 nla_get_u16(const struct nlattr *nla)
  1673	{
  1674		return *(u16 *) nla_data(nla);
  1675	}
  1676	
  1677	/**
  1678	 * nla_get_be16 - return payload of __be16 attribute
  1679	 * @nla: __be16 netlink attribute
  1680	 */
  1681	static inline __be16 nla_get_be16(const struct nlattr *nla)
  1682	{
  1683		return *(__be16 *) nla_data(nla);
  1684	}
  1685	
  1686	/**
  1687	 * nla_get_le16 - return payload of __le16 attribute
  1688	 * @nla: __le16 netlink attribute
  1689	 */
  1690	static inline __le16 nla_get_le16(const struct nlattr *nla)
  1691	{
  1692		return *(__le16 *) nla_data(nla);
  1693	}
  1694	
  1695	/**
  1696	 * nla_get_u8 - return payload of u8 attribute
  1697	 * @nla: u8 netlink attribute
  1698	 */
  1699	static inline u8 nla_get_u8(const struct nlattr *nla)
  1700	{
  1701		return *(u8 *) nla_data(nla);
  1702	}
  1703	
  1704	/**
  1705	 * nla_get_u64 - return payload of u64 attribute
  1706	 * @nla: u64 netlink attribute
  1707	 */
> 1708	static inline u64 nla_get_u64(const struct nlattr *nla)
  1709	{
  1710		u64 tmp;
  1711	
  1712		nla_memcpy(&tmp, nla, sizeof(tmp));
  1713	
  1714		return tmp;
  1715	}
  1716	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
