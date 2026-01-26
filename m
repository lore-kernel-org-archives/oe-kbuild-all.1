Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14333333441
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428305; cv=none; b=qPHIcaUuk4kjIeR1PNHIhwYJ4KJSVDE7PiIpsDPJpaq6Zefp0DSeASWevPEAQyk8/53qwGziJxAN/n54hTpabT/YWleDNTZ2TzzfZToZE13wiLdeWoTC54wHt7ladOQcM5qele60ppxKcFXCabRtvwZsv6CHA2ewoqw2KKnMAh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428305; c=relaxed/simple;
	bh=KaSEFgDH2AdoB4mThzU+UcwCX/MRCKMssC/u8KJYSiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQcxKmFfQHdknXD+NfPlmRdTFmL7TFKRicRoOTcABaAoEYIw5VILGLwDcidMkjUBwSr3SoHqQHVYHdxiWv+4tMmjvo6KncdjNXc+R4hIF9LyerAn2X5nux3s4jQogRYK7ztS1jYdcS6PDHAc99Ok4hfS76cwa34DsIC+nuLWww0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYR+WMmL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYR+WMmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769428303; x=1800964303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KaSEFgDH2AdoB4mThzU+UcwCX/MRCKMssC/u8KJYSiU=;
  b=UYR+WMmLiI7c3UyEkgL+xlyHW2xg1lu/76zw961Xr6o4T7hcP97hQqRe
   GYB2L8+HNADonDxGAD1VRTRqUkJCK9wzB2LDXga/U3lFas0eCHCfsHYQ1
   U55GqQo75UIE97/Wkx4Y2NmRsvnJfnObBhLCZAHqqlvs8qwo3M+dMwtY7
   AsxVptX4CuoRmiXaiRQrYmnVbtkJockll95tZxHXpucqLkxMwaT69Ura6
   R0i1BQv2t7pAvX1x4k9zArvHAEtzuFovRqTA36U+UPj4ZzbSf1fywR1a2
   SlcO45aKDB9C0jLyt9mkishMi/ofZFi3LQNXRmieLeQvnB4cUysbMDaqb
   Q==;
X-CSE-ConnectionGUID: czyvOCnhRs6Oih7LoXuPMQ==
X-CSE-MsgGUID: JqBpux7kSl6vljcY+HMyZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70503359"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70503359"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 03:51:43 -0800
X-CSE-ConnectionGUID: WIcps+SYQkqlkpHEZ5jrTQ==
X-CSE-MsgGUID: Mx6P96SaT9WJ20l2NeBEhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212135308"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jan 2026 03:51:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkL85-00000000XFa-2P9T;
	Mon, 26 Jan 2026 11:51:37 +0000
Date: Mon, 26 Jan 2026 19:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	peterz@infradead.org, david.kaplan@amd.com,
	chang.seok.bae@intel.com
Subject: Re: [PATCH 1/7] stop_machine: Introduce stop_machine_nmi()
Message-ID: <202601261901.Yj2kmvgI-lkp@intel.com>
References: <20260125014224.249901-2-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125014224.249901-2-chang.seok.bae@intel.com>

Hi Chang,

kernel test robot noticed the following build errors:

[auto build test ERROR on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Chang-S-Bae/stop_machine-Introduce-stop_machine_nmi/20260125-101013
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260125014224.249901-2-chang.seok.bae%40intel.com
patch subject: [PATCH 1/7] stop_machine: Introduce stop_machine_nmi()
config: x86_64-randconfig-r133-20260126 (https://download.01.org/0day-ci/archive/20260126/202601261901.Yj2kmvgI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261901.Yj2kmvgI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601261901.Yj2kmvgI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: stop_machine_nmi_handler+0x23: call to {dynamic}() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
