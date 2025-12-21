Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104552FB630
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766327824; cv=none; b=poOjL0yBKX7u98MbH737/WYBR8bGd5MjejQ0wDPyjcUdR3Brw9HgulCFkrwThM5sdAAugBoNZ0gmsXTOpneZWQ4Fv9JwW7RJwwK/b6yEGAOLC5A0JwLkKhbrT2fAk1/sfR4/rtMgE+LFlMS6RK92hyRaZZVUj9QEWBVXvymH0U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766327824; c=relaxed/simple;
	bh=JJ4kA0pkGP/1y50RcJYiufh4DlfbMMQGRKg5TD0ouhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujbV48ovEBKBLp+EgSkoRfjEem7eSLANCD9rx9JO/MVrnvvXIvMH9PpSlUSRxspt+9wYHVXqg6NjymENKW39HrL61m0Fku1qlMM+9x6TDpyn/4KmCc6sMPSJisM04g96s9G7Rg/A2NxZ2Cq+wCM6vfSFmURWot4axwiIhd1fJuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpJhIa2z; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpJhIa2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766327823; x=1797863823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JJ4kA0pkGP/1y50RcJYiufh4DlfbMMQGRKg5TD0ouhk=;
  b=lpJhIa2zVSeY7Q3ASTZLstHqjtsgbLLL2ErCBU7aA47N83dwAhc5X5pI
   f6MX+zpJWLvmgL9eJD0y/wBbNCz990DRo+ySWp+K/BDqK/LnJWBeKbHku
   PINOpJaBsyAgyJ3peyxmbDxsySGWJc+ALO9ABnVelbfDvCTcDLArtD9oQ
   mWkCxoJSz9XEOteHAgazEqomAhCvHcY31cvO15CXvlTJ8q5pLpZp0fmXl
   c6Bldgu5E6DF5ap0KAq9hhvI7OtLsC3Tob17tVUwTGA1xrkT2hXrfvoK6
   Yq1wI/FkRYXTW4nCkFKRFjqafgmiVhLprylpS7WXk3iKTjBlqLeuO4u/w
   A==;
X-CSE-ConnectionGUID: 7D302oN1Rb+yhba+vye27A==
X-CSE-MsgGUID: +sacvrMQQI6kw632EuvzBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72069071"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="72069071"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 06:37:02 -0800
X-CSE-ConnectionGUID: F9sFLfa7T6mJM/dxKvCw9g==
X-CSE-MsgGUID: 8pRy52zaQ7igYzuo+sNTrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="236725439"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Dec 2025 06:37:01 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXKYM-00000000552-3oOn;
	Sun, 21 Dec 2025 14:36:58 +0000
Date: Sun, 21 Dec 2025 15:36:50 +0100
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1] Bluetooth: L2CAP: Add support for setting BT_PHY
Message-ID: <202512211518.gKfAuON1-lkp@intel.com>
References: <20251217205221.285777-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217205221.285777-1-luiz.dentz@gmail.com>

Hi Luiz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[cannot apply to linus/master v6.16-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-L2CAP-Add-support-for-setting-BT_PHY/20251218-045422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20251217205221.285777-1-luiz.dentz%40gmail.com
patch subject: [PATCH v1] Bluetooth: L2CAP: Add support for setting BT_PHY
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251221/202512211518.gKfAuON1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211518.gKfAuON1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211518.gKfAuON1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/bluetooth/hci_conn.c: In function 'hci_conn_set_phy':
>> net/bluetooth/hci_conn.c:3038:25: warning: unused variable 'hdev' [-Wunused-variable]
    3038 |         struct hci_dev *hdev = conn->hdev;
         |                         ^~~~


vim +/hdev +3038 net/bluetooth/hci_conn.c

  3035	
  3036	int hci_conn_set_phy(struct hci_conn *conn, u32 phys)
  3037	{
> 3038		struct hci_dev *hdev = conn->hdev;
  3039		u8 tx_phys, rx_phys;
  3040	
  3041		switch (conn->type) {
  3042		case SCO_LINK:
  3043		case ESCO_LINK:
  3044			return -EINVAL;
  3045		case ACL_LINK:
  3046			/* Only allow setting BR/EDR PHYs if link type is ACL */
  3047			if (phys & ~BT_PHY_BREDR_MASK)
  3048				return -EINVAL;
  3049	
  3050			return hci_acl_change_pkt_type(conn,
  3051						       bt_phy_pkt_type(conn, phys));
  3052		case LE_LINK:
  3053			/* Only allow setting LE PHYs if link type is LE */
  3054			if (phys & ~BT_PHY_LE_MASK)
  3055				return -EINVAL;
  3056	
  3057			if (bt_phy_le_phy(phys, &tx_phys, &rx_phys))
  3058				return -EINVAL;
  3059	
  3060			return hci_le_set_phy(conn, tx_phys, rx_phys);
  3061		default:
  3062			return -EINVAL;
  3063		}
  3064	}
  3065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
