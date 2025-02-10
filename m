Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F67857C93
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739174601; cv=none; b=F2huGlYv2Wy3JLfAFhg0TSYAppP7dq7dgGeyzHa8O2UJjhXRuXp1y51FDA0pCPPrOnTahx9OE9svAkm9ka3WV2VCoEAoPOEzNceAriWzCJsG0jgxLfE6F3Z69C9U/MiW6ojlN+mO/Z0lBnsoBH77esCEU0c8JxF2lsZaH0mmxI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739174601; c=relaxed/simple;
	bh=fOpY4pyOu2ZgIpuzSqmcP/obuqOtr4vUlBd47KuKVCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=grIAhBjcMR7kPz1gRfb7ehAe37Dghef5RXDFTEfGjOiPDuxdJWs/p7Shh4V2ibUJwEdJuc4uapppUaJjgvYbM0icGXZo2So/+6IViD8dBYbc74YBjvDEXfJY1nbqt1aG/ZIrANQdgiLJt6nPeTZf29aG2KGSVa2xZCsQbRvv/GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEgABPVO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEgABPVO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739174600; x=1770710600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fOpY4pyOu2ZgIpuzSqmcP/obuqOtr4vUlBd47KuKVCw=;
  b=lEgABPVOK0s0x+e62nQ14ZpPXckKQ8LfuukwdDHVA4ngeE6gsqy8UUh2
   LVSk/qmtM54N1yH+Vd5NxALO2WJ+gF6Oyv2AUh/0e0dsuq3magV9dKfAi
   Hd6YcbTqdTsCEGBwVC7uLXZS7dfSEquyV6EMGYAFTg5ZWEheT9fbPNW63
   k31FzGQQ++WemW/RBKfq+oyfgF6m8/HUufkJh8VLuqlBeGqOoKQ/UaOO3
   95ZufyNYa1iABoSctqZZSI6J0IKkDEFjiQ6gHm5getHvMt3Az07lPKhY2
   8ObifDmRfZYNhnUhJKXUDZa17StKsyavzr8MUv1EtqTdWdgXksDmBTkqs
   A==;
X-CSE-ConnectionGUID: NkAHENkNQ5G3bag/H7sx0A==
X-CSE-MsgGUID: 2qpqaKMwRw+hkl/oBlBUTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="27345121"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="27345121"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 00:03:19 -0800
X-CSE-ConnectionGUID: Zo/iGfk7SYG3uS3Rhv7Kzw==
X-CSE-MsgGUID: eSccyyZqSTy6WkzijFzI8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="111948855"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2025 00:02:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thOkZ-0012QB-2J;
	Mon, 10 Feb 2025 08:02:39 +0000
Date: Mon, 10 Feb 2025 16:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 22/27] ERROR: modpost:
 "rxrpc_kernel_dequeue_oob" [fs/afs/kafs.ko] undefined!
Message-ID: <202502101546.Vfw1MJ9W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   eb2ef20c8f90912443f70e3cc46ddd4d4dea591f
commit: 6aad41326de842cc9aa4cd58fe8fb4018a5c3241 [22/27] rxrpc: Allow CHALLENGEs to the passed to the app for a RESPONSE
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250210/202502101546.Vfw1MJ9W-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101546.Vfw1MJ9W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101546.Vfw1MJ9W-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
>> ERROR: modpost: "rxrpc_kernel_dequeue_oob" [fs/afs/kafs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
