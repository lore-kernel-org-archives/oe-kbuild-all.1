Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E89222D77
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733907816; cv=none; b=aC+hHv8JAHOs0HcrdhK7ukvwZra9O7lF5BQlFEgM30qSVraW3Us6DK+XSy0UGy9qs9nGhayMjGdP0A0TGvQBKQfMz9zz1gVTRgA+/Sp4+uWMpwnsiLiZ8iviext0Y8kt+V81L/HBLsJ99iKJmjy6vh777JUsa453pphFdvU+LDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733907816; c=relaxed/simple;
	bh=NANtOAIsfnSbxsXzIn95U4iohR1agZGdVJ5CqU9rAj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqVAi+3RQF/DhF/IzMOTkoTvnCMgQMgEPL4Apcrc6Fos5ieZnKTHE49ZyXDJODk1vk0s+ty5PPiQgptDeMzC1kUQSwThLKxA0RwcmUmmQ7W+u2M1wCVsi7Ctib+akNPaHxzCrjULFY3cP3oWmUgsi20hkpX43NimXuyjrVM7poM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5g1uapJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5g1uapJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733907815; x=1765443815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NANtOAIsfnSbxsXzIn95U4iohR1agZGdVJ5CqU9rAj8=;
  b=n5g1uapJKxi/6zYKswd5j2IknEFTGdX0aH+TfmvJeA6Fusg4mz3KGst1
   y/rUJWCN/QNTIBlVTa64lvhbt2JIesDvLWsz/pMMqLWU8I4H65HCN2gXW
   fChLp5HjhO9zcWoN1cNJyUm8JWsCNxMu/qoBZUwXPpU8Ti2drRJR3Ov4v
   EOWXmD3eCgYA43vmlCbDVMPc5jD14jPUR3CjYnduPYZJB4l8UMrfB/nUJ
   l9ZXdrlPoDC4aqJOR/LB9LkqcPNw6fxk+PfNuZ3imRQbY/N/0ZU2d3UiB
   967NEoG69k2tzKXKRJVPCzyBV2mWgLmB+pqcDaOE0JVc9iUlMhVaRgWmE
   w==;
X-CSE-ConnectionGUID: uPDuw/QSRu25/xKmqQdepQ==
X-CSE-MsgGUID: 9deuUfo+SgqPjL6PVMk1Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33598506"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="33598506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 01:03:34 -0800
X-CSE-ConnectionGUID: itrtls3fSGyYhmQpt7n9Kg==
X-CSE-MsgGUID: 4K5AWaU0QZmeUddh4Jj8Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100268267"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2024 01:03:30 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLIcx-0006Sn-33;
	Wed, 11 Dec 2024 09:03:27 +0000
Date: Wed, 11 Dec 2024 17:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 net-next 11/13] bridge: No
 DEV_PATH_BR_VLAN_UNTAG_HW for dsa foreign
Message-ID: <202412111626.1QesC6qq-lkp@intel.com>
References: <20241210094501.3069-12-ericwouds@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210094501.3069-12-ericwouds@gmail.com>

Hi Eric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Woudstra/netfilter-nf_flow_table_offload-Add-nf_flow_encap_push-for-xmit-direct/20241210-175733
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241210094501.3069-12-ericwouds%40gmail.com
patch subject: [PATCH RFC v3 net-next 11/13] bridge: No DEV_PATH_BR_VLAN_UNTAG_HW for dsa foreign
config: sh-randconfig-002-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111626.1QesC6qq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412111626.1QesC6qq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412111626.1QesC6qq-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/bridge/br_vlan.c: In function '__vlan_vid_add':
>> net/bridge/br_vlan.c:112:15: error: implicit declaration of function 'br_switchdev_port_vlan_no_foreign_add'; did you mean 'br_switchdev_port_vlan_add'? [-Wimplicit-function-declaration]
     112 |         err = br_switchdev_port_vlan_no_foreign_add(dev, v->vid, flags, false, extack);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               br_switchdev_port_vlan_add


vim +112 net/bridge/br_vlan.c

   102	
   103	static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
   104				  struct net_bridge_vlan *v, u16 flags,
   105				  struct netlink_ext_ack *extack)
   106	{
   107		int err;
   108	
   109		/* Try switchdev op first. In case it is not supported, fallback to
   110		 * 8021q add.
   111		 */
 > 112		err = br_switchdev_port_vlan_no_foreign_add(dev, v->vid, flags, false, extack);
   113		if (err != -EOPNOTSUPP) {
   114			v->priv_flags |= BR_VLFLAG_ADDED_BY_SWITCHDEV | BR_VLFLAG_TAGGING_BY_SWITCHDEV;
   115			return err;
   116		}
   117		err = br_switchdev_port_vlan_add(dev, v->vid, flags, false, extack);
   118		if (err == -EOPNOTSUPP)
   119			return vlan_vid_add(dev, br->vlan_proto, v->vid);
   120		v->priv_flags |= BR_VLFLAG_ADDED_BY_SWITCHDEV;
   121		return err;
   122	}
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
