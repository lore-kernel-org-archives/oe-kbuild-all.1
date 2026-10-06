Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A80A5C613
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 07:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791271084; cv=none; b=VGxiCTDIju8iSaVTXfGnoFFuLXd85Cbd1Sq+5iX7C6LJxjKNwGOvqnGU+ASdOsxQkY4RX141MrUzYeayFZ1QEufR8u6S+ILrzI7ToyYdruqGajOr0l++1IdcbP1dQ9PDo3YFPHJywQXss6hZVtOY6/7rctkD56N3XPes4RTfJAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791271084; c=relaxed/simple;
	bh=Hqjg1FxlbmYLy8C51jdHwkP3ft2/SbwUfPZbcZQ4oY0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mq477otrPqSZ+M2sA8ZU8vo0uyBG7pGVoYt3MeGe8QeYF2ksGw3QaA8W9FTl6VY47Y+0FYheIss5qLA29g+aRn/ddYjzZhXlS43u/lIHu+9DU43RkEBEw8YG6AfArbMIz/xd1sYKNV6CezcioTOGtR/LV8OG5nB4rheQVJOYYIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKi8pJ0A; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKi8pJ0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791271082; x=1822807082;
  h=date:from:to:cc:subject:message-id;
  bh=Hqjg1FxlbmYLy8C51jdHwkP3ft2/SbwUfPZbcZQ4oY0=;
  b=TKi8pJ0AjKEhNin6BWBNWs+oe3im+CFLUgwrzuGw1LefQ0gssu47yKEH
   7a27EhVsZn3Du5Zyjq8h6THqY2/zX7JHz0e06Y1l9o2FvOyrNjMKlcriN
   KPGBXavrNystaxr74Fi565WTy6cjUJWDdtGNQPz+SH8MXYFTCvmnHXcS3
   kqO8eSdZ/aFQjPO6z7fOLqOmpb7xQkgmnnd54lOHbmgPDydlrbouz4UYN
   cCt1vBcI9zv/VbgF/R/Usm6fazugj4rCxWOzVGXC87mdjsXf31kO251nm
   9x1UMVA2M6dZU6nBppSuDH7RvSTIP3zeTx3+ITFS5Y7scFTfExMQZR+FE
   w==;
X-CSE-ConnectionGUID: VHU2b4z7Tpmgpsc9b+bRlA==
X-CSE-MsgGUID: Uiwx3fcVRluDZNZt2isuVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="117470885"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="117470885"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 00:18:02 -0700
X-CSE-ConnectionGUID: 6cf3B21/TeKgdoTJbGsKUQ==
X-CSE-MsgGUID: sVk/iQCQQAaxbAjBH4IYiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280797878"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Oct 2026 00:18:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDzQz-000000001HU-2Ctc;
	Tue, 06 Oct 2026 07:17:57 +0000
Date: Tue, 06 Oct 2026 15:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 fs/fuse/file.c:2777:19: warning: result of comparison of constant 4294967291
 with expression of type '__u16' (aka 'unsigned short') is always false
Message-ID: <202610061536.Xi3mAvpP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Chirantan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   6f82755ed602e815541b2c6617a3f30f53500cdc
commit: 7f33c2b5012b1ada851aafcf8620e1723b8db574 [0/4] CHROMIUM: Support fsverity in fuse
config: i386-buildonly-randconfig-1004-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061536.Xi3mAvpP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 80cd965b6323b208519f8ab1d5ee86e4ea9862f4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061536.Xi3mAvpP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061536.Xi3mAvpP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/file.c:2777:19: warning: result of comparison of constant 4294967291 with expression of type '__u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
    2777 |                 if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
         |                     ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2777 fs/fuse/file.c

  2745	
  2746	static int fuse_get_ioctl_len(unsigned int cmd, unsigned long arg, size_t *len)
  2747	{
  2748		switch (cmd) {
  2749		case FS_IOC_GETFLAGS:
  2750		case FS_IOC_SETFLAGS:
  2751			*len = sizeof(int);
  2752			break;
  2753		case FS_IOC_GET_ENCRYPTION_POLICY_EX: {
  2754			__u64 policy_size;
  2755			struct fscrypt_get_policy_ex_arg __user *uarg =
  2756				(struct fscrypt_get_policy_ex_arg __user *)arg;
  2757	
  2758			if (copy_from_user(&policy_size, &uarg->policy_size,
  2759					   sizeof(policy_size)))
  2760				return -EFAULT;
  2761	
  2762			if (policy_size > SIZE_MAX - sizeof(policy_size))
  2763				return -EINVAL;
  2764	
  2765			*len = sizeof(policy_size) + policy_size;
  2766			break;
  2767		}
  2768		case FS_IOC_MEASURE_VERITY: {
  2769			__u16 digest_size;
  2770			struct fsverity_digest __user *uarg =
  2771				(struct fsverity_digest __user *)arg;
  2772	
  2773			if (copy_from_user(&digest_size, &uarg->digest_size,
  2774					   sizeof(digest_size)))
  2775				return -EFAULT;
  2776	
> 2777			if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
  2778				return -EINVAL;
  2779	
  2780			*len = sizeof(struct fsverity_digest) + digest_size;
  2781			break;
  2782		}
  2783		default:
  2784			*len = _IOC_SIZE(cmd);
  2785			break;
  2786		}
  2787	
  2788		return 0;
  2789	}
  2790	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
