Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445ED1FC7C8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 17:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777222; cv=none; b=Y5zrqTX7+rtRryppj5mrwYzE1dM9saWWZS13v9GH26vNFM+yL5kbxiZZ1UXdbIZ7HJb0aIqSHlHjYwdERkc1wCYyA05YXs6Pl40xTdoP1VsQ3QG7q6f2tNGRaWZEmMrIb9ja4EzppFncI8JnXwyHE/NT0ijcLKdTMelWIVu+854=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777222; c=relaxed/simple;
	bh=4XI+fP9B/X+RidN4eUgNbnnr7PUL8UstvZQbvKMRUb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fy7zZB1y9DaZ9G9afGKHoseSprp9VxN8gYx4Tsoes5fT4So6uoHdQT1DzdJhL9n9yt5k7JZcjwMUTUIxoZLwg/lYg7eMjn2Dpm8cyGANrbhQSEIGMFHOUeM8mvYK9E3VwIj/S8XeLzf6xGUXo1zLhxGhuzKLhdWPxcDogkYDxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlePrE0U; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlePrE0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738777219; x=1770313219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4XI+fP9B/X+RidN4eUgNbnnr7PUL8UstvZQbvKMRUb4=;
  b=NlePrE0Uy17elsGe0W8f0KmmAU0KVxSeXq1TPTvs5+HzO+6VNNOr7pVo
   BC6rjH1sU5jrwcFMADnOg35pB105/mmisj6jluJgm533upPKshw5Q+D5r
   3HIFIWILZfvt7EbVPZhQVbcMUvi6BVWZemO+iZ8LwWYXHEFz3g9WP27Ay
   6wBJlp+EfOUmE/oNoVnPdj27+IBiLo1J383jTc7DeaSAlLOk9D8IToIuB
   /JJ7XhQTX6U4xoJxuFnx0DuRfv0dZRizG/PJ2oXDIW82mlgtuhmgHkR19
   KC0jTRQISeqVaoc+0SVFh68QZkB3Dc1rfm30OZ9l1PB8hkyO3lEhfKLw4
   Q==;
X-CSE-ConnectionGUID: 6IQEcZNsQvCMDmyv8VfQPg==
X-CSE-MsgGUID: WJjAf61oQDqYwF7JTRW3Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39236592"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="39236592"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 09:40:19 -0800
X-CSE-ConnectionGUID: 8wmsNbvKR9uxvlwL99oJ9g==
X-CSE-MsgGUID: Sw2WuKzUSyibhH4/B47wiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="110948356"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2025 09:40:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfjNn-000vrf-1R;
	Wed, 05 Feb 2025 17:40:15 +0000
Date: Thu, 6 Feb 2025 01:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 192/192]
 drivers/memory/mediatek/smpu.c:350:25: warning: suggest braces around empty
 body in an 'if' statement
Message-ID: <202502060123.pFJwjllG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: dbcecbd857e7f464d25d76f956d9245ac6ae45e1 [192/192] CHROMIUM: memory: mediatek: smpu driver porting
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250206/202502060123.pFJwjllG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060123.pFJwjllG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060123.pFJwjllG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/memory/mediatek/smpu.c: In function 'smpu_violation':
>> drivers/memory/mediatek/smpu.c:350:25: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     350 |                         ;
         |                         ^
   drivers/memory/mediatek/smpu.c: In function 'smpu_clean_cpu_write_vio':
>> drivers/memory/mediatek/smpu.c:425:13: warning: variable 'vio_type' set but not used [-Wunused-but-set-variable]
     425 |         int vio_type = 6, prefetch = 0;
         |             ^~~~~~~~


