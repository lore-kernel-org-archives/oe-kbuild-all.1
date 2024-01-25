Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB83811CB7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 07:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706167053; cv=none; b=JlqZyy0tC/3UMDq+5YAmg4OTcP8Mi5eG5RK/PhbsZnLtR3d6FsTtMn73NSCnaCK5txNU6m0v97/BneuggKIsfWWdduyhjoLyXWusfnt9UiSnAF9nrFeHM8gZCfljT7si4lSCyc8/4o7mTaujuRZKC/xpCVnvJhv/FxQUOX9Y+eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706167053; c=relaxed/simple;
	bh=f/RMkRVOptc28qyMX9OnEMVoIj3pdYTxR/+lGtFf9Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dmq870V7Rb7zjH29wu2XCoytIk4yAOm34VSOdQ6coh3i56ry10nlSB3fijNsw606ZL09MRONJ8FxpOPSKvG5GbKE0wZkx2Oj6BfqTxOb3zC3Lkc1yh4OSYk1BYZxCpQyh+OapEY3NWKeJHJva2TDmHXWoKDwlufNhr4WA+ECjIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LF2NmCT9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LF2NmCT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706167052; x=1737703052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f/RMkRVOptc28qyMX9OnEMVoIj3pdYTxR/+lGtFf9Zk=;
  b=LF2NmCT9JjMsBp1D20H68i88CZDEtcsz1w2udX7YzunCFK1GnFSr3gIv
   bYp7bYiqtr8HafAZVeBII5iJvBRo8i4X/dSmSQSd7Xg3jcNqZ/0uas3ya
   ejv2kYTf2t9TWz+idhLN14BKRpUfWjUc2VMLaDcAHPpCm9JCuL/fY7TSG
   pfcKpMupPwMuoZDX/ZJPkeJPXg9nft4RQYu+1odCiwUz8Xh8Hbd4Md3Au
   x3ic3IfglRLVnvSztMFUHxazEpn82ozCfoah+/ecOTnhKw/zHngplf1No
   G4uPKIENjTJ4hLYDhXPBXbfQK/8ma+qeiA6sToQjAeQ3l+Ms4P8x8nM4X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9196153"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9196153"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 23:17:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="736230442"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="736230442"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Jan 2024 23:17:29 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rStzL-0008pR-28;
	Thu, 25 Jan 2024 07:17:27 +0000
Date: Thu, 25 Jan 2024 15:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lukasz Plachno <lukasz.plachno@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH iwl-next v4 2/2] ice: Implement 'flow-type ether' rules
Message-ID: <202401251536.jUjE8Acc-lkp@intel.com>
References: <20240124152141.15077-3-lukasz.plachno@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124152141.15077-3-lukasz.plachno@intel.com>

Hi Lukasz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukasz-Plachno/ice-Remove-unnecessary-argument-from-ice_fdir_comp_rules/20240125-054019
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20240124152141.15077-3-lukasz.plachno%40intel.com
patch subject: [PATCH iwl-next v4 2/2] ice: Implement 'flow-type ether' rules
config: i386-randconfig-001-20240125 (https://download.01.org/0day-ci/archive/20240125/202401251536.jUjE8Acc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251536.jUjE8Acc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251536.jUjE8Acc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c:1237: warning: Function parameter or struct member 'dev' not described in 'ice_set_ether_flow_seg'


vim +1237 drivers/net/ethernet/intel/ice/ice_ethtool_fdir.c

  1226	
  1227	/**
  1228	 * ice_set_ether_flow_seg
  1229	 * @seg: flow segment for programming
  1230	 * @eth_spec: mask data from ethtool
  1231	 *
  1232	 * Return: 0 on success and errno in case of error.
  1233	 */
  1234	static int ice_set_ether_flow_seg(struct device *dev,
  1235					  struct ice_flow_seg_info *seg,
  1236					  struct ethhdr *eth_spec)
> 1237	{
  1238		ICE_FLOW_SET_HDRS(seg, ICE_FLOW_SEG_HDR_ETH);
  1239	
  1240		/* empty rules are not valid */
  1241		if (is_zero_ether_addr(eth_spec->h_source) &&
  1242		    is_zero_ether_addr(eth_spec->h_dest) &&
  1243		    !eth_spec->h_proto)
  1244			return -EINVAL;
  1245	
  1246		/* Ethertype */
  1247		if (eth_spec->h_proto == htons(0xFFFF)) {
  1248			ice_flow_set_fld(seg, ICE_FLOW_FIELD_IDX_ETH_TYPE,
  1249					 ICE_FLOW_FLD_OFF_INVAL,
  1250					 ICE_FLOW_FLD_OFF_INVAL,
  1251					 ICE_FLOW_FLD_OFF_INVAL, false);
  1252		} else if (eth_spec->h_proto) {
  1253			dev_warn(dev, "Only 0x0000 or 0xffff proto mask is allowed for flow-type ether");
  1254			return -EOPNOTSUPP;
  1255		}
  1256	
  1257		/* Source MAC address */
  1258		if (is_broadcast_ether_addr(eth_spec->h_source))
  1259			ice_flow_set_fld(seg, ICE_FLOW_FIELD_IDX_ETH_SA,
  1260					 ICE_FLOW_FLD_OFF_INVAL, ICE_FLOW_FLD_OFF_INVAL,
  1261					 ICE_FLOW_FLD_OFF_INVAL, false);
  1262		else if (!is_zero_ether_addr(eth_spec->h_source))
  1263			goto err_mask;
  1264	
  1265		/* Destination MAC address */
  1266		if (is_broadcast_ether_addr(eth_spec->h_dest))
  1267			ice_flow_set_fld(seg, ICE_FLOW_FIELD_IDX_ETH_DA,
  1268					 ICE_FLOW_FLD_OFF_INVAL, ICE_FLOW_FLD_OFF_INVAL,
  1269					 ICE_FLOW_FLD_OFF_INVAL, false);
  1270		else if (!is_zero_ether_addr(eth_spec->h_dest))
  1271			goto err_mask;
  1272	
  1273		return 0;
  1274	
  1275	err_mask:
  1276		dev_warn(dev, "Only 00:00:00:00:00:00 or ff:ff:ff:ff:ff:ff MAC address mask is allowed for flow-type ether");
  1277		return -EOPNOTSUPP;
  1278	}
  1279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
