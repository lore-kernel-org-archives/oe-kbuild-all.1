Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C02E14286
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 01:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733361166; cv=none; b=qx3vfBndRsNA9ctLDj2l+D3NIM4M7QaeEgdfAvQhQ6O0MyL0YRP40x0DhIn0a3RDlsMaMoaGMuI31UPRD1Jj7Kjojju/z9EYeb2gnqdeJaeSnfWhcqcP2Mb7ErQkaI8aVGKXVj2bNxPq0zpQs88snwODNnB7BgfgGq3ZUlytOB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733361166; c=relaxed/simple;
	bh=WC/Fha8I55zxNVtslAJv56DO+aNYlNbDibXjGeI5Loo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sD88TQXvir4hSSpPX71iZ/SGHHgjLhBGlNOS4Q6g/W4xbkRYVCGb31GQFE3WFrsAulphTg0OTkd7y41lJWVDAA8y/QEYPrC7bNKWXzT/3LWEDZnrRvF4GIgEIQpXFJXP5iN/v4c2LnlB4sBdKaeYvnryUeDMxfoLWN+SPSYwy7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbF1g/xY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbF1g/xY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733361164; x=1764897164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WC/Fha8I55zxNVtslAJv56DO+aNYlNbDibXjGeI5Loo=;
  b=CbF1g/xY7yx8tdGVByG2tYpiV1tOyaeYEFSrzZsfWSfY3Df6ZO58QUV9
   MHWBw4ML/xd9h6Q5JZ60hs30HzPo7pzRziEp2hZ6VaCau02ufk2LtqjIc
   t0FGs2MS2yM3dsw2icJIlmmV/MwdKL1zaNYmjItDv1ekUiI+UpGhIbXDg
   gaw640yqn0y5fv3IUch+QDKsT8K4Xyd+83S/b8nkXxbqacHxkh/Z+OAfi
   H8Ilf9AN+sdyWDgwiUsq24pTT9RH7NWrM1sMVEu1FJRf0djBJh8/mv6na
   vuqyJthHwMYqrbdHxcQ2XpoJb9VYnu3ffcZQzHT4lFyBTLju9OQcS46IZ
   A==;
X-CSE-ConnectionGUID: lCXNGcUqSVioF09E7D/4hw==
X-CSE-MsgGUID: LF56bNyOShuVqbgTWy/OYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56132588"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="56132588"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 17:12:44 -0800
X-CSE-ConnectionGUID: ZBr3JXcxTxe+6+j1hIOObg==
X-CSE-MsgGUID: wOAS7N4qTaCgUpzVHWVDlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94771029"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 17:12:43 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ0Q4-0003dg-12;
	Thu, 05 Dec 2024 01:12:40 +0000
Date: Thu, 5 Dec 2024 09:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, WenChen <chenwen54@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/ubcore/ubcore_tp.c:392:5: warning: no previous prototype for
 'ubcore_modify_tp_state'
Message-ID: <202412050951.PkO7IjDp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WenChen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b71af6f00ede58be00cb7306c9acb2660ec90947
commit: 329bf7f331286ee5d571d374e31ed50d2877b110 [2516/2516] ubcore: fix the bug of tp negotiation concurrency
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241205/202412050951.PkO7IjDp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050951.PkO7IjDp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050951.PkO7IjDp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_tp.c:66:17: warning: no previous prototype for 'ubcore_get_mtu' [-Wmissing-prototypes]
      66 | enum ubcore_mtu ubcore_get_mtu(int mtu)
         |                 ^~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_tp.c:392:5: warning: no previous prototype for 'ubcore_modify_tp_state' [-Wmissing-prototypes]
     392 | int ubcore_modify_tp_state(struct ubcore_device *dev, struct ubcore_tp *tp,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c:894:19: warning: no previous prototype for 'ubcore_create_vtp' [-Wmissing-prototypes]
     894 | struct ubcore_tp *ubcore_create_vtp(struct ubcore_device *dev, union ubcore_eid *remote_eid,
         |                   ^~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c:920:5: warning: no previous prototype for 'ubcore_destroy_vtp' [-Wmissing-prototypes]
     920 | int ubcore_destroy_vtp(struct ubcore_tp *vtp)
         |     ^~~~~~~~~~~~~~~~~~


vim +/ubcore_modify_tp_state +392 drivers/ub/urma/ubcore/ubcore_tp.c

   391	
 > 392	int ubcore_modify_tp_state(struct ubcore_device *dev, struct ubcore_tp *tp,
   393		enum ubcore_tp_state new_state, struct ubcore_tp_attr *attr, union ubcore_tp_attr_mask mask)
   394	{
   395		if (ubcore_modify_tp_state_check(tp, new_state) != 0)
   396			return -1;
   397	
   398		if (tp->state == UBCORE_TP_STATE_ERR && new_state == UBCORE_TP_STATE_ERR) {
   399			ubcore_log_info("tp is already in ERR state and tpn = %u",
   400				tp->tpn);
   401			return 0;
   402		}
   403	
   404		if (dev->ops->modify_tp(tp, attr, mask) != 0) {
   405			/* tp->peer_ext.addr will be freed when called ubcore_destroy_tp */
   406			ubcore_log_err("Failed to modify tp to %u from state %u and tpn = %u",
   407				(uint32_t)new_state, (uint32_t)tp->state, tp->tpn);
   408			return -1;
   409		}
   410		tp->state = new_state;
   411		ubcore_log_info("tp state:(%u to %u) with tpn %u, peer_tpn %u",
   412			(uint32_t)tp->state, (uint32_t)new_state, tp->tpn, tp->peer_tpn);
   413		return 0;
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
