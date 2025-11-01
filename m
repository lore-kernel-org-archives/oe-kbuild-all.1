Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ECC248883
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 16:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762014409; cv=none; b=Qg1o61qtHLqTZHkE27OkQz9MFJ0aYmZrmk1TzA+mbkgtSuFpA3bs03fdWlAtJMoNRbq2Dy+n5nnXLBOXlqejRse11Exxx14UgKIqgRWEv3/pnsOHAGNBGJnGINLWJ16lKetvb55ibvIf7hCv42Ct2oR/pKJ04/0wchPgCo0qpi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762014409; c=relaxed/simple;
	bh=LbTS5vdDEMlW/mplJsre4KeS5Vs1/FS7/QL071Ph3tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1pV4EBoThj+ArLlHJGJVnB3YpLOz9EDWAQ8I7izWHSl1LTieF5vU4yxI7DZVqIGncyY+SoNZ2TrHIxBNy27BqJwtgQfYV1FR47p3j/u0RJYO4dWOUcn21eUu5d8QnuaVY6KLBcxAzQRJiRNfisf0tb0OKBl9+XUlyrUY3k96u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7KidnX8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7KidnX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762014408; x=1793550408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LbTS5vdDEMlW/mplJsre4KeS5Vs1/FS7/QL071Ph3tQ=;
  b=P7KidnX8VlYbIGf9P7CEuFLq8lE+W2Ccm5rHGVS4BWXhMvZG10YyDtKU
   8faeqHgdMS28Hh19I3D1yyGa2ERZJuWkXDnFuursbUHeA7cdiAHupEFBU
   GEzj+h2ckTxVKBo4HlJIXwhulRYB8tvQU36FEbhcaJ9KbRYQAbYGnEIiJ
   ueEdpLZJ0IqQXprLyybS9ucjIFX14f3gln6plBpmo3H6zusHc37uQtjZs
   HtC2ygwu6Y95aFL7RPuxuNdG+9HfS4Nv99X/CpaLs+PaMwFI6IaFBJQiR
   VBIzWq9WCroEYMKFQisDqa584fztKJzj6OAf5B4tT9A/D84TC5HxUSVzk
   w==;
X-CSE-ConnectionGUID: Raqb1k3RQ3m7eVPk0VN3AQ==
X-CSE-MsgGUID: YDvZIxBRTcCwqm/Ucy8REw==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="74447211"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="74447211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 09:26:47 -0700
X-CSE-ConnectionGUID: jgtXkozeSnyPeHK3bz/SEA==
X-CSE-MsgGUID: chY1btWiTxGTiqzguQB6sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186440363"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2025 09:26:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFER8-000OT6-2N;
	Sat, 01 Nov 2025 16:26:42 +0000
Date: Sun, 2 Nov 2025 00:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, nbd@nbd.name, lorenzo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: Re: [PATCH] wifi: mt76: mmio_(read|write)_copy byte swap when on Big
 Endian
Message-ID: <202511020028.smeiQhNk-lkp@intel.com>
References: <20251027171759.1484844-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027171759.1484844-1-cjd@cjdns.fr>

Hi Caleb,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Caleb-James-DeLisle/wifi-mt76-mmio_-read-write-_copy-byte-swap-when-on-Big-Endian/20251028-012349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20251027171759.1484844-1-cjd%40cjdns.fr
patch subject: [PATCH] wifi: mt76: mmio_(read|write)_copy byte swap when on Big Endian
config: loongarch-randconfig-r111-20251101 (https://download.01.org/0day-ci/archive/20251102/202511020028.smeiQhNk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020028.smeiQhNk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020028.smeiQhNk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/wireless/mediatek/mt76/mmio.c:41:24: sparse: sparse: cast from restricted __le32
>> drivers/net/wireless/mediatek/mt76/mmio.c:41:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/net/wireless/mediatek/mt76/mmio.c:41:24: sparse:     expected unsigned int [usertype] value
   drivers/net/wireless/mediatek/mt76/mmio.c:41:24: sparse:     got restricted __le32 [usertype]
   drivers/net/wireless/mediatek/mt76/mmio.c:63:23: sparse: sparse: cast to restricted __le32

vim +41 drivers/net/wireless/mediatek/mt76/mmio.c

    32	
    33	static void mt76_mmio_write_copy_portable(void __iomem *dst,
    34						  const u8 *src, int len)
    35	{
    36		__le32 val;
    37		int i = 0;
    38	
    39		for (i = 0; i < ALIGN(len, 4); i += 4) {
    40			memcpy(&val, src + i, sizeof(val));
  > 41			writel(cpu_to_le32(val), dst + i);
    42		}
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
