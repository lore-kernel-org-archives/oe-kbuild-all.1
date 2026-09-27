Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B676827057D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 13:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517375; cv=none; b=DSU8wsDNxb8n/dVkeBXuo8An5oKzjYjNvszOqQvPJJyzrY6uu1uzbiAyeRPFB3tX0gbtbERaDJc6XX7P7JpqTFh8aqVipL3FxIK0q+XEK4YKz3vw7MhKNL47ICNcNemO5Xk9GM+YUGpo4OAandueodcCvUt0o0IaFuFIRN71cIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517375; c=relaxed/simple;
	bh=mHZn0S54Ty12Ue024Ygxu9hLtNSmw1mMrZvGUGcotj0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aMaocNJGpntc2g9wva+JHkmO6MKT8vNyIoCcMHKc6VPVDA8kzn1qICDGjH+chzTXx2RODHfssnP0IboDezAY8dDHmhPGfO/WtiSPC7u98WfY06Q1u32CUAceecGTpxxgpQmHUwkqF7wMp5E1UmLrE8UqCDU2lcOF+y7D7bxxY4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRUpHiQa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRUpHiQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790517374; x=1822053374;
  h=date:from:to:cc:subject:message-id;
  bh=mHZn0S54Ty12Ue024Ygxu9hLtNSmw1mMrZvGUGcotj0=;
  b=XRUpHiQayz5r4oQr+koY8CnlyG0xWg4KrmkUih/39YfjDdBmss9f3jtG
   mbyqU96Qibv1PKnOC9j9NUNeGuX7kf+BN4P3ssJq8faAoWbS5WcFkGJ5I
   o1jn0NpdKkMd/GpQVA4xZu7yy0H87sH18SYBCpm3WP0ngcWcNoiJlwdGh
   Vhiuh5PPSJZdu3caDvtpSjrV7dbuZQf3mMcR881tJMy7TSYmjLGXLD06S
   XIO6gVFtvqAmWxQHu7Q7IP1QfMewkaZvIRMbzLjfzjSSN5w1K/07oxKNv
   iGwpdakfcwfau21jlF4ccRZ+kxoKPTX5IZ8MiyTdAUJjkcoJPWtkhcVNs
   g==;
X-CSE-ConnectionGUID: Xl0WRDNzQvenJXmruwoPTw==
X-CSE-MsgGUID: p4FVnBs8ROCpSUjeE4vmig==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78795468"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="78795468"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 06:56:13 -0700
X-CSE-ConnectionGUID: fvf2Q1q0RaKKtdxapsLiGw==
X-CSE-MsgGUID: nl8UQEGeTViQCS4IxYPCpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="273921340"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2026 06:56:12 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xApMP-000000000b7-2AQ6;
	Sun, 27 Sep 2026 13:56:09 +0000
Date: Sun, 27 Sep 2026 15:56:00 +0200
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [mhiramat:topic/wprobe-v2 14/17] htmldocs:
 Documentation/trace/wprobetrace.rst:98: WARNING: Block quote ends without a
 blank line; unexpected unindent. [docutils]
Message-ID: <202609271543.pv566S9C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/wprobe-v2
head:   8fd3d67f8ca00e91f910acb4ee753d2290077c33
commit: 3cf00e4048276f677baca769649aea6fb5ae0f30 [14/17] tracing/wprobe: Add set_wprobe and clear_wprobe event triggers
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609271543.pv566S9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271543.pv566S9C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Relational referents
   ~~~~~~~~~~~~~~~~~~~~~ [docutils]
   Documentation/trace/wprobetrace.rst:97: ERROR: Unexpected indentation. [docutils]
>> Documentation/trace/wprobetrace.rst:98: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/userspace-api/landlock:572: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +98 Documentation/trace/wprobetrace.rst

    94	
    95	Notes:
    96	- set_wprobe only works on the wprobe which is NOT set a valid address yet,
    97	  and it must be enabled after the trigger is set.
  > 98	- clear_wprobe only works on the wprobe which is set a valid address, and it
    99	  will be soft-disabled after the trigger is cleared.
   100	- Therefore, if a trigger sets/clears a wprobe, other/same trigger events
   101	  will not work (on the same event) while the wprobe is set.
   102	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
