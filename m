Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E28208DA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723143907; cv=none; b=X3w/O/NqUkCbp27lH9R1STe9+TiZkbQQ6IuK85scjqyR87yCbDpt8OvWbqjUtkY4ok5WyVhFGhBqUiNLxtGhfzcg8UpiaV3Dk/fTLjZAZsu9lldt7VHOc4lYJdyS8bmiSBLEauBZuYiAkrp8Phd568DwXOIGJhpywVNq3++LN84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723143907; c=relaxed/simple;
	bh=35e7y76SrkTGoHsdLVc8LGs22TP1bLTYg0bKmlCbNqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bzWCemNstQOp56DcqIcMfdPC2RhuNAK1gX4J637Y7IyM2PizNIcX7hpIQP0fONCjtiUTST4cJhkp0wmWEAJ2A5EASfSMvPWtLOp8OMUioJYT5mMwDlS5SSLjdCHx6aC9lkUsAgX3Cuc/BzStiLpvMt9gywrsj1O6lxIu74cw+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RU7mnvxb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RU7mnvxb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723143905; x=1754679905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=35e7y76SrkTGoHsdLVc8LGs22TP1bLTYg0bKmlCbNqY=;
  b=RU7mnvxberSHfu9q2qNONbLm8prWjz1LlFXzCDsU41DE6H0d4ibPOrKs
   p4irX9phN3SQ/TYBm/uOfDr80+DntAkDfO6vohYEgMwcSTHGtDLdO0at/
   9IuWEPLsrfBMsEvjIHSQRAm8PrtQL4SGeltbeoj2Tkej2VspLfdvfVVoB
   zbAdEZ+dT+Z7GpJCtCGbIwspRi+ebwWiUgoj8L8oBvl4bLfkJN/uIhDHh
   94K3Hl+u6WOp52YnOWG/VHi37OC5uIdPP45M244beyQfgdQz3ea/xOnRS
   Ak7EUUCvNibhIRHTj/FHwyUpn7bdNNXGhs0dpY8/Gz1zYHs46jsCmD/n8
   g==;
X-CSE-ConnectionGUID: pnYFkEA1SXuVZcPqWiYB4Q==
X-CSE-MsgGUID: x5m14tqHS/ONa9zamQNEow==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21454898"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="21454898"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 12:05:05 -0700
X-CSE-ConnectionGUID: 0YYwDpkjTr6Q3+pG7yRZgw==
X-CSE-MsgGUID: c5fg8odETEy63d72FwiL2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="62277975"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2024 12:05:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc8RZ-0006Qy-2A;
	Thu, 08 Aug 2024 19:05:01 +0000
Date: Fri, 9 Aug 2024 03:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 53/53]
 sound/soc/codecs/wsa884x.c:1719 wsa884x_spkr_event() warn: inconsistent
 indenting
Message-ID: <202408090203.YWNzrhSV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/debug/soundwire-wsa884x-interrupts
head:   77aa965762ad9c8711d005628b5c471007e0df82
commit: 77aa965762ad9c8711d005628b5c471007e0df82 [53/53] DEBUG: interrupts on wsa884x
config: i386-randconfig-141-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090203.YWNzrhSV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090203.YWNzrhSV-lkp@intel.com/

smatch warnings:
sound/soc/codecs/wsa884x.c:1719 wsa884x_spkr_event() warn: inconsistent indenting

vim +1719 sound/soc/codecs/wsa884x.c

  1705	
  1706	static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
  1707				      struct snd_kcontrol *kcontrol, int event)
  1708	{
  1709		struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
  1710		struct wsa884x_priv *wsa884x = snd_soc_component_get_drvdata(component);
  1711	
  1712		switch (event) {
  1713		case SND_SOC_DAPM_POST_PMU:
  1714			wsa884x_spkr_post_pmu(component, wsa884x);
  1715	
  1716			snd_soc_component_write_field(component, WSA884X_PDM_WD_CTL,
  1717						      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
  1718						      0x1);
> 1719		{
  1720			u32 sts0 = 0, sts1 = 0;
  1721	
  1722			regmap_read(wsa884x->regmap, WSA884X_INTR_STATUS0, &sts0);
  1723			regmap_read(wsa884x->regmap, WSA884X_INTR_STATUS1, &sts1);
  1724			dev_err(wsa884x->dev, "AAA %s:%d sts0=0x%x sts1=0x%x\n",
  1725				__func__, __LINE__, sts0, sts1);
  1726	#if 1
  1727			regmap_write(wsa884x->regmap, WSA884X_INTR_CLEAR0, sts0);
  1728			regmap_write(wsa884x->regmap, WSA884X_INTR_CLEAR1, sts1);
  1729	#endif
  1730		}
  1731	
  1732			break;
  1733		case SND_SOC_DAPM_PRE_PMD:
  1734			snd_soc_component_write_field(component, WSA884X_PDM_WD_CTL,
  1735						      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
  1736						      0x0);
  1737			break;
  1738		}
  1739	
  1740		return 0;
  1741	}
  1742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
