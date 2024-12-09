Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F4F15DBC1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719167; cv=none; b=WeCOKSfyXJhRhu3WathsscnEZV80a9aDPAciVOdDnyUJrlqvYt9TCQxDiioJ6iWY+dbKITDsPzcl6gyhXIkuVFiNEC6GhQ5J0yhA2umsNALsOdCNH4li6oFIZbMWogykJPCCDmZ7slhRF5+F/kY8yAN87mru31xbogpajkGqLZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719167; c=relaxed/simple;
	bh=fwcAKkdsGsfjKUqG8hVSyHoPImxFxn1vfb/P3RitlcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WxIelinyB+mTkxneyAmgniEUIrtern9WbQdXLouxQQkn/Cb45LIXvuvBIcsPJzW13/XquGTxPao7lTp9jnLOar9awoi3PWaIujQUCKrZcJ/4ImcknQbNZ4OZutYuVRjlPppOtlD0fAgqVwQ46soCXkIxYH61q9bbznwKzq85LTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGXIA/Ht; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGXIA/Ht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719165; x=1765255165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fwcAKkdsGsfjKUqG8hVSyHoPImxFxn1vfb/P3RitlcQ=;
  b=HGXIA/Ht1sFMqErgZyF6wqAgIHjAxPZ9QkcGjEHE+cs65MQaIqdQ20v8
   dVTvKzMZV1ShaDgSntrbfx5X0MqTtz5/zALNM2zbx5JNDbP0bNinvC3Xd
   Oa2OV+eyLzGI4nUOGBh/Tqxe8fWYlp9hvQs08DNY1sF1zGswxz11du37Z
   AnBnwfMT1Z4y91Gn0LQp5svCVunLZOiuWvc3/tLQtrp7kbEDdD7sm3skm
   tMngV4ownOCpqkcW+CEWxtfkLRJlDxDQo5D/P6THc/mOocawQNXZd5XW5
   rxb3sNOv6C6lGNwJJg+83LakCkjglK5MGvda07tNXNpIoIpvHNimEqaqu
   w==;
X-CSE-ConnectionGUID: EhchUepGQiGNn8eF1hycow==
X-CSE-MsgGUID: CNjVrbw7Rv+2tef6DGJ/oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51415831"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51415831"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:39:25 -0800
X-CSE-ConnectionGUID: FR9l7mQCREyJM6PTnpRvvA==
X-CSE-MsgGUID: IUMJKgZQR0awSeFE+0HGQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94653425"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Dec 2024 20:39:24 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVYH-0003tH-0Q;
	Mon, 09 Dec 2024 04:39:21 +0000
Date: Mon, 9 Dec 2024 12:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1321/1321]
 sound/soc/codecs/simple-amplifier.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202412081030.HpEhO2B9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   faa52e40c08916893e09ba030e616f92e4fc020b
commit: 4aa5db22d35588e1a5d2ee88472348ea73d9fb23 [1321/1321] Merge branch 'asoc-4.19' into asoc-next
config: x86_64-buildonly-randconfig-002-20241205 (https://download.01.org/0day-ci/archive/20241208/202412081030.HpEhO2B9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412081030.HpEhO2B9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412081030.HpEhO2B9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/simple-amplifier.o: warning: objtool: missing symbol for section .init.text
--
   sound/soc/codecs/es7241.c:206:33: warning: unused variable 'es7241_chip' [-Wunused-const-variable]
     206 | static const struct es7241_chip es7241_chip = {
         |                                 ^~~~~~~~~~~
   1 warning generated.
>> sound/soc/codecs/es7241.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
