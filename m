Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4814C70
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 07:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739692480; cv=none; b=GedsleZrXlfg5L1TSwB5a36dv7Cmjq1YtLHxqvODqzsky/oislMAQvT2l6UllSLSBDabYoMr/p1HXVYYcLFIKq5jUfgYUfk4cXYqaT8ab4+p3xRzRHZuF2Mk4J4MMfM17KTCRUWp0u9OEpbcJuhPStW1MIsAv5vnieiQ3EBx9Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739692480; c=relaxed/simple;
	bh=9DqDm838ixvXRQDnvriNZUmGZkXrEQSuM3ZGtpBDGO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HFU79DUPXsWpL7xtnwdx5cLfKNDj9IBOVyU5l/hWQe7/idfiTqxA0yBzjJm2LYslpRUPe+eHdXmvSnbpYy1L9NPna9RxcTFFNqlJ7dYkuEn6I/h+4GAgSlRO9QjdhRgAVckXafa+MLYbwLHzccrwpzwpO2SKLMcF6gCcitAlGJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRMjINPZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRMjINPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739692479; x=1771228479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9DqDm838ixvXRQDnvriNZUmGZkXrEQSuM3ZGtpBDGO0=;
  b=nRMjINPZulVuPQKM/R+05BhVQDDSJxBo4HAvLbLK6RqrOd9qX23II6gq
   4b3EBox0XZLlMqEs77Nn/MLymCFZD8FSQytiyp3wWdf/+YvKTBQpR+Rtm
   dtwd8DGhO5yb/Mnpt+nQrB0JcGxwOstjpFWxSG0P9shyvhkz0RcyGUr9T
   TfB7XfiNQtGHvlfspumss4AwuEgZOdLnUH3nqUdAmqiSeHsq2+qWWLWXR
   /C9ggL88B3F5oAkg8kZzwrnVnL5oP15QUAfyZPZbK/HJgctLekkB8mtXr
   UWWeTm3Dayjm47yFar0yvJw+LD1h77x714EED7qOXEqKIb69T3RLiiFxe
   g==;
X-CSE-ConnectionGUID: U+SjybL3Qwu7NAUEZivKsA==
X-CSE-MsgGUID: 022rBolbQzeFssCxUBq/tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="50612295"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="50612295"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 23:54:38 -0800
X-CSE-ConnectionGUID: h/GKW8HURRSox9cyJgMNug==
X-CSE-MsgGUID: 3HezDaH9Re6dVa/Y4qzpfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117976036"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Feb 2025 23:54:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjZU2-001Bgh-34;
	Sun, 16 Feb 2025 07:54:34 +0000
Date: Sun, 16 Feb 2025 15:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 0/90] fs/f2fs/super.o: warning:
 objtool: f2fs_handle_stop()+0xe4: unreachable instruction
Message-ID: <202502161524.O7cryzoi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   d54a4869d416b5e3beebfa0e94bc0e2cd7568737
commit: 24220df8028a5ae16b20aa5dc175186b14252ccb [0/90] FROMGIT: f2fs: support recording stop_checkpoint reason into super_block
config: x86_64-buildonly-randconfig-004-20250212 (https://download.01.org/0day-ci/archive/20250216/202502161524.O7cryzoi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502161524.O7cryzoi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502161524.O7cryzoi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/super.o: warning: objtool: f2fs_handle_stop()+0xe4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
