Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A88335CB93
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 23:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768345257; cv=none; b=B0eQ+v6SXm/CVgxzPms7Lco/JpFU2QfCan8gk8vNH9EoYHz1hjnRyIIV3MLQUbUPPxMuALYI9xcmi/oYkcm9FXIVunLA/W/TL9WA+LfUcAnPaMzIrSlZp9IuuOipL8R2/zxq/sVLSD0EkQLS5N3mwCYEkfDiSRMhTyhzA1D2Mc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768345257; c=relaxed/simple;
	bh=/w1uwaUGJ02kmN6Edi+GVSlxzkTVq1B9zz0xvjg+xVw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mc32dSXKB357mf6BplpY1v4UhQQ1HqVb19cXp/f19dQxRsvoKRVMvekz0k0A62/KYDQHSXf12tq2tySOmbx5aNuT0zoOboT3vHz9itiGM2XVCLlXDQ/apmXx4GgyuQ0j3rZxaouyof0eeKHGkn6h5pNNJbRtUCylLTFY2zD2uYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsJgfWpI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsJgfWpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768345255; x=1799881255;
  h=date:from:to:cc:subject:message-id;
  bh=/w1uwaUGJ02kmN6Edi+GVSlxzkTVq1B9zz0xvjg+xVw=;
  b=BsJgfWpI53XHntdoUy7U/HwxXCiLOxTpRLpwG6yjbo5SEIlo/pJixkaG
   PoFUt4YNqjDSpXudTgseGyxIYsix86cPVP9SIrR9nP03ByNEKt7y3lSUS
   sMnbgJfcM/tntunPejTw5ZThO4sTlCpxDqlaJLyffIGbk5E2MYc3cA8AN
   z9AS2TjTYHb6xgyacOnqJex9OzotLFwz3323enhDDKDgSc6K5Od+lXTqO
   qlfrGkXiu52TZXI2++xwBNwz4KR7mZ4n2VkDKruHAIPlZH7AWsvlYRggF
   osEyFUFU2A0N7XnGvqhpZ2FRKyKs6uSnFI6+xUgsZmFgXMQxGMDWB1lv+
   g==;
X-CSE-ConnectionGUID: yhMLl8MRSYiQuIl8OGhNPg==
X-CSE-MsgGUID: 4C7PlecTT86/IHxjSzOgMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92310892"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="92310892"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 15:00:52 -0800
X-CSE-ConnectionGUID: UincIv1zSg6nz+zfLHdQ2A==
X-CSE-MsgGUID: lX7U5I5LRningC0siRgpQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204399098"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 15:00:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfnNY-00000000FT2-1h5l;
	Tue, 13 Jan 2026 23:00:48 +0000
Date: Wed, 14 Jan 2026 07:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
 Vlastimil Babka <vbabka@suse.cz>
Subject: [vbabka-slab:slab/for-7.0/obj_metadata 9/10] Warning:
 mm/slub.c:7013 function parameter 'objp' not described in 'ksize'
Message-ID: <202601140605.GNpnpgLF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git slab/for-7.0/obj_metadata
head:   a4e5702b7bb846cf50d2917cadf2289c25720812
commit: 1e8eb4117f27366855b192104098330a2f290f26 [9/10] mm/slab: move [__]ksize and slab_ksize() to mm/slub.c
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260114/202601140605.GNpnpgLF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140605.GNpnpgLF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140605.GNpnpgLF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slub.c:7013 function parameter 'objp' not described in 'ksize'
>> Warning: mm/slub.c:7013 function parameter 'objp' not described in 'ksize'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
