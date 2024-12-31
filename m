Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B40A189915
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735636885; cv=none; b=dkvW+ui7YG/qAVYaCZ5nlSlbYvGKkMhHxF7cYU/nf3LIDFFleGl6cc++rhjiWL/0Q5Rtmt5OW52AsuhRmVOO44KYGtSLFaCK39RwS8Azt1exDuCS0ubILDy0YYTSmDZ44h01g7IPaYIba3rEietPHcuh83dVh76L8f9xnJHg+KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735636885; c=relaxed/simple;
	bh=DdNYikgOdrR0dCTRU0tLNSWeS9wXhJcoFcKZwg67tDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQg3ty90oYeVRla5JhXJaBalxtRk9hx/z4EgIufANg8ghFLQ5OEX86q+4yZ0pmbp9olUHYD7NyyL5M1UwPhyFglh7iHcnRKXIgomqmQONh/hUui4Z5taZJevPyWKFxk4vAu27HG/PTlc74XysSwixVOP27tQ5O8weYKM0QR/x6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jB4FhmcN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jB4FhmcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735636884; x=1767172884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DdNYikgOdrR0dCTRU0tLNSWeS9wXhJcoFcKZwg67tDE=;
  b=jB4FhmcNNXiPjunTud2+/qrXdAXncnVQqb3L3YcBguhiEt9yVg2ljnpC
   WmqUo60aJVAxw3cpt9s4A5WTYUmQGA4eqQNJ4QlKQ6ix03hFZdvALoin6
   wd/3spVD90Q91PJectyRHr4gCccqLFbYx+gZI/1kqZ1+TIYctsBt72iNf
   2gLrqEPcvJOBg0kDcaNW3ffE2ajPC/+ZpZkvjr90HgfXL4ufbiZehnzUk
   QzTnVfWsbdn9JMNWuiOMf9ySysaFYgNbap/Y0heyG9icRDmvW+tOQRf2h
   D+q4AEULfHlSjrrdIMxc8uq88WDxxxLpjP7FOlsm9GNxshA2WkL3otcos
   A==;
X-CSE-ConnectionGUID: /XiVnAQ1TG2EuWNzS0ZW0w==
X-CSE-MsgGUID: VE01WpJ6StqGRDm5EUnzjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="61289114"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="61289114"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 01:21:23 -0800
X-CSE-ConnectionGUID: kXsEWLjQT12wGNtmTj5CPg==
X-CSE-MsgGUID: TcKOYz9nSkajsG4Y7FFHwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101493835"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Dec 2024 01:21:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSYRD-00070x-2F;
	Tue, 31 Dec 2024 09:21:19 +0000
Date: Tue, 31 Dec 2024 17:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1359/1359] kernel/user.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202412311749.tP5DWGDt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4dc4cec05b40921a3db85d24f97f1142272e4abf
commit: ce0a568d327968367f294ea2425fe2c6f4f33ed2 [1359/1359] userns: use irqsave variant of refcount_dec_and_lock()
config: x86_64-buildonly-randconfig-002-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311749.tP5DWGDt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311749.tP5DWGDt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311749.tP5DWGDt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/user.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
