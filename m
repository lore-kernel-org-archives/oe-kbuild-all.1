Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB39296BBF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532086; cv=none; b=eOI1bnMZwO5l0y3bNWS7qyyNL0bMchw8gXZhpzMM+FTDEaIr0OWoA/Xe793gZlUGq9Y/6rkqIWNPp2sOW1VB5F/vafp4jIGevm2HqY823PfuC/hidqJJlnXP8jlLkV1WJ08R1vrWX37td5fC6EA1JdHeoaYuiaIMFFAFiv5ybCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532086; c=relaxed/simple;
	bh=xDZ1CjxoZ5zBmIzZlqeQykozanYIzdFzhbBR3Uo2eaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1FcGjMXgCoxOSJpc3JZZ87adtLwtxt+e4C5RI+l7adPFZH3oMZL+f77j+8fhmg+OTzWOQxUlqxynwFfn0XBwEPYP9PnukxLW/NEqSyochzyCAYTLwqIvpWZ6PqpcYTlxKHjKL10jH5pPqXctDFhXcNN2ARcxFxCy1ct5DjSyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QID7pZzg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QID7pZzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774532085; x=1806068085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xDZ1CjxoZ5zBmIzZlqeQykozanYIzdFzhbBR3Uo2eaM=;
  b=QID7pZzgjS88LgWMUA86N3Pw3nFxNUOdUz4GNWcX0kHGTL7K48TBzZ1X
   0mS1Um8L17OkURPiz/JlO3tcANfkebY9jcPM+0+sHJs85Wq3w6ji+VWce
   2TTdhPsCCAIB1t7iFHnCLZhvEVhx9nmqYhqpaQ1JFkRP/8SaN8u5SrL9i
   MK21LIBQB1akGfJj5uCaTYC+DuTMAk8Z19q3YuGwF/q5MzDfsSIXpdH1p
   4UEWYkn7Vyz7XOAeppWQyK65V7ENxUh6K3nBJ4Wj8o+3IQPSRrddOEPZh
   qAc/5kbDsnBxOb5/d1J1ylsvpnlMwCzoDcUvqvZ1ZT3lyJG/pYFzMVdXj
   A==;
X-CSE-ConnectionGUID: DwHXtPhnTKewo7kd5eRj9w==
X-CSE-MsgGUID: 2Xq/uhbzRwar4hGkA6oapw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="92972322"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="92972322"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 06:34:45 -0700
X-CSE-ConnectionGUID: fiPqK9WNRcWjDK98eh0YuQ==
X-CSE-MsgGUID: uKtM6VLiQ+qLvqcKajbvUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="248050858"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Mar 2026 06:34:41 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5kr9-000000007Hd-2s1L;
	Thu, 26 Mar 2026 13:34:39 +0000
Date: Thu, 26 Mar 2026 14:34:20 +0100
From: kernel test robot <lkp@intel.com>
To: luka.gejak@linux.dev, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, horms@kernel.org, fmaurer@redhat.com,
	liuhangbin@gmail.com, linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: Re: [PATCH net-next v1 2/7] net: hsr: replace fallthrough comments
 with fallthrough macro
Message-ID: <202603261419.jqhvfAVi-lkp@intel.com>
References: <20260324144630.189094-3-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324144630.189094-3-luka.gejak@linux.dev>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/luka-gejak-linux-dev/net-hsr-constify-hsr_ops-and-prp_ops-protocol-operation-structures/20260326-143638
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260324144630.189094-3-luka.gejak%40linux.dev
patch subject: [PATCH net-next v1 2/7] net: hsr: replace fallthrough comments with fallthrough macro
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260326/202603261419.jqhvfAVi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261419.jqhvfAVi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261419.jqhvfAVi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/compiler_types.h:88,
                    from <command-line>:
   net/hsr/hsr_netlink.c: In function 'hsr_get_node_status':
>> include/linux/compiler_attributes.h:214:41: error: invalid use of attribute 'fallthrough'
     214 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   net/hsr/hsr_netlink.c:436:9: note: in expansion of macro 'fallthrough'
     436 |         fallthrough;
         |         ^~~~~~~~~~~
   net/hsr/hsr_netlink.c: In function 'hsr_get_node_list':
>> include/linux/compiler_attributes.h:214:41: error: invalid use of attribute 'fallthrough'
     214 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   net/hsr/hsr_netlink.c:527:9: note: in expansion of macro 'fallthrough'
     527 |         fallthrough;
         |         ^~~~~~~~~~~
--
   In file included from include/linux/compiler_types.h:88,
                    from <command-line>:
   hsr_netlink.c: In function 'hsr_get_node_status':
>> include/linux/compiler_attributes.h:214:41: error: invalid use of attribute 'fallthrough'
     214 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   hsr_netlink.c:436:9: note: in expansion of macro 'fallthrough'
     436 |         fallthrough;
         |         ^~~~~~~~~~~
   hsr_netlink.c: In function 'hsr_get_node_list':
>> include/linux/compiler_attributes.h:214:41: error: invalid use of attribute 'fallthrough'
     214 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   hsr_netlink.c:527:9: note: in expansion of macro 'fallthrough'
     527 |         fallthrough;
         |         ^~~~~~~~~~~


vim +/fallthrough +214 include/linux/compiler_attributes.h

294f69e662d157 Joe Perches   2019-10-05  201  
294f69e662d157 Joe Perches   2019-10-05  202  /*
294f69e662d157 Joe Perches   2019-10-05  203   * Add the pseudo keyword 'fallthrough' so case statement blocks
294f69e662d157 Joe Perches   2019-10-05  204   * must end with any of these keywords:
294f69e662d157 Joe Perches   2019-10-05  205   *   break;
294f69e662d157 Joe Perches   2019-10-05  206   *   fallthrough;
ca0760e7d79e2b Wei Ming Chen 2021-05-06  207   *   continue;
294f69e662d157 Joe Perches   2019-10-05  208   *   goto <label>;
294f69e662d157 Joe Perches   2019-10-05  209   *   return [expression];
294f69e662d157 Joe Perches   2019-10-05  210   *
294f69e662d157 Joe Perches   2019-10-05  211   *  gcc: https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html#Statement-Attributes
294f69e662d157 Joe Perches   2019-10-05  212   */
294f69e662d157 Joe Perches   2019-10-05  213  #if __has_attribute(__fallthrough__)
294f69e662d157 Joe Perches   2019-10-05 @214  # define fallthrough                    __attribute__((__fallthrough__))
294f69e662d157 Joe Perches   2019-10-05  215  #else
294f69e662d157 Joe Perches   2019-10-05  216  # define fallthrough                    do {} while (0)  /* fallthrough */
a3f8a30f3f0079 Miguel Ojeda  2018-08-30  217  #endif
a3f8a30f3f0079 Miguel Ojeda  2018-08-30  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
