Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E321D5176
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729784586; cv=none; b=ONNaLw0Dq2a9m1Gu4d8b2ZdX0iWdPcPxPKml1aS9qpGbVITpdXSIOrReTOVeNAN7KIsPByECBXkA3Ibk7ogbUig+Y7gsvLea8ecMDhmF3Nx1arOHS+Uxt80UAaSjmKmwrbzN4RXyWV313H9Y+RpPm6H9af9am/EWFbzR/FZ9i3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729784586; c=relaxed/simple;
	bh=sXIWJuCM3B05K3xwawfQCC05ekSGnw0R8Xe+3AFiv/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXMO+G6gj+3iXrGFB/dIn9C9ruGL97xNEBlCOWPakI+5TmHDQjdl0TS8GMd3mF+jgGXCV7ArgO7VLdBYN9TNh9yncnmTbaQgGh2kCLUflySUMnSjhrhZbaTKJMOt9/twoa6+EIdlS49UOZ6NOXLiqXxfLtpWNLsCIZZTMotITqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWzSo+h7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWzSo+h7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729784584; x=1761320584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sXIWJuCM3B05K3xwawfQCC05ekSGnw0R8Xe+3AFiv/Q=;
  b=HWzSo+h78oqamvE01t27+VGF8uafpPNDvTdBu1I8rjj9sLhq38RpHOQY
   GwIbLKc0PcCbHqickBCOouxH74gOu08IIV4qnHKDNbqDlMif3QUCZlY++
   WPGHa++GcvD/Z07piOeyH7QVEPnVy4DXzzMhPW25P8zA+lRB/O+C5OrrT
   +3ajOWwDTx8OEEQdOD3yF9ILhKg1Yt5XINUCXevHvxnF/x77vKN/vea3A
   U426nolxuMEpfa2WFDNYfGI056nsqBEpU9gEtok6giOLaFTnRjx0FzKeU
   FeUVIvLtQvF24GBqlc+CyASMHN4fytSzXd/XYiGXcuLdxuu19/gqGVCdU
   A==;
X-CSE-ConnectionGUID: C9E9KWxLSSKlva/veGYy6w==
X-CSE-MsgGUID: JyP6bY1pTPmsBfxHTIbhGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29641265"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="29641265"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:43:03 -0700
X-CSE-ConnectionGUID: mB5x8fa1TMWuG411Uhzjag==
X-CSE-MsgGUID: k6cQkmjlSmKkHWD2sSJ+nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="85735960"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Oct 2024 08:43:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3zzH-000Wbw-35;
	Thu, 24 Oct 2024 15:42:59 +0000
Date: Thu, 24 Oct 2024 23:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] net: netlink: add nla_get_*_default() accessors
Message-ID: <202410242345.2HEJkySu-lkp@intel.com>
References: <20241024131807.0a6c07355832.I3df6aac71d38a5baa1c0a03d0c7e82d4395c030e@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024131807.0a6c07355832.I3df6aac71d38a5baa1c0a03d0c7e82d4395c030e@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main netfilter-nf/main linus/master horms-ipvs/master nf-next/master v6.12-rc4 next-20241024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/net-convert-to-nla_get_-_default/20241024-191943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20241024131807.0a6c07355832.I3df6aac71d38a5baa1c0a03d0c7e82d4395c030e%40changeid
patch subject: [RFC PATCH 1/2] net: netlink: add nla_get_*_default() accessors
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241024/202410242345.2HEJkySu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242345.2HEJkySu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242345.2HEJkySu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/rtnetlink.h:6,
                    from include/net/neighbour.h:31,
                    from include/net/dst.h:20,
                    from include/net/sock.h:66,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:102,
                    from include/net/gro.h:8,
                    from net/8021q/vlan_core.c:7:
   include/net/netlink.h: In function 'nla_get_u8_default':
>> include/net/netlink.h:1878:16: error: implicit declaration of function 'n' [-Werror=implicit-function-declaration]
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1881:1: note: in expansion of macro 'MAKE_NLA_GET_DEFAULT'
    1881 | MAKE_NLA_GET_DEFAULT(u8, nla_get_u8);
         | ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/net/rtnetlink.h:6,
                    from include/net/neighbour.h:31,
                    from include/net/arp.h:8,
                    from net/8021q/vlan.c:27:
   include/net/netlink.h: In function 'nla_get_u8_default':
>> include/net/netlink.h:1878:16: error: implicit declaration of function 'n' [-Werror=implicit-function-declaration]
    1878 |         return n(nla);                                  \
         |                ^
   include/net/netlink.h:1881:1: note: in expansion of macro 'MAKE_NLA_GET_DEFAULT'
    1881 | MAKE_NLA_GET_DEFAULT(u8, nla_get_u8);
         | ^~~~~~~~~~~~~~~~~~~~
   net/8021q/vlan.c: In function 'register_vlan_device':
   net/8021q/vlan.c:247:46: warning: '%i' directive output may be truncated writing between 1 and 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     247 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                              ^~
   net/8021q/vlan.c:247:42: note: directive argument in the range [0, 4094]
     247 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                          ^~~~~~~
   net/8021q/vlan.c:247:17: note: 'snprintf' output between 3 and 21 bytes into a destination of size 16
     247 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/8021q/vlan.c:235:46: warning: '%.4i' directive output may be truncated writing 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     235 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                              ^~~~
   net/8021q/vlan.c:235:42: note: directive argument in the range [0, 4094]
     235 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                          ^~~~~~~~~
   net/8021q/vlan.c:235:17: note: 'snprintf' output between 6 and 21 bytes into a destination of size 16
     235 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/n +1878 include/net/netlink.h

  1871	
  1872	#define MAKE_NLA_GET_DEFAULT(tp, fn)			\
  1873	static inline tp fn##_default(const struct nlattr *nla,	\
  1874				      tp defvalue)		\
  1875	{							\
  1876		if (!nla)					\
  1877			return defvalue;			\
> 1878		return n(nla);					\
  1879	}
  1880	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
