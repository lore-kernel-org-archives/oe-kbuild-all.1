Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45EF139579
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752497350; cv=none; b=QhOcHmhkJl0vir9S/jqs0S+dMG60Ju8xqclBeIwkG4qjW0rXueavTXClkXSbWISzcytWnkyIzo2hn0yWgncG7TeuD5AUXBADv8uLN+5Vu6veovcchx1rp/8tWQsvUgc101mvLZlUiGV9Q0UmyQzZp4nQwLRCwFR7xje9Z9PzHvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752497350; c=relaxed/simple;
	bh=/HZzDD5f47h/ocSENoGmLlMZfAwRA/dldq9jVl+PsFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jywbS5gYyHX5+FFSe0n4XNLNPjatfq7Beqrwtl3yJIw43D7rMdSkucZHfS8UOJr7gqIKlG/lV5dWkfJt5iiPPpUsbW/5E2q1smN0dUjshQVUqzQvY6rHmVibjFOStrIVAl84pE+AnPv8WkGQ5a5J8PCh2E3ve2YET4Q+vFgJsJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6AMQnWp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6AMQnWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752497348; x=1784033348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/HZzDD5f47h/ocSENoGmLlMZfAwRA/dldq9jVl+PsFQ=;
  b=P6AMQnWpb7cujNTv5oYGuxd/N6bRA7ds1Tmdh+ekTzFrNr2ta0sjz1Qs
   6c9bH3VIimZjaTJf9YXlkXSU/u3Ol1t13RsyFrjUFnOCJUy1XS/iigypT
   RkHZOSTSHxJ7mmwYzqTvRtZNE2t8Q7x02rI7ibvUli/CoFgxZMzqOS2nj
   aZQJDjZ8tQ+277z7FhBjXhUb1GTCotlboeAZy9Ml2mu/TzCTSFZDmLF+n
   6Bq56nMwFe3KIGWb0c9orUMq5THMdQKwVyDm9bVBPNKCr0veXPyYSMYva
   S/8VYGyVHnN+clzszm4m9y7dRqnGVzuGHop/eRSO51wUcIz0MifW4d8oz
   Q==;
X-CSE-ConnectionGUID: CHaHdSb4RoqOewzq7yZxMQ==
X-CSE-MsgGUID: Xr7FgYRRRGqp7Kp0F+LkDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54659136"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="54659136"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 05:49:06 -0700
X-CSE-ConnectionGUID: 8ACEErSqRKmWvOG8+hHNYQ==
X-CSE-MsgGUID: Fij+J8A1RuOaY6bqGx1lrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="160938073"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jul 2025 05:49:04 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubIcA-0008sP-0Y;
	Mon, 14 Jul 2025 12:49:02 +0000
Date: Mon, 14 Jul 2025 20:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: [linux-next:master 1295/9557] kismet: WARNING: unmet direct
 dependencies detected for SM_GCC_6350 when selected by SM_VIDEOCC_6350
Message-ID: <202507142044.IrnmDHo3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0be23810e32e6d0a17df7c0ebad895ba2c210fc4
commit: 720b1e8f20047e072b98a0931fc3e9a545fda18f [1295/9557] clk: qcom: Add video clock controller driver for SM6350
config: arm-kismet-CONFIG_SM_GCC_6350-CONFIG_SM_VIDEOCC_6350-0-0 (https://download.01.org/0day-ci/archive/20250714/202507142044.IrnmDHo3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250714/202507142044.IrnmDHo3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507142044.IrnmDHo3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SM_GCC_6350 when selected by SM_VIDEOCC_6350
   WARNING: unmet direct dependencies detected for SM_GCC_6350
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SM_VIDEOCC_6350 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
