Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8790B1DE4F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 15:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729785203; cv=none; b=DiWdUM/Gt4A4in7SfoEwfS5eFQFGS3dfK643QAW2P4SJ4a+KAMAM7/qyLoLH76AL386TmAqrdu/spY0ZsOXzT3wG+gTlP1TnUZdWMoGD306adF13eHxa7JgZR4jvyuvuzh3fWHxwBUe3Ki62DJzZkpEqMAA6dCyXau1HtD53LPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729785203; c=relaxed/simple;
	bh=KvwXv9BykRScZndwPzymLDeDOq8UUfarB1xM4xJAjvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I83TBn7CaFlnBQimLDScgg84aVdzYEVTcB3aZ8xvdF9ZCgP01FUlMpxeqyyprPAjzD7r2bK8k+MianL42mPp810va1dzC9VB//PAi4oU//SthGiTF53GKPT18Hv6bJb2qgCKVxKjmRGrlpNE9i3msOXBWcOdgfqcr4xGFTUdiVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZa/ylYo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZa/ylYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729785201; x=1761321201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KvwXv9BykRScZndwPzymLDeDOq8UUfarB1xM4xJAjvE=;
  b=UZa/ylYocLn1g0MvjcFrqu5J3iUsT/11zSqrPlP9Sutv2e3ZKTYwjs5c
   8l1/lqnAw94MCfsqnJNrvb15pRS14saSTV7oIF+XuZQAkZZs5FodKxMfc
   ayMAIWAVAeKoX4MQvAfBpHpKJgrT2sLmN/3Wx9tn7MxXRDJSq73mWcLBE
   Tag3Qv3sl1XYJYksRGyQHYfC3RNsO14lteQvhUVR2OE8s2Lh3Tt5bPGCn
   vCkjwg9+utD/4m51zzgER7w7gNqprmTGHoCM4fitO9iNEFgyGKKtJoT78
   +t7bTDiAv6NRDg3Ek3MxDoVrMkMNnbSUlPlZcoS3fl488nBX09B6fZ2Id
   g==;
X-CSE-ConnectionGUID: e7RKL6XIRAWi5cOZMbSbRQ==
X-CSE-MsgGUID: f1AWtHxnQo2L7Fyw5bsfJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="28867545"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="28867545"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:53:03 -0700
X-CSE-ConnectionGUID: 3NSIdwyeS/q1CVdnWXqktA==
X-CSE-MsgGUID: RktRkgk2R0aNbGoybSKtYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80615790"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Oct 2024 08:53:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t408y-000Wci-0x;
	Thu, 24 Oct 2024 15:53:00 +0000
Date: Thu, 24 Oct 2024 23:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next RFC PATCH 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <202410242306.0YAKVib8-lkp@intel.com>
References: <20241021130209.15660-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021130209.15660-4-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-mdio-implement-mdio_mutex_nested-guard-variant/20241021-210643
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241021130209.15660-4-ansuelsmth%40gmail.com
patch subject: [net-next RFC PATCH 3/4] net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241024/202410242306.0YAKVib8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242306.0YAKVib8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242306.0YAKVib8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/dsa/an8855.o: in function `an8855_vlan_add':
>> an8855.c:(.text+0x1010): undefined reference to `__ffsdi2'
   ld: drivers/net/dsa/an8855.o: in function `an8855_vlan_add.cold':
>> an8855.c:(.text.unlikely+0x91): undefined reference to `__ffsdi2'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
