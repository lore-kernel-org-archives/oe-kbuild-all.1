Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D54629
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735226380; cv=none; b=oXiPQp5VdhBeuRyH7Q1hb1VyhdnhmkTpMyaY5MkS+Zq9T9YDdNCN3gm878VKBMjBekrs3YGlFPQp3IO/byHapacBsAnDlBELwpZqoVYAMhOKQ42eERnhbNZFxewV6YAGw10KYs/RC5fFVurtDxGWSJOoER/OOWP4pcM3JACmWV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735226380; c=relaxed/simple;
	bh=Bi+YI4KNUyfMO78M7FAoGyOGb13DbxX7QcWZOGJ4lG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVhLLK4tNhRe89cU11lRzIZ8EQZ9nBNH7HEw1/O3esNeJY3MK4Ku/Fhn74UBmTwdldlO8SunsvONa3BS/oZQIu1TfDjMGVhw7YDrYwK/aFNPKB+Un1F+8owIjNOq5Cagej4Yzq3uu0xbPTFxyv4aWkWSu7bgcXMIPb5+SAnA6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kepyRh88; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kepyRh88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735226378; x=1766762378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bi+YI4KNUyfMO78M7FAoGyOGb13DbxX7QcWZOGJ4lG8=;
  b=kepyRh889ztG5xT+I+96llcvhuCqO9RbeRWz2WWXWZ8KrI/BBjle3MMY
   SP/NSvYyeKMpJwQdEO8iNURJNbe44nAD3jYaNPW3VZqWlq2XfLBmUclV2
   kEjEcuml34uaVKlu17e4ptcx7mVmjDfskg57GFy931PRJKz2Q36neHlCs
   OA9Zad1cVAfG08DQfmQfvG2xc1e9+qqNVLHdGp8UXsqMx1GSEjwNxEA9y
   taxlXutOcgFThMIOVaMGLVvVs9KuK1pn7avXYqUEkOFZ7iWNxIESD/gep
   KN6cH/dPJOfkASvY9xDn7+XtHFSoZiCYOy6L4vVHw80Wsna9HKecP8rzR
   w==;
X-CSE-ConnectionGUID: B1FV01zNS4SpALBIa5sowg==
X-CSE-MsgGUID: 05i1maFORQuRosmUEKhyjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46326120"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="46326120"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 07:19:34 -0800
X-CSE-ConnectionGUID: YEvWBWeiTrqj2X1V8fvnqA==
X-CSE-MsgGUID: BU5AFAvkSkK9WwlOahjTag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104015591"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Dec 2024 07:19:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQpe4-0002ek-0B;
	Thu, 26 Dec 2024 15:19:28 +0000
Date: Thu, 26 Dec 2024 23:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Gur Stavi <gur.stavi@huawei.com>, gongfan <gongfan1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>, Xin Guo <guoxin09@huawei.com>,
	Shen Chenyang <shenchenyang1@hisilicon.com>,
	Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
	Shi Jing <shijing34@huawei.com>,
	Meny Yossefi <meny.yossefi@huawei.com>
Subject: Re: [PATCH net-next v02 1/1] hinic3: module initialization and tx/rx
 logic
Message-ID: <202412262337.pslE1avE-lkp@intel.com>
References: <bbf2442dc9feca8bfa13ccfa2497a0e857eb5809.1735206602.git.gur.stavi@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbf2442dc9feca8bfa13ccfa2497a0e857eb5809.1735206602.git.gur.stavi@huawei.com>

Hi Gur,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9268abe611b09edc975aa27e6ce829f629352ff4]

url:    https://github.com/intel-lab-lkp/linux/commits/Gur-Stavi/hinic3-module-initialization-and-tx-rx-logic/20241226-192558
base:   9268abe611b09edc975aa27e6ce829f629352ff4
patch link:    https://lore.kernel.org/r/bbf2442dc9feca8bfa13ccfa2497a0e857eb5809.1735206602.git.gur.stavi%40huawei.com
patch subject: [PATCH net-next v02 1/1] hinic3: module initialization and tx/rx logic
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20241226/202412262337.pslE1avE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412262337.pslE1avE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412262337.pslE1avE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic3/hinic3_tx.c: In function 'csum_magic':
>> drivers/net/ethernet/huawei/hinic3/hinic3_tx.c:292:17: error: implicit declaration of function 'csum_ipv6_magic'; did you mean 'csum_magic'? [-Werror=implicit-function-declaration]
     292 |                 csum_ipv6_magic(&ip->v6->saddr, &ip->v6->daddr, 0, proto, 0);
         |                 ^~~~~~~~~~~~~~~
         |                 csum_magic
   cc1: some warnings being treated as errors


vim +292 drivers/net/ethernet/huawei/hinic3/hinic3_tx.c

   287	
   288	static __sum16 csum_magic(union hinic3_ip *ip, unsigned short proto)
   289	{
   290		return (ip->v4->version == 4) ?
   291			csum_tcpudp_magic(ip->v4->saddr, ip->v4->daddr, 0, proto, 0) :
 > 292			csum_ipv6_magic(&ip->v6->saddr, &ip->v6->daddr, 0, proto, 0);
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
