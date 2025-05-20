Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FB9BA45
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 19:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768767; cv=none; b=cNWu4qalqtkbwtWjgW5pW8/IVd917cxV8WzvnVOjK4pDfYLyF5pv/ggiuROfFybkSxsLpxVITLbW6fS7U22nmn1TZycjzBfL6EnYilUl32W07lj/t8bNRwVWlerxYj/5322Uiod31OfNNNNmyR4ajzMSiaNKIIhjSGIV8DwNaxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768767; c=relaxed/simple;
	bh=QKLif58ZCh0HlfQLYlkhoQogS2qXgM3d+rWXgIHwD0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CvGNWjkHgCf1HN9TNlhhXgaBPWdf22TAgys5VzQ0kaL1bmKdMP9lcKA/duzBUQcjJLv+Lz6DyvUyATkwycnPfaAygvUP5BznTSpI8e8rqWpWSyenJMKZ3XezkBQkSlixiBxBHqF09QIiyDQtyyg2d5XmAMcDWf0euxypNsTgDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERmepq9v; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERmepq9v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747768765; x=1779304765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QKLif58ZCh0HlfQLYlkhoQogS2qXgM3d+rWXgIHwD0o=;
  b=ERmepq9vPVjCa6KP2+IfwFZrUfcYe+ZPr3CB9oAGbMyw9oyQymoTL7tW
   pP8SnahvFVbCw26LWfmVh7NReBGPHBHXf/nhkCDixvVc7Tz03VxuG26Qp
   9gxuH7Y3f6+IE7cQmoaKgqsRj6DhyBjCkiwfkTuV7YLzR4V/lNqQ/DR5Q
   6DZaz3xKhGpcCAgv0Xv+w0X8nEq9L/zG9Zfpqf4ofoBFJ1zn5WWSbIjy8
   p54E8T8tN+rPd2YQ/nq5aVVIX3Dqz/k3Fa6R4JgYPuQi6aAUdHGJVwoA9
   0ckoYcWeeOi8H9f0loQCYfCFJw7qRRctkpu9ufouRyDWpyJH2qcnVFpjm
   A==;
X-CSE-ConnectionGUID: NKs3eqYpQZywuxOcRB5S+A==
X-CSE-MsgGUID: QXNcxtvMQ2yGTwyHNG/JVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60759630"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60759630"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 12:19:25 -0700
X-CSE-ConnectionGUID: sSgsu1rFSeSXdZNbWVcT+w==
X-CSE-MsgGUID: ZBPMYNWBRgeoJTaQJEFeUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140312310"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 May 2025 12:19:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHSUk-000NUO-0c;
	Tue, 20 May 2025 19:19:22 +0000
Date: Wed, 21 May 2025 03:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 14/14] aarch64-linux-ld:
 jack.c:undefined reference to `input_unregister_device'
Message-ID: <202505210340.2pupPzNg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   785e577258509dc0a11b4eff53a85ef73ff88bf2
commit: 1e702f432d551041753c46ec0d6d49484e776441 [14/14] ANDROID: GKI: Added missing SND configs
config: arm64-randconfig-004-20250521 (https://download.01.org/0day-ci/archive/20250521/202505210340.2pupPzNg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210340.2pupPzNg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210340.2pupPzNg-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   videobuf2-core.c:(.text+0x5158): undefined reference to `v4l_vb2q_enable_media_source'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_dev_disconnect':
   jack.c:(.text+0x120): undefined reference to `input_free_device'
>> aarch64-linux-ld: jack.c:(.text+0x148): undefined reference to `input_unregister_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_dev_register':
   jack.c:(.text+0x228): undefined reference to `input_set_capability'
   aarch64-linux-ld: jack.c:(.text+0x24c): undefined reference to `input_register_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_new':
   jack.c:(.text+0x6ac): undefined reference to `input_allocate_device'
   aarch64-linux-ld: jack.c:(.text+0x744): undefined reference to `input_set_capability'
   aarch64-linux-ld: jack.c:(.text+0x780): undefined reference to `input_free_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_report':
   jack.c:(.text+0x9e4): undefined reference to `input_event'
   aarch64-linux-ld: jack.c:(.text+0xa68): undefined reference to `input_event'
   aarch64-linux-ld: jack.c:(.text+0xa90): undefined reference to `input_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
