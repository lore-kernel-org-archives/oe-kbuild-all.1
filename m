Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE35C186292
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 21:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721252031; cv=none; b=RYdBjfXwV9I0kJ6tsxgfVRzlG1579Zx3BJ14kiOVvApi6D6uMfE6oV/sPF+HqQeDYpkP+QRv+bGeTmCJTlHOMJ7JWXoIQWJPzjVJYAtsKJISxeONgDDpEYpl2LOWb+JY0EvJoqQvFita1JvdB7F3vvV2z5xYgRFw6Z2IBbqikKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721252031; c=relaxed/simple;
	bh=WbcUxGx1w8f71ermCezkCeSr2vstCpr+aSC2Ev1aFvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=axzeC35Erg/9ZyxfhVxufhdAmYLTL1FZS6UJW8aKUGaFDoB5lDmu8CF0sLNGx+7PlJ5zf4BjlDREILZRsDXMDf35ltPlJdGwW1uqZzQ19DTgm14JCzMP5Bu3l7Hyev0f5hsRZhto8/GzXqeTP4iO0l4Z+fmXAFByCIOfPdpjktk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lx0bRs/n; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lx0bRs/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721252026; x=1752788026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WbcUxGx1w8f71ermCezkCeSr2vstCpr+aSC2Ev1aFvc=;
  b=Lx0bRs/naPJB4KlDPP0iALK5CQ6o8XTyUHZRyI1au4k8P5Mn/RpMx8aD
   7HgV96PXLmoi+/Y36L8ZChJfi9oVE0a29EGaIYbO5u24TfhY1tK/Q8KHH
   ooXu+kl7HEmq+n1QBlCR68j9zcIGgUal4jJX0DL8Y7zJsG3j+GZ8z1vYK
   DbrITcQK7qaqOLynLt6l/X2t97ISzTJlHZWUgOKrizBAFua7OUtZCnFrP
   BAWhYYHe9U9muVvdXo5pb/cZ6yuvTk5OUA4b4kai30edgLc37yxca6JpB
   UC8CEeOVanlse5EFY+hi+dUvv6u8VvpkdwR4q9h2leJqhdtdaIPfHNlqQ
   Q==;
X-CSE-ConnectionGUID: tGDkh7tXTHCFb3G+ED5GQw==
X-CSE-MsgGUID: 8gct0/p/ReiyXgeqZBwDLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="30171908"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="30171908"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 14:32:52 -0700
X-CSE-ConnectionGUID: STRhS06yTbqhq5Fl8vTUog==
X-CSE-MsgGUID: 7W6UrUmeQYahgEudbVKE5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="50404469"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jul 2024 14:32:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUCGW-000ghK-1c;
	Wed, 17 Jul 2024 21:32:48 +0000
Date: Thu, 18 Jul 2024 05:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:secure-concat.v5 11/16]
 include/linux/nvme-keyring.h:23:16: error: returning 'int' from a function
 with return type 'struct key *' makes pointer from integer without a cast
Message-ID: <202407180519.jAmTqblp-lkp@intel.com>
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
commit: c85200aaab7f1248dd0142da172df0047ddbb812 [11/16] nvme-keyring: add nvme_tls_psk_refresh()
config: arm-randconfig-004-20240718 (https://download.01.org/0day-ci/archive/20240718/202407180519.jAmTqblp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180519.jAmTqblp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407180519.jAmTqblp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/target/configfs.c:18:
   include/linux/nvme-keyring.h: In function 'nvme_tls_psk_refresh':
>> include/linux/nvme-keyring.h:23:16: error: returning 'int' from a function with return type 'struct key *' makes pointer from integer without a cast [-Wint-conversion]
      23 |         return -ENOTSUPP;
         |                ^
   include/linux/nvme-keyring.h: At top level:
   include/linux/nvme-keyring.h:20:20: warning: 'nvme_tls_psk_refresh' defined but not used [-Wunused-function]
      20 | static struct key *nvme_tls_psk_refresh(struct key *keyring, char *hostnqn, char *subnqn,
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +23 include/linux/nvme-keyring.h

    19	
    20	static struct key *nvme_tls_psk_refresh(struct key *keyring, char *hostnqn, char *subnqn,
    21			u8 hmac_id, bool generated, u8 *data, size_t data_len, char *digest)
    22	{
  > 23		return -ENOTSUPP;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
