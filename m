Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFD043CEE1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 09:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835081; cv=none; b=YLbninX3q/kfbl911XGbjRRKfYZ6SCW+8V6cnjeMsXz9YjpnCrwxYh+3/knHea1BeGgmDuYisnk66PmyHmatctChYpQ1BXvLpT1tcmIFAmSbMTEv4ir/kRgzA0LLQDcC59EE2aqSYEHfy9utZYu4xvEyczGNp33e0TPhaSBljy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835081; c=relaxed/simple;
	bh=Xnc5KBLqfTrzf1YHz9XESgTn+NFwXtPtYwkXhanXaHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkSH2DAHnd04axYSBlnTG7fEJdNqY1iAZ1zJQp4/CMvr6bv2jDVInMVZ5LvgsR6T9tLRjRU1vUoeQI5HKHrNAE+WptDdiny7iuAvOl6C/ykZtoFyT75oXiX8EamZ182Qy32a4PWpAk/p3UwoYFe+9++kPoSbpkhCpVx+o9FrE3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxF8yV/q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxF8yV/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785835080; x=1817371080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xnc5KBLqfTrzf1YHz9XESgTn+NFwXtPtYwkXhanXaHU=;
  b=cxF8yV/q77wxZbRdNrol/7aolw1WzuREMVez62m2LhnYDF70erJAH6nw
   W8Fla4Hjsva2hiXNuEbLG7kqODYwvGHCcJYCeYzqFOjQ37eAGSSYy2M0P
   pig6xIwUghH/RBajDrCSHmbAGI3HAFTXNbDHpJNm87hS2S0+Ym5GNSFx6
   ROE7Y9WrUkyp/Zs5m/0ABgNrVM0m1zMyJ2omYkTMCeQcxaOe20/p9aaAc
   Hd+6CH+eQa8OzDf0VoYbOoXiaD340d8zGY+Y/C3HWHwmQ6sPjd9/kljST
   YoJn6Hmufk4720HJvB8/1VBiDEisRJ+wblPX04043/bSNvOcpo50RQXx/
   g==;
X-CSE-ConnectionGUID: ZtEsbjokQO2LVPV4g+/XTw==
X-CSE-MsgGUID: r1WeAIOkScSOEHYNtRZtzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86150477"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86150477"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 02:17:58 -0700
X-CSE-ConnectionGUID: RwfehJXCRJaaQFErlCyujQ==
X-CSE-MsgGUID: MDC7Lv8tT+iWScqToc/J2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263448278"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Aug 2026 02:17:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrBHT-000000009Wj-2Awl;
	Tue, 04 Aug 2026 09:17:51 +0000
Date: Tue, 4 Aug 2026 17:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Haoxiang Li <haoxiang_li2024@163.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: mediatek: vcodec: unregister VPU watchdog handler
Message-ID: <202608041721.qBlQgdnE-lkp@intel.com>
References: <20260708124235.763036-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708124235.763036-1-lgs201920130244@gmail.com>

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v7.2-rc6 next-20260803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-mediatek-vcodec-unregister-VPU-watchdog-handler/20260804-140933
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260708124235.763036-1-lgs201920130244%40gmail.com
patch subject: [PATCH] media: mediatek: vcodec: unregister VPU watchdog handler
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608041721.qBlQgdnE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041721.qBlQgdnE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041721.qBlQgdnE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vpu/mtk_vpu.c:440:1: error: expected identifier or '(' before '+' token
     440 | +void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
         | ^


vim +440 drivers/media/platform/mediatek/vpu/mtk_vpu.c

   439	
 > 440	+void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
   441	{
   442		struct mtk_vpu *vpu = platform_get_drvdata(pdev);
   443	
   444		if (!vpu || id >= VPU_RST_MAX)
   445			return;
   446	
   447		mutex_lock(&vpu->vpu_mutex);
   448		vpu->wdt.handler[id].reset_func = NULL;
   449		vpu->wdt.handler[id].priv = NULL;
   450		mutex_unlock(&vpu->vpu_mutex);
   451	}
   452	EXPORT_SYMBOL_GPL(vpu_wdt_unreg_handler);
   453	
   454	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
