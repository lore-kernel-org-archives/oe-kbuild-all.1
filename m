Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF4182DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 19:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721244085; cv=none; b=NY2rGUCsKJLN2hRGo1YhVr0YJ5CQVhGph2GVbQ/E83p2DPyL/UBNQnkyZbcObbJQLcLkFCc53QXgXmBKYM4SvMAMC8CooZPQN+jQPP8rSgyF+mlo35guD614dbA28HzvPW8s7do54W5ys+QDa0NagCjPxOmyB+aH4gf2X2onrgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721244085; c=relaxed/simple;
	bh=ksK8D2Qg4B/FZ8oeOqSwhfZnaadoZw4ffjT/0QB/HQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DTEXF8DodEZ+vfVbR3o8cwvtZPjO5MHd+74X7+qP5PWjfOxMjAAN7phjLU8bNUnpavjrGR+GWsRhlDlboa3BJWIb3kCWkpw5UiRg7lsz5qDqIS7l0eG0yXbACqMNPw96T6kpxkll15r/E65IEXJ1u7EWeAOD0aowb0JfLqJ3CrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mN8v4/Tv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mN8v4/Tv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721244084; x=1752780084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ksK8D2Qg4B/FZ8oeOqSwhfZnaadoZw4ffjT/0QB/HQ0=;
  b=mN8v4/Tv5DTBYC3/MVYz6WgGK3biZsRApYAVe4ZShpxcDcJrQxslwSE5
   wSuurNfFZzdaZq10kiifxis9ouf4MgaU68QebU1i7FPGqdfUaef4djRsk
   MuFWKp2yyB4XTsJrKL9xlIh6Pk2/Hr2cqf5JnZ+TjAs2UBmn0eORp4OeH
   JMHy3AgcymfpzB1iTVaEoA2mQcdVmsEEW1jrh+iaJjMexYqaJW8DstBFV
   +CNRF9kJLhvy+5NrtqVWSIVU+1wco9a9RnOwECMPgJyBBvkJtOWqZhdaX
   sMkZapTZcMiQa2rF7hkgLTo7dIYJX+XU+WWpiW+nmQsEjs7IVkiiDpoMQ
   Q==;
X-CSE-ConnectionGUID: ss/n2/0rTzicVNgvLqnO1Q==
X-CSE-MsgGUID: 9jqvYa9fRDqPZXS1jF83dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="41295998"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="41295998"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 12:21:23 -0700
X-CSE-ConnectionGUID: EKZ7SUikSFGqhtlReD40Ww==
X-CSE-MsgGUID: paOkPYBWSSagzdfMRj5koA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="50233232"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2024 12:21:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUADH-000gd4-27;
	Wed, 17 Jul 2024 19:21:19 +0000
Date: Thu, 18 Jul 2024 03:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:secure-concat.v5 16/16]
 include/linux/nvme-keyring.h:13:1: error: unknown type name 'key_serial_t'
Message-ID: <202407180301.t95KeJor-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v5
head:   4d58e409712027c1084413a8c31e93af4d148650
commit: 4d58e409712027c1084413a8c31e93af4d148650 [16/16] nvmet-tcp: support secure channel concatenation
config: x86_64-buildonly-randconfig-001-20240718 (https://download.01.org/0day-ci/archive/20240718/202407180301.t95KeJor-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180301.t95KeJor-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407180301.t95KeJor-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/target/auth.c:18:
>> include/linux/nvme-keyring.h:13:1: error: unknown type name 'key_serial_t'
      13 | key_serial_t nvme_tls_psk_default(struct key *keyring,
         | ^~~~~~~~~~~~
   include/linux/nvme-keyring.h:16:1: error: unknown type name 'key_serial_t'
      16 | key_serial_t nvme_keyring_id(void);
         | ^~~~~~~~~~~~
   include/linux/nvme-keyring.h:17:33: error: unknown type name 'key_serial_t'
      17 | struct key *nvme_tls_key_lookup(key_serial_t key_id);
         |                                 ^~~~~~~~~~~~


vim +/key_serial_t +13 include/linux/nvme-keyring.h

9d77eb52778499 Hannes Reinecke 2023-08-24  10  
c85200aaab7f12 Hannes Reinecke 2023-04-19  11  struct key *nvme_tls_psk_refresh(struct key *keyring, char *hostnqn, char *subnqn,
c85200aaab7f12 Hannes Reinecke 2023-04-19  12  				 u8 hmac_id, bool generated, u8 *data, size_t data_len, char *digest);
501cc6f4aca8dc Hannes Reinecke 2023-08-24 @13  key_serial_t nvme_tls_psk_default(struct key *keyring,
501cc6f4aca8dc Hannes Reinecke 2023-08-24  14  		const char *hostnqn, const char *subnqn);
501cc6f4aca8dc Hannes Reinecke 2023-08-24  15  

:::::: The code at line 13 was first introduced by commit
:::::: 501cc6f4aca8dc0958c4d9716f0233ba7cff4830 nvme-keyring: implement nvme_tls_psk_default()

:::::: TO: Hannes Reinecke <hare@suse.de>
:::::: CC: Keith Busch <kbusch@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
