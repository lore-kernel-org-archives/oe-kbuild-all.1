Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A23C1D54D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 05:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717393586; cv=none; b=JkPlTxGqDXuZUpaNIisdpVrq7f5qmQFBcOCKWeG7BBR+a2GtGkO7WBm3qFWQhPfcf0cXVIUyQDCTmj7hEAhBd2RlDJl0qWmYxIu+5udhW91h6Wdm9H153JiEgneTr62MkCghAO50QqLNRfT26NHRYHq1nHJUUZdBrE0W0FlcRCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717393586; c=relaxed/simple;
	bh=LjLWyp4EOBDJ7QhWHGJWqaDq3UDTvKSMFTwiGkg/Vcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U4KwxiArsC9tCt2JfPzBpY5QgJKM7xDJ+Zzw5SRvv4Jyc2HuhS5LLq0QMX+Ap9nJadx3mCKdrMvWQmEP0HA2rXcxmpPY/EGWHk6masmpJ3E0FkeY7WLvnEmx0qA5NlTL8wMfGdmcy0n0gSlq6Dd/E97xFwvKbk6KCSTvGE/KCJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8SY9gdr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8SY9gdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717393584; x=1748929584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LjLWyp4EOBDJ7QhWHGJWqaDq3UDTvKSMFTwiGkg/Vcg=;
  b=F8SY9gdrYgBPoFeonLXhM3SgGvvzLTeUWz6+pT9WdMztqWI0bpVoLtkq
   cy11cX5K5+IppHZtDPr2Zpdt7ozsTit0Km1ISHGDxPHCBoNqwHjDcght4
   4ddH5d6CmTro7MyrbePQAH0PkhDJadwMKJ3AndVNTAzLDL5DhOOPe8Kx4
   V07OX2kRGoT8vnJ/qo/TlIehyxyNvf6ljn6N7T7YzZX+hh8rCIJkyl6sV
   JgjB3UAK1dyzz81yg8W7G3JtQ8Gy/9xy6aLpCP6gyaK1IGFwYj5kH86wL
   lsZzLrE23VOsw974dVbREovPIZ9UejUXeQZO4O3j9G0r8HYjdV0FF1B3R
   w==;
X-CSE-ConnectionGUID: gAf0SXbLQ8qbDc8Fcd0v8g==
X-CSE-MsgGUID: 8oRH8zvpRBKlqlZRdyxNNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13712314"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="13712314"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 22:46:24 -0700
X-CSE-ConnectionGUID: LSJF9tx2RrSS2bZPvvTkDw==
X-CSE-MsgGUID: hRDvJVolSuirRuWss67oxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="74257339"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Jun 2024 22:46:23 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE0VX-000L5G-1D;
	Mon, 03 Jun 2024 05:45:46 +0000
Date: Mon, 3 Jun 2024 13:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:master 3415/3461] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist: Documentation/hwmon/chros_ec_hwmon.rst
Message-ID: <202406031357.4T4JTALQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   861a3cb5a2a8480d361fa6708da24747d6fa72fe
commit: e8665a172378986159ce8aaf45712c43472f5866 [3415/3461] hwmon: add ChromeOS EC driver
reproduce: (https://download.01.org/0day-ci/archive/20240603/202406031357.4T4JTALQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406031357.4T4JTALQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/hwmon/chros_ec_hwmon.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
