Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240031A71B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 23:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIdedM0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697845297; x=1729381297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bZv0zeXlw9qU/1/D/owbaVl+bqE7C9phH0VHsflWcKo=;
  b=KIdedM0VpxL/d4IYgUm/SpjtV67wrluPA+TMiMaua4k8HvRAy7mILLxH
   9jB8QYW0Se9MRACj0ogbKGBso4kNYb1m45ceOB+Bv7hyY+AcHVpIhLUdS
   vq3Ld9IRpu+Dlk50zJi4IZ80456OLG6ixvTp+JdMHkABkIQnCo/etYdiq
   kulRB/YorKm9xi5KwEk1tGdNqgGMyN2VcwRKorhR3vGSdGwbY8EVko89S
   UV7feiUJls5ubZpzlz5uWiPyZ0Tsx0dA3bR6m1U/Jgpet7EQ3FxD5T1jd
   WeqaO0SX0YCXWqOFz1sbsNhY0+h8Da99YcqqyGWx71iNxhVwSQuarERxr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="389445376"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="389445376"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 16:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="707372664"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="707372664"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Oct 2023 16:41:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtz7V-00047H-15;
	Fri, 20 Oct 2023 23:41:33 +0000
Date: Sat, 21 Oct 2023 07:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 12/43] checkpatch: WARNING:
 Missing a blank line after declarations
Message-ID: <202310210712.7ACtXqOE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc6-esp32
head:   7b60fbaf629519456a4de1b76bf9edfb331ffb50
commit: 6a667045a0bbf3d9fecc6546ba0457fa0717ad7c [12/43] irqchip: irq-xtensa-pic: add support for domain hierarchy
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210712.7ACtXqOE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210712.7ACtXqOE-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#127: FILE: drivers/irqchip/irq-xtensa-pic.c:135:
+		struct irq_data *d = irq_domain_get_irq_data(domain, virq + i);
+		irq_domain_reset_irq_data(d);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
