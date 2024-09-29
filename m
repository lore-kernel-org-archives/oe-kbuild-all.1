Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C72029CEB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 05:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727587576; cv=none; b=ui1ex/bLQ8TdC+UIFeCMXrLg4qoTAKSLI/IpmoblEOU51yrbNejSiK+9H3b+q8MKDnJ7840CWmV2bqN1DE/egL5dqa3jvZB3AOs/Bb8dNy/HGbeBP5ZjRuuFIgQv5oOaKqJGdFq4gcM8B49cV+rlqv8lRhuH8X0vbZEon5QkPpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727587576; c=relaxed/simple;
	bh=gdwaJu4jXz1wKuVG00Q7zXHqvoGk6ISJk6l8AYbxYHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdWX/RnY0BqO7Osp3vJcgsu7f6Ym0/hilbB8PlTYwRYpDumLS7SY3vp8/VDyFfsOVPDmvilUtJFqe9F3yAN9GdJDLN5fLUpwRjXepBlbnunqbVNX06gEy+LTXE2ohj91GGxKq38NsTj7NuXeDfSnnMKjX6jJJFxXesmJMt1HPNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFWfd6R2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFWfd6R2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727587574; x=1759123574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdwaJu4jXz1wKuVG00Q7zXHqvoGk6ISJk6l8AYbxYHM=;
  b=QFWfd6R2MA60zYxZhDKmzfxG5XRPnnKpBHoBw6Q+AOk/GbSbSVgM30Iw
   FbNtJ8CITcv3ugzcQNSeWGbHpY9/1oC9NtoMVNWa085jg89Cc9ClDiUFb
   cPNlNxgODhWKUiRkaF6vlLlxyoNXzBvQ9d3dGkLCybNyeIvCOlmxBY3wh
   d4VX+xZKHEaJPHccoJ90j+vVhzxxIknlNuq16E7ZFb5eccF0UrPFra+D/
   SOFZCx/lCFeulYN8+dDfmWyT+K1ISjv71JfmY0rtSCj4nJgS5mJr0qYdj
   +6LT4x3iYpAPBHiLxQLvagJnQvZ+rB4DyspE+tr5Phiyj4IAwDo2+NVQU
   Q==;
X-CSE-ConnectionGUID: FlpyOKD4QeG9QpdB/Sg0hQ==
X-CSE-MsgGUID: WqQy3GVeTROQkD5AGdph7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="29571641"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="29571641"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 22:26:13 -0700
X-CSE-ConnectionGUID: bMw+gfeUTme/rjQeXrL8oQ==
X-CSE-MsgGUID: hxtTI/z6SwK0zwGu7Ai0nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="77882187"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Sep 2024 22:26:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sumRd-000Nub-3B;
	Sun, 29 Sep 2024 05:26:09 +0000
Date: Sun, 29 Sep 2024 13:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, WenChen <chenwen54@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 23323/30000]
 drivers/ub/urma/ubcore/ubcore_tp.c:392:5: warning: no previous prototype for
 'ubcore_modify_tp_state'
Message-ID: <202409291302.BCi0PcSr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   dc55753ca59725e5130059dc4c520e8a91c655c0
commit: 329bf7f331286ee5d571d374e31ed50d2877b110 [23323/30000] ubcore: fix the bug of tp negotiation concurrency
config: arm64-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409291302.BCi0PcSr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291302.BCi0PcSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291302.BCi0PcSr-lkp@intel.com/

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
