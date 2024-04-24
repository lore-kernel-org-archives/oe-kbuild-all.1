Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F5171C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 01:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713923519; cv=none; b=CAcryJheMcEyzZN6MtaZ9eCV4aFvpWNKal/LDaHVouLU3yCQm6Lsi7mvMpU2zDfLLuLiwLuEKPHYpZR7JMHiBIpFRwdnCMNBLYO6c7UBb2Xm4HfV5TGWbiL8QKRAZdwASR2SpMH4MGSKwA8KXONgWtIOeNei4Um8Veoc/b71TLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713923519; c=relaxed/simple;
	bh=zeeuamTs/vv6J7BdgRRwghET6ADePOZ1mZwb5Xa5qGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VhkMufwCAL2ZL8NZ8SZsYjwGDUobLPjDJ0EhlSKGjoL5qE9A23zlx8EXjdoDKM+tpBnWBnQPAtYR3yLGxdq1VGp8s3m+2tQqNrz/hXGWVRSnl+vRsGxLlrGRR+KWV5MCLNSkwYZ53N9r1/pN8PCk7cJWEeu8zKTBb7cC985/nko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTYZvPVp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTYZvPVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713923517; x=1745459517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zeeuamTs/vv6J7BdgRRwghET6ADePOZ1mZwb5Xa5qGc=;
  b=kTYZvPVpFAJh33Y+TjlmLEE2XiMFCgjvXafJQnSY32piR4OdIWuwc7VH
   WSMnKZ+E5/LwwFC3ajmqT3N28O3l1jxh9pnxMKACdSH6OtNVSh40IknUs
   1pKyUgb8rYUc+XifBt9bI3BRiwkZS0m3j/NcaX/bfN7STGVzRxZU/Mx+k
   inbRAuJSz60JPgXlvsuu8y2DGH8HjrrVf4e0fa41yD3REFYRpdrMTq1fZ
   98KSy1daSsHcltwM55872oDK7m6JiwfGNPzvKQYiIboikJLeqQEph/23Q
   Ggh2GeVZse2XpLME5qSetglXU+W2EPCQ708WpakfbZUDn42L5fRsBukIO
   A==;
X-CSE-ConnectionGUID: EHUcfsc0QwyOVsBzNcbsVQ==
X-CSE-MsgGUID: 5dtQyBnlQdajsjXY2p7TBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20083880"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20083880"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 18:51:55 -0700
X-CSE-ConnectionGUID: SaVi/ynjQxyecye6ZvCOGw==
X-CSE-MsgGUID: 2P9swWWAS4qoZlU1Fjv8iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="29194368"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Apr 2024 18:51:52 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzRna-0000jQ-1A;
	Wed, 24 Apr 2024 01:51:50 +0000
Date: Wed, 24 Apr 2024 09:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mediatek:v6.9-next/soc 17/17]
 drivers/soc/mediatek/mtk-dvfsrc.c:324:5: error: redefinition of
 'mtk_dvfsrc_send_request'
