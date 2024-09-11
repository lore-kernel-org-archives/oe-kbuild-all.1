Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA133C00
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 00:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726013600; cv=none; b=L9g/FcqXHoU3phs2wg+TwzDnaXQNAzjC+Jp+Ic6PUNzMfNKI1mP5zHd5P4YhwHJcxk7fHo5Og3XCpcevZqPgFTvE4idQRS8vNWZzGS1T1ISgIbvn4V8klzXeeAjphzVByGTP9HjLSH0obwLrW5xNb6QjnUYbvzF9ayWGxmKbBVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726013600; c=relaxed/simple;
	bh=s6MXCnsBqaD6gM64dd+TVadErRI1EtPoMyetBWHA0N0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZvHrxcd1Szf9tZYcaoN4IDoBEzQX8XuBUsMBwhQcp2NUU1unkXTW9Ym4ihKviA+bmdd4zzuwdK4Kh6VohWNetmkKPgOmFC+W75IwHsxFo6yp+Nh1yBzjB/x3p3ANARsYc6kC7l4faNIGp79zDtNhLrVb20D/hME+6hEiHh6kw9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oASfrt6A; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oASfrt6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726013599; x=1757549599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s6MXCnsBqaD6gM64dd+TVadErRI1EtPoMyetBWHA0N0=;
  b=oASfrt6A567Ew7FFz/hEC3bSGAsalKKKns2ETQzkeHu6V4dH9XnHo3yW
   QaMJCEhTWaDwFwJr7Zr3BT5SeVLxvOdoVKxnPnbEV5lOryXpsjMeou+EJ
   U/AchoEq1czC6LccmeEOxi02trYzVQVOM7winkhj2/ejowMZEYn8GCpjA
   pEkvU/ZOtWGZtRV/KBXzadv8ZK4HKk84cgU5Dk67O3W6cxfGb0ZVrzr8O
   wzH70VUmHaMiD/f0IH+8Iy+/d8BO0cPiOGqqr1GgE/4Nn8/SsQSn9WgbR
   eJXbaONIdLTvrB4hRCVxv2A1SHNbs6Z4Lyeca1sy9JQxL3pg5WqZ02Qlh
   Q==;
X-CSE-ConnectionGUID: WcyCNxzyT6Cc85WK4CwxWw==
X-CSE-MsgGUID: fzTzdETTRXizN5IjAf99nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24930571"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24930571"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 17:13:18 -0700
X-CSE-ConnectionGUID: gHTqAskhTH6kHqNBa09E6w==
X-CSE-MsgGUID: HhyAXMEdTpSPbId3hRvVAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="71959682"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Sep 2024 17:13:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soAyw-0002rK-1v;
	Wed, 11 Sep 2024 00:13:14 +0000
Date: Wed, 11 Sep 2024 08:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10709/10862] WARNING: modpost:
 drivers/clk/clk-test: section mismatch in reference:
 clk_orphan_transparent_single_parent_mux_test_init+0x9c (section: .text) ->
 __dtbo_kunit_clk_parent_data_test_end (section: .init.rodata)
Message-ID: <202409110842.9K3bykGt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6708132e80a2ced620bde9b9c36e426183544a23
commit: de175eda2f6d9169bc2be11529ab69c18055b5de [10709/10862] Merge branch 'clk-next' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
config: xtensa-randconfig-m041-20221110 (https://download.01.org/0day-ci/archive/20240911/202409110842.9K3bykGt-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110842.9K3bykGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110842.9K3bykGt-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_orphan_transparent_single_parent_mux_test_init+0x9c (section: .text) -> __dtbo_kunit_clk_parent_data_test_end (section: .init.rodata)
>> WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_orphan_transparent_single_parent_mux_test_init+0xa0 (section: .text) -> __dtbo_kunit_clk_parent_data_test_begin (section: .init.rodata)
>> WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_register_clk_parent_data_of_test_gen_params+0x3c (section: .text) -> __dtbo_kunit_clk_parent_data_test_end (section: .init.rodata)
>> WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_register_clk_parent_data_of_test_gen_params+0x40 (section: .text) -> __dtbo_kunit_clk_parent_data_test_begin (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-fixed-rate-test: section mismatch in reference: clk_fixed_rate_of_test_probe+0x28 (section: .text) -> __dtbo_kunit_clk_fixed_rate_test_end (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-fixed-rate-test: section mismatch in reference: clk_fixed_rate_of_test_probe+0x2c (section: .text) -> __dtbo_kunit_clk_fixed_rate_test_begin (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: of_overlay_bus_match_compatible+0xc (section: .text) -> __dtbo_kunit_overlay_test_end (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: of_overlay_bus_match_compatible+0x10 (section: .text) -> __dtbo_kunit_overlay_test_begin (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
