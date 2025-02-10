Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7634199E80
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177631; cv=none; b=LiiLO98gxl+o9sV9ysRCNAzKTBr9QBbhhpy1rm+PTMk+HTX0ArTcHgdUFREApaIeq1SoFDV7sailkEDzM1Q6m10y5Nsfr+9AuQRDxpKY4sOzBFvbzNMp2E0EBJkNW/0HkgZ+XRklIZRX9TyZj+n8xsQwKi1+bPSZQUofw9KikFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177631; c=relaxed/simple;
	bh=8NkU1yuaode7BSCA7WKgtx/IkRAU/Kd8jXOWcHkiIpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HjGixzSto1Tecp+pifvm1hwkgozZJALcGbVtNjbEUb72sNK+Pbd/O9JBS1dGaOS29iMDE1YfN5absTiJfjpqB8+DpMuvIZviCzh5ul6LdRFLzoHStiL5eiv4BdWfj+sU+5y2yA5nWBMWPhPMLjiLyb/1CgZvNEpiIc3DmKHoxKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTwn+9pa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTwn+9pa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739177630; x=1770713630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8NkU1yuaode7BSCA7WKgtx/IkRAU/Kd8jXOWcHkiIpI=;
  b=MTwn+9paSwKKkHMIEsoPIRmoc0Zb/IRd/Xs8J7D3hjdeWqNp5DLoaUmi
   Gxlo0ViuWeZhHX6MbC8Fs9pePtAPOoNr1aThPdPlfiabJF5CeYG154yZV
   0TitrzWJQlYWbep0Yf8NWCxSqHOuDHEoHwMjrc1c0yJ/hzM32E3EVHo2D
   9383v4dKMNpPE+WLHPBmGMZLt/ngKr9JbbIPAzuSmps+UwDFKq3lI096t
   9oC6CSuyYLjGQwM3sI66g8pXpBL+PUIvFai7tXNxqRM47A09hsKTdFdQL
   gcEwO1KKymH4SQHgR9OLJyV+tfseg+YRP1DXoYt1tkHzRc8ED61rXdOYs
   Q==;
X-CSE-ConnectionGUID: 0/CGNZewSDyiOJ02xQ6plg==
X-CSE-MsgGUID: cs2b8sTBQEa/13blfIE8dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="49982796"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="49982796"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 00:53:49 -0800
X-CSE-ConnectionGUID: DRD1ZYr6SsWzKyhFsPN8fw==
X-CSE-MsgGUID: hw8dDcCNQ3CHQZPhn/KScA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113013481"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2025 00:53:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thPY1-0012Tj-2P;
	Mon, 10 Feb 2025 08:53:45 +0000
Date: Mon, 10 Feb 2025 16:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 26/27] sparc64-linux-ld:
 fs/afs/cm_security.c:54:undefined reference to
 `rxgk_kernel_respond_to_challenge'
Message-ID: <202502101649.WEyEO0ED-lkp@intel.com>
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
commit: 9a9fcafaffebfbb7b0810aaac96ae9a28e849ff6 [26/27] rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)
config: sparc-randconfig-002-20250210 (https://download.01.org/0day-ci/archive/20250210/202502101649.WEyEO0ED-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101649.WEyEO0ED-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101649.WEyEO0ED-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: fs/afs/cm_security.o: in function `afs_respond_to_challenge':
   fs/afs/cm_security.c:50:(.text+0x98): undefined reference to `rxkad_kernel_respond_to_challenge'
>> sparc64-linux-ld: fs/afs/cm_security.c:54:(.text+0xfc): undefined reference to `rxgk_kernel_respond_to_challenge'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
