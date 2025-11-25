Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F951A3172
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764080152; cv=none; b=n2kyI3i1Fz5DdgGlj2TopOs+hlvl4aTmyLUcbZjxhghaM8ERT0wzc8J0FeRfELdz2CpMisWm1zD1RvgqsDe1AhSkjL+DtIeN5i0EuZPs+0tQjC4Y37SDg8GOS61+ouGHSk6foUrd2NTfT2+Lmh8sVWwwBrYPFNZ5tyDs7hUf7FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764080152; c=relaxed/simple;
	bh=Q7Zowz3L3UrtK63vNyrqiE/gRH8Nab47l5tHohecymk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rD0Xxp33OPITSInDj7cKg25H+KWuLlgTqzgg25vKio1oewjOOOUeUdzEqae3H4hZ3TyHPzUBrSNn1UGrj9bOaj09avwyITL6wVkyTN5oyArTHEeGZIMVPNfWEQGhxi3odh7mMEWlyRzrPCNZfTGVx3vMEyGpN6n5Grvt13a4TPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eW3nRFAS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eW3nRFAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764080151; x=1795616151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q7Zowz3L3UrtK63vNyrqiE/gRH8Nab47l5tHohecymk=;
  b=eW3nRFASPW4Wr5jJSCTQNuG1id9M+k+7EkJbxEDz2MjgXAUVYCNOFnOi
   u/MIUYWXmgMKgr1zPKQOkaaL3z9NU+h4zzyhb8MoWs/2710wGXvRud57b
   Z/3Y0CU0PxrU1hrCXft4BSf1RFyX7RVuL03wKb7+AtY/HSzZTXei/HYgs
   1nBcXBBxTjXFnwPR1OzNoKeWnnm5m/BofY3GfggoQNLWq+YmSxU7HPnta
   /A2YJ8NgkCvHc2GQf7OqdcJdqYJo69/OMRMSckOizxPBOIAeATnMucFGe
   HB08t/ruK2qfEZ859n0kAvGXxeL4XQIxrkVD/airRxl4hfEsr7uAZeRpt
   w==;
X-CSE-ConnectionGUID: UMoJFVcbQvC5ROUy+X8hdA==
X-CSE-MsgGUID: zYwLPNfXTuiWhwLjGi8PLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="91585903"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="91585903"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 06:15:50 -0800
X-CSE-ConnectionGUID: 2FF3nQ6aSOSojTT+J1Aesw==
X-CSE-MsgGUID: tcXLkljuTNCLyybM6ErLsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="197765352"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Nov 2025 06:15:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNtpb-000000001sx-06eX;
	Tue, 25 Nov 2025 14:15:47 +0000
Date: Tue, 25 Nov 2025 22:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Krist=F3fer_Fannar_Bj=F6rnsson?= <kristoferfannarb@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1208 4/17] error[E0609]: no field `owner` on type `&mut
 bindings::file_system_type`
Message-ID: <202511252239.P17Z8eIr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1208
head:   9bba107357a10d7bc2b6d669bfecb41e498bbb5d
commit: 4642fd5cb17c48a3939f1d779f2d645fcfffb36a [4/17] register+unregister nop FS
config: loongarch-randconfig-r061-20251125 (https://download.01.org/0day-ci/archive/20251125/202511252239.P17Z8eIr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511252239.P17Z8eIr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511252239.P17Z8eIr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `owner` on type `&mut bindings::file_system_type`
   --> rust/kernel/fs.rs:65:12
   |
   65 |         fs.owner = module.0;
   |            ^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `name` on type `&mut bindings::file_system_type`
   --> rust/kernel/fs.rs:66:12
   |
   66 |         fs.name = T::NAME.as_char_ptr();
   |            ^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
