Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BA020EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Mar 2023 10:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679738999; x=1711274999;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1mV1il1WSh6TRlkOeBqi/pQLVGKJ0GlEpi9b6QXdkPI=;
  b=fWyIvp/ejUEhbEY63ym/N7By9KGB09Rj6ZrTHvTh7RV+154ObWA81Yjl
   E2Ixtxs3M4QN06n3+YMuiEM1QoE1aFqYIR9TvSGFlC7pXC4NjToFxU5pR
   06jqHNVC8f00pDPNYXMVETqPdKNzMm47q5wKy5lGxk32kGUlIt2ICZXqH
   kvTQzf5Kzzkg4t3KktyN7z4ECEB0G1pjtnkhxwfiam4DIaKn2qG4IZ/7z
   i+WM4m2koO+c59D/yhcOkDgGBvXmYPoEoHKw95EHsmp+LO+oB2FECDB3c
   rDcNqgveQQ/pyNtnrCu2BGglq9Wn6T3bOElWXG2fcD7c1PcRpFPPw3YaC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="339980128"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="339980128"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 03:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="1012551827"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="1012551827"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Mar 2023 03:09:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pg0qT-000GBn-0q;
	Sat, 25 Mar 2023 10:09:57 +0000
Date: Sat, 25 Mar 2023 18:09:15 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>,
 Chao Gao <chao.gao@intel.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+188 bytes kernel size regression] [i386-tinyconfig]
 [b7b0bf83da] KVM: TDX: Add perfmon support for TD
Message-ID: <641ec84b.mhMt42zHVZgfXd3+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +188 bytes kernel size regression due to commit:

commit: b7b0bf83da5f4431fca1a7596554007af89aa255 (KVM: TDX: Add perfmon support for TD)
https://github.com/intel/tdx.git kvm-upstream-workaround


Details as below (size data is obtained by `nm --size-sort vmlinux`):

c31926bb: KVM: TDX: allow get_interrupt_shadow operation for debuggable TD
b7b0bf83: KVM: TDX: Add perfmon support for TD

+------------------------+----------+----------+-------+
|         symbol         | c31926bb | b7b0bf83 | delta |
+------------------------+----------+----------+-------+
| bzImage                | 501600   | 501824   | 224   |
| nm.T.intel_pmu_restore | 0        | 97       | 97    |
| nm.T.intel_pmu_save    | 0        | 83       | 83    |
| nm.D.cpu_hw_events     | 3844     | 3852     | 8     |
+------------------------+----------+----------+-------+



Thanks

