Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D2C7E105
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 01:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786151894; cv=none; b=A3RdN2auzMLM3N8dqOgr4smeTswvSgf34CU+u8bqVUWNqhOTjawazdPJLojOAWKpL/M8ju/+4Di9rVnWCC3CQvN0NqtSlNO2SGS0qEqHHZK3o0vHjoH7We46tzqgSB6ZIiqNU8zOm1kp09P5g5R/Phto/ylpO7rshhN6Ij9lum4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786151894; c=relaxed/simple;
	bh=edtziRL++2K7kFyJW8Z+vbOWAVVvlrrXbWcSwy5jXiA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D6MwH8m9xH0h9DWXNZfyxab1nhXPAGnrEzDsHnds25CXrNd2ptMB+bjIWvYs3CvdyYnhYZm+vAzIp7Dqcg9s5vnOH79dxEvF0MNg+brRbtFwzIu3lpfCtuqe8fWoyiyTQPQwSnE7eA9oDRwtQS1XnmZZnM3jQrXUPGKMZ3lqJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIwBsAJz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIwBsAJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786151893; x=1817687893;
  h=date:from:to:cc:subject:message-id;
  bh=edtziRL++2K7kFyJW8Z+vbOWAVVvlrrXbWcSwy5jXiA=;
  b=oIwBsAJzTpiiIsu9DvqE0pTKmlbJxC8wrLZaQe2iWohNHFw1J1xI6lPk
   VRtDyrbdxHcVJUoehcNNRCJOMARCdq74nmWYnCojwUqPtWw8HBQxsPRxi
   ZkDMm7CTFZe61A81Ta4/1iWt2DcGdzBg8GRGnbY79QnHJyFeVYJkwkHOr
   SZc5gWsLbbI28cJuYUI5XlfXgD2iN+rZ301zkx2ImyBOgjqFvuSpNP9TJ
   nMOtjxAN0tc6GviqdyUl6fNNH5wqk3cu1En3QoEL6cDlpLoJGtmtrqrD0
   RtHUP5WgXNd4Rv9ZzvyhR3fVXzco24CPhupFAKjcUHgBaZFmQCwDncRfl
   g==;
X-CSE-ConnectionGUID: CTMEA+CZTiauunDEp7hMVQ==
X-CSE-MsgGUID: r3e9lrldT/Oi+U56L3bn7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="89292162"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="89292162"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 18:18:12 -0700
X-CSE-ConnectionGUID: VotfIugTRUWhKk8N2//bnQ==
X-CSE-MsgGUID: ovBDY48mStyoO8HJymNFYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="258237705"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2026 18:18:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsVhP-00000000JbU-2ywh;
	Sat, 08 Aug 2026 01:18:07 +0000
Date: Sat, 08 Aug 2026 09:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [thermal:thermal/linux-next 14/26]
 drivers/thermal/qcom/qcom-spmi-mbg-tm.c:184:21: error: implicit declaration
 of function 'FIELD_GET'
Message-ID: <202608080800.RfxKb9uR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/linux-next
head:   55c16e15ff9f91bc994a20124b83faf27f0e3690
commit: c3dce117333c0e2fbdb35228d4960442d2b1ef54 [14/26] thermal/drivers/qcom: Add support for Qualcomm MBG thermal monitoring
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260808/202608080800.RfxKb9uR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080800.RfxKb9uR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080800.RfxKb9uR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/thermal/qcom/qcom-spmi-mbg-tm.c: In function 'mbg_tm_isr':
>> drivers/thermal/qcom/qcom-spmi-mbg-tm.c:184:21: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     184 |                 if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR)
         |                     ^~~~~~~~~


vim +/FIELD_GET +184 drivers/thermal/qcom/qcom-spmi-mbg-tm.c

   174	
   175	static irqreturn_t mbg_tm_isr(int irq, void *data)
   176	{
   177		struct mbg_tm_chip *chip = data;
   178		int ret, val;
   179	
   180		scoped_guard(mutex, &chip->lock) {
   181			ret = regmap_read(chip->map, chip->base + MBG_TEMP_MON2_FAULT_STATUS, &val);
   182			if (ret < 0)
   183				return IRQ_HANDLED;
 > 184			if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR)
   185				chip->last_thres_crossed = true;
   186		}
   187	
   188		if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR) {
   189			dev_dbg(chip->dev, "Notifying Thermal, fault status=%d\n", val);
   190			thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);
   191		} else {
   192			dev_dbg(chip->dev, "Lvl1 upper threshold not violated, ignoring interrupt\n");
   193		}
   194	
   195		return IRQ_HANDLED;
   196	}
   197	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
