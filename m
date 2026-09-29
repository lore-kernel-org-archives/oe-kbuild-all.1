Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD453DDDCC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 03:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651588; cv=none; b=IQ0mElEbIHuc29uo70WvOqtElCG3PxC1sMT8hQcttQHpJ11tnFdgiNqg2BqAGx4I31gJgkBdp28qGc6Zt4SR/gQzdS3qVn2BPvqaBbnYT39Q4V8YUKOP9RHTKGLeFG7Eelm6aXM0N5GEO/izCdYZxh/y70iMUq5vGwrPAe63cTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651588; c=relaxed/simple;
	bh=NS9UQSGFVxlquTZHxhdQWc4jhhurGBs301T5LCyWhLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UIVZUFSanEr1YJ7/zHEAo8Yb4g6RGpC0j8j1C9tsk0DLFbYGU0WwSsbRy2sv99pigYjJBZp/X0Gp253FITbVnOp0NUxr/aJoMMAmQ6DqkbLT/4HrIhgGnxhMXdWfxZwg+wUF5xnICBA/qCx5ni/7DddQ+7vqqut1E+yQSl/blM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxE+UbTx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxE+UbTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790651585; x=1822187585;
  h=date:from:to:cc:subject:message-id;
  bh=NS9UQSGFVxlquTZHxhdQWc4jhhurGBs301T5LCyWhLw=;
  b=nxE+UbTx8sZ2U1fcRqeTfr4kLeqbZb9+emaudmZ6Amuz+i1JGYFb5r0X
   SJG0JE432UUmTKd6f3z94rFjZWa/IMwDsqs5Z4xkyc7VSmBH+FBDb6gtQ
   HpraauwelkMM1VpE+uzOXV1mfA3gE7wvrGmokxlbP7SC06tZe5PMMBrb1
   Lk/OVhIZzjOBu+z06y4CAj/K+xmZ7HLnQu8wh5vXbYtcn1TlMlS2zm3Uh
   cDWme5/fn4VwyWXrbA/9ah7hoY+XBn72BiEQ7u+vIBSCT/aINoriVq+hl
   Uyl5+IUskmktE2CKp+9QogPMuudJNtsvPIgy0P6svPQc7J1yOBQRQBWvN
   g==;
X-CSE-ConnectionGUID: 1eBYeKsZRsuq0+JeG0niXw==
X-CSE-MsgGUID: BnJ/cQ2AR5yvPHGkO9zIxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90581203"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90581203"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 20:13:04 -0700
X-CSE-ConnectionGUID: lg2WNapDSUOS//YvZKguFA==
X-CSE-MsgGUID: BXT/6PCLSHKGnzqxY/w+Vg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Sep 2026 20:13:02 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBOH5-000000001HH-3ZnA;
	Tue, 29 Sep 2026 03:12:59 +0000
Date: Tue, 29 Sep 2026 05:12:52 +0200
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thesofproject:topic/sof-dev 7661/8676]
 sound/soc/sof/mediatek/mtk-adsp-common.c:99: undefined reference to
 `mtk_adsp_ipc_send'
Message-ID: <202609290540.xLiP5Uqm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   31d325add7cc39aaf227bb8f5e5dc292b735db25
commit: 3e55a76d727eddf6b3bad82139a6788172168a01 [7661/8676] Merge branch 'sound/upstream-20250414' into merge/sound-upstream-20250414
config: nios2-randconfig-r2104-20260928 (https://download.01.org/0day-ci/archive/20260929/202609290540.xLiP5Uqm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290540.xLiP5Uqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290540.xLiP5Uqm-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: sound/soc/sof/mediatek/mtk-adsp-common.o: in function `mtk_adsp_send_msg':
>> sound/soc/sof/mediatek/mtk-adsp-common.c:99: undefined reference to `mtk_adsp_ipc_send'
>> sound/soc/sof/mediatek/mtk-adsp-common.c:99:(.text+0xb4): relocation truncated to fit: R_NIOS2_CALL26 against `mtk_adsp_ipc_send'
   nios2-linux-ld: sound/soc/sof/mediatek/mtk-adsp-common.o: in function `mtk_adsp_handle_request':
   sound/soc/sof/mediatek/mtk-adsp-common.c:139: undefined reference to `mtk_adsp_ipc_send'
   sound/soc/sof/mediatek/mtk-adsp-common.c:139:(.text+0x1f0): relocation truncated to fit: R_NIOS2_CALL26 against `mtk_adsp_ipc_send'
   nios2-linux-ld: sound/soc/sof/mediatek/mt8365/mt8365.o:(.data+0x7c): undefined reference to `sof_of_pm'


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
