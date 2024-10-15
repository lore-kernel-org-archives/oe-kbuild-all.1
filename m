Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11EA170A0B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 06:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973595; cv=none; b=Q/1dyuGblfRsncpJ9dcQMAGHl04HTTqfk9uYHElAlyyRqDNBeE9UG6C4n/UK79gAU4+Clg6tRLuowYFYLjkKRxnt2qy2x47FXrcU8wZ1dJ4QnjGvgWDZjrdHbS/2fpUU3AVY1xOzBreJjU+CVCKEk1jor/XC76lmG/jTiDGX+l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973595; c=relaxed/simple;
	bh=wIHbCcD6Ivwq4eqYi4NfyJ1EdC63NEl591HHhglylzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbOLV3C7TtwEFttSLYAmIe/zikFuUtKceyKCznlfONEN6xRztlXePRo7/g2r1mCns8rK8A/B/zxU5dm8hXkgtBneEd/FQBXjGkpYhlW7UVzNlQ+MJ5HyeqgAc7kqpEXftZwK67yh6P2r0JXlYALIBTipwzaE5SEjhQjoHT5st8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9xM177n; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9xM177n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728973594; x=1760509594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wIHbCcD6Ivwq4eqYi4NfyJ1EdC63NEl591HHhglylzM=;
  b=O9xM177njatHOKKe4b6bewC9IFRJLU+rUsRkRfw31uBNKIzp96Ie8C+N
   tlGGi9QuyCEeFBT3ynZTp9x0iQgNkyKAKLxfJ5pON9Nimux2tfNv+63tG
   j6lz3m7hPmDEEd1rSN9EJWpQNUTVyWw5jZewZlHxEJyeiJppVKqBLbIr/
   dLiaIp9LoKpTy83CUR1Yu89mQmrlMDZEyD3gVVmfMKxKrh2qXGz1K/86L
   O1ib/UHDXuqbud1a1bTvDs/opCq8uA6e4upRGPJ99CwJLZ716B9YIOXCm
   AuHPCQPTEdSHc4jbxIBf8gmRSiGMV+lT1+h8niFvk4xBfHrQbvkmmD9Z+
   A==;
X-CSE-ConnectionGUID: KtSWO52yR6+4k76zLxFpvg==
X-CSE-MsgGUID: FZ9QSqY5THi/NR/jA2Gl3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32143157"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="32143157"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 23:26:33 -0700
X-CSE-ConnectionGUID: cvCYzGJpRzCqI8zqyAs+Dw==
X-CSE-MsgGUID: UeL4FDOAQpeJdyllAfi7jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77869962"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Oct 2024 23:26:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0b0o-000Hh1-1F;
	Tue, 15 Oct 2024 06:26:30 +0000
Date: Tue, 15 Oct 2024 14:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/9] nvme-keyring: add nvme_tls_psk_refresh()
Message-ID: <202410151334.eGrdO99i-lkp@intel.com>
References: <20241011155430.43450-6-hare@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011155430.43450-6-hare@kernel.org>

Hi Hannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master brauner-vfs/vfs.all linus/master v6.12-rc3 next-20241014]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/crypto-fs-Separate-out-hkdf_extract-and-hkdf_expand/20241011-235704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241011155430.43450-6-hare%40kernel.org
patch subject: [PATCH 5/9] nvme-keyring: add nvme_tls_psk_refresh()
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241015/202410151334.eGrdO99i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151334.eGrdO99i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151334.eGrdO99i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/fabrics.c:15:
>> include/linux/nvme-keyring.h:21:20: warning: 'nvme_tls_psk_refresh' defined but not used [-Wunused-function]
      21 | static struct key *nvme_tls_psk_refresh(struct key *keyring,
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +/nvme_tls_psk_refresh +21 include/linux/nvme-keyring.h

    20	
  > 21	static struct key *nvme_tls_psk_refresh(struct key *keyring,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