Message-ID: <202404240912.B98BoPf9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.9-next/soc
head:   9c2aa575f0f0dfc9163e54727e527c9e0566502d
commit: 9c2aa575f0f0dfc9163e54727e527c9e0566502d [17/17] soc: mediatek: Add MediaTek DVFS Resource Collector (DVFSRC) driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240424/202404240912.B98BoPf9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240912.B98BoPf9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240912.B98BoPf9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-dvfsrc.c:324:5: error: redefinition of 'mtk_dvfsrc_send_request'
     324 | int mtk_dvfsrc_send_request(const struct device *dev, u32 cmd, u64 data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/soc/mediatek/mtk-dvfsrc.c:15:
   include/linux/soc/mediatek/dvfsrc.h:28:19: note: previous definition of 'mtk_dvfsrc_send_request' with type 'int(const struct device *, u32,  u64)' {aka 'int(const struct device *, unsigned int,  long long unsigned int)'}
      28 | static inline int mtk_dvfsrc_send_request(const struct device *dev, u32 cmd, u64 data)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/mediatek/mtk-dvfsrc.c:395:5: error: redefinition of 'mtk_dvfsrc_query_info'
     395 | int mtk_dvfsrc_query_info(const struct device *dev, u32 cmd, int *data)
         |     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/soc/mediatek/dvfsrc.h:31:19: note: previous definition of 'mtk_dvfsrc_query_info' with type 'int(const struct device *, u32,  int *)' {aka 'int(const struct device *, unsigned int,  int *)'}
      31 | static inline int mtk_dvfsrc_query_info(const struct device *dev, u32 cmd, int *data)
         |                   ^~~~~~~~~~~~~~~~~~~~~


vim +/mtk_dvfsrc_send_request +324 drivers/soc/mediatek/mtk-dvfsrc.c

   323	
 > 324	int mtk_dvfsrc_send_request(const struct device *dev, u32 cmd, u64 data)
   325	{
   326		struct mtk_dvfsrc *dvfsrc = dev_get_drvdata(dev);
   327		bool state;
   328		int ret;
   329	
   330		dev_dbg(dvfsrc->dev, "cmd: %d, data: %llu\n", cmd, data);
   331	
   332		switch (cmd) {
   333		case MTK_DVFSRC_CMD_BW:
   334			dvfsrc->dvd->set_dram_bw(dvfsrc, data);
   335			return 0;
   336		case MTK_DVFSRC_CMD_HRT_BW:
   337			if (dvfsrc->dvd->set_dram_hrt_bw)
   338				dvfsrc->dvd->set_dram_hrt_bw(dvfsrc, data);
   339			return 0;
   340		case MTK_DVFSRC_CMD_PEAK_BW:
   341			if (dvfsrc->dvd->set_dram_peak_bw)
   342				dvfsrc->dvd->set_dram_peak_bw(dvfsrc, data);
   343			return 0;
   344		case MTK_DVFSRC_CMD_OPP:
   345			if (!dvfsrc->dvd->set_opp_level)
   346				return 0;
   347	
   348			dvfsrc->dvd->set_opp_level(dvfsrc, data);
   349			break;
   350		case MTK_DVFSRC_CMD_VCORE_LEVEL:
   351			dvfsrc->dvd->set_vcore_level(dvfsrc, data);
   352			break;
   353		case MTK_DVFSRC_CMD_VSCP_LEVEL:
   354			if (!dvfsrc->dvd->set_vscp_level)
   355				return 0;
   356	
   357			dvfsrc->dvd->set_vscp_level(dvfsrc, data);
   358			break;
   359		default:
   360			dev_err(dvfsrc->dev, "unknown command: %d\n", cmd);
   361			return -EOPNOTSUPP;
   362		}
   363	
   364		/* DVFSRC needs at least 2T(~196ns) to handle a request */
   365		udelay(STARTUP_TIME_US);
   366	
   367		ret = readx_poll_timeout_atomic(dvfsrc_is_idle, dvfsrc, state, state,
   368						STARTUP_TIME_US, DVFSRC_POLL_TIMEOUT_US);
   369		if (ret < 0) {
   370			dev_warn(dvfsrc->dev,
   371				 "%d: idle timeout, data: %llu, last: %d -> %d\n", cmd, data,
   372				 dvfsrc->dvd->get_current_level(dvfsrc),
   373				 dvfsrc->dvd->get_target_level(dvfsrc));
   374			return ret;
   375		}
   376	
   377		if (cmd == MTK_DVFSRC_CMD_OPP)
   378			ret = dvfsrc->dvd->wait_for_opp_level(dvfsrc, data);
   379		else
   380			ret = dvfsrc->dvd->wait_for_vcore_level(dvfsrc, data);
   381	
   382		if (ret < 0) {
   383			dev_warn(dvfsrc->dev,
   384				 "%d: wait timeout, data: %llu, last: %d -> %d\n",
   385				 cmd, data,
   386				 dvfsrc->dvd->get_current_level(dvfsrc),
   387				 dvfsrc->dvd->get_target_level(dvfsrc));
   388			return ret;
   389		}
   390	
   391		return 0;
   392	}
   393	EXPORT_SYMBOL(mtk_dvfsrc_send_request);
   394	
 > 395	int mtk_dvfsrc_query_info(const struct device *dev, u32 cmd, int *data)
   396	{
   397		struct mtk_dvfsrc *dvfsrc = dev_get_drvdata(dev);
   398	
   399		switch (cmd) {
   400		case MTK_DVFSRC_CMD_VCORE_LEVEL:
   401			*data = dvfsrc->dvd->get_vcore_level(dvfsrc);
   402			break;
   403		case MTK_DVFSRC_CMD_VSCP_LEVEL:
   404			*data = dvfsrc->dvd->get_vscp_level(dvfsrc);
   405			break;
   406		default:
   407			return -EOPNOTSUPP;
   408		}
   409	
   410		return 0;
   411	}
   412	EXPORT_SYMBOL(mtk_dvfsrc_query_info);
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
