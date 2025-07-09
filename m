Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B321D3E8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752079137; cv=none; b=YyF4eLyG9uif+ORK14aosvDSU2E18EgRcl2kdJUjSqDRktlR63704prEitdMh4kbPqTlc3Xv7+MHHiovQ3A96y/BYT+Vksrsr1QeQLnSGmH8s+ZB5nA5wHGvy4n/YOe4JXmuEs8WciI/7yheFKB7JxZ1Xy+ybore0+oAVb3Ko30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752079137; c=relaxed/simple;
	bh=sscLlVLSTqX6Ja4Jl6uAsGtdoJXwQqGex1/xNaJecj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hwv9WaENky4jiHg7ktYiJnQj/OVCXh/96ZtUVDIrs1HZmaxlzYiM7iLT1QB29fsfbDpl1Pyl3t4zXrtD8Wl/S/kzS+E4k/4eR9HaOpjYzBWbanOjPU6POS6q4Qr7MEIYSZk2UdWePIw1kXncN5cutDksxy/5dYNXzsxwVb0/uck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsFT1ln1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsFT1ln1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752079135; x=1783615135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sscLlVLSTqX6Ja4Jl6uAsGtdoJXwQqGex1/xNaJecj8=;
  b=lsFT1ln1beDw8akbpytDm5TW/qi0oBdyU1v8GneC+jKD9wRKDq11Kw0u
   p9e0zhqgPsSvI2yAhALtTNoBdmBgqL0ZFnKp2scSdaOtK5O7YWFWqWjk1
   FEJcnhSht57/JPPuVeKakiWM17YI9W/AeOzJUtQq/tcQ2KuKL3KLLZYdE
   W13jzoKR7ViDCFaAUhFnzq40bU43NNwBe7RuhmQ3pohCkYjbD5yMNBXvD
   +y/9p81eY+QjtK6r5loVACDApaSBwy40uH5qlL/gspI94aaYxQl8I65uG
   Jd5NItB38f6AlGSgoR5HILfCz/8K4amGoEU9SGzZaa9Y2YlFYjEuOhJH3
   Q==;
X-CSE-ConnectionGUID: jpc8UIK/Qqua5h+cFwbwVA==
X-CSE-MsgGUID: 3vwtYuooQdy2dKujL1zqmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54441008"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54441008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 09:38:54 -0700
X-CSE-ConnectionGUID: j9qyy7HuTXKiHRMwQfnudw==
X-CSE-MsgGUID: FFKNPH+ST/Wz/xZfw4p7PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155236464"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2025 09:38:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZXon-0003lT-13;
	Wed, 09 Jul 2025 16:38:49 +0000
Date: Thu, 10 Jul 2025 00:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Guoqing Jiang <guoqing.jiang@canonical.com>, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	angelogioacchino.delregno@collabora.com, amergnat@baylibre.com
Cc: oe-kbuild-all@lists.linux.dev, zoran.zhan@mediatek.com,
	guoqing.jiang@canonical.com, linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mediatek: mt8365-dai-i2s: pass correct size to
 mt8365_dai_set_priv
Message-ID: <202507100010.qEVMavru-lkp@intel.com>
References: <20250709053900.55171-1-guoqing.jiang@canonical.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709053900.55171-1-guoqing.jiang@canonical.com>

Hi Guoqing,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on broonie-spi/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.16-rc5 next-20250709]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guoqing-Jiang/ASoC-mediatek-mt8365-dai-i2s-pass-correct-size-to-mt8365_dai_set_priv/20250709-134028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250709053900.55171-1-guoqing.jiang%40canonical.com
patch subject: [PATCH] ASoC: mediatek: mt8365-dai-i2s: pass correct size to mt8365_dai_set_priv
config: csky-randconfig-001-20250709 (https://download.01.org/0day-ci/archive/20250710/202507100010.qEVMavru-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100010.qEVMavru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507100010.qEVMavru-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8365/mt8365-dai-i2s.c: In function 'mt8365_dai_i2s_set_priv':
>> sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:819:43: error: invalid operands to binary & (have 'unsigned int' and 'struct mtk_afe_i2s_priv')
     819 |                                           &mt8365_i2s_priv[i]);
         |                                           ^~~~~~~~~~~~~~~~~~~
         |                                                           |
         |                                                           struct mtk_afe_i2s_priv
>> sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:817:23: error: too few arguments to function 'mt8365_dai_set_priv'; expected 4, have 3
     817 |                 ret = mt8365_dai_set_priv(afe, mt8365_i2s_priv[i].id,
         |                       ^~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:14:
   sound/soc/mediatek/mt8365/mt8365-afe-common.h:428:5: note: declared here
     428 | int mt8365_dai_set_priv(struct mtk_base_afe *afe,
         |     ^~~~~~~~~~~~~~~~~~~


vim +819 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c

402bbb13a195ca Alexandre Mergnat 2024-07-22  811  
402bbb13a195ca Alexandre Mergnat 2024-07-22  812  static int mt8365_dai_i2s_set_priv(struct mtk_base_afe *afe)
402bbb13a195ca Alexandre Mergnat 2024-07-22  813  {
402bbb13a195ca Alexandre Mergnat 2024-07-22  814  	int i, ret;
402bbb13a195ca Alexandre Mergnat 2024-07-22  815  
402bbb13a195ca Alexandre Mergnat 2024-07-22  816  	for (i = 0; i < DAI_I2S_NUM; i++) {
402bbb13a195ca Alexandre Mergnat 2024-07-22 @817  		ret = mt8365_dai_set_priv(afe, mt8365_i2s_priv[i].id,
08cb0e42ff0631 Guoqing Jiang     2025-07-09  818  					  sizeof(mt8365_i2s_priv[i])
402bbb13a195ca Alexandre Mergnat 2024-07-22 @819  					  &mt8365_i2s_priv[i]);
402bbb13a195ca Alexandre Mergnat 2024-07-22  820  		if (ret)
402bbb13a195ca Alexandre Mergnat 2024-07-22  821  			return ret;
402bbb13a195ca Alexandre Mergnat 2024-07-22  822  	}
402bbb13a195ca Alexandre Mergnat 2024-07-22  823  	return 0;
402bbb13a195ca Alexandre Mergnat 2024-07-22  824  }
402bbb13a195ca Alexandre Mergnat 2024-07-22  825  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
