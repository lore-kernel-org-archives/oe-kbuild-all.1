Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F76731A045
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 04:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780030243; cv=none; b=pbDgK866qRkkgvy5sYDksAXRUAgF+5WgrttfbF5lzo68UXZgzqMeN0Zwi5lAA17/E1VabCBRnOFQAUc2YDRIY//34EieNKmhGbtbfPPbpsFmyBJYrJ3PChbZV0xKWcYFjkfdMGfyKxaTBh4Hu+MWEo9ubpu2t62C5pLRaNyUZ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780030243; c=relaxed/simple;
	bh=PwkO2FHCz+myKVpCIlHL72fYkcYgUNVduVXUzYJnkCE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q5xlvOy4PM4rKe+QuNOYJhgcpEn3zygaGqHuQpRyWXk8rp3CbEta+BIcVZzucL9ex5oVV3csMJBqet3N/GsVN0RE5X5vh6muzINLmL3l3L4h+DmJBICSZgvgf9P1kcq6GQUVH2UmkkefzQ28eH7DoPMjViNv2ZEKVHiLXHp8UwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncrr7EED; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncrr7EED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780030243; x=1811566243;
  h=date:from:to:cc:subject:message-id;
  bh=PwkO2FHCz+myKVpCIlHL72fYkcYgUNVduVXUzYJnkCE=;
  b=ncrr7EEDsFFp+fSCbne1Xt3l1LmhfcGkT1whzdIduMXG3r2z9IjAw3XV
   LgCd8XCyISYvALKBydgQzqZK3cMYyX1qonZgAa0aWBBxLHrHHOjW9/6u1
   wfbuwbuSpSQ0u7rfO4iTY3FnAC/IcYKkTIqktVLUucO6WpC3U2GjIv2ET
   ghl0AQk47sYlefH3b0y5/bKk8c0ar2ANph0NEAhGG4KFVi9pRjL/FXZoe
   nyGBuvarNjamxg3urDZjHpiIWSbbxF4XKspHqO3r0IbFni88Vfza7aWdR
   2cji+aOKEDKuWsHBBtBKS+a1efX9bKOVUIr/qNKoMb9Qs99ypbtcccYB8
   A==;
X-CSE-ConnectionGUID: qwzsBd1mTqmz4GfA+zQHrw==
X-CSE-MsgGUID: E32NK3C0S9SWU9iX42VuqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="103552899"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="103552899"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 21:50:42 -0700
X-CSE-ConnectionGUID: W6zKDqCQQCS9TshwLHtyIg==
X-CSE-MsgGUID: zduWmbYIQhG1XIL27QxK+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="247691441"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2026 21:50:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSpB7-000000006mM-3ZDb;
	Fri, 29 May 2026 04:50:37 +0000
Date: Fri, 29 May 2026 12:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thesofproject:topic/sof-dev 7661/8934]
 sound/soc/sof/mediatek/mtk-adsp-common.c:99: undefined reference to
 `mtk_adsp_ipc_send'
Message-ID: <202605291211.u0Zp8nwq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   ce4ed6c4e02650bce16e2f4d7b9d313c573e8541
commit: 3e55a76d727eddf6b3bad82139a6788172168a01 [7661/8934] Merge branch 'sound/upstream-20250414' into merge/sound-upstream-20250414
config: alpha-randconfig-r072-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291211.u0Zp8nwq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291211.u0Zp8nwq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291211.u0Zp8nwq-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: sound/soc/sof/mediatek/mtk-adsp-common.o: in function `mtk_adsp_send_msg':
>> sound/soc/sof/mediatek/mtk-adsp-common.c:99: undefined reference to `mtk_adsp_ipc_send'
>> alpha-linux-ld: sound/soc/sof/mediatek/mtk-adsp-common.c:99: undefined reference to `mtk_adsp_ipc_send'
   alpha-linux-ld: sound/soc/sof/mediatek/mtk-adsp-common.o: in function `mtk_adsp_handle_request':
   sound/soc/sof/mediatek/mtk-adsp-common.c:139: undefined reference to `mtk_adsp_ipc_send'
   alpha-linux-ld: sound/soc/sof/mediatek/mtk-adsp-common.c:139: undefined reference to `mtk_adsp_ipc_send'
   alpha-linux-ld: sound/soc/sof/mediatek/mt8365/mt8365.o:(.data.rel+0xa0): undefined reference to `sof_of_pm'


vim +99 sound/soc/sof/mediatek/mtk-adsp-common.c

698c1e99a0a3b8 YC Hung                    2022-05-17   86  
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20   87  /**
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20   88   * mtk_adsp_send_msg - Send message to Audio DSP
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20   89   * @sdev: SOF device
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20   90   * @msg: SOF IPC Message to send
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20   91   */
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20   92  int mtk_adsp_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20   93  {
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20   94  	struct adsp_priv *priv = sdev->pdata->hw_pdata;
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20   95  
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20   96  	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20   97  			  msg->msg_size);
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20   98  
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20  @99  	return mtk_adsp_ipc_send(priv->dsp_ipc, MTK_ADSP_IPC_REQ, MTK_ADSP_IPC_OP_REQ);
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20  100  }
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20  101  EXPORT_SYMBOL(mtk_adsp_send_msg);
24489150c5d9af AngeloGioacchino Del Regno 2025-03-20  102  

:::::: The code at line 99 was first introduced by commit
:::::: 24489150c5d9afea54c6909ba05c4dbdd8846dc0 ASoC: SOF: mediatek: Commonize duplicated functions

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
