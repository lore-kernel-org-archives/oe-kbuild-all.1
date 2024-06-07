Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7912D600
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 23:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717801434; cv=none; b=iwwmgkrylU8AX12jmKG/TAr0ieICcKXimKGFtge2xmEWNuhhet2cbTc07Nfi5ipe0UVV1pPRjEVPNns92b4m7npAwc21ZO+szq0m9I4wGdZO5xD074eYDzHLFU3WymNCTlQtC4kU4diVSVf2gFiv7t8X5TcXEslosfpArLZmp9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717801434; c=relaxed/simple;
	bh=OV0B/zjxKykMC5g2oRt2yFrWHHKWlMLRED15dmDAOIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XJVSs8rhcq2CJqmM10k8enlTkEUf8RsS6qtdpkdXVYPc6IFiUHyNmMvzpSlRAjUai9yC4w1pZhu2AmRThqCHCeVMqPVak6xD3imGpaUchNqtGTAWho4fTNeuYM04iaCK1aSJuTfvugUgQZe7sGrvYkaRQl8SZrf23qxa6KZvIo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibVFRp6w; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibVFRp6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717801432; x=1749337432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OV0B/zjxKykMC5g2oRt2yFrWHHKWlMLRED15dmDAOIg=;
  b=ibVFRp6wxM/vzzLg45hjwn4Ba3+KPrSde7oD7dqYbavAu27kl4z4lhya
   2UbSPXndTTd7zwwPTy6iAtUAqQzcfzSuNhufFVFC1bQTlCqGJrprKewPZ
   0QwgeKzrCIj7DYN8R772RXQmQq/ypakMyih+8sujKVYwgublEWaKEujxP
   IPaLBXkdtmAiL8tKSC77N3AeWVKs5hPkISozT0V3m57GZJVR4Wi7aB4d5
   wp0DyrSrUHj6/eTyT4s2SodBRHYWpesfTr+/gCYP5Afj9mxHul3ExC/3T
   /jnE1bFjdT1Gf8WvIzNHCTI4ioain/LGE0uH27kaHAag0xg3WIsayauCA
   w==;
X-CSE-ConnectionGUID: S3RvRze3TeKiIhMTOSipLQ==
X-CSE-MsgGUID: fmIeOyaxS7qUo1hQZ6xX+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="39944567"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="39944567"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 16:03:50 -0700
X-CSE-ConnectionGUID: A0/h+k7kRzWiOBo60t8oMw==
X-CSE-MsgGUID: zP4WvUH3Qe2lGh2Nj0AMQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38596685"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jun 2024 16:03:49 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFicd-0000f5-1C;
	Fri, 07 Jun 2024 23:03:47 +0000
Date: Sat, 8 Jun 2024 07:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 20/25] error: matching on `Some` with
 `ok()` is redundant
Message-ID: <202406080731.yQQVUsT3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   aca334cdc747f90b4a1051a3e570cbfa56f10a35
commit: ec8ea3f68df07330203b58920f07fb166aecf232 [20/25] rust: Extend cpufreq bindings for driver registration
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240608/202406080731.yQQVUsT3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080731.yQQVUsT3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080731.yQQVUsT3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: matching on `Some` with `ok()` is redundant
   --> rust/kernel/cpufreq.rs:972:9
   |
   972 |         if let Some(mut policy) = Policy::from_cpu(cpu).ok() {
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#match_result_ok
   = note: `-D clippy::match-result-ok` implied by `-D clippy::style`
   = help: to override `-D clippy::style` add `#[allow(clippy::match_result_ok)]`
   help: consider matching on `Ok(mut policy)` and removing the call to `ok` instead
   |
   972 |         if let Ok(mut policy) = Policy::from_cpu(cpu) {
   |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> error: matching on `Some` with `ok()` is redundant
   --> rust/kernel/cpufreq.rs:1012:9
   |
   1012 |         if let Some(mut policy) = Policy::from_cpu(cpu).ok() {
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#match_result_ok
   help: consider matching on `Ok(mut policy)` and removing the call to `ok` instead
   |
   1012 |         if let Ok(mut policy) = Policy::from_cpu(cpu) {
   |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
