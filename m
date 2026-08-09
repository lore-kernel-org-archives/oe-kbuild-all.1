Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343DF35C6B3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786262026; cv=none; b=FSaCv6v7aixbwY14miBrK+cqWvngpAIjRH58yzVxsq2tbhItKcy33Y1/+0GHki1uc6hK4cXNvVWdoRgVOn6hGeCEr/Sm5Jyrfz1uT4khq1yI+MnxoA1AHTx+eQCBJmuxUWCZMb4vyoELwe8Cv08yAg3vHHGgEDAVAS9ETMU0Dog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786262026; c=relaxed/simple;
	bh=1K+f3vu8CTOVx0lMPJuFO1wgOA6eH8p5AONDYrr+Wto=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ftAYX1KPp8CfhwgfJaVEpgELT+tDHtfkYitc8LJbyuA9hrDWmXy5M2FFp8rg9Pwi6VPla9US72qo1X2wsO1OQR4MYhVOb2qCkwI8BiKcytiYocLbwzJbC+JUAXkfbRp0r5sNDL/ym+OdYgRF/S5HRn26iBTPCuh6dny/fVDZ/f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4UXmxDC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4UXmxDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786262024; x=1817798024;
  h=date:from:to:cc:subject:message-id;
  bh=1K+f3vu8CTOVx0lMPJuFO1wgOA6eH8p5AONDYrr+Wto=;
  b=e4UXmxDC4lhx3cdtg7n3DvwLWRPCxPuISIZo7+WaXfQMMJ/LX0Ln+Je/
   nDOo/RbonsKe/nxnvNksnWk9l7nKYeIFaRGfjAYyJf8yXGy38MfMZh/Su
   IL+uNvd/p3DIcg2884vXoV1lDtL+VGUJhY9TOmkYm9+CNqBtqWspYopGI
   3VY7n+nYzgD5VfXOqax2hl/OzGeK7EAJ1qBEEDVaDKn4R5KwE491O39FS
   T0HquatKwwNx/3uz9JX3yEhqu30dZSEonRK14V6bdnyA9d+llcVoLqft5
   Rlpl/8sxmtudaSPFPViiy8QFNSo2a2PX9b9IvD/8sO5TM/dJXwkI7UTvy
   g==;
X-CSE-ConnectionGUID: Jn7/JuBoSHmCfSRQVyMDQA==
X-CSE-MsgGUID: YSmN/eo3TtiZ5+aRXDCihQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="104339017"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="104339017"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 00:53:41 -0700
X-CSE-ConnectionGUID: AzswdC0nRx6o5+LppCPHCQ==
X-CSE-MsgGUID: ekCfliL/RGaP5eXi94/Mmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="260152988"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Aug 2026 00:53:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsyLg-00000000Lcd-2Itl;
	Sun, 09 Aug 2026 07:53:36 +0000
Date: Sun, 09 Aug 2026 15:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:bpf-waitq-kthread-reclaim-v1 8/9]
 tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/config.json:
 warning: ignored by one of the .gitignore files
Message-ID: <202608091550.qd5JI2f4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux bpf-waitq-kthread-reclaim-v1
head:   02201107f4d68e8f9f6b61079f487b1ebf636128
commit: 216509453b83c3f28e0f3216c1a01607ce8d696f [8/9] selftests/bpf: Record adaptive memcg reclaim results
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260809/202608091550.qd5JI2f4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608091550.qd5JI2f4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608091550.qd5JI2f4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/config.json: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/environment.txt: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-bpf-final-batch-cpu.stat: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-bpf-final-batch-memory.events: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-bpf-final-batch-memory.stat: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-bpf-final-parent-cpu.stat: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-bpf-final-parent-memory.events: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-bpf-final-parent-memory.stat: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-bpf-final-service-cpu.stat: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-bpf-final-service-memory.events: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-bpf-final-service-memory.stat: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-kernel-final-batch-cpu.stat: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-kernel-final-batch-memory.events: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-kernel-final-batch-memory.stat: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-kernel-final-parent-cpu.stat: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-kernel-final-parent-memory.events: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-kernel-final-parent-memory.stat: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-kernel-final-service-cpu.stat: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-kernel-final-service-memory.events: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-kernel-final-service-memory.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-memory-low-final-batch-cpu.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-memory-low-final-batch-memory.events: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-memory-low-final-batch-memory.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-memory-low-final-parent-cpu.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-memory-low-final-parent-memory.events: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-memory-low-final-parent-memory.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-memory-low-final-service-cpu.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-memory-low-final-service-memory.events: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-memory-low-final-service-memory.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-userspace-final-batch-cpu.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-userspace-final-batch-memory.events: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-userspace-final-batch-memory.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-userspace-final-parent-cpu.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-userspace-final-parent-memory.events: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-userspace-final-parent-memory.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-userspace-final-service-cpu.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-userspace-final-service-memory.events: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/raw/rep0-userspace-final-service-memory.stat: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/samples.csv: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/status: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/summary.json: warning: ignored by one of the .gitignore files
   tools/testing/selftests/bpf/memcg-reclaim-20260808-104045-396/summary.txt: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
