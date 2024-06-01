Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C02B64B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717233374; cv=none; b=D84VnGsJY935rU2P/tOeUJtANZ8hV1h4ond61kTqxHtbSD3IcCt5MqRqDsRLoz58Zj8zEufuFhFfPfm4RQAojSENgTn0/3vs9eBEUIRAVj+ogTN0Es5klBSeT75ABNtKYGucvu6JOn68q5vYpQM/eEGb11qq/G3Dixrr1ia1kio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717233374; c=relaxed/simple;
	bh=T6/CPowi4thvbK601KZt4tAJbwgEaWyDdTOOsspbz0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S15IGF12DA85yUctadE+rSuVzu8sSLrKL81RDkD18/r/djGLEROcf+nDu5pqKtnZSw997VESu0sKjSE9xme8w2QBkAOAVK9oYMT9wiqiFWyCp/CUFoMZKFmybLJQRpK9U8ya3Lf1RskfzaxTzU+ZP3FrqZ2nU4nsctd5jAWSYJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/oHr3TL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/oHr3TL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717233371; x=1748769371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T6/CPowi4thvbK601KZt4tAJbwgEaWyDdTOOsspbz0o=;
  b=c/oHr3TLSp6bqo5ZsVC2aPNzxkxHzkhjnZ2H2uDyXV7UXwP0m5+2KHMB
   jQFB3ul08n/Lj955iodOYgCQ8hNtQeS3ZuQyF3UWwM8CxFo95KaM/4cIV
   /A9Kpf59DKxYz+7VaQ9LQomqalOd1/QIybC+XCekfAkAY14lBfnPWM1mA
   GEprjlPH6eNVjM4LCX5qkMrVwaJIIFKu6yzG/l2EyRKqz5Ukcdd48gTcx
   bffgZhQ14z3KyUj9nwtAIUTFSHeFM6BgP1tmchkm9wevgk/W2MqkoF6lf
   MO1AQMn538XgxblKCHAzoTd6mtcgnGWENZrhFVIFdhfHmsvBL/1wm8aCT
   g==;
X-CSE-ConnectionGUID: 3tbTuaoxTJGBImRfRa+D+w==
X-CSE-MsgGUID: knR8uisoSz2wRSUk5OpmKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13972352"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="13972352"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 02:16:11 -0700
X-CSE-ConnectionGUID: 6DckudI/SECIzNrhAbR7Rg==
X-CSE-MsgGUID: aDDBc9IuQ9emxbmkfXQcZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="36985450"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Jun 2024 02:16:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDKqM-000IcP-0p;
	Sat, 01 Jun 2024 09:16:06 +0000
Date: Sat, 1 Jun 2024 17:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 run_tracer_selftest+0x2c0 (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
Message-ID: <202406011735.mZrn6TzP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cc8ed4d0a8486c7472cd72ec3c19957e509dc68c
commit: 481461f5109919babbb393d6f68002936b8e2493 linux/export.h: make <linux/export.h> independent of CONFIG_MODULES
date:   10 months ago
config: xtensa-randconfig-r024-20220805 (https://download.01.org/0day-ci/archive/20240601/202406011735.mZrn6TzP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011735.mZrn6TzP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011735.mZrn6TzP-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: run_tracer_selftest+0x2c0 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
