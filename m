Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76D51DBB13
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910811; cv=none; b=Tc0tqH7rJ8SIIsCzGqKei1+dwTOCfnAtBWBO++vk194/FBoZT5UT+9UctUegdwJIO8jbOEIUsbaqCpJTFMraeIeCcLUOoikKXWpPAu/kzhwuSq48IbF8C1LwxP2O5tFOTKT0pkPWkB+OEHzChkL3xjRT8Mvz/ifFCnirhPho/Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910811; c=relaxed/simple;
	bh=TeP0cBwan6HxEPvXAdhn6n1zMM3Sy3oxoY2vv3duhcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E07OZxo5pKVnqhKYmqU7X1Kf8ZWNPG3FVhXGIV2VdFFEKYO0SVpFYYls+EW7znKOLDzQe/bdCY1lSLeFNGNZ3ogeBvZLyyYVU86E4naxCge4sDlyjLX6MeYxlRZGeoCYGaUSVs3GGb1SgCCabTX30RAxXkovrNXVWYcLFFM2leU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFArmHkB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFArmHkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742910809; x=1774446809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TeP0cBwan6HxEPvXAdhn6n1zMM3Sy3oxoY2vv3duhcU=;
  b=MFArmHkBVu3/vIiJcLXIPqibmk4l7qC/eFK8EuQBEHSM4Ofqtuink+bi
   fDIyxlJfFWRVNRVFESUZW5WbbB810EfXRGm1iYuqEG8qUi+KG4dl1qb1o
   7paTDt8lo30AmDJo95teDCkUSc/ptzcshg+0nFLSrCC/PcdwMJ8cb7PjG
   Jaf2pEeJmmN/fZmkl/8U6aW0j/vuQcmNejPZijnuWVySnuwVEkVzdo+Z6
   Tx6RGsecxrIDZyKYdwavwse0l8D3hvWt6g7raYUc05UcwHndkx9ZiOahK
   4I3rVs2/VaHwFl27VWxCEbRLRGgXGhErRWgjrdnoQZGc7bFmFOysDmLid
   A==;
X-CSE-ConnectionGUID: CNQ3hqFzST6RXCYjU/GOiw==
X-CSE-MsgGUID: j+a0hWYRQZ+gmrRkU0qbpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54360892"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="54360892"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 06:53:28 -0700
X-CSE-ConnectionGUID: l0/9WjnvTA2gDpy05gdAEQ==
X-CSE-MsgGUID: I7JuyO6yTIONgmzja/EclQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="129053143"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Mar 2025 06:53:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx4ib-0004vf-0j;
	Tue, 25 Mar 2025 13:53:25 +0000
Date: Tue, 25 Mar 2025 21:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2820/2820] net/core/sock_map.c:1501:5: sparse:
 sparse: symbol 'sock_map_prog_lookup' was not declared. Should it be static?
Message-ID: <202503252115.VoLdAs0Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0d616a77cb5f7198cca524a24f717f59ad51b41b
commit: 050383882de382969e4fb8362235749b232cccae [2820/2820] bpf: support BPF_PROG_QUERY for progs attached to sockmap
config: x86_64-randconfig-123-20250325 (https://download.01.org/0day-ci/archive/20250325/202503252115.VoLdAs0Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503252115.VoLdAs0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503252115.VoLdAs0Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/sock_map.c:1501:5: sparse: sparse: symbol 'sock_map_prog_lookup' was not declared. Should it be static?

vim +/sock_map_prog_lookup +1501 net/core/sock_map.c

  1500	
> 1501	int sock_map_prog_lookup(struct bpf_map *map, struct bpf_prog ***pprog,
  1502				 u32 which)
  1503	{
  1504		struct sk_psock_progs *progs = sock_map_progs(map);
  1505	
  1506		if (!progs)
  1507			return -EOPNOTSUPP;
  1508	
  1509		switch (which) {
  1510		case BPF_SK_MSG_VERDICT:
  1511			*pprog = &progs->msg_parser;
  1512			break;
  1513		case BPF_SK_SKB_STREAM_PARSER:
  1514			*pprog = &progs->skb_parser;
  1515			break;
  1516		case BPF_SK_SKB_STREAM_VERDICT:
  1517			*pprog = &progs->skb_verdict;
  1518			break;
  1519		default:
  1520			return -EOPNOTSUPP;
  1521		}
  1522		return 0;
  1523	}
  1524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
