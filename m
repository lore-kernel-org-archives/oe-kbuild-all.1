Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04AF13D897
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 18:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722536027; cv=none; b=ZPHsuPXI0RS+V8+NqAnMQf0pyMXbMujZdcgF0XaRdmJeUKpkfAHt2wszHUZobXklk+q1r/SzJuqtRsgI6GL16EUKj24s4wX5bmyMQ/BR2+pDnSTfslE8CuzgwVWdJupZ6bGk9G1Cjs4SCDnRLYc9cdJKCFOyMe/6+O1tHkrHB7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722536027; c=relaxed/simple;
	bh=pIM3AetSM71PAZLJf5oIRrO9c2lW5GQewRDCkylegl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pB04sEG/GaqPsfsqVVILyjb/d9t5T5WUMNVzCz1yiCFgdwWohZgE4z/2TPxEACaavB72LgCOD0Y247iBKDNcBgPurcLSjsIkIaHNArHGLL+J7ychJmhRyjjCXMLq23PAxb/uzRuHbm7NT+ngoUrPad2v5OrvjKVaEAyIaGJOyzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLD9Ck7t; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLD9Ck7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722536025; x=1754072025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pIM3AetSM71PAZLJf5oIRrO9c2lW5GQewRDCkylegl0=;
  b=KLD9Ck7tgYjx5uw3lBg6iGmsTcByaufxnbKf2f2bvfXfrBb0dDmVg7bv
   HMq5g9hCrcGNwaRV+ytvnRqUVPM0UTA2ZLQK33TqmPBKu+E2fRvyfc5ED
   q+wG4wcvALDJBHBbgjClrYTOSA2hjmN9PB0NL/WgD2S4sbmgpUmDf08Xq
   5rN9+MDop/XFQ7vE9aDUNPHt330vdS6XsdVJX7RN3cvuLl0Zg7vCORex5
   GdQaVxJgsrjbRYTk5CmfMvqz+iMT2UJtLTDAGKgATxgthbocavZ7OBlz4
   aCCiijgDRhc7AAJHCiq26PlWkeH08Q/AlIEvvLvEdcza65oy626T0b+f7
   w==;
X-CSE-ConnectionGUID: IUTOe7n5RQmONPlsJ/klaA==
X-CSE-MsgGUID: P62KORkDRe2QwaYwfRnGiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="23435742"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="23435742"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 11:13:44 -0700
X-CSE-ConnectionGUID: 4Z+xM+68Rqqfc+hW8te9pA==
X-CSE-MsgGUID: v8ZpxD6cTiq7plDJdjVY/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="54775254"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Aug 2024 11:13:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZaJ2-000vtI-1T;
	Thu, 01 Aug 2024 18:13:40 +0000
Date: Fri, 2 Aug 2024 02:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [qcom:clk-for-6.12 8/15] kismet: WARNING: unmet direct dependencies
 detected for SM_GCC_8150 when selected by SM_CAMCC_8150
Message-ID: <202408020234.jg9wrvhd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-6.12
head:   802b83205519e4253b873bef5c095b147cd69dad
commit: ea73b7aceff69c4426c5d13bbdd785c5dc1e2960 [8/15] clk: qcom: Add camera clock controller driver for SM8150
config: arm-kismet-CONFIG_SM_GCC_8150-CONFIG_SM_CAMCC_8150-0-0 (https://download.01.org/0day-ci/archive/20240802/202408020234.jg9wrvhd-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240802/202408020234.jg9wrvhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408020234.jg9wrvhd-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SM_GCC_8150 when selected by SM_CAMCC_8150
   WARNING: unmet direct dependencies detected for SM_GCC_8150
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SM_CAMCC_8150 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
