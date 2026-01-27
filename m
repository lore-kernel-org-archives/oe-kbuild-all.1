Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B3220F5C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516427; cv=none; b=FMkrW9Gn3EG4/ijiX45zh6uuJiQS23DESsnONxmO5a5MuuDo2IKqIXjwQwkJP1OuZRXkbfEI+7WtIFLcu5ibZ7xtRm2yeaxwg1CBcOMUZ4VMMiskB/FH1YioVm9nbE9Zh2F1z5o8dm3LzoeDSM56V9OTxtCDtbTi+2wKbPn7Mlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516427; c=relaxed/simple;
	bh=ZWrzRVn/ZvOgjf7GTLtVqjXGyI63PLi/aQem941QjoE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FdV7pvdn/zjtEi4N/prg/46B4Y4/ytmjjQsyn0yU9GfK0JrQCZV6REhGB5VxDAVZ8+be5EB4xvcsmKn8IZCA5EWH/KlhbBftlsClfoEVJk8eOKmbJvAgj03zHtaVjThxtUgm8fI4qh/ZKx58o+gM0JQMPCQ3q4K8paTsrVfvt6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=La95uO1N; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="La95uO1N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769516427; x=1801052427;
  h=date:from:to:cc:subject:message-id;
  bh=ZWrzRVn/ZvOgjf7GTLtVqjXGyI63PLi/aQem941QjoE=;
  b=La95uO1NMd/ZwmNjslkBRez6JyJMPP4dXVNLM3/gXU2dZHvoXZghD9l5
   FNoLcLsxH83/zs/Vcb79v15mfLemhQXZbjyPAobQ7ZxS6bB0NwwO+UBM3
   8dQ/cVgGiFbbzz0fLYEmwpLvYLJtDDAhBNJXU3aQVlmGB6T8y2pI5U6eL
   SuziGJT3ChKX5w5iPORjfYkMRHBIdJzEh1+ucvyNMr8a0ZepXz9qQMMrv
   z88icT91wagMtbxOucT/84b4QwxGZovX6SOnFpz80wWElnjX//H9kG606
   5D+SXn2hOgjwdNQLtvwLA7/PYne6CUzb//fW58rAMd2MEOs9F40C/w3f+
   A==;
X-CSE-ConnectionGUID: vFwwg/0ERbu7N3rZAfkm8g==
X-CSE-MsgGUID: HIoUzNQ3TkKwSUTVPMz+2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81013861"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81013861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:20:26 -0800
X-CSE-ConnectionGUID: vSZyxZiHQVm7WGq+y2Q2KQ==
X-CSE-MsgGUID: wMkJnRf3RHevqVWdzAWfDQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jan 2026 04:20:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vki3S-00000000YSO-1Yzh;
	Tue, 27 Jan 2026 12:20:22 +0000
Date: Tue, 27 Jan 2026 20:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:vcam 5/5] drivers/media/vcamera.c:1310:45:
 warning: cast to pointer from integer of different size
Message-ID: <202601272027.93t1s56H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   aca163adc973822190ede13e24470004c2a6d800
commit: 4fa6033b7c74b72719b8608a01660b9e6e06d14b [5/5] media: vcamera
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260127/202601272027.93t1s56H-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272027.93t1s56H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272027.93t1s56H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/vcamera.c: In function 'vcamera_ioc_vcam_new_validate':
>> drivers/media/vcamera.c:1310:45: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1310 |         len = strncpy_from_user(card_label, (void __user *)config->device_name,
         |                                             ^


vim +1310 drivers/media/vcamera.c

  1297	
  1298	static int vcamera_ioc_vcam_new_validate(struct vcamera_ioc_new *config,
  1299						 char *card_label)
  1300	{
  1301		long len, i;
  1302	
  1303		if (config->device_nr != 0 || config->output_fd != 0)
  1304			return -EINVAL;
  1305	
  1306		if (memchr_inv(config->reserved, 0, sizeof(config->reserved)))
  1307			return -EINVAL;
  1308	
  1309		memset(card_label, 0, VCAMERA_CARD_LABEL_MAX);
> 1310		len = strncpy_from_user(card_label, (void __user *)config->device_name,
  1311					VCAMERA_CARD_LABEL_MAX);
  1312		if (len < 0)
  1313			return -EFAULT;
  1314		if (len > VCAMERA_CARD_LABEL_MAX ||
  1315		    (len == VCAMERA_CARD_LABEL_MAX &&
  1316		     card_label[VCAMERA_CARD_LABEL_MAX - 1] != '\0'))
  1317			return -E2BIG;
  1318		if (!len)
  1319			return -EINVAL;
  1320		if (!isalnum((unsigned char)card_label[0]))
  1321			return -EINVAL;
  1322		for (i = 0; i < len; i++) {
  1323			if (!isalnum((unsigned char)card_label[i]) &&
  1324			    !isspace((unsigned char)card_label[i]))
  1325				return -EINVAL;
  1326		}
  1327		if (!isalnum((unsigned char)card_label[len - 1]))
  1328			return -EINVAL;
  1329	
  1330		return len;
  1331	}
  1332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
