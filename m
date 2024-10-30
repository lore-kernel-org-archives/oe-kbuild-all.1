Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A4447F69
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730281748; cv=none; b=I0WMWVhtWkB9pTOvjIEy8rRHSGWMhCXKFZaLFwIHbPwLPKXTMP9TYGYEi6lk2PaMEV4+rye4urB0mFKx/2ADecPP8iay/ipwW6QKzq/RA68pW424V79i6oYJTjcskKvELmAyB9pLhhN+uc3hBYlpWaQW6/NIKpn7QaMwggVlkpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730281748; c=relaxed/simple;
	bh=WnbbGTbi+YoHQvi8+eSxgnRAVgvqGIe+Bn1hg4tgcx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jBBAK/5BPgRKudj1FK5tj9wUiWC5pZdRgwbEQbkYSyrIOxqHLmBoMAerKEwQzxFVccLeLn8RONBQ/i7Fy6CU0HHEqbVlIWd7N2Up9YN6cDUT2eyszqO5E42coqnXiUbmRy9OZptaBVQ7oQnM+LPeAllkM5nswOqoBcTiB5AW1ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEJ23Act; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEJ23Act"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730281746; x=1761817746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WnbbGTbi+YoHQvi8+eSxgnRAVgvqGIe+Bn1hg4tgcx4=;
  b=oEJ23ActjG/shWgOVEibt5cqz1e0up5Nn+r9TFpzeY1Fsd55F3lWhfu2
   X1qji5ruSER3V6ThYr4sxnm6kW0wn9oAFmVs4v+Ljk8oOwVuzfzyR8WDM
   PgYLzCkHM2t4FRUIC85KvnRJSfCpk6CHGPBpbq43lGvVYni+9cVMnuNgP
   UwrhkTyf8KIAVKn2PjFfVpPPxnIhkfebzz/PGKHI1PZsad3tvr5jJQW0E
   GenWM+cmbyRYDROy1OrX6NcN2MDJA4onMmKmyiha39p/QhJX+yQmwbb98
   JAjOaC0VvdcORBoQb3ou02sk+Beq7Aj3xioVXYniEuKJ9h1SBterwPSxO
   A==;
X-CSE-ConnectionGUID: Bud8h/uuTouth9iQyRyHrg==
X-CSE-MsgGUID: +EePLxPaToqR5SDPCNwuRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="32812458"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="32812458"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 02:49:05 -0700
X-CSE-ConnectionGUID: BZCvxGGiT7+EzpTk/BrSyQ==
X-CSE-MsgGUID: sH2lUlcTTRmbiKptmOPwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="87400897"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2024 02:49:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t65K1-000eiG-2y;
	Wed, 30 Oct 2024 09:49:01 +0000
Date: Wed, 30 Oct 2024 17:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Carl Vanderlip <quic_carlv@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 6600/7771] drivers/accel/qaic/sahara.c:776:2-7:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202410301732.abF5Md4e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6fb2fa9805c501d9ade047fc511961f3273cdcb5
commit: 93accc16a8d45a44e1f51fdf2c6014feedb13d27 [6600/7771] accel/qaic: Add crashdump to Sahara
config: alpha-randconfig-r064-20241030 (https://download.01.org/0day-ci/archive/20241030/202410301732.abF5Md4e-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410301732.abF5Md4e-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/accel/qaic/sahara.c:776:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +776 drivers/accel/qaic/sahara.c

   768	
   769	static void sahara_mhi_remove(struct mhi_device *mhi_dev)
   770	{
   771		struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
   772	
   773		cancel_work_sync(&context->fw_work);
   774		cancel_work_sync(&context->dump_work);
   775		if (context->mem_dump)
 > 776			vfree(context->mem_dump);
   777		sahara_release_image(context);
   778		mhi_unprepare_from_transfer(mhi_dev);
   779	}
   780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
