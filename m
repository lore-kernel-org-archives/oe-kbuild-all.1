Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9DC3B19CA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435180; cv=none; b=TWY2774etwYUpco+hrkBpD2poBwgeb4d20u+6eaURuARlSvx/K8INyDNAjhDY9DGzNTsYZqXnKj6+gFXn+VASmuhiZorXegyOwuSIjX2Adm3ATZBcAPon23I2of8uJYsDn/0TjGSEQbtWG8rU8p4rOZwvWNshzBBIJmvBOIgM4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435180; c=relaxed/simple;
	bh=++WXPHX8nwC18HVzWqpZs1GWJBiydGpwMs1toGtFYvs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PNJvOzA6bhkOeylxAClRq/re3g2sD+dUtoX5clp+x3TOoMh/ub2rm4MEsrQaJfvbXo49P24y4Ig1nZZ8EDS/jdTlMi1QUsoe6jupyADTLIjIHCnJfl2gaWC+DoMfDHGZTIHMRMlCadBPTfpf+StdmqMzwHt41i4M0DXtiEQMpBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLBR7WMP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLBR7WMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776435176; x=1807971176;
  h=date:from:to:cc:subject:message-id;
  bh=++WXPHX8nwC18HVzWqpZs1GWJBiydGpwMs1toGtFYvs=;
  b=TLBR7WMPPNMrNAzYuWW7tLw4kmKQpqR4d9AhbJDtdre0qZhkYRuog4F5
   3RkcO2ImTAjHMSEUOcFFZXh+vJmPG0n6JuZNaLZXHCm8C9+gPf32Qk6v8
   DbNAcnJ/Ay48Rd+bcY5nN1TsxNvb8PiPKHinBy0qd9iLDkA1s4doMOTl/
   567yp7LO4C85s50IfdFV8L1y8u8D9DgQte27o3w44XBlST2byBkb30010
   UYQ8Y3H8HeHG2mt8HKzzI04ykuAyZ0rWbEE+AkdwOBAe/XIENWBk5QQem
   NFrPz5L2dzVreDZoX1bt7ve78OBtCrkhar3am8SU1GDn3eGSsCUwyWnK1
   A==;
X-CSE-ConnectionGUID: jpBhC0GOQYi/M601lZ/4lw==
X-CSE-MsgGUID: A0yQHbgRRx600ej4BkS1Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77569720"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77569720"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 07:12:55 -0700
X-CSE-ConnectionGUID: RoqJzoZ1QE6fwiM7NxCfng==
X-CSE-MsgGUID: AWzuSDMrRAS04M0t5Muurg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="254261250"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Apr 2026 07:12:54 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDjwB-000000000Rc-4B5Z;
	Fri, 17 Apr 2026 14:12:52 +0000
Date: Fri, 17 Apr 2026 22:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Qu Wenruo <wqu@suse.com>
Subject: [btrfs:ci-kvm-misc-next 143/161] fs/btrfs/ioctl.c:4179:13:
 warning: unused variable 'ret'
Message-ID: <202604172247.pnrVp1Wo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/btrfs/linux.git ci-kvm-misc-next
head:   c456fe863b632c5564eb9cff08c40bb76a106200
commit: ef0c33ef0f4020b31bca106645340968f1a497bb [143/161] btrfs: convert ioctl handlers to AUTO_KFREE
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260417/202604172247.pnrVp1Wo-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604172247.pnrVp1Wo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604172247.pnrVp1Wo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/ioctl.c: In function '_btrfs_ioctl_send':
>> fs/btrfs/ioctl.c:4179:13: warning: unused variable 'ret' [-Wunused-variable]
    4179 |         int ret;
         |             ^~~


vim +/ret +4179 fs/btrfs/ioctl.c

2eaa055fab4e312 Jeff Mahoney   2013-11-15  4175  
4e043cd196c85bf David Sterba   2025-03-03  4176  static int _btrfs_ioctl_send(struct btrfs_root *root, void __user *argp, bool compat)
2351f431f727223 Josef Bacik    2017-09-27  4177  {
ef0c33ef0f4020b David Sterba   2026-04-14  4178  	struct btrfs_ioctl_send_args AUTO_KFREE(arg);
2351f431f727223 Josef Bacik    2017-09-27 @4179  	int ret;
2351f431f727223 Josef Bacik    2017-09-27  4180  
2351f431f727223 Josef Bacik    2017-09-27  4181  	if (compat) {
2351f431f727223 Josef Bacik    2017-09-27  4182  #if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)
9147b9ded499d98 Josef Bacik    2023-09-26  4183  		struct btrfs_ioctl_send_args_32 args32 = { 0 };
2351f431f727223 Josef Bacik    2017-09-27  4184  
2351f431f727223 Josef Bacik    2017-09-27  4185  		ret = copy_from_user(&args32, argp, sizeof(args32));
2351f431f727223 Josef Bacik    2017-09-27  4186  		if (ret)
2351f431f727223 Josef Bacik    2017-09-27  4187  			return -EFAULT;
bf4afc53b77aeaa Linus Torvalds 2026-02-21  4188  		arg = kzalloc_obj(*arg);
2351f431f727223 Josef Bacik    2017-09-27  4189  		if (!arg)
2351f431f727223 Josef Bacik    2017-09-27  4190  			return -ENOMEM;
2351f431f727223 Josef Bacik    2017-09-27  4191  		arg->send_fd = args32.send_fd;
2351f431f727223 Josef Bacik    2017-09-27  4192  		arg->clone_sources_count = args32.clone_sources_count;
2351f431f727223 Josef Bacik    2017-09-27  4193  		arg->clone_sources = compat_ptr(args32.clone_sources);
2351f431f727223 Josef Bacik    2017-09-27  4194  		arg->parent_root = args32.parent_root;
2351f431f727223 Josef Bacik    2017-09-27  4195  		arg->flags = args32.flags;
5de0434bc064606 David Sterba   2023-11-14  4196  		arg->version = args32.version;
2351f431f727223 Josef Bacik    2017-09-27  4197  		memcpy(arg->reserved, args32.reserved,
2351f431f727223 Josef Bacik    2017-09-27  4198  		       sizeof(args32.reserved));
2351f431f727223 Josef Bacik    2017-09-27  4199  #else
2351f431f727223 Josef Bacik    2017-09-27  4200  		return -ENOTTY;
2351f431f727223 Josef Bacik    2017-09-27  4201  #endif
2351f431f727223 Josef Bacik    2017-09-27  4202  	} else {
2351f431f727223 Josef Bacik    2017-09-27  4203  		arg = memdup_user(argp, sizeof(*arg));
2351f431f727223 Josef Bacik    2017-09-27  4204  		if (IS_ERR(arg))
2351f431f727223 Josef Bacik    2017-09-27  4205  			return PTR_ERR(arg);
2351f431f727223 Josef Bacik    2017-09-27  4206  	}
ef0c33ef0f4020b David Sterba   2026-04-14  4207  	return btrfs_ioctl_send(root, arg);
2351f431f727223 Josef Bacik    2017-09-27  4208  }
2351f431f727223 Josef Bacik    2017-09-27  4209  

:::::: The code at line 4179 was first introduced by commit
:::::: 2351f431f727223b4d82851ee8fc045bf51edd34 btrfs: fix send ioctl on 32bit with 64bit kernel

:::::: TO: Josef Bacik <josef@toxicpanda.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