vim +/if +350 drivers/memory/mediatek/smpu.c

   305	
   306	static irqreturn_t smpu_violation(int irq, void *dev_id)
   307	{
   308		struct smpu *mpu = (struct smpu *)dev_id;
   309		struct smpu_reg_info_t *dump_reg = mpu->dump_reg;
   310		void __iomem *mpu_base;
   311		int i, vio_dump_idx, vio_dump_pos, prefetch;
   312		int vio_type = 6;
   313		bool violation;
   314		ssize_t msg_len = 0;
   315		unsigned int prefetch_mask = 0x200000;
   316	
   317		irqreturn_t irqret;
   318		static DEFINE_RATELIMIT_STATE(ratelimit, 1 * HZ, 3);
   319	
   320		violation = false;
   321		mpu_base = mpu->mpu_base;
   322	
   323		if (!(strcmp(mpu->name, "nsmpu")))
   324			vio_type = VIO_TYPE_NSMPU;
   325		else if (!(strcmp(mpu->name, "ssmpu")))
   326			vio_type = VIO_TYPE_SSMPU;
   327		else if (!(strcmp(mpu->name, "nkp")))
   328			vio_type = VIO_TYPE_NKP;
   329		else if (!(strcmp(mpu->name, "skp")))
   330			vio_type = VIO_TYPE_SKP;
   331		else
   332			goto clear_violation;
   333	
   334		/* record dump reg */
   335		for (i = 0; i < mpu->dump_cnt; i++)
   336			dump_reg[i].value = readl(mpu_base + dump_reg[i].offset);
   337	
   338		/* record vioinfo */
   339		for (i = 0; i < mpu->vio_dump_cnt; i++) {
   340			vio_dump_idx = mpu->vio_reg_info[i].vio_dump_idx;
   341			vio_dump_pos = mpu->vio_reg_info[i].vio_dump_pos;
   342			if (CHECK_BIT(dump_reg[vio_dump_idx].value, vio_dump_pos)) {
   343				violation = true;
   344				mpu->is_vio = true;
   345			}
   346		}
   347	
   348		if (!violation) {
   349			if (__ratelimit(&ratelimit))
 > 350				;
   351			clear_violation(mpu);
   352			return IRQ_HANDLED;
   353		}
   354	
   355		if (violation) {
   356			if (vio_type == VIO_TYPE_NSMPU || vio_type == VIO_TYPE_SSMPU) {
   357				/* smpu violation */
   358				if (mpu->by_plat_isr_hook) {
   359					irqret = mpu->by_plat_isr_hook(
   360						dump_reg, mpu->dump_cnt, vio_type);
   361	
   362					if (irqret == IRQ_HANDLED) {
   363						violation = true;
   364						mpu->is_vio = true;
   365						mpu->is_bypass = true;
   366						goto clear_violation;
   367					}
   368				}
   369			}
   370	
   371			if (msg_len < MTK_SMPU_MAX_CMD_LEN) {
   372				prefetch = (prefetch_mask & readl(mpu_base + 0xe00)) ||
   373				(prefetch_mask & readl(mpu_base + 0xe80));
   374				mpu->is_prefetch = prefetch == 1 ? true : false;
   375				msg_len += scnprintf(mpu->vio_msg + msg_len,
   376						     MTK_SMPU_MAX_CMD_LEN - msg_len,
   377						     "\ncpu-prefetch:%d", prefetch);
   378				msg_len += scnprintf(mpu->vio_msg + msg_len,
   379						     MTK_SMPU_MAX_CMD_LEN - msg_len,
   380						     "\n[SMPU]%s\n", mpu->name);
   381			}
   382	
   383			for (i = 0; i < mpu->dump_cnt; i++) {
   384				if (msg_len < MTK_SMPU_MAX_CMD_LEN)
   385					msg_len += scnprintf(
   386						mpu->vio_msg + msg_len,
   387						MTK_SMPU_MAX_CMD_LEN - msg_len,
   388						"[%x]%x;", dump_reg[i].offset,
   389						dump_reg[i].value);
   390			}
   391		}
   392	
   393	clear_violation:
   394		mask_irq(mpu);
   395		if (vio_type == VIO_TYPE_NKP || vio_type == VIO_TYPE_SKP)
   396			clear_kp_violation(vio_type % 2);
   397	
   398		/* if there is violation happened, wake up the thread */
   399		if (violation)
   400			return IRQ_WAKE_THREAD;
   401	
   402		return IRQ_HANDLED;
   403	}
   404	
   405	static const struct of_device_id smpu_of_ids[] = {
   406		{
   407			.compatible = "mediatek,smpu",
   408		},
   409		{}
   410	};
   411	MODULE_DEVICE_TABLE(of, smpu_of_ids);
   412	
   413	/* As SLC b mode enable CPU will write clean evict, which may trigger SMPU violation.
   414	 * and those data may cached in CPU L3 cache through CPU prefetch.
   415	 */
   416	static void smpu_clean_cpu_write_vio(struct platform_device *pdev, struct smpu *mpu)
   417	{
   418		int sec_cpu_aid = 240;
   419		int ns_cpu_aid = 241;
   420		int hyp_cpu_aid = 243;
   421		bool slc_enable = mpu->slc_b_mode;
   422		int i;
   423		void __iomem *mpu_base = mpu->mpu_base;
   424		struct smpu_reg_info_t *dump_reg = mpu->dump_reg;
 > 425		int vio_type = 6, prefetch = 0;
   426		ssize_t msg_len = 0;
   427		unsigned int prefetch_mask = 0x200000;
   428	
   429		/* smpu check violation */
   430		if (slc_enable) {
   431			if (!(strcmp(mpu->name, "nsmpu")))
   432				vio_type = VIO_TYPE_NSMPU;
   433			else if (!(strcmp(mpu->name, "ssmpu")))
   434				vio_type = VIO_TYPE_SSMPU;
   435			else if (!(strcmp(mpu->name, "nkp")))
   436				vio_type = VIO_TYPE_NKP;
   437			else if (!(strcmp(mpu->name, "skp")))
   438				vio_type = VIO_TYPE_SKP;
   439	
   440			/* read SMPU/KP vio reg */
   441			for (i = 0; i < mpu->dump_cnt; i++)
   442				dump_reg[i].value =
   443					readl(mpu_base + dump_reg[i].offset);
   444	
   445			/* check whether cpu type master lead this smpu violation */
   446			if (!(strcmp(mpu->name, "nsmpu")) ||
   447			    !(strcmp(mpu->name, "ssmpu"))) {
   448				/* check smpu write violation aid reg */
   449				if ((mpu->dump_reg[5].value == sec_cpu_aid) ||
   450				    (mpu->dump_reg[5].value == ns_cpu_aid) ||
   451				    (mpu->dump_reg[5].value == hyp_cpu_aid)) {
   452					if (msg_len < MTK_SMPU_MAX_CMD_LEN) {
   453						prefetch = (prefetch_mask & readl(mpu_base + 0xe00)) ||
   454						(prefetch_mask & readl(mpu_base + 0xe80));
   455						mpu->is_prefetch = prefetch == 1 ? true : false;
   456						msg_len += scnprintf(mpu->vio_msg + msg_len,
   457						     MTK_SMPU_MAX_CMD_LEN - msg_len,
   458						     "\ncpu-prefetch:%d", prefetch);
   459						msg_len += scnprintf(mpu->vio_msg + msg_len,
   460						     MTK_SMPU_MAX_CMD_LEN - msg_len,
   461						     "\n[SMPU]%s\n", mpu->name);
   462					}
   463					for (i = 0; i < mpu->dump_cnt; i++) {
   464						if (msg_len < MTK_SMPU_MAX_CMD_LEN)
   465							msg_len += scnprintf(
   466							mpu->vio_msg + msg_len,
   467							MTK_SMPU_MAX_CMD_LEN - msg_len,
   468							"[%x]%x;", dump_reg[i].offset,
   469							dump_reg[i].value);
   470					}
   471					dev_err(&pdev->dev, "%s", mpu->vio_msg);
   472					clear_violation(mpu);
   473				}
   474			} else {
   475				/* check kp write violation aid reg */
   476				if ((MTK_SMPU_KP_AID(mpu->dump_reg[1].value) ==
   477				     sec_cpu_aid) ||
   478				    (MTK_SMPU_KP_AID(mpu->dump_reg[1].value) ==
   479				     ns_cpu_aid) ||
   480				    (MTK_SMPU_KP_AID(mpu->dump_reg[1].value) ==
   481				     hyp_cpu_aid)) {
   482					dev_err(&pdev->dev, "%s", mpu->vio_msg);
   483					clear_violation(mpu);
   484				}
   485			}
   486		}
   487	}
   488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
