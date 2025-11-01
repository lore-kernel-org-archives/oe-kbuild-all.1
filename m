Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA922BCFB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 03:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761966156; cv=none; b=PcbiHwaE67fmKGhlPpvVtIrUetk06qN0JKhjLz3fZbAIDVsPl5KieVNr+miQtyhmYKrx8x4zcDsOHcKGCJSw1VwrNfxiqiMqxiZb72lGcJ4pAUEVDzRflHpCrYAQ7UVIbo+apUKxUIOQfk3V+C4fsWB/D4M2AMsElZx2HHSJgHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761966156; c=relaxed/simple;
	bh=YvpBePHhnivA3VM2RXPZsAQSlEsD3YlDMkzWZ2mLjk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A0cAKwflr2U5O+Lkte0PwbP1TYSH/Y/2SW3F1w+qMmcDDy20SxqiZrWKRcaJ0WYSB6nl0nl5gSkG4OvY2PSqhD/nVAcTy4qEh7/Cv9tK6Mvq56+7L2I1N+xb7PmBH1ZqV+YyDgftIPGMKXGiDxVQiXNcL+B2toDMkMJlKAyrz0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvNn1AtW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvNn1AtW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761966154; x=1793502154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YvpBePHhnivA3VM2RXPZsAQSlEsD3YlDMkzWZ2mLjk4=;
  b=FvNn1AtW8lZbd+qY17F+UDEtrssXL9RD6Aql0Vd9l3pM5kT8u2sHz7hI
   7rs8ySO6joryyFEvC/Hm8PansOrX+/C+wvqZewu5J1/f1GKy3iOyi8qs0
   oyoT3zzAEQsGq9gbv3kI9TO75ebWqD5ubRZX3jmjcllQPrPtEeogHAtJp
   YWCkNGGDjI7bZyOUEdlkBjUFFD1xoh7E+DJlnRaYqLQ3dLsjQiuQWcbPw
   /zJsWdGXffYF6zcsDyze4hEbDvNH7mdds+4WgfpCBcRC85EXBmPOKAEoA
   9wiyEOvW4p6bATwHAVnkyDesKq6LhsM/jiftgLyKZDCmqT7PqDExvkyIc
   g==;
X-CSE-ConnectionGUID: h6dad1omTJaMCHnjjW3gUQ==
X-CSE-MsgGUID: 2iEZ48neSfCuYgSu1uQMsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64049670"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="64049670"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 20:02:33 -0700
X-CSE-ConnectionGUID: L3YjvipIR8eLxj87a8Nh/Q==
X-CSE-MsgGUID: ba5oc6ShRcW+Rj6jiX6oNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="191530393"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 31 Oct 2025 20:02:32 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vF1sr-000000001FE-1lmt;
	Sat, 01 Nov 2025 03:02:29 +0000
Date: Sat, 1 Nov 2025 04:01:30 +0100
From: kernel test robot <lkp@intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 3826/5383]
 arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtb:
 /soc@0/cci@ac16000/i2c-bus@0/sensor@10: failed to match any schema with
 compatible: ['samsung,s5k3m5']
Message-ID: <202511010410.vvF5vCC2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
commit: 08ce5274038ae7ad2b9e90bbcbeabe7548ec425b [3826/5383] arm64: dts: qcom: sm8550-hdk: Add SM8550-HDK Rear Camera Card overlay
config: arm64-randconfig-2052-20251031 (https://download.01.org/0day-ci/archive/20251101/202511010410.vvF5vCC2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010410.vvF5vCC2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010410.vvF5vCC2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtb: /soc@0/cci@ac16000/i2c-bus@0/sensor@10: failed to match any schema with compatible: ['samsung,s5k3m5']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
